# -*- coding: utf-8 -*-
from abc import ABC, abstractmethod
from enum import Enum
from pathlib import Path
from hyperspy.api import load as hs_load
from hyperspy.signals import Signal2D
from matplotlib.figure import Figure
from matplotlib import pyplot as plt
from numpy.typing import NDArray
from PIL import Image, ExifTags
from scipy.integrate import simpson, cumulative_simpson
from skimage import io as skio
from skimage import color, exposure, filters
import exifread
import numpy as np
import pandas as pd

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

    @MajordomePlot.new(grid=False)
    @staticmethod
    def plot_spectrum2d(P: NDArray, Nx: int, Ny: int, Lx: float, Ly: float,
                        vstep: int = 2, *, plot: MajordomePlot):
        """ Plot a 2D power spectrum with proper calibration. """
        vmin, vmax = bounds(P)
        wx, wy = HelpersFFT.wavenumber_axes(Nx, Ny, Lx, Ly)

        ticks = np.round(np.arange(vmin, vmax + vstep / 2, vstep))
        extent = (wx.min(), wx.max(), wy.min(), wy.max())

        fig, ax = plot.subplots()
        im = ax[0].imshow(P, cmap="gray", extent=extent)

        ax[0].set_title("FFT Spectrum")
        ax[0].set_xlabel("Horizontal spatial frequency (1 / µm)")
        ax[0].set_ylabel("Vertical spatial frequency (1 / µm)")

        cbar = fig.colorbar(im, ax=ax[0], shrink=0.95)
        cbar.set_label("Power spectral density", rotation=270, labelpad=15)
        cbar.set_ticks(ticks)
        cbar.ax.yaxis.set_major_formatter(PowerFormatter())


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
    def data(self, value: NDArray) -> None:
        """ Set the image data from a NumPy array. """
        self._image.data = value

    def view(self, **kwargs) -> Figure:
        """ Plot the image with optional scalebar and title. """
        kwargs.setdefault("backend", "matplotlib")
        kwargs.setdefault("title", self._title)

        kwargs.setdefault("scalebar", False)
        kwargs.setdefault("scalebar_color", "#0000ff")
        kwargs.setdefault("axes_off", True)
        kwargs.setdefault("colorbar", False)

        plt.close("all")

        if kwargs.pop("backend") == "matplotlib":
            fig, ax = plt.subplots(
                figsize=kwargs.pop("figsize", (8, 6)),
                facecolor=kwargs.pop("facecolor", "white")
            )
            ax.imshow(self._image.data, cmap="gray")
            ax.set_title(kwargs.pop("title", ""))
            ax.axis("off")
        else:
            self._image.plot(**kwargs)
            fig = plt.gcf()
            fig.patch.set_facecolor("white")

        if kwargs.pop("show", False):
            plt.show()

        return fig

    def fft(self, window=True) -> NDArray:
        """ Perform FFT of internal image instance. """
        return self._image.fft(shift=True, apodization=window).data

    def spectrum_plot(self, window=True, vstep=2):
        """ Plot the power spectrum of the internal image. """
        """ Plot the FFT spectrum with proper calibration. """
        (Nx, Ny), (Lx, Ly) = self.shape, self.dimensions
        F = self._image.fft(shift=True, apodization=window)
        P = np.log10(np.abs(F.data)**2)
        return HelpersFFT.plot_spectrum2d(P, Nx, Ny, Lx, Ly, vstep=vstep)


class CharacteristicLengthSEMImage:
    """" Compute the characteristic length of a 2D field through FFT. """
    __slots__ = ("_k_centers", "_spectrum", "_length", "_table")

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

    @property
    def table(self) -> pd.DataFrame:
        """ Retrieve the computed spectrum as a pandas DataFrame. """
        if not hasattr(self, "_table"):
            # Retrieve the data:
            x = self._k_centers.copy()
            y = self._spectrum.copy()

            # Normalize y to have area = 1 under the curve (PDF) and compute the
            # cumulative distribution function (CDF); notice that we actually
            # evaluate 1-CDF because of plotting in physical (length) space:
            pdf = y / simpson(y, x=x)
            cdf = 1 - cumulative_simpson(pdf, x=x, initial=0)
            z = 1 / x

            self._table = pd.DataFrame({
                "Wavenumber (1/µm)": x,
                "Power Spectrum": y,
                "Length (µm)": z,
                "PDF": pdf,
                "CDF": cdf
            })

        return self._table

    @MajordomePlot.new(shape=(2, 1), size=(6, 9))
    def _plot_spectrum_full(self, *, plot, cutoff=None):
        """ Plot the power spectrum and indicate characteristic length. """
        table = self.table
        z = table["Length (µm)"].to_numpy()
        cdf = table["CDF"].to_numpy()
        pdf = table["PDF"].to_numpy()

        mean = self.characteristic_length
        label = f"Characteristic length: {mean:.2f} µm"

        fig, ax = plot.subplots()

        ax[0].plot(z, cdf)
        ax[1].plot(z, pdf)

        if cutoff is not None and cutoff > 0 and cutoff < z.max():
            ax[0].set_xlim(0, cutoff)

        ax[0].set_ylabel("CDF")
        ax[1].set_ylabel("PDF")
        ax[0].set_xlabel("Length [µm]")
        ax[1].set_xlabel("Length [µm]")

        conf = dict(color="red", linestyle="--", label=label)
        ax[0].axvline(mean, **conf)
        ax[1].axvline(mean, **conf)

        ax[0].legend(loc="best", fontsize=9)
        ax[1].legend(loc="best", fontsize=9)

    @MajordomePlot.new(shape=(1, 1), size=(6, 5))
    def _plot_spectrum_density(self, *, plot, cutoff=None):
        """ Plot the power spectrum and indicate characteristic length. """
        table = self.table
        z = table["Length (µm)"].to_numpy()
        pdf = table["PDF"].to_numpy()

        mean = self.characteristic_length
        label = f"Characteristic length: {mean:.2f} µm"

        fig, ax = plot.subplots()

        ax[0].plot(z, pdf)

        if cutoff is not None and cutoff > 0 and cutoff < z.max():
            ax[0].set_xlim(0, cutoff)

        ax[0].set_ylabel("PDF")
        ax[0].set_xlabel("Length [µm]")

        conf = dict(color="red", linestyle="--", label=label)
        ax[0].axvline(mean, **conf)

        ax[0].legend(loc="best", fontsize=9)

    def plot_spectrum(self, full: bool = False, cutoff: float | None = None):
        """ Plot the characteristic length spectrum.

        Parameters
        ----------
        full : bool = True
            If True, plot both PDF and CDF. If False, plot only PDF.
        cutoff : float | None = None
            If provided, limit the x-axis to [0, cutoff].
        """
        if full:
            return self._plot_spectrum_full(cutoff=cutoff)

        return self._plot_spectrum_density(cutoff=cutoff)


def load_metadata(fname: Path, backend: str = "HS"):
    """ Wrap metadata loading for readability of constructor.

    Parameters
    ----------
    fname: Path
        Path to the file to be parsed.
    backend: str = "HS"
        Data extraction backend. Supports "HS" for HyperSpy, "PIL" for
        PIL, and "EXIFREAD" for exifread packages.
    """
    match backend.upper():
        case "HS":
            return hs_load(fname).original_metadata
        case "PIL":
            return metadata_pil(fname)
        case "EXIFREAD":
            return metadata_exifread(fname)
        case _:
            raise ValueError(f"Unknown backend '{backend}', currently"
                             f"available: HS, PIL, EXIFREAD")


def metadata_exifread(fname: Path) -> dict:
    """ Extract metadata using exifread package. """
    with open(fname, "rb") as reader:
        exif_data = {k:v for k, v in exifread.process_file(reader).items()}

    return exif_data


def metadata_pil(fname: Path) -> dict:
    """ Extract metadata using PIL.Image package. """
    with Image.open(fname) as img:
        # XXX: using more complete private method!
        data = img._getexif()
        exif_data = {}

        for tag_id, value in data.items():
            exif_data[ExifTags.TAGS.get(tag_id, tag_id)] = value

    if "GPSInfo" in exif_data:
        data = exif_data["GPSInfo"]
        gps = {ExifTags.GPSTAGS.get(k, k): v for k, v in data.items()}
        exif_data["GPSInfo"] = gps

    return exif_data


def hyperspy_rgb_to_numpy(image: Signal2D, dtype=np.float32) -> NDArray:
    """ Handle conversion of image into a plain NumPy array. """
    if not image.data.dtype.names:
        return image.data.astype(np.float32)

    r = image.data["R"].astype(np.float32)
    g = image.data["G"].astype(np.float32)
    b = image.data["B"].astype(np.float32)

    return np.stack([r, g, b], axis=-1)
