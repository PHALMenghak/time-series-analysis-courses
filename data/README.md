# Data Catalog

This directory stores datasets utilized for practical sessions and assignments in Time Series Analysis.

## Datasets

### 1. Gold Price Dataset (`gold_price.csv`, `gold_price_daily.csv`, `gold_price_monthly.csv`)
- **Asset / Instrument:** COMEX Continuous Gold Futures (`GC=F`), Chicago Mercantile Exchange (CME Group) / Yahoo Finance.
- **Underlying:** Physical Gold (*XAU*), standard delivery.
- **Target Variable:** `price` (daily settlement closing price).
- **Currency & Unit:** USD ($) per troy ounce.
- **Time Horizon:** 2 January 2015 to 26 October 2026.
- **Observations:** 
  - `gold_price.csv`: 2,971 daily observations (columns: `date`, `price`).
  - `gold_price_daily.csv`: 2,971 daily records with OHLCV (`date`, `price`, `open`, `high`, `low`, `volume`).
  - `gold_price_monthly.csv`: 142 monthly aggregate observations (`date`, `price`).
- **Data Acquisition Script:** Reproducible script available at [`scripts/download_gold_data.R`](../scripts/download_gold_data.R).

### 2. Built-in Textbooks Series
- Practicals TP01 and TP02 utilize textbook datasets directly from the `TSA` R package (`larain`, `color`, `tempdub`).
