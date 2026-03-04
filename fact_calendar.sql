CREATE OR REPLACE TABLE marts.fact_calendar AS
-- creating Airbnb "events" by joining calendar and listings tables
--Events are a listing on a specific date with a specific price and availability.
SELECT  
    c.listing_id,
    c.date,
    c.available,
    c.price,
    
    -- Listing metadata
    l.name AS listing_name,
    l.host_id,
    l.host_name,
    l.neighbourhood,
    l.room_type,
    l.minimum_nights,
    l.number_of_reviews,
    l.calculated_host_listings_count,
    l.availability_365

FROM staging.calendar c
LEFT JOIN staging.listings l
    ON c.listing_id = l.id;
