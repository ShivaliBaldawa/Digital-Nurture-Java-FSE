
CREATE OR REPLACE TRIGGER UpdateCustomerLastModified
BEFORE UPDATE ON Customers
FOR EACH ROW
BEGIN
    :NEW.LastModified := SYSDATE;
END;
/

UPDATE Customers
SET Balance = 18000
WHERE CustomerID = 1;

COMMIT;

SELECT CustomerID,
       Name,
       LastModified
FROM Customers;