-- Host listing count 
SELECT
    host_id,
    host_name,
    total_listings
FROM marts.dim_hosts
ORDER BY total_listings DESC;

--- Host occupancy rate
SELECT
    host_id,
    host_name,
    AVG(is_booked) AS occupancy_rate
FROM marts.fact_revenue
GROUP BY host_id, host_name
ORDER BY occupancy_rate DESC;

--- Host performance score
SELECT
    host_id,
    host_name,
    ROUND(AVG(is_booked) * 100, 0) AS performance_score,
    COUNT(DISTINCT listing_id) AS listing_count
FROM marts.fact_revenue
GROUP BY host_id, host_name
ORDER BY performance_score DESC;

--- Best Hosts 
SELECT
    host_id,
    host_name,
    COUNT(DISTINCT listing_id) AS listing_count,
    ROUND(AVG(is_booked) * 100, 0) AS performance_score
FROM marts.fact_revenue
GROUP BY host_id, host_name
HAVING COUNT(DISTINCT listing_id) > 5
ORDER BY listing_count DESC;

--- Underperforming Hosts
SELECT
    host_id,
    host_name,
    COUNT(DISTINCT listing_id) AS listing_count,
    ROUND(AVG(is_booked) * 100, 0) AS performance_score
FROM marts.fact_revenue
GROUP BY host_id, host_name
HAVING AVG(is_booked) < 0.40
ORDER BY performance_score ASC;



