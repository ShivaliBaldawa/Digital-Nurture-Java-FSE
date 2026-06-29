DECLARE
    CURSOR cust_cursor IS
        SELECT CustomerID,
               FLOOR(MONTHS_BETWEEN(SYSDATE, DOB)/12) AS Age
        FROM Customers;
BEGIN
    FOR cust IN cust_cursor LOOP
        IF cust.Age > 60 THEN
            UPDATE Loans
            SET InterestRate = InterestRate - 1
            WHERE CustomerID = cust.CustomerID;
        END IF;
    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Interest rates updated successfully.');
END;
/

DECLARE
    CURSOR cust_cursor IS
        SELECT CustomerID, Balance
        FROM Customers;
BEGIN
    FOR cust IN cust_cursor LOOP
        IF cust.Balance > 10000 THEN
            UPDATE Customers
            SET IsVIP = 'TRUE'
            WHERE CustomerID = cust.CustomerID;
        END IF;
    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('VIP status updated successfully.');
END;
/

DECLARE
    CURSOR loan_cursor IS
        SELECT c.Name,
               l.LoanID,
               l.EndDate
        FROM Customers c
        JOIN Loans l
        ON c.CustomerID = l.CustomerID
        WHERE l.EndDate BETWEEN SYSDATE AND SYSDATE + 30;
BEGIN
    FOR loan IN loan_cursor LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Reminder: Dear ' || loan.Name ||
            ', your Loan ID ' || loan.LoanID ||
            ' is due on ' ||
            TO_CHAR(loan.EndDate,'DD-MON-YYYY')
        );
    END LOOP;
END;
/