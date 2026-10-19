-- 1. Complex Query: Retrieve total spent by each customer on specific categories, including order details.
SELECT 
    u.Name AS CustomerName,
    c.Name AS CategoryName,
    COUNT(DISTINCT o.OrderID) AS TotalOrders,
    SUM(oi.Quantity * oi.UnitPrice) AS TotalSpent
FROM Users u
JOIN Orders o ON u.UserID = o.UserID
JOIN OrderItems oi ON o.OrderID = oi.OrderID
JOIN Products p ON oi.ProductID = p.ProductID
JOIN Categories c ON p.CategoryID = c.CategoryID
WHERE o.OrderDate >= '2026-01-01' AND o.Status != 'Cancelled'
GROUP BY u.Name, c.Name
ORDER BY TotalSpent DESC;

-- 2. Execution Plan Before Optimisation
-- In DB Fiddle (MySQL/PostgreSQL), prepending EXPLAIN shows how the database scans tables.
EXPLAIN SELECT 
    u.Name AS CustomerName,
    c.Name AS CategoryName,
    COUNT(DISTINCT o.OrderID) AS TotalOrders,
    SUM(oi.Quantity * oi.UnitPrice) AS TotalSpent
FROM Users u
JOIN Orders o ON u.UserID = o.UserID
JOIN OrderItems oi ON o.OrderID = oi.OrderID
JOIN Products p ON oi.ProductID = p.ProductID
JOIN Categories c ON p.CategoryID = c.CategoryID
WHERE o.OrderDate >= '2026-01-01' AND o.Status != 'Cancelled'
GROUP BY u.Name, c.Name;

-- 3. Creating Indexes for Optimisation
-- We frequently filter by OrderDate and Status, and join on Foreign Keys.
CREATE INDEX idx_orders_date_status ON Orders(OrderDate, Status);
CREATE INDEX idx_orderitems_product ON OrderItems(ProductID);

-- 4. Execution Plan After Optimisation
-- Run the exact same EXPLAIN query again to capture the new optimised execution plan.
EXPLAIN SELECT 
    u.Name AS CustomerName,
    c.Name AS CategoryName,
    COUNT(DISTINCT o.OrderID) AS TotalOrders,
    SUM(oi.Quantity * oi.UnitPrice) AS TotalSpent
FROM Users u
JOIN Orders o ON u.UserID = o.UserID
JOIN OrderItems oi ON o.OrderID = oi.OrderID
JOIN Products p ON oi.ProductID = p.ProductID
JOIN Categories c ON p.CategoryID = c.CategoryID
WHERE o.OrderDate >= '2026-01-01' AND o.Status != 'Cancelled'
GROUP BY u.Name, c.Name;