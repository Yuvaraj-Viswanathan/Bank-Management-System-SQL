INSERT INTO Customer(full_name, phone, email)
VALUES 
('John Doe', '555-2221', 'john@example.com'),
('Sara Ali', '555-7789', 'sara@example.com');

INSERT INTO Account(customer_id, account_type, balance, interest_rate)
VALUES
(1, 'SAVINGS', 50000, 3.5),
(2, 'CURRENT', 120000, 0);

-- Test Operations
CALL DepositAmount(1, 20000);
CALL WithdrawAmount(1, 10000);
CALL TransferAmount(2, 1, 50000);
