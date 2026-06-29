DECLARE

    CURSOR UpdateLoanInterestRates IS
        SELECT LoanID,
               InterestRate
        FROM Loans;

BEGIN

    FOR loan IN UpdateLoanInterestRates LOOP

        UPDATE Loans
        SET InterestRate = loan.InterestRate - 0.5
        WHERE LoanID = loan.LoanID;

    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Loan interest rates updated successfully.');

END;
/

