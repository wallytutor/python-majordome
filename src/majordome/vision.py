# -*- coding: utf-8 -*-
from enum import Enum
from pathlib import Path
from skimage import io as skio
from skimage import color, exposure, filters
from numpy.typing import NDArray
import numpy as np


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
