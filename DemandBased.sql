--- Monthly demand patterns
SELECT strftime('%Y-%m', date) AS month,
 AVG(is_booked) AS occupancy_rate 
 FROM marts.fact_revenue
  GROUP BY month ORDER BY month;

---Neighbourhood demand patterns
  SELECT
    neighbourhood,
    AVG(is_booked) AS occupancy_rate
FROM marts.fact_revenue
GROUP BY neighbourhood
ORDER BY occupancy_rate DESC;

-- Seasonal Demand
SELECT strftime('%m', date) AS month,
 AVG(is_booked) AS occupancy_rate 
 FROM marts.fact_revenue 
 GROUP BY month 
 ORDER BY month;

---This shows how sensitive each neighbourhood is to demand changes.
WITH monthly AS ( SELECT neighbourhood, strftime('%Y-%m', date) AS month,
 AVG(is_booked) AS occupancy_rate 
 FROM marts.fact_revenue
  GROUP BY neighbourhood, month ) 
 
 SELECT neighbourhood, MIN(occupancy_rate) AS low_demand, MAX(occupancy_rate) AS high_demand, MAX(occupancy_rate) - MIN(occupancy_rate) AS demand_variation
 FROM monthly
  GROUP BY neighbourhood 
  ORDER BY demand_variation DESC; 