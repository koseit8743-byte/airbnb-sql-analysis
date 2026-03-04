Airbnb Market Analysis Using SQL

This project analyzes Airbnb occupancy patterns using SQL. It includes data cleaning, modeling, listing performance scoring, host analysis, neighbourhood demand evaluation, seasonality forecasting, and clustering. All analysis was performed using DuckDB avnd SQL.

PROJECT STRUCTURE:
AIRBNB/
│
├── analysis/
│   └── AnalysisInsight.report
│
├── data/
│   ├── calendar.csv
│   ├── listings.csv
│   ├── neighbourhoods.csv
│   └── reviews.csv
│
├── sql/
│   ├── AnalyzeSql/
│   │   ├── DemandBased.sql
│   │   ├── HostAnalysis.sql
│   │   ├── NeighborhoodsAnalysis.sql
│   │   └── OccupancyBasedAnalysis.sql
│   │
│   ├── stg_calendar.sql
│   ├── stg_listings.sql
│   ├── stg_neighbourhoods.sql
│   ├── stg_reviews.sql
│   ├── dim_hosts.sql
│   ├── dim_listings.sql
│   ├── dim_neighbourhoods.sql
│   ├── fact_calendar.sql
│   ├── fact_revenue.sql
│   └── (other transformation SQL files)
│
├── mydb.duckdb
├── mydb.duckdb.wal
└── duckdb.exe


The core table is fact_revenue, containing nightly availability, listing metadata, neighbourhood, and host information. Key fields include: date, listing_id, host_id, neighbourhood, is_booked.

Data Cleaning & Modeling:

stg_calendar.sql — cleans raw calendar data
stg_listings.sql — standardizes listing metadata
stg_neighbourhoods.sql — cleans neighbourhood data
stg_reviews.sql — prepares review data
dim_listings.sql — listing dimension
dim_hosts.sql — host dimension
dim_neighbourhoods.sql — neighbourhood dimension
fact_calendar.sql — nightly availability fact table
fact_revenue.sql — final analytical fact table

Analysis Queries (in /AnalyzeSql):

OccupancyBasedAnalysis.sql — listing performance & occupancy scoring
HostAnalysis.sql — host portfolio behavior
NeighborhoodsAnalysis.sql — neighbourhood demand patterns
DemandBased.sql — seasonality, weekday/weekend, demand forecasting


 How to Run the Project

You can use the included duckdb.exe or install DuckDB separately

Run the SQL scripts in this order:
Staging tables (stg_*.sql)
Dimensions (dim_*.sql)
Fact tables (fact_*.sql)
Analysis queries in /sql/AnalyzeSql
Review results in /analysis
## Data Source
The original Airbnb dataset is too large to upload to GitHub.  
You can download it here:
https://insideairbnb.com/get-the-data/