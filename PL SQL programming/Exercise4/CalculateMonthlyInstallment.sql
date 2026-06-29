CREATE OR REPLACE FUNCTION CalculateMonthlyInstallment(
    p_loan_amount NUMBER,
    p_interest_rate NUMBER,
    p_years NUMBER
)
RETURN NUMBER
IS
    v_rate NUMBER;
    v_months NUMBER;
    v_emi NUMBER;
BEGIN
    v_rate := p_interest_rate / (12 * 100);
    v_months := p_years * 12;

    v_emi :=
        (p_loan_amount * v_rate * POWER(1 + v_rate, v_months)) /
        (POWER(1 + v_rate, v_months) - 1);

    RETURN ROUND(v_emi,2);
END;
/

SELECT CalculateMonthlyInstallment(500000,8.5,20) AS EMI
FROM dual;