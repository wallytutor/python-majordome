# -*- coding: utf-8 -*-
import functools
import logging


class ColorFormatter(logging.Formatter):
    """ Simple colored formatter for logging. """
    RESET = "\033[0m"
    COLORS = {"DEBUG":    "\033[94m",  # Blue
              "INFO":     "\033[92m",  # Green
              "WARNING":  "\033[93m",  # Yellow
              "ERROR":    "\033[91m",  # Red
              "CRITICAL": "\033[95m"}  # Magenta

    def format(self, record):
        color = self.COLORS.get(record.levelname, self.RESET)
        return f"{color}{super().format(record)}{self.RESET}"


class WalangLogger:
    """ A simple logger for Walang with colored output. """
    __slots__ = ("logger",)

    def __init__(self) -> None:
        handler = logging.StreamHandler()
        handler.setFormatter(ColorFormatter("%(levelname)s: %(message)s"))

        self.logger = logging.getLogger("walang")
        self.logger.setLevel(logging.DEBUG)
        self.logger.addHandler(handler)

    def info(self, message: str) -> None:
        self.logger.info(message)

    def debug(self, message: str) -> None:
        self.logger.debug(message)

    def warning(self, message: str) -> None:
        self.logger.warning(message)

    def error(self, message: str) -> None:
        self.logger.error(message)

    def critical(self, message: str) -> None:
        self.logger.critical(message)


def runtime_arguments(func):
    """ Decorator to add runtime arguments to the main function. """
    global WALANG_LOGGER

    @functools.wraps(func)
    def wrapper(*args, **kwargs):
        WALANG_LOGGER.info(f"{func.__name__.upper()}...")
        WALANG_LOGGER.info(f"\targs   = {args}")
        WALANG_LOGGER.info(f"\tkwargs = {kwargs}")
        return func(*args, **kwargs)

    return wrapper


WALANG_LOGGER = WalangLogger()
