CREATE OR REPLACE TABLE marts.dim_hosts AS
SELECT DISTINCT
    host_id,
    host_name,
    calculated_host_listings_count AS total_listings
FROM staging.listings;
