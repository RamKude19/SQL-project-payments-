-- CTE: Find total revenue per city, then show only top 3
WITH city_revenue AS (
    SELECT city,
           SUM(transaction_amount) AS total_revenue
    FROM transactions
    WHERE transaction_status = 'Success'
    GROUP BY city
)
SELECT city, total_revenue
FROM city_revenue
ORDER BY total_revenue DESC
LIMIT 3;

-- CTE: Find high value users (spent more than ₹50,000 total)
WITH high_value_users AS (
    SELECT user_id,
           SUM(transaction_amount) AS total_spent
    FROM transactions
    WHERE transaction_status = 'Success'
    GROUP BY user_id
    HAVING SUM(transaction_amount) > 50000
)
SELECT 
    u.user_name,
    u.city,
    h.total_spent
FROM high_value_users h
INNER JOIN users u ON h.user_id = u.user_id
ORDER BY h.total_spent DESC;

-- Multiple CTEs together
WITH successful_txns AS (
    SELECT * FROM transactions
    WHERE transaction_status = 'Success'
),
merchant_revenue AS (
    SELECT merchant_id,
           SUM(transaction_amount) AS total_revenue
    FROM successful_txns
    GROUP BY merchant_id
)
SELECT 
    m.merchant_name,
    m.category,
    mr.total_revenue
FROM merchant_revenue mr
INNER JOIN merchants m ON mr.merchant_id = m.merchant_id
ORDER BY mr.total_revenue DESC
LIMIT 5;