-- See ALL columns (good for exploring)
SELECT * FROM transactions;

-- See SPECIFIC columns only
SELECT transaction_id, user_id, transaction_amount, transaction_status
FROM transactions;

-- Show only successful transactions
SELECT transaction_id, transaction_amount, transaction_status
FROM transactions
WHERE transaction_status = 'Success';

-- Show transactions above ₹10,000
SELECT transaction_id, transaction_amount, payment_method
FROM transactions
WHERE transaction_amount > 10000;

-- Show UPI payments that were successful
SELECT transaction_id, transaction_amount, payment_method
FROM transactions
WHERE payment_method = 'UPI'
AND transaction_status = 'Success';

-- Highest transaction amount first
SELECT transaction_id, transaction_amount, city
FROM transactions
ORDER BY transaction_amount DESC;

-- Lowest transaction amount first
SELECT transaction_id, transaction_amount, city
FROM transactions
ORDER BY transaction_amount ASC;

-- Sort by city name A to Z
SELECT transaction_id, city, transaction_status
FROM transactions
ORDER BY city ASC;

-- Show only top 5 transactions
SELECT transaction_id, transaction_amount, city
FROM transactions
ORDER BY transaction_amount DESC
LIMIT 5;

--Show all failed transactions
SELECT * FROM transactions
WHERE transaction_status = 'Failed';

--Show top 10 highest payments
SELECT transaction_id, transaction_amount, payment_method
FROM transactions
ORDER BY transaction_amount DESC
LIMIT 10;

-- Show all wallet payments from Mumbai
SELECT transaction_id, transaction_amount, transaction_date
FROM transactions
WHERE payment_method = 'Wallet'
AND city = 'Mumbai';

--What are all unique device types used?
SELECT DISTINCT device_type
FROM transactions;

--Show successful card payments above ₹5000, highest first
SELECT transaction_id, transaction_amount, city
FROM transactions
WHERE payment_method = 'Card'
AND transaction_status = 'Success'
AND transaction_amount > 5000
ORDER BY transaction_amount DESC;

-- How many total transactions are there?
SELECT COUNT(*) AS total_transactions
FROM transactions;

-- How many successful transactions?
SELECT COUNT(*) AS successful_transactions
FROM transactions
WHERE transaction_status = 'Success';

-- How many successful transactions?
SELECT COUNT(*) AS failed_transactions
FROM transactions
WHERE transaction_status = 'Failed';

-- How many transactions per payment method?
SELECT payment_method, COUNT(*) AS total
FROM transactions
GROUP BY payment_method;

-- Total money transacted overall
SELECT SUM(transaction_amount) AS total_revenue
FROM transactions;

-- Total revenue from successful transactions only
SELECT SUM(transaction_amount) AS successful_revenue
FROM transactions
WHERE transaction_status = 'Success';

-- Total revenue per city
SELECT city, SUM(transaction_amount) AS total_revenue
FROM transactions
GROUP BY city
ORDER BY total_revenue DESC;

-- Average transaction amount
SELECT AVG(transaction_amount) AS avg_transaction
FROM transactions;

-- Average transaction amount per payment method
SELECT payment_method, 
       ROUND(AVG(transaction_amount), 2) AS avg_amount
FROM transactions
GROUP BY payment_method
ORDER BY avg_amount DESC;

-- What is the smallest and largest transaction?
SELECT MIN(transaction_amount) AS min_amount,
       MAX(transaction_amount) AS max_amount
FROM transactions;

-- Min and Max per payment method
SELECT payment_method,
       MIN(transaction_amount) AS min_amount,
       MAX(transaction_amount) AS max_amount
FROM transactions
GROUP BY payment_method;

-- How many transactions per status?
SELECT transaction_status, COUNT(*) AS total
FROM transactions
GROUP BY transaction_status;

-- Total revenue per payment method
SELECT payment_method,
       COUNT(*) AS total_transactions,
       SUM(transaction_amount) AS total_revenue,
       ROUND(AVG(transaction_amount), 2) AS avg_amount
FROM transactions
GROUP BY payment_method
ORDER BY total_revenue DESC;

-- Which city has the most transactions?
SELECT city,
       COUNT(*) AS total_transactions,
       SUM(transaction_amount) AS total_revenue
FROM transactions
GROUP BY city
ORDER BY total_transactions DESC;

-- Show only cities with more than 10 transactions
SELECT city, COUNT(*) AS total_transactions
FROM transactions
GROUP BY city
HAVING COUNT(*) > 10
ORDER BY total_transactions DESC;

-- Show payment methods with total revenue above ₹50,000
SELECT payment_method,
       SUM(transaction_amount) AS total_revenue
FROM transactions
GROUP BY payment_method
HAVING SUM(transaction_amount) > 50000
ORDER BY total_revenue DESC;

-- Q1: How many transactions were made on each device type?
SELECT device_type, COUNT(*) AS total
FROM transactions
GROUP BY device_type;

-- Q2: What is the total revenue per city, highest first?
SELECT city,
       SUM(transaction_amount) AS total_revenue
FROM transactions
GROUP BY city
ORDER BY total_revenue DESC;

-- Q3: Which payment method has the highest average transaction?
SELECT payment_method,
       ROUND(AVG(transaction_amount), 2) AS avg_amount
FROM transactions
GROUP BY payment_method
ORDER BY avg_amount DESC
LIMIT 1;

-- Q4: Show only statuses with more than 50 transactions
SELECT transaction_status, COUNT(*) AS total
FROM transactions
GROUP BY transaction_status
HAVING COUNT(*) > 50;

-- Q5: Total successful revenue per payment method
SELECT payment_method,
       SUM(transaction_amount) AS successful_revenue
FROM transactions
WHERE transaction_status = 'Success'
GROUP BY payment_method
ORDER BY successful_revenue DESC;

