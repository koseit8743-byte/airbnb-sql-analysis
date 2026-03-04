CREATE OR REPLACE TABLE staging.reviews AS
SELECT
    listing_id,
    date,
    reviewer_id,
    reviewer_name,
    comments
FROM raw_reviews;
