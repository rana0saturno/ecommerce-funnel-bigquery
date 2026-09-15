-- ============================================
-- 1. EMBUDO GENERAL - tasas de conversión
-- ============================================
WITH max_date AS (
  SELECT MAX(event_date) AS ultima_fecha
  FROM `portfolio-analytics-508503.my_dataset.user_events`
),
funnel_stages AS (
  SELECT
    COUNT(DISTINCT CASE WHEN event_type = 'page_view' THEN user_id END) AS stage_1_views,
    COUNT(DISTINCT CASE WHEN event_type = 'add_to_cart' THEN user_id END) AS stage_2_cart,
    COUNT(DISTINCT CASE WHEN event_type = 'checkout_start' THEN user_id END) AS stage_3_checkout,
    COUNT(DISTINCT CASE WHEN event_type = 'payment_info' THEN user_id END) AS stage_4_payment,
    COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) AS stage_5_purchase
  FROM `portfolio-analytics-508503.my_dataset.user_events`, max_date
  WHERE event_date >= TIMESTAMP_SUB(max_date.ultima_fecha, INTERVAL 30 DAY)
)
SELECT
  stage_1_views,
  stage_2_cart,
  ROUND(SAFE_DIVIDE(stage_2_cart * 100, stage_1_views)) AS view_to_cart_rate,

  stage_3_checkout,
  ROUND(SAFE_DIVIDE(stage_3_checkout * 100, stage_2_cart)) AS cart_to_checkout_rate,

  stage_4_payment,
  ROUND(SAFE_DIVIDE(stage_4_payment * 100, stage_3_checkout)) AS checkout_to_payment_rate,

  stage_5_purchase,
  ROUND(SAFE_DIVIDE(stage_5_purchase * 100, stage_4_payment)) AS payment_to_purchase_rate,

  ROUND(SAFE_DIVIDE(stage_5_purchase * 100, stage_1_views)) AS overall_conversion_rate
FROM funnel_stages
