DROP VIEW IF EXISTS supplychain.otd_shipping_mode_view;

CREATE VIEW supplychain.otd_shipping_mode_view AS
SELECT 
    shipping_mode,
    delivery_status,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(COUNT(DISTINCT order_id)) OVER(PARTITION BY shipping_mode) AS orders_per_shipping_mode,
    ROUND(SUM(sales), 2) AS total_sales,
    COUNT(DISTINCT order_id) * 100.0 /
        SUM(COUNT(DISTINCT order_id)) OVER(PARTITION BY shipping_mode) AS pct_orders,
    ROUND((SUM(sales)/COUNT(DISTINCT order_id)),2) AS AOV
FROM supplychain.supplychain_cleaned
GROUP BY shipping_mode, delivery_status
ORDER BY total_sales DESC;

DROP VIEW IF EXISTS supplychain.avg_delay_view;

CREATE VIEW supplychain.avg_delay_view AS
WITH delay_cte AS (
SELECT
    shipping_mode,
    delivery_status,
    days_for_shipment_scheduled,
    days_for_shipping_real,
    days_for_shipping_real - days_for_shipment_scheduled AS delay_days
FROM supplychain.supplychain_cleaned
)
SELECT
    shipping_mode,
    delivery_status,
    ROUND(AVG(CASE WHEN delay_days > 0 THEN delay_days ELSE 0 END),2) AS avg_delay_days
FROM delay_cte
GROUP BY shipping_mode, delivery_status
ORDER BY avg_delay_days DESC;

DROP VIEW IF EXISTS supplychain.avg_delay_otd_view;

CREATE VIEW supplychain.avg_delay_otd_view AS
SELECT *
FROM supplychain.avg_delay_view
JOIN supplychain.otd_shipping_mode_view USING (shipping_mode, delivery_status)
ORDER BY total_sales DESC;
