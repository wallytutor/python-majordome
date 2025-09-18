# -*- coding: utf-8 -*-
from pathlib import Path
from time import perf_counter
from typing import Iterator
from typing import Optional
import sys
import shutil
import requests


class ExtendedDict(dict):
    def get_nested(self, *args):
        """ Recursive access of nested dictionary. """
        if not self:
            raise KeyError("Dictionary is empty")

        if not args or len(args) < 1:
            raise ValueError("No arguments were provided")

        value = self.get(args[0])

        return value if len(args) == 1 else \
            ExtendedDict(value).get_nested(*args[1:])


class ClassPropertyDescriptor:
    """ Implements a basic class property descriptor.

    Based on https://stackoverflow.com/a/5191224.
    """
    def __init__(self, fget, fset=None):
        self.fget = fget
        self.fset = fset

    def __get__(self, obj, klass=None):
        if klass is None:
            klass = type(obj)
        return self.fget.__get__(obj, klass)()

    def __set__(self, obj, value):
        if not self.fset:
            raise AttributeError("can't set attribute")
        type_ = type(obj)
        return self.fset.__get__(obj, type_)(value)

    def setter(self, func):
        if not isinstance(func, (classmethod, staticmethod)):
            func = classmethod(func)

        self.fset = func
        return self


def classproperty(func):
    """ Decorator for creation of a class property. """
    if not isinstance(func, (classmethod, staticmethod)):
        func = classmethod(func)

    return ClassPropertyDescriptor(func)






# TODO: provide all of these stackoverflow.com/questions/4842424

class TextColor:
    """ Basic text colors for happy terminal print. """
    BLACK = "\u001b[30m."
    RED = "\u001b[31m."
    GREEN = "\u001b[32m."
    YELLOW = "\u001b[33m."
    BLUE = "\u001b[34m."
    MAGENTA = "\u001b[35m."
    CYAN = "\u001b[36m."
    WHITE = "\u001b[37m."


class ProgressBar:
    """ Simple progress bar with duration estimation for simulation tracking.

    This basic progress bar display process status advance on the screen and
    also total run-time and e.t.a (estimated time of arrival). It is extremely
    minimalist and cannot handle overflow, thus it is up to the user to ensure
    terminal will be at least 79 characters wide.

    Parameters
    ----------
    ncols: Optional[int] = 40
        Number of columns used for bar tracing.
    marker: Optional[str] = "█"
        Single character used for filling up the bar.
    """
    def __init__(self,
            ncols: Optional[int] = 40,
            marker: Optional[str] = "█"
        ) -> None:
        self._nc = ncols + 1.0e-06
        self._mk = marker[:1]
        self._t0 = perf_counter()
        self._duration = None

        base = ("\r|{{0:{ncols}s}}| {{1:3.0f}}% "
                "[run {{2:.2e}}s | eta {{3:.2e}}s]")
        self._txt = base.format(ncols=ncols)

    def update(self, frac: float) -> None:
        """ Update fraction of bar filling.

        Parameters
        ----------
        frac: float
            Current status of filling to apply to the bar.
        """
        stat = int(self._nc * frac)

        mark = self._mk * stat
        fill = 100 * stat / self._nc

        run = perf_counter() - self._t0
        eta = float("nan") if fill <= 0.0 else 100 * run / fill - run

        sys.stdout.write(self._txt.format(mark, fill, run, eta))
        sys.stdout.flush()

        self._duration = run

    @property
    def duration(self):
        """ Return total wall time of process. """
        if self._duration is None:
            raise ValueError("Progress not yet measured.")
        return self._duration


def progress_bar(
        array: list[object] | Iterator,
        ncols: Optional[int] = 40,
        marker: Optional[str] = "█",
        size: Optional[int] = None,
        enum: Optional[bool] = False
    ):
    """ Wrapper to use progress bar as iterator.

    Parameters
    ----------
    array: list[object] | Iterator
        List of iterator of objects to track progression.
    ncols: Optional[int] = 40
        Number of columns used for bar tracing.
    marker: Optional[str] = "█"
        Single character used for filling up the bar.
    size: Optional[int] = None
        If `array` does not have a length, *i.e*, it is an iterator,
        the size of the provided object is mandatory and provided
        through this parameters.
    enum: Optional[bool] = False
        If true, return the zero based object counter.
    """
    size = size if size is not None else len(array)
    pbar = ProgressBar(ncols=ncols, marker=marker)

    for count, value in enumerate(array, 1):
        pbar.update(count / size)
        yield value if not enum else (count - 1, value)

    print(f"\nTook {pbar.duration}s")



def download_file(url: str, saveas: str | Path):
    """ Download file from given URL and destination path.

    Reference
    ---------
    https://stackoverflow.com/questions/34692009

    Parameters
    ----------
    url : str
        URL of file to download.
    saveas : path-like
        Path to save downloaded file.
    """
    r = requests.get(url, stream=True)
    status = r.status_code

    match status:
        case 200:
            with open(saveas, "wb") as fp:
                r.raw.decode_content = True
                shutil.copyfileobj(r.raw, fp)
        case _:
            Exception(f"Download of {url} failed with status {status}")
