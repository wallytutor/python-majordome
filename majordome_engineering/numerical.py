# -*- coding: utf-8 -*-
from numpy.typing import NDArray
import logging
import warnings
import numpy as np


class RelaxUpdate:
    """ Relax solution for updating new iteration.

    Parameters
    ----------
    v_ini: np.ndarray
        Initial guess of solution.
    alpha: float = 0.5
        Fraction of old solution to use at updates.
    """
    def __init__(self, v_ini: NDArray[np.float64],
                 alpha: float = 0.5) -> None:
        self._c_old = alpha
        self._c_new = 1.0 - alpha

        self._v_old = np.copy(alpha * v_ini)
        self._v_new = np.empty_like(v_ini)

    def update(self, alpha: float) -> None:
        """ Update relaxation coefficients.

        Parameters
        ----------
        alpha: float
            Fraction of old solution to use at updates.
        """
        self._c_old = alpha
        self._c_new = 1.0 - alpha

    def __call__(self, v_new: NDArray[np.float64]) -> NDArray[np.float64]:
        """ Evaluate new relaxed solution estimate.

        Parameters
        ----------
        v_new: np.ndarray
            New solution estimate to be relaxed.
        """
        self._v_new[:] = self._c_new * v_new + self._v_old
        self._v_old[:] = self._c_old * self._v_new
        return self._v_new


class StabilizeNvarsConvergenceCheck:
    """ Check stabilization towards a constant value along iterations.

    Parameters
    ----------
    n_vars: int
        Number of variables to be checked in problem.
    min_iter: int = 1
        Minimum number of iterations before considering converged.
    max_iter: int = 1_000_000
        Maximum number of iterations before considering failure.
    patience: int = 10
        Number of consecutive convergences before declaring convergence.
    rtol: float = 1.0e-06
        See `numpy.isclose` for details.
    atol: float = 1.0e-12
        See `numpy.isclose` for details.
    equal_nan: bool = False
        See `numpy.isclose` for details.
    log_iter: bool = False
        If true, log convergence message when achieved.
    """
    def __init__(self, *, n_vars: int, min_iter: int = 1,
                 max_iter: int = 1_000_000, patience: int = 10,
                 rtol: float = 1.0e-10,  atol: float = 1.0e-20,
                 equal_nan: bool = False, log_iter: bool = False,
                 ) -> None:
        # TODO add some validation here.
        self._min_iter = min_iter
        self._max_iter = max_iter
        self._patience = patience

        self._last = np.full(n_vars, np.inf)
        self._niter = 0
        self._count = 0
        self._log_iter = log_iter

        def is_close(A, B):
            return np.isclose(A, B, rtol=rtol, atol=atol,
                              equal_nan=equal_nan)

        self._close = is_close

    def _compare(self, A, B):
        """ Compare two arrays for convergence. """
        return self._close(A, B)

    def __call__(self, state: NDArray[np.float64]) -> bool:
        """ Check if all variables have stabilized at current iteration.

        Parameters
        ----------
        state: NDArray[np.float64]
            Current solution state to be checked for convergence.
        """
        # Increase counter:
        self._niter += 1

        # Logical checks for leaving:
        converge_enough_times  = self._count >= self._patience
        reached_min_iterations = self._niter >= self._min_iter

        # If converging for a while, good, but for a minimum iterations!
        if converge_enough_times and reached_min_iterations:
            if self._log_iter:
                logging.info(f"Converged after {self._niter} iterations")
            return True

        # If reached each, we are *good* here...
        if self._niter >= self._max_iter:
            warnings.warn(f"Leaving after `max_iter` without convergence")
            return True

        # Converge once, count it, otherwise reset counter:
        if np.all(self._compare(self._last, state)):
            self._count += 1
        else:
            self._count = 0

        # TODO report variables lacking convergence?
        # capture results of self._compare.

        # Swap solution states for next call:
        self._last[:] = state

        # Not good, call me back later, folks!
        return False

    @property
    def n_iterations(self) -> int:
        """ Provides access to number of iterations performed. """
        return self._niter


class ComposedStabilizedConvergence:
    """ Wrapper for checking stabilization of several arrays.

    See `StabilizeNvarsConvergenceCheck` for keyword arguments;
    these are shared by all tested arrays. It is always possible to
    compose your own convergence checker using individual instances
    for more control over setup.

    Parameters
    ----------
    n_arrs: int
        Number of arrays to be checked for convergence.
    kwargs:
        See `StabilizeNvarsConvergenceCheck` for details.
    """
    def __init__(self, n_arrs: int, **kwargs):
        conv = [StabilizeNvarsConvergenceCheck(**kwargs)
                for _ in range(n_arrs)]
        self._conv = np.array(conv, dtype=object)
        self._niter = 0

    def __call__(self, *arrs: tuple[NDArray[np.float64], ...]) -> bool:
        """ Check if all arrays have stabilized at current iteration.

        Parameters
        ----------
        arrs: tuple[NDArray[np.float64], ...]
            Arrays to be checked for convergence.
        """
        self._niter += 1

        if len(arrs) != self._conv.shape[0]:
            raise RuntimeError("Bad number of arrays to verify")

        # XXX: run until a first failure only (lazy evaluation).
        for data, conv in zip(arrs, self._conv):
            if not conv(data):
                return False

        return True

    @property
    def n_iterations(self) -> int:
        """ Provides access to number of iterations performed. """
        return self._niter