DROP TABLE IF EXISTS supplychain.otd_rate_summary;
CREATE TABLE supplychain.otd_rate_summary AS
SELECT 
    market,
    order_country,
    ROUND(SUM(CASE WHEN Delivery_Status='shipping on time' THEN 1 ELSE 0 END)
/ COUNT(DISTINCT order_id), 2) AS OTD_rate,
    ROUND(SUM(sales),2) AS total_sales,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND((SUM(sales)/COUNT(DISTINCT order_id)),2) AS AOV
FROM supplychain.supplychain_cleaned
GROUP BY order_country, market
ORDER BY OTD_rate DESC;



SELECT 
    (AVG(OTD_rate * total_sales) - AVG(OTD_rate) * AVG(total_sales)) /
    (STDDEV(OTD_rate) * STDDEV(total_sales)) AS corr_otd_sales,

    (AVG(OTD_rate * total_orders) - AVG(OTD_rate) * AVG(total_orders)) /
    (STDDEV(OTD_rate) * STDDEV(total_orders)) AS corr_otd_orders,

    (AVG(OTD_rate * AOV) - AVG(OTD_rate) * AVG(AOV)) /
    (STDDEV(OTD_rate) * STDDEV(AOV)) AS corr_otd_aov
FROM supplychain.otd_rate_summary;
