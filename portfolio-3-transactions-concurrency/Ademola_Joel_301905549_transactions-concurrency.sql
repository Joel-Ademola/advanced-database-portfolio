-- 1. Successful Transaction (COMMIT)
-- Scenario: Alice buys 1 'Laptop Pro' (ProductID = 1). We must create the order and deduct stock safely.
START TRANSACTION;

INSERT INTO Orders (UserID, TotalAmount, Status) 
VALUES (1, 1200.00, 'Pending');

-- Get the auto-generated OrderID from the last insert
SET @OrderID = LAST_INSERT_ID();

INSERT INTO OrderItems (OrderID, ProductID, Quantity, UnitPrice) 
VALUES (@OrderID, 1, 1, 1200.00);

UPDATE Products 
SET StockQuantity = StockQuantity - 1 
WHERE ProductID = 1;

COMMIT;

-- Verify the COMMIT was successful (Stock should be reduced from 50 to 49)
SELECT ProductID, Name, StockQuantity FROM Products WHERE ProductID = 1;


-- 2. Failed Transaction (ROLLBACK)
-- Scenario: Bob attempts to buy 100 'Wireless Mouse' units, but only 200 exist and the payment gateway fails. 
START TRANSACTION;

INSERT INTO Orders (UserID, TotalAmount, Status) 
VALUES (2, 2500.00, 'Pending');
SET @FailedOrderID = LAST_INSERT_ID();

INSERT INTO OrderItems (OrderID, ProductID, Quantity, UnitPrice) 
VALUES (@FailedOrderID, 2, 100, 25.00);

UPDATE Products 
SET StockQuantity = StockQuantity - 100 
WHERE ProductID = 2;

-- System detects a payment failure before completion, so we revert the entire process
ROLLBACK;

-- Verify the ROLLBACK was successful (Stock should remain at 200, and the order is erased)
SELECT ProductID, Name, StockQuantity FROM Products WHERE ProductID = 2;


-- 3. Concurrency Control Mechanism (Row-Level Locking / FOR UPDATE)
-- Scenario: Two customers try to buy the very last '4K Monitor' at the exact same millisecond.
-- Setting the isolation level to prevent dirty reads.
SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;

START TRANSACTION;
-- The 'FOR UPDATE' clause places an exclusive lock on the row. 
-- If Customer B tries to read this row for an update, the database forces them to wait until Customer A commits.
SELECT StockQuantity 
FROM Products 
WHERE ProductID = 4 FOR UPDATE;

UPDATE Products 
SET StockQuantity = StockQuantity - 1 
WHERE ProductID = 4;

-- 4. Transaction Isolation Level Demonstration
-- Scenario: The Admin is generating an inventory report. We set the isolation level to 
-- REPEATABLE READ to prevent "Non-Repeatable Reads" if a customer buys an item at the exact same time.

-- Set isolation level for the session
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;

START TRANSACTION;

-- Admin reads the stock of 'Laptop Pro' (Returns 49 if previous script ran)
SELECT Name, StockQuantity AS 'Admin First Read' 
FROM Products WHERE ProductID = 1;

-- (Simulated concurrency: In a real environment, if a customer in Session B 
-- buys a laptop right now and commits, this REPEATABLE READ isolation level 
-- hides that change from the Admin's current transaction).

-- Admin reads the stock of 'Laptop Pro' again. 
-- Because of REPEATABLE READ, the database guarantees this second read matches the first exactly, 
-- ensuring the Admin's report data remains consistent.
SELECT Name, StockQuantity AS 'Admin Second Read' 
FROM Products WHERE ProductID = 1;

COMMIT;