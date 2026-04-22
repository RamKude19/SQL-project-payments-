-- Find transactions above the average amount
SELECT transaction_id, user_id, transaction_amount
FROM transactions
WHERE transaction_amount > (
    SELECT AVG(transaction_amount) 
    FROM transactions
);

-- Show users who have made at least one transaction
SELECT user_name, city
FROM users
WHERE user_id IN (
    SELECT DISTINCT user_id 
    FROM transactions
);

-- Show users who have NEVER made a transaction
SELECT user_name, city
FROM users
WHERE user_id NOT IN (
    SELECT DISTINCT user_id 
    FROM transactions
);

-- Find the merchant with the highest total revenue
SELECT merchant_id, merchant_name
FROM merchants
WHERE merchant_id = (
    SELECT merchant_id
    FROM transactions
    WHERE transaction_status = 'Success'
    GROUP BY merchant_id
    ORDER BY SUM(transaction_amount) DESC
    LIMIT 1
);