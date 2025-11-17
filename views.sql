-- Daily Transactions View
CREATE VIEW DailyTransactionReport AS
SELECT 
    DATE(created_at) AS txn_date,
    COUNT(*) AS total_txns,
    SUM(amount) AS total_amount
FROM TransactionLog
GROUP BY DATE(created_at);

-- High Value Customers View
CREATE VIEW HighValueCustomers AS
SELECT 
    c.customer_id,
    c.full_name,
    SUM(a.balance) AS total_balance
FROM Customer c
JOIN Account a ON c.customer_id = a.customer_id
GROUP BY c.customer_id
HAVING total_balance > 100000;
