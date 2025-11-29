DROP VIEW IF EXISTS supplychain.customer_segmentation_view;
CREATE VIEW supplychain.customer_segmentation_view AS
SELECT
    market,
    order_country,
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers,
    COUNT(DISTINCT product_name) AS total_products,
    ROUND((SUM(sales)/COUNT(DISTINCT order_id)),2) AS AOV,
    TIMESTAMPDIFF(MONTH, MIN(order_date), MAX(order_date)) + 1 AS active_months,
    ROUND(SUM(sales),2) AS total_sales,
    ROUND((SUM(sales)/((MAX(order_date) - MIN(order_date))/30 + 1)),2) AS avg_sales_per_month,
    ROUND((SUM(sales)/COUNT(DISTINCT customer_id)),2) AS avg_sales_per_customer,

    CASE 
        WHEN COUNT(DISTINCT order_id) >= 5 THEN 'loyal customer'
        WHEN COUNT(DISTINCT order_id) BETWEEN 2 AND 4 THEN 'regular customer'
        WHEN COUNT(DISTINCT order_id) = 1 THEN 'one time customer'
        ELSE 'unknown'
    END AS customer_segment,

    ROUND(SUM(CASE WHEN Delivery_Status='shipping on time' THEN 1 ELSE 0 END)
    / COUNT(DISTINCT order_id), 2) AS OTD_rate

FROM supplychain.supplychain_cleaned
GROUP BY market, order_country
ORDER BY total_sales DESC;
