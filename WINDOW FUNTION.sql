-- Rank transactions per user by amount
SELECT 
    user_id,
    transaction_id,
    transaction_amount,
    ROW_NUMBER() OVER (
        PARTITION BY user_id 
        ORDER BY transaction_amount DESC
    ) AS rank
FROM transactions;

-- Rank cities by total revenue
SELECT 
    city,
    SUM(transaction_amount) AS total_revenue,
    RANK() OVER (
        ORDER BY SUM(transaction_amount) DESC
    ) AS city_rank
FROM transactions
GROUP BY city;

-- Running total of transactions over time
SELECT 
    transaction_date,
    transaction_amount,
    SUM(transaction_amount) OVER (
        ORDER BY transaction_date
    ) AS running_total
FROM transactions
WHERE transaction_status = 'Success'
ORDER BY transaction_date;

-- Compare each transaction amount with the previous one
SELECT 
    transaction_id,
    transaction_date,
    transaction_amount,
    LAG(transaction_amount) OVER (
        ORDER BY transaction_date
    ) AS previous_amount,
    transaction_amount - LAG(transaction_amount) OVER (
        ORDER BY transaction_date
    ) AS difference
FROM transactions
ORDER BY transaction_date;

-- Q1: Show each transaction and how it compares to avg amount
SELECT 
    transaction_id,
    transaction_amount,
    ROUND(AVG(transaction_amount) OVER(), 2) AS overall_avg,
    CASE 
        WHEN transaction_amount > AVG(transaction_amount) OVER() 
        THEN 'Above Average'
        ELSE 'Below Average'
    END AS comparison
FROM transactions;

-- Q2: Top 3 transactions per payment method
WITH ranked AS (
    SELECT 
        payment_method,
        transaction_id,
        transaction_amount,
        ROW_NUMBER() OVER (
            PARTITION BY payment_method 
            ORDER BY transaction_amount DESC
        ) AS rn
    FROM transactions
)
SELECT payment_method, transaction_id, transaction_amount
FROM ranked
WHERE rn <= 3;

-- Q3: Each merchant's revenue vs total revenue (percentage)
WITH merchant_rev AS (
    SELECT 
        merchant_id,
        SUM(transaction_amount) AS merchant_revenue
    FROM transactions
    WHERE transaction_status = 'Success'
    GROUP BY merchant_id
)
SELECT 
    m.merchant_name,
    mr.merchant_revenue,
    ROUND(mr.merchant_revenue * 100.0 / SUM(mr.merchant_revenue) OVER(), 2) AS revenue_percentage
FROM merchant_rev mr
INNER JOIN merchants m ON mr.merchant_id = m.merchant_id
ORDER BY revenue_percentage DESC;