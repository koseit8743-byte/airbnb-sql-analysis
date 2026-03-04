--- Occupancy rate by neighborhood.
SELECT
    neighbourhood,
    AVG(is_booked) AS occupancy_rate,
    COUNT(*) AS total_nights
FROM marts.fact_revenue
GROUP BY neighbourhood
ORDER BY occupancy_rate DESC;

--- Convert occupancy into a simple 0–100 score.
SELECT
SELECT neighbourhood, COUNT(DISTINCT listing_id) AS supply, 
    SUM(is_booked) AS demand, 
    ROUND(AVG(is_booked) * 100, 0) AS occupancy_score 
    FROM marts.fact_revenue 
    GROUP BY neighbourhood 
    ORDER BY occupancy_score DESC;

    --- Supply and demand by neighborhood.
    SELECT
    neighbourhood,
    COUNT(DISTINCT listing_id) AS supply,
    SUM(is_booked) AS demand,
    ROUND(AVG(is_booked) * 100, 0) AS occupancy_score
FROM marts.fact_revenue
GROUP BY neighbourhood
ORDER BY occupancy_score DESC;
