CREATE OR REPLACE TABLE staging.calendar AS
SELECT
    listing_id,
    date,
    available,
    price
FROM raw_calendar;
