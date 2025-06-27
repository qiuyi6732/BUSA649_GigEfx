# Data Scraping Module – GigEfx

This folder contains the manual data extraction script developed for the GigEfx project. It is designed to retrieve mobile phone product information (e.g., name, price, brand) from selected South African e-commerce platforms and generate a structured CSV file aligned with the database schema.

---

## Contents

- `scarping_main.ipynb` – Jupyter Notebook that executes the scraping logic using `requests` and `BeautifulSoup`. It fetches HTML content, parses key product fields, and stores the output as a structured CSV.
- `sample_output.csv` – Sample extracted data including item name, brand, unit price, currency, rating, and promotional status.

---

## How to Use

1. Open and run `scarping_main.ipynb` in Jupyter Notebook or VSCode.
2. The script will send an HTTP request to the specified product listing page.
3. Product data (name, brand, price, etc.) will be parsed and saved to `sample_output.csv`.

---

## Output Format

The output CSV follows the expected structure for loading into the database:

| ItemName       | Brand      | UnitPrice | Currency | Rating | IsPromotion |
|----------------|------------|-----------|----------|--------|-------------|
| Samsung A04s   | Samsung    | 1999.00   | ZAR      | 4.5    | TRUE        |
| iPhone 13 128G | Apple      | 15499.00  | ZAR      | 4.8    | FALSE       |
| ...            | ...        | ...       | ...      | ...    | ...         |

---

## Dependencies

Make sure the following Python packages are installed:

```bash
pip install requests beautifulsoup4 pandas
```

---

## Notes

- The script uses static HTML parsing; it does not handle JavaScript-rendered pages.
- The current configuration targets one platform only (e.g., Pick n Pay). For extension to other sites, manual editing of the HTML tag structure inside the notebook is required.
- Scraped data can be further cleaned and uploaded to the `Items` and `Prices` tables in the database.

---

## Status

This scraping module serves as a **proof-of-concept** for GigEfx and validates compatibility between external web sources and the internal schema. It is not a production-grade pipeline but is designed to be easily extensible.
