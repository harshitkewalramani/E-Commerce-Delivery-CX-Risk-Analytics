-- E-Commerce Delivery & Customer Experience Risk Analytics
-- SQL analysis library
-- Tables/column names should match the local Olist database schema.

-- 1. Integrity checks
SELECT COUNT(*) AS total_orders,
       COUNT(DISTINCT order_id) AS unique_orders
FROM olist_orders_dataset;

-- 2. Duplicate reviews
SELECT order_id,
       COUNT(*) AS review_rows
FROM olist_order_reviews_dataset
GROUP BY order_id
HAVING COUNT(*) > 1
ORDER BY review_rows DESC;

-- 3. Unmatched review order IDs
SELECT COUNT(*) AS unmatched_review_order_ids
FROM olist_order_reviews_dataset r
LEFT JOIN olist_orders_dataset o
  ON r.order_id = o.order_id
WHERE o.order_id IS NULL;

-- 4. Delivery status breach
SELECT
    CASE
        WHEN order_delivered_customer_date > order_estimated_delivery_date
        THEN 'Late'
        ELSE 'On-time'
    END AS delivery_status,
    COUNT(*) AS orders
FROM olist_orders_dataset
WHERE order_status = 'delivered'
GROUP BY 1;

-- 5. Category breach rate
SELECT category,
       COUNT(*) AS orders,
       AVG(is_late) AS breach_rate
FROM order_level_analytics
GROUP BY category
HAVING COUNT(*) >= 200
ORDER BY breach_rate DESC;

-- 6. State breach rate
SELECT customer_state,
       COUNT(*) AS orders,
       SUM(is_late) AS late_orders,
       AVG(is_late) AS breach_rate
FROM order_level_analytics
GROUP BY customer_state
ORDER BY breach_rate DESC;

-- 7. Bad-review rate by delivery status
SELECT
    CASE WHEN is_late = 1 THEN 'Late' ELSE 'On-time' END AS delivery_status,
    COUNT(*) AS orders,
    AVG(is_bad_review) AS bad_review_rate
FROM order_level_analytics
GROUP BY 1;

-- 8. Category bad-review rate
SELECT category,
       COUNT(*) AS orders,
       AVG(is_bad_review) AS bad_review_rate
FROM order_level_analytics
GROUP BY category
HAVING COUNT(*) >= 200
ORDER BY bad_review_rate DESC;
