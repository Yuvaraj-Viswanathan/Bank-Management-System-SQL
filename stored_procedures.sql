DELIMITER $$

-- Interest Calculation Function
CREATE FUNCTION CalculateInterest(
    principal DECIMAL(12,2),
    rate DECIMAL(4,2)
)
RETURNS DECIMAL(12,2)
DETERMINISTIC
RETURN principal * (rate / 100);
$$

-- Deposit Procedure
CREATE PROCEDURE DepositAmount(
    IN p_account_id INT,
    IN p_amount DECIMAL(12,2)
)
BEGIN
    UPDATE Account
    SET balance = balance + p_amount
    WHERE account_id = p_account_id;

    INSERT INTO TransactionLog(account_id, txn_type, amount, balance_after)
    VALUES(p_account_id, 'DEPOSIT', p_amount,
           (SELECT balance FROM Account WHERE account_id = p_account_id));
END$$

-- Withdraw Procedure
CREATE PROCEDURE WithdrawAmount(
    IN p_account_id INT,
    IN p_amount DECIMAL(12,2)
)
BEGIN
    IF (SELECT balance FROM Account WHERE account_id = p_account_id) < p_amount THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Insufficient Balance';
    END IF;

    UPDATE Account
    SET balance = balance - p_amount
    WHERE account_id = p_account_id;

    INSERT INTO TransactionLog(account_id, txn_type, amount, balance_after)
    VALUES(p_account_id, 'WITHDRAW', p_amount,
           (SELECT balance FROM Account WHERE account_id = p_account_id));
END$$

-- Transfer Procedure
CREATE PROCEDURE TransferAmount(
    IN p_from_account INT,
    IN p_to_account INT,
    IN p_amount DECIMAL(12,2)
)
BEGIN
    CALL WithdrawAmount(p_from_account, p_amount);
    CALL DepositAmount(p_to_account, p_amount);

    INSERT INTO TransactionLog(account_id, txn_type, amount, balance_after)
    VALUES(p_from_account, 'TRANSFER', p_amount,
           (SELECT balance FROM Account WHERE account_id = p_from_account));
END$$

DELIMITER ;
