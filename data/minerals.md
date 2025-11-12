# Data recovery from THERMODDEM webpage


References:

- [Beautiful Soup: Build a Web Scraper With Python](https://realpython.com/beautiful-soup-web-scraper-python/)
- [Beautiful Soup Documentation](https://www.crummy.com/software/BeautifulSoup/bs4/doc/)

```python
from pathlib import Path
from time import perf_counter
from typing import Any
from bs4 import BeautifulSoup
from bs4.element import Tag, ResultSet
from requests.models import Response
from tinydb.database import TinyDB
import re
import requests
```

```python
URL   = "https://thermoddem.brgm.fr"
QUERY = "/data/minerals?page={n}"
```

```python
def get_number_of_pages() -> int:
    """ Find number of pages in database. """
    page = requests.get(f"{URL}{QUERY.format(n=0)}")
    
    soup = BeautifulSoup(page.content, "html.parser")
    pager = soup.find("ul", class_="pager")
    last = pager.find("li", class_="pager-last")
    ref = last.find("a").attrs["href"]

    if not (match := re.search(r"\?page=(\d+)", ref)):
        raise RuntimeError("Cannot extract page number from {ref}")
        
    return int(match.group(1))
```

```python
def retrieve_navigation_table(page: Response) -> Tag:
    """ Retrieve `<table class="views-table cols-4">` from page. """
    if page.status_code != 200:
        raise RuntimeError(f"Unable to retrieve data from {page.url}!")
        
    soup = BeautifulSoup(page.content, "html.parser")
    tables = soup.find_all("table", class_="views-table")
    
    if (n_tables := len(tables)) > 1:
        print(f"Unexpected, more than 1 ({n_tables}) table!")
    
    tbody = tables[0].find_all("tbody")

    if (n_bodies := len(tbody)) > 1:
        print(f"Unexpected, more than 1 ({n_bodies}) bodies!")

    return tbody[0].find_all("tr")
```

```python
def extract_species_paths(rows: ResultSet) -> list[str]:
    """ Find link to all species in row set. """
    paths = []
    
    for i, row in enumerate(rows):
        try:
            col = row.find_all("td")[0]
            ref = col.find_all("a")[-1].attrs["href"]
            paths.append(ref)
        except Exception as err:
            print(f"While parsing row {i}: {err}")

    return paths
```

```python
def retrieve_all_paths(verbose: bool = False) -> list[str]:
    n_pages = get_number_of_pages()
    paths = []
    
    for n in range(n_pages + 1):
        if verbose and not n % 2:
            print(f"Working on page {n:02}/{n_pages}")
        
        page = requests.get(f"{URL}{QUERY.format(n=n)}")
        rows = retrieve_navigation_table(page)
        paths.extend(extract_species_paths(rows))

    return paths
```

```python
def get_thermo_row(tag: Tag) -> list[str]:
    """ Extract text data from first row of table. """
    rows = tag.find("tbody").find_all("tr")
    
    if (n_rows := len(rows)) > 1:
        print(f"Unexpected, more than 1 ({n_rows}) rows!")
    
    cols = rows[0].find_all("td")
    data = [c.text.strip() for c in cols]

    return data
```

```python
def get_thermo_species(species_path: str) -> dict[str, Any]:
    """ Retrieve data from a single species URL. """
    page = requests.get(f"{URL}{species_path}")
    
    if page.status_code != 200:
        raise RuntimeError(f"Unable to retrieve data from {page.url}!")
    
    soup = BeautifulSoup(page.content, "html.parser")

    # Header where one finds the title:
    article = soup.find("article", class_="node-mineral")

    # There are 4 `blockthermodynamics`:
    # 0 -> Molar mass and Maier-Kelley
    # 1 -> log10K and its coefficients
    # 2 -> Minitable with 298.15K, 1 bar data
    # 3 -> same as coefficients of [1]
    thermo = soup.find_all("div", class_="blockthermodynamics")

    # In thermo[0] there are 2 `table` elements:
    # 0 -> Molar mass, etc
    # 1 -> Maier-Kelley
    (mm, mk) = thermo[0].find_all("table")
    
    payload = {
        "path": species_path,
        "title": article.find("h2").text,
        "individual_props": get_thermo_row(mm),
        "maierkelley_props": get_thermo_row(mk)
    }

    return payload
```

```python
def create_raw_database(*, dbname: str) -> TinyDB:
    """ Manage all required requests to construct a species database. """
    if Path(dbname).exists():
        return TinyDB(dbname)

    t0 = perf_counter()
    paths = retrieve_all_paths()
    db = TinyDB(dbname)
    
    species = db.table("species-raw", cache_size=len(paths))

    for i, species_path in enumerate(paths):
        try:
            data = get_thermo_species(species_path)
            species.insert(data)
        except Exception as err:
            print(f"While parsing row {i}: {err}")

    print(f"Extraction took {perf_counter()-t0:.0f} s")
    return db
```

```python
db = create_raw_database(dbname="sandbox.json")

raw = db.table("species-raw")
data = raw.all()
```

```python
data[0]
```
