# -*- coding: utf-8 -*-
import os
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from pdf2image import convert_from_path
from pypdf import PdfReader
from pytesseract import pytesseract, image_to_string

from .common import program_path
from .internals import majordome_warning


@dataclass
class PdfExtracted:
    """ Stores data extracted from a PDF file. """
    meta: dict[str, Any] | None
    content: str


class PdfToTextConverter:
    """ Performs text extraction from PDF file.

    Please notice that Tesseract executable path is to be supplied (if
    not in PATH) and not its containing directory, while Poppler's
    directory containing `pdftotext` and other tools is also to be
    supplied (if these are not in PATH).

    Parameters
    ----------
    tesseract : Path | None, optional
        Path to Tesseract executable. If None, searches in PATH.
    pdftotext : Path | None, optional
        Path to pdftotext directory. If None, searches in PATH.
    n_pages_warn : int, optional
        Number of pages above which a warning is issued. Default is 100.
    """
    __slots__ = ("_tesseract", "_pdftotext", "_bigpdf")

    def __init__(self, tesseract: Path | None = None,
                 pdftotext: Path | None = None, n_pages_warn: int = 100) -> None:
        self._pdftotext = self._ensure_program("pdftotext", pdftotext)
        self._tesseract = self._ensure_program("tesseract", tesseract)
        self._bigpdf = n_pages_warn

        if self._pdftotext is not None:
            self._pdftotext = self._pdftotext.parent

        pytesseract.tesseract_cmd = self._tesseract

    def _ensure_program(self, name: str, program: Path | None) -> Path | None:
        """ Ensure that `program` exists, or find it in PATH. """
        if program:
            if not (program := Path(program)).exists():
                raise FileNotFoundError(f"Missing {name} at {program}")
            return program

        return program_path(name)

    def read(self, pdf_path: str | Path) -> PdfReader | None:
        """ Return True if PDF is not encrypted, performs some checks. """
        doc = PdfReader(pdf_path)

        if doc.is_encrypted:
            majordome_warning(f"PDF is encrypted: {pdf_path}")
            return None

        if (n_pages := len(doc.pages)) > self._bigpdf:
            majordome_warning(f"{pdf_path} is too long ({n_pages})")

        return doc

    def _page_image(self, pdf_path: str | Path, page: int, *, dpi: int = 150,
                    userpw: str | None = None, thread_count: int = 1) -> str:
        """ Handles in-memory conversion of PDF to image. """
        max_threads = os.cpu_count() or 1

        if thread_count > max_threads:
            thread_count = max_threads

        kwargs = {
            "dpi": dpi,
            "first_page": page,
            "last_page": page,
            "thread_count": thread_count,
            "poppler_path": self._pdftotext,
            "output_folder": None,
            "fmt": "ppm",
            "jpegopt": None,
            "use_cropbox": False,
            "strict": False,
            "transparent": False,
            "single_file": False,
            "grayscale": False,
            "size": None,
            "paths_only": False,
        }

        if userpw is not None:
            kwargs["userpw"] = userpw

        images = convert_from_path(pdf_path, **kwargs)
        return image_to_string(images[0])

    def __call__(self, pdf_path: str | Path, first_page: int | None = None,
                 last_page: int | None = None, use_ocr: bool = False,
                 fallback_ocr: bool = True, verbose: bool = False,
                 ocr_opts: dict[str, Any] = {}) -> PdfExtracted | None:
        """ In-memory convertion of PDF to text.

        Parameters
        ----------
        pdf_path : str | Path
            Path to PDF file.
        first_page : int | None, optional
            First page to extract (1-based). If None, starts from first page.
        last_page : int | None, optional
            Last page to extract (1-based). If None, goes to last page.
        use_ocr : bool, optional
            Whether to use OCR for all pages. Default is False.
        fallback_ocr : bool, optional
            Whether to use OCR if text extraction fails. Default is True.
        verbose : bool, optional
            Whether to print metadata. Default is False.
        ocr_opts : dict[str, Any], optional
            Options to pass to OCR engine (e.g., `thread_count`, `dpi`).
        """
        if not (doc := self.read(pdf_path)):
            return None

        meta = doc.metadata

        if use_ocr:
            majordome_warning("OCR may take a long time.")

            if not ocr_opts:
                ocr_opts = {"thread_count": os.cpu_count()}

        if verbose and meta is not None:
            skip = max(map(len, meta.keys()))
            fmt = f"{{key:>{skip+1}s}} : {{value}}"

            for key, value in meta.items():
                print(fmt.format(key=key, value=value))

        content = ""

        for i, page in enumerate(doc.pages, 1):
            if first_page is not None and i < first_page:
                continue

            if last_page is not None and i > last_page:
                break

            if use_ocr:
                print(f"Processing page {i} with OCR...")
                content += self._page_image(pdf_path, page=i, **ocr_opts)
            else:
                text = page.extract_text()

                if not text and fallback_ocr:
                    text = self._page_image(pdf_path, page=i, **ocr_opts)

                content += text

        return PdfExtracted(meta=meta, content=content)
