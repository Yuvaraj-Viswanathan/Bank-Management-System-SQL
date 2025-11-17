DELIMITER $$

CREATE TRIGGER DetectLargeWithdrawal
AFTER INSERT ON TransactionLog
FOR EACH ROW
BEGIN
    IF NEW.txn_type = 'WITHDRAW' AND NEW.amount > 50000 THEN
        INSERT INTO FraudAlerts(account_id, message)
        VALUES(NEW.account_id, 'Potential fraud: High withdrawal amount');
    END IF;
END$$

DELIMITER ;
