# ==============================================================================
# Script: download_gold_data.R
# Purpose: Fetch official real-market historical gold prices via COMEX / Yahoo Finance
# Output: data/gold_price.csv, data/gold_price_daily.csv, data/gold_price_monthly.csv
# ==============================================================================

library(quantmod)
library(zoo)

dir.create("data", showWarnings = FALSE)

cat("Fetching COMEX Continuous Gold Futures (GC=F) from Yahoo Finance...\n")
gold_xts <- getSymbols("GC=F", from = "2015-01-01", auto.assign = FALSE)

# Clean missing / non-trading values
gold_clean <- na.omit(gold_xts)

# 1. Daily Dataset
daily_df <- data.frame(
  date   = as.character(index(gold_clean)),
  price  = as.numeric(gold_clean[, "GC=F.Close"]),
  open   = as.numeric(gold_clean[, "GC=F.Open"]),
  high   = as.numeric(gold_clean[, "GC=F.High"]),
  low    = as.numeric(gold_clean[, "GC=F.Low"]),
  volume = as.numeric(gold_clean[, "GC=F.Volume"])
)

write.csv(daily_df, "data/gold_price_daily.csv", row.names = FALSE)
write.csv(daily_df[, c("date", "price")], "data/gold_price.csv", row.names = FALSE)
cat("Saved daily gold prices to data/gold_price.csv (", nrow(daily_df), " rows)\n")

# 2. Monthly Aggregate Dataset (Ideal for SARIMA s=12 seasonal modeling)
monthly_xts <- to.monthly(gold_clean[, "GC=F.Close"], indexAt = "firstof", OHLC = FALSE)
monthly_df <- data.frame(
  date  = as.character(index(monthly_xts)),
  price = as.numeric(monthly_xts)
)

write.csv(monthly_df, "data/gold_price_monthly.csv", row.names = FALSE)
cat("Saved monthly gold prices to data/gold_price_monthly.csv (", nrow(monthly_df), " rows)\n")
