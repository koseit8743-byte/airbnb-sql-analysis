CREATE OR REPLACE TABLE marts.dim_neighbourhoods AS
SELECT
    neighbourhood AS neighbourhood_name
FROM staging.neighbourhoods;
