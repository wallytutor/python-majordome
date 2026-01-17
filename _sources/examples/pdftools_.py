# ---
# jupyter:
#   jupytext:
#     cell_metadata_filter: -all
#     default_lexer: ipython3
#     formats: py:percent
#     text_representation:
#       extension: .py
#       format_name: percent
#       format_version: '1.3'
#       jupytext_version: 1.18.1
#   kernelspec:
#     display_name: Python 3 (ipykernel)
#     language: python
#     name: python3
# ---

# %% [markdown]
# # PDF text extraction

# %% [markdown]
# Below we illustrate the usage of `PdfToTextConverted`. Please notice that data curation of extracted texts is still required if readability is a requirement. If quality of automated extractions is often poor for a specific language, you might want to search the web how to *train tesseract*, that topic is not covered here.

# %% [markdown]
# **Note:** this note assumes [tesseract](https://github.com/tesseract-ocr/tesseract) and [poppler](https://github.com/oschwartz10612/poppler-windows), and [ImageMagick](https://imagemagick.org/) are available in system path. Under Windows you might struggle to get them all working together, please check Majordome's Kompanion for automatic installation.

# %% [markdown]
# Install dependencies on Ubuntu 22.04:
#
# ```bash
# sudo apt install tesseract-ocr imagemagick poppler-utils
# ```
#
# In case of Rocky Linux 9:
#
# ```bash
# sudo dnf install tesseract tesseract-langpack-eng ImageMagick poppler-utils
# ```

# %%
from majordome import PdfToTextConverter

# %% [markdown]
# Assuming the dependencies are found in the path, it is simply a matter of creating a converter:

# %%
converter = PdfToTextConverter()

# %% [markdown]
# For generated PDF (not scanned documents), it is much faster to avoir using OCR; below we show the metadata from a paper:

# %%
data = converter("data/sample-pdf/paper.pdf", use_ocr=False)
data.meta

# %% [markdown]
# For scanned documents, by default if OCR is not enabled it will be used as a fallback method for text extraction:

# %%
data = converter("data/sample-pdf/scanned.pdf", last_page=1)
data.content[:500]
