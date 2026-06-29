DECLARE

    CURSOR GenerateMonthlyStatements IS
        SELECT c.CustomerID,
               c.Name,
               t.TransactionDate,
               t.Amount,
               t.TransactionType
        FROM Customers c
        JOIN Accounts a
          ON c.CustomerID = a.CustomerID
        JOIN Transactions t
          ON a.AccountID = t.AccountID
        WHERE EXTRACT(MONTH FROM t.TransactionDate) = EXTRACT(MONTH FROM SYSDATE)
          AND EXTRACT(YEAR FROM t.TransactionDate) = EXTRACT(YEAR FROM SYSDATE);

BEGIN

    FOR rec IN GenerateMonthlyStatements LOOP

        DBMS_OUTPUT.PUT_LINE(
            'Customer ID: ' || rec.CustomerID ||
            ', Name: ' || rec.Name ||
            ', Date: ' || TO_CHAR(rec.TransactionDate,'DD-MON-YYYY') ||
            ', Amount: ' || rec.Amount ||
            ', Type: ' || rec.TransactionType
        );

    END LOOP;

END;
/