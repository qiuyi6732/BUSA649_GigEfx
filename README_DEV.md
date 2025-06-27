
# GigEfx Database & Scraping System – Developer Documentation

This document provides all necessary technical instructions to understand, maintain, and extend the GigEfx database and data scraping infrastructure. It assumes access to the existing AWS RDS environment and GitHub handoff repository.

---

## Project Structure

```
handoff_files/
├── README_CLIENT.md
├── README_DEV.md
├── connection_config.txt
├── requirements.txt
├── SQL_scripts/
├── data_scraping/
├── screenshots/
```

---

## Database Overview

- **Platform**: AWS RDS (MySQL)
- **Host**: See `connection_config.txt`
- **Schema**: Retail-focused, supports mobile device data, store info, pricing, users, reviews, and delivery coverage

### Key Tables:
- `Items`, `ItemCategory`, `Prices`
- `Stores`, `StoreInventory`, `StoreDeliveryAreas`
- `Users`, `UserRatings`

### Schema Files:
- `SQL_scripts/01_create_schema.sql`: Creates all tables
- `SQL_scripts/02_insert_sample_data.sql`: Loads sample data

Use DBeaver or MySQL client to connect and verify.

---

## How to Connect (Local Testing)

1. Use values in `connection_config.txt` to configure `.env` or local connection
2. Tools: DBeaver, MySQL Workbench, or CLI
3. All passwords are stored separately and can be rotated on AWS if needed

---

## Sample Query (for testing)

```sql
SELECT s.StoreName, i.ItemName, p.UnitPrice
FROM Stores s
JOIN StoreInventory si ON s.StoreId = si.StoreId
JOIN Items i ON si.ItemId = i.ItemId
JOIN Prices p ON i.ItemId = p.ItemId
LIMIT 10;
```

---

## Scraping Module

All data scraping logic resides in `data_scraping/`.

### Files:
- `scraping_main.py`: Main script (run this)
- `parsing_utils.py`: Helper functions for cleaning/structuring HTML data
- `scrape_config.json`: Input settings – platform URLs, search keywords
- `sample_output.csv`: Output sample (loaded into database during validation)

### How to Run:

```bash
pip install -r requirements.txt
python data_scraping/scraping_main.py
```

> Output is saved as CSV by default

---

## Deployment Notes

- Database is hosted on AWS RDS with no CI/CD pipeline attached (manual SQL execution or via DBeaver)
- Scraped data must be inserted manually or through an ETL script (not provided)
- No front-end or API layer currently attached

---

## File Naming & Git Structure

- Use clear file naming: `create_schema.sql`, `insert_data.sql`, `scraping_main.py`
- Keep all sensitive credentials in `connection_config.txt` (excluded from README uploads)
- ERD and schema documentation to be kept in `SQL_scripts/` and ideally exported as `erd_diagram.png` in `screenshots/`

---

## Recommended Improvements

- Add automated ETL pipeline to load scrape output into database
- Introduce logging/error handling in scraping module
- Add pagination & anti-bot handling for more robust scraping
- Deploy a lightweight web interface for data access and admin queries

---

## Maintainers

This project was developed as part of McGill MMA BUSA649.  
For questions, contact:

- Qiuyi Wang – [qiuyi.wang@mail.mcgill.ca](mailto:qiuyi.wang@mail.mcgill.ca)  
- Ziyan Chen – [ziyan.chen@mail.mcgill.ca]

---

## License & Access

- Code is shared for internal use only
- AWS credentials are owned by the client (GigEfx); password rotation is managed by them
