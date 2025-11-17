## Bank Management System – SQL Core Banking Project ##

A complete SQL-based Core Banking Simulation built with professional database design practices.
This project demonstrates real-world backend logic for account management, transactions, stored procedures, triggers, reporting views, and fraud detection.


## Features

Core Banking

Create customers

Create accounts (Savings / Current)

Maintain balances

Automatic transaction logging

Transaction Processing

Deposit stored procedure

Withdraw stored procedure (with validation)

Transfer procedure (from → to)

Auto-generated transaction logs

## Fraud Detection

Trigger for detecting large withdrawals

Logs suspicious events in a separate table

## Reporting & Analytics

Daily transactions view

High-value customer view

Interest calculation function

## Project Structure
```
BankManagementSystem/
├── schema.sql                # Tables and constraints
├── stored_procedures.sql     # Deposit/Withdraw/Transfer procedures
├── triggers.sql              # Fraud detection trigger
├── views.sql                 # Reporting views
├── test_data.sql             # Sample data + test transactions
└── documentation.md          # ERD + explanations
```

## Technologies Used

MySQL 8+

SQL Functions

Stored Procedures

Triggers

Views

Relational Schema Design

ACID Transaction Concepts

## Database Schema (Overview)
Tables

Customer → Customer details

Account → Savings/Current accounts

TransactionLog → Logs all operations

FraudAlerts → Stores suspicious events (trigger-based)

Relationships

One Customer → Many Accounts

One Account → Many Transactions

One Account → Many Fraud Alerts

## Setup Instructions

1️ Create the database
CREATE DATABASE BankDB;
USE BankDB;

2️ Run the schema
SOURCE schema.sql;

3️ Add stored procedures
SOURCE stored_procedures.sql;

4️ Add triggers
SOURCE triggers.sql;

5️ Add reporting views
SOURCE views.sql;

6️ Insert test data
SOURCE test_data.sql;

## Sample Test Operations

Deposit
CALL DepositAmount(1, 20000);

Withdraw
CALL WithdrawAmount(1, 10000);

Transfer
CALL TransferAmount(2, 1, 50000);

## Fraud Detection Example

If a withdrawal exceeds ₹50,000, the trigger automatically inserts an alert:

SELECT * FROM FraudAlerts;

## Reporting Views
1. Daily Transaction Summary
SELECT * FROM DailyTransactionReport;

2. High Value Customers (> ₹100,000)
SELECT * FROM HighValueCustomers;

## What You Learn From This Project

Professional SQL database creation

Multi-table relationships with foreign keys

Complex stored procedures

Trigger-based automation

Data analytics using SQL Views

Core banking architecture

Fraud detection logic

Modular SQL project structure

## Future Enhancements 

Loan module

KYC verification table

Admin authentication

Account locking

ATM simulation module

Audit logs with BEFORE/AFTER triggers

## Contribution

Pull requests are welcome!
Feel free to submit enhancements or report issues.

## License

This project is open-source under the MIT License.
