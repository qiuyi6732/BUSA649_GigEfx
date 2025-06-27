# GigEfx Database Access Guide (Client Version)

## Overview

This document provides a step-by-step guide to accessing and using the GigEfx hosted database. The database stores structured retail data related to mobile products, prices, inventory, stores, users, and delivery areas.

The database is hosted on **Amazon Web Services (AWS RDS)** and can be accessed using a graphical SQL client such as **DBeaver**.

---

## What’s in the Database?

The schema includes the following tables:

- `ItemCategory` – Item category definitions
- `Items` – Product details including name, brand, category, rating
- `Stores` – Store profile including location, contact info, website, and delivery availability
- `StoreInventory` – Store-level inventory by item and date
- `Prices` – Price and promotion information for items
- `Users` – Basic user profile and contact data
- `StoreDeliveryAreas` – Store-to-area delivery fee and estimated time
- `UserRatings` – User-submitted item reviews and scores

> A full ERD and schema documentation is available in the `handoff_files/SQL_scripts/` folder.

---

## Connection Details

### Credentials Location

The connection configuration is stored in a separate text file:

- `connection_config.txt` — located in the `handoff_files/` root directory
- **Note**: The password is not included in the file and should be shared securely (e.g., by email or private message)


You can use any SQL client (recommended: **DBeaver**). Below are the credentials for accessing the database:

| Item              | Value                                                 |
|-------------------|-------------------------------------------------------|
| Host              | `gigefx.cjmse20c0gg6.ap-southeast-2.rds.amazonaws.com` |
| Port              | `3306`                                                |
| Database name     | `gigefx`                                              |
| Username          | `admin`                                               |
| Password          | _Provided separately_                                 |

---

## Setup Instructions (via DBeaver)

1. [Download DBeaver](https://dbeaver.io/download/)
2. Open DBeaver and click `New Database Connection`
3. Choose `MySQL`
4. Fill in the credentials from above
5. Click `Test Connection` → If successful, click `Finish`
6. You can now view tables, run SQL queries, and export data

---

## Sample Query

```sql
SELECT ItemName, Brand, UnitPrice, Date
FROM Items
JOIN Prices ON Items.ItemId = Prices.ItemId
ORDER BY Date DESC
LIMIT 10;
```

> DBeaver login page and query xxample is available in the `handoff_files/screenshots` folder.

---

## Notes

- This is a **read/write** environment. Be cautious with updates or deletions.
- Data is manually loaded during the prototype phase; no automated syncing is active.
- For scraping tools and data mapping, refer to the `data_scraping/` and `SQL_scripts/` folders.

---

## Support

If you need assistance:
- Refer to the ERD and schema in the SQL scripts
- Use the sample queries to test and explore
- Contact the original project team as listed in `README_DEV.md`
