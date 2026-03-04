CREATE OR REPLACE TABLE staging.listings AS
SELECT
    id,
    name,
    host_id,
    host_name,
    neighbourhood_cleansed AS neighbourhood,
    room_type,
    price,
    minimum_nights,
    number_of_reviews,
    calculated_host_listings_count,
    availability_365
FROM raw_listings;
