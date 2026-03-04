CREATE OR REPLACE TABLE marts.dim_listings AS
SELECT
    id AS listing_id,
    name AS listing_name,
    host_id,
    host_name,
    neighbourhood,
    room_type,
    minimum_nights,
    number_of_reviews,
    calculated_host_listings_count,
    availability_365
FROM staging.listings;
