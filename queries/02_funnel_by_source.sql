WITH max_date AS (
  SELECT MAX(event_date) AS ultima_fecha
  FROM `portfolio-analytics-508503.my_dataset.user_events`
),
source_funnel AS (
  SELECT
    traffic_source,
    COUNT(DISTINCT CASE WHEN event_type = 'page_view' THEN user_id END) AS views,
    COUNT(DISTINCT CASE WHEN event_type = 'add_to_cart' THEN user_id END) AS carts,
    COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) AS purchases
  FROM `portfolio-analytics-508503.my_dataset.user_events`, max_date
  WHERE event_date >= TIMESTAMP_SUB(max_date.ultima_fecha, INTERVAL 30 DAY)
  GROUP BY traffic_source
)
SELECT
  traffic_source,
  views,
  carts,
  purchases,
  ROUND(SAFE_DIVIDE(carts * 100, views)) AS cart_conversion_rate,
  ROUND(SAFE_DIVIDE(purchases * 100, views)) AS purchase_conversion_rate,
  ROUND(SAFE_DIVIDE(purchases * 100, carts)) AS cart_to_purchase_conversion_rate
FROM source_funnel
