-- USERS table
CREATE TABLE users (
    user_id            INT PRIMARY KEY,
    user_name          VARCHAR(100),
    age                INT,
    city               VARCHAR(50),
    account_created_date TIMESTAMP,
    account_status     VARCHAR(20)
);

-- MERCHANTS table
CREATE TABLE merchants (
    merchant_id    INT PRIMARY KEY,
    merchant_name  VARCHAR(100),
    category       VARCHAR(50),
    city           VARCHAR(50),
    rating         DECIMAL(2,1)
);

-- TRANSACTIONS table
CREATE TABLE transactions (
    transaction_id     INT PRIMARY KEY,
    user_id            INT,
    merchant_id        INT,
    transaction_amount DECIMAL(10,2),
    transaction_date   TIMESTAMP,
    payment_method     VARCHAR(20),
    transaction_status VARCHAR(20),
    device_type        VARCHAR(20),
    city               VARCHAR(50)
);

-- DEVICES table
CREATE TABLE devices (
    device_id      INT PRIMARY KEY,
    transaction_id INT,
    device_brand   VARCHAR(50),
    os             VARCHAR(20),
    ip_address     VARCHAR(20)
);
SELECT * FROM users;
SELECT * FROM merchants;
SELECT * FROM transactions;
SELECT * FROM devices;