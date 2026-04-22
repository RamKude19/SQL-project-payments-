# SQL-project-payments-
## 📌 Project Overview

This project simulates a **fintech payment platform** — similar to PhonePe, Paytm, or Razorpay — where users make transactions at merchants using various payment methods and devices.

The goal is to analyze:
- 💰 Revenue trends and transaction volumes
- 👤 User spending behavior
- 🏪 Merchant and category performance
- 📱 Device and payment method usage patterns

---

## 🗂️ Dataset

The dataset consists of **4 related tables** with real-world structure:

| Table | Rows | Description |
|---|---|---|
| `users` | 120 | Registered users with city, age, account status |
| `merchants` | 310 | Merchants with category, city, rating |
| `transactions` | 300 | Payment records with amount, method, status |
| `devices` | 300 | Device info per transaction |

### Entity Relationship Diagram

```
users                  transactions               merchants
──────                 ────────────               ─────────
user_id (PK) ◄──────  user_id (FK)           ──► merchant_id (PK)
user_name              transaction_id (PK)   │    merchant_name
age                    merchant_id (FK) ─────┘    category
city                   transaction_amount          city
account_status         transaction_date            rating
                       payment_method
                       transaction_status
                       transaction_id (PK)
                               │
                               ▼
                           devices
                           ───────
                           device_id (PK)
                           transaction_id (FK)
                           device_brand
                           os
```

---

## 📊 SQL Concepts Covered

### Basic Queries
- `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`, `DISTINCT`
- Filtering with `AND`, `OR`, `IN`, `BETWEEN`

### Aggregations
- `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`
- `GROUP BY`, `HAVING`
- `ROUND` for formatting

### JOINs
- `INNER JOIN` — matching rows across tables
- `LEFT JOIN` — all users, even without transactions
- `RIGHT JOIN` — all merchants, even without transactions
- `FULL JOIN` — complete picture

### Advanced SQL
- **Subqueries** — filter using results of another query
- **CTEs (Common Table Expressions)** — cleaner complex queries
- **Window Functions** — `ROW_NUMBER`, `RANK`, `LAG`, `SUM OVER`

## 🔍 Key Business Questions Answered

```sql
-- 1. What is the total revenue from successful transactions?
-- 2. Which city generates the most revenue?
-- 3. Which payment method is used most often?
-- 4. Which merchant category performs best?
-- 5. Who are the top spending users?
-- 6. What is the transaction success rate?
-- 7. Which device brand is most popular?
-- 8. What is the average transaction per payment method?
-- 9. Which users have never made a transaction?
-- 10. What is the running total of revenue over time?
```

---

## 🛡️ Database Design & Constraints

```sql
-- Primary Keys   → unique identity per row
-- Foreign Keys   → referential integrity between tables
-- NOT NULL       → required fields
-- CHECK          → valid values only (e.g. rating between 0-5)
-- DEFAULT        → auto-fill values (e.g. account_status = 'Active')
```

---

## 💡 Key Learnings

- Designing a **normalized relational database** from scratch
- Writing **efficient SQL queries** using best practices
- Using **JOINs** to combine multiple related tables
- Applying **window functions** for advanced analytics
- Answering real **business questions** using SQL

---

## 👤 Author

**Your Name**
- GitHub: [@yourusername](https://github.com/RamKude19)
- LinkedIn: [your-linkedin](https://www.linkedin.com/in/ramkude/).
