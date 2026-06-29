DECLARE

    CURSOR ApplyAnnualFee IS
        SELECT AccountID
        FROM Accounts;

BEGIN

    FOR acc IN ApplyAnnualFee LOOP

        UPDATE Accounts
        SET Balance = Balance - 500
        WHERE AccountID = acc.AccountID;

    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Annual maintenance fee applied.');

END;
/