# -*- coding: utf-8 -*-
from enum import Enum
from pathlib import Path
from hyperspy.signals import BaseSignal
from hyperspy.misc.utils import DictionaryTreeBrowser
from numpy.typing import NDArray
from PIL import Image
from PIL.ExifTags import TAGS
from scipy.integrate import cumulative_simpson
from skimage import io as skio
from skimage import color, exposure, filters
from numpy.typing import NDArray
import exifread
import hyperspy.api as hs
import numpy as np

from .plotting import MajordomePlot


class ImageCrop:
    """ Defines a region of interest (ROI) for image cropping.

    Parameters
    ----------
    percentages : bool
        If True, the crop values are interpreted as percentages of image
        dimensions. If False, they are interpreted as pixel counts.
    left : int
        Number of pixels to crop from the left edge.
    bottom : int
        Number of pixels to crop from the bottom edge.
    right : int
        Number of pixels to crop from the right edge.
    top : int
        Number of pixels to crop from the top edge.
    """
    __slots__ = ("_percentages", "_left", "_bottom", "_right", "_top")

    def __init__(self, *, percentages: bool = False, left: int = 0,
                 bottom: int = 0, right: int = 0, top: int = 0) -> None:
        self._percentages = percentages
        self._left = left
        self._bottom = bottom
        self._right = right
        self._top = top

        if self._percentages:
            self._validate_percentages()

    def _validate_percentages(self):
        """ Validate the cropping parameters. """
        for side in (self._left, self._bottom, self._right, self._top):
            if not (0 <= side <= 50):
                raise ValueError("When using percentages, crop values "
                                 "must be between 0 and 50.")

    def get_coords(self, img: NDArray) -> tuple[int, int, int, int]:
        """ Get the cropping coordinates for the input image. """
        h, w = img.shape[0], img.shape[1]

        if self._percentages:
            y0 = int(h * self._top / 100)
            x0 = int(w * self._left / 100)
            y1 = h - int(h * self._bottom / 100)
            x1 = w - int(w * self._right / 100)
        else:
            y0 = self._top
            x0 = self._left
            y1 = h - self._bottom
            x1 = w - self._right

        if np.any(np.array([x0, x1, y0, y1]) < 0):
            raise ValueError("Negative index cropping not allowed")

        if x0 >= x1 or y0 >= y1:
            raise ValueError("Invalid cropping dimensions")

        return x0, y0, x1, y1

    def apply(self, img: NDArray) -> NDArray:
        """ Crop the input image according to the defined ROI. """
        x0, y0, x1, y1 = self.get_coords(img)
        return img[y0:y1, x0:x1]

    def to_dict(self) -> dict:
        """ Convert the cropping parameters to a dictionary. """
        return {
            "percentages": self._percentages,
            "left": self._left,
            "bottom": self._bottom,
            "right": self._right,
            "top": self._top
        }


class ChannelSelector(Enum):
    """ Enumeration for selecting image channels. """
    RED   = 0
    GREEN = 1
    BLUE  = 2
    GRAY  = -1

    def select(self, img: NDArray) -> NDArray:
        """ Select the appropriate channel from the input image. """
        match self:
            case ChannelSelector.GRAY:
                return color.rgb2gray(img)
            case _:
                return img[:, :, self.value]

    def load(self, fname: str | Path) -> NDArray:
        """ Load image from file selecting the appropriate channel. """
        match self:
            case ChannelSelector.GRAY:
                return skio.imread(fname, as_gray=True)
            case _:
                return skio.imread(fname)[:, :, self.value]

    def to_dict(self) -> dict:
        """ Convert the channel selector to a dictionary. """
        return {"channel": self.name, "index": self.value}


class ContrastEnhancement(Enum):
    """ Enumeration for contrast enhancement methods. """
    NONE       = "none"
    ADAPTIVE   = "adaptive"
    STRETCHING = "stretching"

    def _adaptive(self, img, *, nbins=256, **kw):
        return exposure.equalize_adapthist(img, nbins=nbins)

    def _stretching(self, img, *, percentiles=(2, 98), **kw) -> NDArray:
        in_range = tuple(np.percentile(img, percentiles))
        return exposure.rescale_intensity(img, in_range=in_range)

    def apply(self, img: NDArray, **kw) -> NDArray:
        """ Apply contrast enhancement to the input image. """
        match self:
            case ContrastEnhancement.NONE:
                pass
            case ContrastEnhancement.ADAPTIVE:
                img = self._adaptive(img, **kw)
            case ContrastEnhancement.STRETCHING:
                img = self._stretching(img, **kw)

        return img


class ThresholdImage(Enum):
    """ Enumeration for image thresholding methods. """
    MANUAL = "manual"
    OTSU   = "otsu"

    def _manual(self, img: NDArray, threshold: float) -> NDArray:
        mask = np.ones_like(img, dtype=np.uint8)
        mask[img < threshold] = 0
        return mask

    def _otsu(self, img: NDArray) -> NDArray:
        return img > filters.threshold_otsu(img)

    def apply(self, img: NDArray, **kw) -> NDArray:
        """ Apply thresholding to the input image. """
        match self:
            case ThresholdImage.MANUAL:
                img = self._manual(img, kw.get("threshold", 0.0))
            case ThresholdImage.OTSU:
                img = self._otsu(img)

        return img


class SEMImageLoader:
    """ A class to load SEM images and their metadata. """
    __slots__ = ("img", "meta", "fei")

    def __init__(self, fname: Path, backend: str = "HS"):
        self.img  = hs.load(fname)
        self.meta = self._load_metadata(fname, backend)
        self.fei  = None

        # TODO understand why named FEI. Specfic to microscope brand?
        if isinstance(self.meta, DictionaryTreeBrowser):
            if "fei_metadata" in self.meta:
                self.fei  = self.meta["fei_metadata"]

    def _load_metadata(self, fname: Path, backend: str):
        """ Wrap metadata loading for readability of constructor. """
        match backend.upper():
            case "HS":
                return self.img.original_metadata
            case "PIL":
                return self.metadata_pil(fname)
            case "EXIFREAD":
                return self.metadata_exifread(fname)
            case _:
                raise ValueError(f"Unknown backend '{backend}'")

    @staticmethod
    def metadata_exifread(fname: Path) -> dict:
        """ Extract metadata using exifread package. """
        with open(fname, "rb") as reader:
            exif_data = {k:v for k, v in exifread.process_file(reader).items()}

        return exif_data

    @staticmethod
    def metadata_pil(fname: Path) -> dict:
        """ Extract metadata using PIL.Image package. """
        skip_tags = {"StripOffsets", "StripByteCounts"}

        with Image.open(fname) as img:
            data = img.getexif()
            exif_data = {}

            for tag_id, value in data.items():
                if (tag_name := TAGS.get(tag_id, tag_id)) in skip_tags:
                    continue

                exif_data[tag_name] = value

        return exif_data

    @property
    def image(self): # -> hs.Image:
        """ Get the HyperSpy image object. """
        return self.img

    @property
    def metadata(self):
        """ Get the metadata of the image. """
        return self.meta

    @property
    def data(self) -> NDArray:
        """ Get the image data as a NumPy array. """
        return self.img.data

    @data.setter
    def data(self, array: NDArray) -> None:
        """ Set the image data from a NumPy array. """
        self.img.data = array


class SEMImageHandler(SEMImageLoader):
    """ A class to represent a SEM image and its metadata. """
    __slots__ = ("_orig", "_fft")

    def __init__(self, fname: Path, crop: bool = True):
        super().__init__(fname, backend="HS")
        self._orig = self.img.deepcopy()

        if crop:
            self._crop_sem_bar()

    def _crop_sem_bar(self):
        """ Crop the SEM scale bar from the image. """
        dx = self.fei.Image.ResolutionX
        dy = self.fei.Image.ResolutionY

        self.img.crop("width",  end=dx)
        self.img.crop("height", end=dy)

    def _plot_title(self):
        """ Generate a plot title from metadata. """
        mode = self.fei.Detectors.Mode
        volt = self.fei.Beam.HV / 1000
        h, w = self.dimensions

        return f"{mode} at {volt:.0f} kV - region of {w:.1f} µm x {h:.1f} µm"

    def plot(self, **kwargs):
        """ Plot the image with optional scalebar and title. """
        kwargs.setdefault("scalebar", False)
        kwargs.setdefault("scalebar_color", "#0000ff")
        kwargs.setdefault("axes_off", True)
        kwargs.setdefault("colorbar", False)
        kwargs.setdefault("title", self._plot_title())
        self.img.plot(**kwargs)

    def reset(self, crop: bool = True):
        """ Reset the image data to the original state. """
        self.img = self._orig.deepcopy()

        if crop:
            self._crop_sem_bar()

    def apply_gaussian(self, sigma: float,
                       fresh: bool = False, **kwargs) -> None:
        """ Apply Gaussian filter to the image data. """
        if fresh:
            self.reset(crop=kwargs.pop("crop", True))

        self.data = filters.gaussian(self.data, sigma=sigma)

    def apply_contrast(self, method: ContrastEnhancement,
                       fresh: bool = False, **kwargs) -> None:
        """ Apply contrast enhancement to the image data. """
        if fresh:
            self.reset(crop=kwargs.pop("crop", True))

        self.data = method.apply(self.data, **kwargs)

    def apply_derivative(self, order: int = 1, axes="xy",
                         fresh: bool = False, **kwargs) -> None:
        """ Apply derivative filter to the image data. """
        if fresh:
            self.reset(crop=kwargs.pop("crop", True))

        match axes:
            case "x":
                self.data = self.img.derivative(0, order=order).data
            case "y":
                self.data = self.img.derivative(1, order=order).data
            case "xy":
                data0 = self.img.derivative(0, order=order).data
                data1 = self.img.derivative(1, order=order).data
                self.data = data0 + data1

    @property
    def dimensions(self) -> tuple[float, float]:
        """ Get the dimensions in micrometers of the scanned region. """
        try:
            h = 1e6 * self.fei["EScan"]["VerFieldsize"]
            w = 1e6 * self.fei["EScan"]["HorFieldsize"]
        except:
            h, w = self.img.data.shape
            w = 1e6 * w * self.fei.Scan.PixelWidth
            h = 1e6 * h * self.fei.Scan.PixelHeight

        return h, w


class CharacteristicLength:
    """" Compute the characteristic length of a 2D field through FFT. """
    __slots__ = ("_k_centers", "_spectrum", "_length")

    def __init__(self, f, Lx, Ly, nbins=200, window=True) -> None:
        Ny, Nx = f.shape if not isinstance(f, BaseSignal) else f.data.shape
        P = self.power_spectrum(f, Nx, Ny, Lx, Ly, window)

        K = self.wavenumber_grid(Nx, Ny, Lx, Ly)
        k, E = self.radial_binarization(P, K, nbins)

        self._k_centers = k
        self._spectrum  = E

    def power_spectrum(self, f, Nx, Ny, Lx, Ly, window):
        """ Compute the power spectrum of the field f. """
        if isinstance(f, BaseSignal):
            F = f.fft(shift=True, apodization=window).data#, )
        else:
            if window:
                f = self.apodization(f, Nx, Ny, Lx, Ly)

            F = np.fft.fftshift(np.fft.fft2(f))

        return np.abs(F)**2

    def apodization(self, f, Nx, Ny, Lx, Ly):
        """ Apply a 2D (cosine) Hann window to the field f. """
        wx = 0.5 * (1 - np.cos(2 * np.pi * np.arange(Nx) / Nx))
        wy = 0.5 * (1 - np.cos(2 * np.pi * np.arange(Ny) / Ny))
        W = np.outer(wy, wx)
        return f * W

    def wavenumber_grid(self, Nx, Ny, Lx, Ly):
        """ Compute the cycles per unit length wavenumber grid. """
        kx = np.fft.fftshift(np.fft.fftfreq(Nx, d=Lx/Nx))
        ky = np.fft.fftshift(np.fft.fftfreq(Ny, d=Ly/Ny))

        KX, KY = np.meshgrid(kx, ky)
        return np.sqrt(KX**2 + KY**2)

    def radial_binarization(self, P, K, nbins):
        """ Digitize the wavenumber grid into radial bins. """
        k_bins = np.linspace(0, K.max(), nbins+1)
        k = 0.5 * (k_bins[:-1] + k_bins[1:])

        # Digitize all points at once
        idx = np.digitize(K.ravel(), k_bins)

        # Vectorized radial average
        E = np.zeros(nbins)
        for i in range(1, nbins+1):
            mask = (idx == i)
            if np.any(mask):
                E[i-1] = P.ravel()[mask].mean()

        return k, E / np.trapz(E, k)

    @property
    def characteristic_length(self):
        """ Retrieve characteristic length from the spectrum. """
        if not hasattr(self, "_length"):
            # Skip zero-frequency bin:
            i_peak = np.argmax(self._spectrum[1:]) + 1
            k_peak = self._k_centers[i_peak]
            self._length = 1.0 / k_peak

        return self._length

    @MajordomePlot.new
    def plot_spectrum(self, plot=None, cdf=True, cutoff=None):
        """ Plot the power spectrum and indicate characteristic length. """
        fig, ax = plot.subplots()

        x = 1 / self._k_centers
        y = self._spectrum
        Y = self.characteristic_length

        if cdf:
            y = 1 - cumulative_simpson(y, x=x[::-1], initial=0)

        ax[0].plot(x, y)
        ax[0].set_xlabel("Length [µm]")
        ax[0].axvline(Y, color="red", linestyle="--",
                      label=f"Characteristic length: {Y:.2f} µm")
        ax[0].legend(loc=1)
