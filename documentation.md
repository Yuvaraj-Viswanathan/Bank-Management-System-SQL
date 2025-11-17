# Bank Management System – SQL Project

A complete SQL-based Core Banking System that manages customers, accounts, transactions, interest, reporting, and fraud detection.

## ER Diagram (Text Description)

Customer (1 → M) Account  
Account (1 → M) TransactionLog  
Account (1 → M) FraudAlerts  

## Modules

### 1. Customer Management
Stores personal data: name, phone, email.

### 2. Account Management
Savings / Current
Balance + interest rate

### 3. Transactions
Deposits, Withdrawals, Transfers
Auto logs all transactions

### 4. Triggers
Fraud detection for high withdrawals

### 5. Views
Daily reports
High-value customers

### 6. Procedures
Encapsulated banking logic
