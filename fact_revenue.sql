CREATE OR REPLACE TABLE marts.fact_revenue AS
SELECT
    listing_id,
    date,
    available,
        -- Clean price to numeric
    CAST(REPLACE(price, '$', '') AS DOUBLE) AS price_numeric,

    -- Revenue logic
    CASE 
        WHEN available = false THEN CAST(REPLACE(price, '$', '') AS DOUBLE)
        ELSE 0
    END AS revenue,

    -- Occupancy logic
    CASE 
        WHEN available = false THEN 1
        ELSE 0
    END AS is_booked,

    -- Listing metadata
    listing_name,
    host_id,
    host_name,
    neighbourhood,
    room_type,
    minimum_nights,
    number_of_reviews,
    calculated_host_listings_count,
    availability_365

FROM marts.fact_calendar;
