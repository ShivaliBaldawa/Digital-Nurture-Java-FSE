CREATE OR REPLACE TRIGGER CheckTransactionRules
BEFORE INSERT ON Transactions
FOR EACH ROW

DECLARE
    v_Balance NUMBER;

BEGIN

    SELECT Balance
    INTO v_Balance
    FROM Accounts
    WHERE AccountID = :NEW.AccountID;

    IF :NEW.TransactionType = 'Withdrawal' THEN

        IF :NEW.Amount > v_Balance THEN
            RAISE_APPLICATION_ERROR
            (
            -20001,
            'Withdrawal exceeds account balance.'
            );
        END IF;

    ELSIF :NEW.TransactionType = 'Deposit' THEN

        IF :NEW.Amount <= 0 THEN
            RAISE_APPLICATION_ERROR
            (
            -20002,
            'Deposit amount must be positive.'
            );
        END IF;

    END IF;

END;
/

INSERT INTO Transactions
VALUES
(
1007,
101,
SYSDATE,
50000,
'Withdrawal'
);

INSERT INTO Transactions
VALUES
(
1008,
101,
SYSDATE,
-500,
'Deposit'
);

INSERT INTO Transactions
VALUES
(
1009,
101,
SYSDATE,
1000,
'Deposit'
);

COMMIT;