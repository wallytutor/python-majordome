# -*- coding: utf-8 -*-
from abc import ABC, abstractmethod
from enum import Enum
from pathlib import Path
from hyperspy.api import load as hs_load
from hyperspy.signals import Signal2D
from hyperspy.misc.utils import DictionaryTreeBrowser
from matplotlib import pyplot as plt
from numpy.typing import NDArray
from PIL import Image, ExifTags
from scipy.integrate import cumulative_simpson
from skimage import io as skio
from skimage import color, exposure, filters
from numpy.typing import NDArray
import exifread
import numpy as np

from .common import bounds
from .plotting import MajordomePlot, PowerFormatter


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


class HelpersFFT:
    """ Helper methods for FFT-based analysis. """
    @staticmethod
    def wavenumber_axis(N, L):
        """ Compute the cycles per unit length wavenumber axis. """
        return np.fft.fftshift(np.fft.fftfreq(N, d=L/N))

    @staticmethod
    def wavenumber_axes(Nx, Ny, Lx, Ly):
        """ Compute the cycles per unit length wavenumber axes. """
        kx = HelpersFFT.wavenumber_axis(Nx, Lx)
        ky = HelpersFFT.wavenumber_axis(Ny, Ly)
        return kx, ky

    @staticmethod
    def wavenumber_grid(Nx, Ny, Lx, Ly):
        """ Compute the cycles per unit length wavenumber grid. """
        kx, ky = HelpersFFT.wavenumber_axes(Nx, Ny, Lx, Ly)
        KX, KY = np.meshgrid(kx, ky)
        return np.sqrt(KX**2 + KY**2)


class AbstractSEMImageLoader(ABC):
    @property
    def dimensions(self) -> NDArray:
        """ Get the image dimensions in micrometers. """
        return self.pixel_size * np.array(self.shape)

    @property
    @abstractmethod
    def shape(self) -> tuple[int, int]:
        """ Get the image shape as (height, width). """
        pass

    @property
    @abstractmethod
    def pixel_size(self) -> float:
        """ Pixel size in micrometers. """
        pass

    @property
    @abstractmethod
    def data(self) -> NDArray:
        """ Get the image data as a NumPy array. """
        pass

    @data.setter
    @abstractmethod
    def data(self, value: NDArray) -> None:
        """ Set the image data from a NumPy array. """
        pass

    @abstractmethod
    def view(self, **kwargs):
        """ Plot the image with optional scalebar and title. """
        pass


class HyperSpySEMImageLoaderStub(AbstractSEMImageLoader):
    """ Base SEM image loader using HyperSpy."""
    __slots__ = ("__original", "_image", "_pixel_size", "_title")

    def __init__(self, filepath: Path) -> None:
        super().__init__()

        # Load image that will remain unmodified:
        self.__original = hs_load(filepath)

        # Create empty slots for inheritors:
        self._image = Signal2D([[], []])
        self._pixel_size = -1.0
        self._title = ""

    @property
    def original(self):
        """ Original unmodified image. """
        return self.__original

    @property
    def handle(self) -> Signal2D:
        """ Access to internal image. """
        return self._image

    @property
    def shape(self) -> tuple[int, int]:
        """ Get the image shape as (height, width). """
        return self._image.data.shape[:2]

    @property
    def pixel_size(self) -> float:
        """ Pixel size (in micrometers). """
        return self._pixel_size

    @property
    def data(self) -> NDArray:
        """ Get the image data as a NumPy array. """
        return np.array(self._image.data)

    @data.setter
    def data(self, array: NDArray) -> None:
        """ Set the image data from a NumPy array. """
        self._image.data = array

    def view(self, **kwargs) -> None:
        """ Plot the image with optional scalebar and title. """
        kwargs.setdefault("scalebar", False)
        kwargs.setdefault("scalebar_color", "#0000ff")
        kwargs.setdefault("axes_off", True)
        kwargs.setdefault("colorbar", False)
        kwargs.setdefault("title", self._title)

        plt.close("all")
        self._image.plot(**kwargs)

    def fft(self, window=True) -> NDArray:
        """ Perform FFT of internal image instance. """
        return self._image.fft(shift=True, apodization=window).data

    @MajordomePlot.new(grid=False)
    def spectrum_plot(self, plot=None, window=True, vstep=2):
        """ Plot the power spectrum of the internal image. """
        """ Plot the FFT spectrum with proper calibration. """
        F = self._image.fft(shift=True, apodization=window)
        P = np.log10(np.abs(F.data)**2)

        vmin, vmax = bounds(P)
        Nx, Ny = self.shape
        Lx, Ly = self.dimensions
        wx, wy = HelpersFFT.wavenumber_axes(Nx, Ny, Lx, Ly)

        ticks = np.round(np.arange(vmin, vmax + vstep / 2, vstep))
        extent = [wx.min(), wx.max(), wy.min(), wy.max()]

        fig, ax = plot.subplots()
        im = ax[0].imshow(P, cmap="gray", extent=extent)

        ax[0].set_title("FFT Spectrum")
        ax[0].set_xlabel("Horizontal spatial frequency (1 / µm)")
        ax[0].set_ylabel("Vertical spatial frequency (1 / µm)")

        cbar = fig.colorbar(im, ax=ax[0], shrink=0.95)
        cbar.set_label("Power spectral density", rotation=270, labelpad=15)
        cbar.set_ticks(ticks)
        cbar.ax.yaxis.set_major_formatter(PowerFormatter())


class CharacteristicLengthSEMImage:
    """" Compute the characteristic length of a 2D field through FFT. """
    __slots__ = ("_k_centers", "_spectrum", "_length")

    def __init__(self, f: AbstractSEMImageLoader, **kwargs) -> None:
        nbins = kwargs.pop("nbins", 200)
        window = kwargs.pop("window", True)

        Lx, Ly = f.dimensions
        Ny, Nx = f.shape

        P = self.power_spectrum(f, Nx, Ny, window)
        K = HelpersFFT.wavenumber_grid(Nx, Ny, Lx, Ly)
        k, E = self.radial_binarization(P, K, nbins)

        self._k_centers = k
        self._spectrum  = E

    @staticmethod
    def fft(f, Nx, Ny, window):
        """ Compute the FFT of the field with possible apodization. """
        if hasattr(f, "fft"):
            return f.fft(window)

        if window:
            # Apply a 2D (cosine) Hann window to the field f.
            wx = 0.5 * (1 - np.cos(2 * np.pi * np.arange(Nx) / Nx))
            wy = 0.5 * (1 - np.cos(2 * np.pi * np.arange(Ny) / Ny))
            f = f * np.outer(wy, wx)

        return np.fft.fftshift(np.fft.fft2(f))

    def power_spectrum(self, f, Nx, Ny, window):
        """ Compute the power spectrum of the field f. """
        return np.abs(self.fft(f, Nx, Ny, window))**2

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
        E = np.zeros(nbins, dtype=P.dtype)

        for i in range(1, nbins+1):
            mask = (idx == i)
            if np.any(mask):
                E[i-1] = P.ravel()[mask].mean()

        # Normalize the spectrum:
        E = E / np.trapezoid(E, k)

        return k, E

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


def load_metadata(fname: Path, backend: str = "HS"):
    """ Wrap metadata loading for readability of constructor. """
    match backend.upper():
        case "HS":
            return hs_load(fname).original_metadata
        case "PIL":
            return metadata_pil(fname)
        case "EXIFREAD":
            return metadata_exifread(fname)
        case _:
            raise ValueError(f"Unknown backend '{backend}'")


def metadata_exifread(fname: Path) -> dict:
    """ Extract metadata using exifread package. """
    with open(fname, "rb") as reader:
        exif_data = {k:v for k, v in exifread.process_file(reader).items()}

    return exif_data


def metadata_pil(fname: Path) -> dict:
    """ Extract metadata using PIL.Image package. """
    skip_tags = {"StripOffsets", "StripByteCounts"}

    with Image.open(fname) as img:
        data = img.getexif()
        exif_data = {}

        for tag_id, value in data.items():
            if (tag_name := ExifTags.TAGS.get(tag_id, tag_id)) in skip_tags:
                continue

            exif_data[tag_name] = value

    return exif_data
