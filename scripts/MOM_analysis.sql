WITH monthly_data AS (
    SELECT
        DATE_FORMAT(order_date, '%Y-%m') AS `month`,
        SUM(sales) AS total_sales,
        COUNT(order_id) AS order_volume,
        SUM(sales) * 1.0 / COUNT(order_id) AS aov
    FROM supplychain.supplychain_cleaned
    GROUP BY DATE_FORMAT(order_date, '%Y-%m')
),

with_prev AS (
    SELECT
        m.*,
        LAG(total_sales) OVER (ORDER BY `month`) AS prev_sales,
        LAG(order_volume) OVER (ORDER BY `month`) AS prev_volume,
        LAG(aov) OVER (ORDER BY `month`) AS prev_aov
    FROM monthly_data m
)

SELECT
    `month`,
    ROUND(total_sales,2) AS total_sales,
    order_volume,
    ROUND(aov,2) AS aov,
    ROUND((total_sales - prev_sales) * 100.0 / NULLIF(prev_sales,0), 2) AS mom_sales_pct,
    ROUND((order_volume - prev_volume) * 100.0 / NULLIF(prev_volume,0), 2) AS mom_volume_pct,
    ROUND((aov - prev_aov) * 100.0 / NULLIF(prev_aov,0), 2) AS mom_aov_pct
FROM with_prev
ORDER BY `month`;
