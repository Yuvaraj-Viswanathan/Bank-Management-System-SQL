CREATE TABLE Customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Account (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    account_type ENUM('SAVINGS', 'CURRENT'),
    balance DECIMAL(12,2) DEFAULT 0,
    interest_rate DECIMAL(4,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE TransactionLog (
    txn_id INT PRIMARY KEY AUTO_INCREMENT,
    account_id INT,
    txn_type ENUM('DEPOSIT','WITHDRAW','TRANSFER'),
    amount DECIMAL(12,2),
    balance_after DECIMAL(12,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account_id) REFERENCES Account(account_id)
);

CREATE TABLE FraudAlerts (
    alert_id INT PRIMARY KEY AUTO_INCREMENT,
    account_id INT,
    message VARCHAR(255),
    alert_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
