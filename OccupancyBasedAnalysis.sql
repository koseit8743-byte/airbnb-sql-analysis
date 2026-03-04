--- Key performance indicators (KPIs) for Airbnb hosts ---


--- Occupancy rate by neighbourhood
SELECT neighbourhood, AVG(is_booked)
FROM marts.fact_revenue
GROUP BY neighbourhood;

--- occupancy rate 
SELECT
    AVG(is_booked) AS occupancy_rate
FROM marts.fact_revenue;


--Supply
SELECT COUNT(DISTINCT listing_id) AS supply
FROM marts.fact_revenue;

--- Occupancy per listing 
SELECT
    listing_id,
    AVG(is_booked) AS occupancy_rate,
    COUNT(*) AS total_nights
FROM marts.fact_revenue
GROUP BY listing_id
ORDER BY occupancy_rate DESC;

-- Neigborhood performance 
SELECT
    fr.listing_id,
    fr.host_id,
    fr.neighbourhood,
    AVG(fr.is_booked) AS occupancy_rate
FROM marts.fact_revenue fr
GROUP BY fr.listing_id, fr.host_id, fr.neighbourhood
ORDER BY occupancy_rate DESC;

--- Performance rating score
SELECT
    listing_id,
    neighbourhood,
    AVG(is_booked) AS occupancy_rate,
    ROUND(AVG(is_booked) * 100, 0) AS performance_score
FROM marts.fact_revenue
GROUP BY listing_id, neighbourhood
ORDER BY performance_score DESC;

--- Top 10 listings 
SELECT
    listing_id,
    neighbourhood,
    ROUND(AVG(is_booked) * 100, 0) AS performance_score
FROM marts.fact_revenue
GROUP BY listing_id, neighbourhood
ORDER BY performance_score DESC
LIMIT 10;

--- bottom 10 listings 
SELECT
    listing_id,
    neighbourhood,
    ROUND(AVG(is_booked) * 100, 0) AS performance_score
FROM marts.fact_revenue
GROUP BY listing_id, neighbourhood
ORDER BY performance_score ASC
LIMIT 10;

