-- INSERT MOCK DATA
INSERT INTO Users (Name, Email, PasswordHash, Role, Address) VALUES 
('Alice Doe', 'alice@example.com', 'hash1', 'Customer', '123 Main St, Lagos'),
('Bob Smith', 'bob@example.com', 'hash2', 'Customer', '456 Oak Ave, Abuja'),
('Admin User', 'admin@joelmegastore.com', 'hash3', 'Admin', 'Store HQ, Lagos'),
('Charlie Davies', 'charlie@example.com', 'hash4', 'Customer', '789 Pine Rd, Port Harcourt'),
('Diana Prince', 'diana@example.com', 'hash5', 'Customer', '321 Elm St, Kano'),
('Logistics Team', 'logistics@joelmegastore.com', 'hash6', 'Logistics', 'Warehouse 1, Lagos');

INSERT INTO Categories (Name, Description) VALUES 
('Electronics', 'Gadgets, computers, and accessories'),
('Furniture', 'Home and office furniture'),
('Clothing', 'Men and women apparel'),
('Books', 'Educational and fiction books');

INSERT INTO Products (Name, Description, Price, StockQuantity, CategoryID) VALUES 
('Laptop Pro', 'High performance laptop 16GB RAM', 1200.00, 50, 1),
('Wireless Mouse', 'Ergonomic bluetooth mouse', 25.00, 200, 1),
('Mechanical Keyboard', 'RGB mechanical keyboard', 85.00, 100, 1),
('4K Monitor', '32-inch 4K UHD display', 350.00, 30, 1),
('Office Desk', 'Wooden standing desk', 300.00, 20, 2),
('Ergonomic Chair', 'Lumbar support mesh chair', 150.00, 35, 2),
('Bookshelf', '5-tier wooden bookshelf', 90.00, 40, 2),
('Cotton T-Shirt', '100% cotton casual t-shirt', 15.00, 500, 3),
('Denim Jeans', 'Slim fit blue denim', 40.00, 300, 3),
('Sneakers', 'Running shoes white/black', 60.00, 150, 3),
('Advanced Database Systems', 'University textbook', 120.00, 80, 4),
('Science Fiction Novel', 'Award-winning sci-fi', 20.00, 120, 4);

INSERT INTO Orders (UserID, OrderDate, TotalAmount, Status) VALUES 
(1, '2026-02-15 10:00:00', 1225.00, 'Delivered'),
(2, '2026-03-10 14:30:00', 450.00, 'Delivered'),
(4, '2026-05-20 09:15:00', 120.00, 'Delivered'),
(1, '2026-06-05 11:45:00', 435.00, 'Shipped'),
(5, '2026-07-12 16:20:00', 70.00, 'Delivered'),
(2, '2026-08-01 08:30:00', 150.00, 'Cancelled'),
(4, '2026-09-15 13:10:00', 350.00, 'Pending'),
(1, '2026-10-10 10:00:00', 105.00, 'Pending'),
(5, '2026-10-18 12:00:00', 60.00, 'Pending');

INSERT INTO OrderItems (OrderID, ProductID, Quantity, UnitPrice) VALUES 
(1, 1, 1, 1200.00), (1, 2, 1, 25.00),
(2, 5, 1, 300.00), (2, 6, 1, 150.00),
(3, 11, 1, 120.00),
(4, 4, 1, 350.00), (4, 3, 1, 85.00),
(5, 9, 1, 40.00), (5, 8, 2, 15.00),
(6, 6, 1, 150.00),
(7, 4, 1, 350.00),
(8, 7, 1, 90.00), (8, 8, 1, 15.00),
(9, 10, 1, 60.00);

INSERT INTO Payments (OrderID, PaymentDate, PaymentMethod, PaymentStatus) VALUES 
(1, '2026-02-15 10:05:00', 'Credit Card', 'Success'),
(2, '2026-03-10 14:35:00', 'Bank Transfer', 'Success'),
(3, '2026-05-20 09:20:00', 'Debit Card', 'Success'),
(4, '2026-06-05 11:50:00', 'Credit Card', 'Success'),
(5, '2026-07-12 16:25:00', 'Mobile Money', 'Success'),
(6, '2026-08-01 08:35:00', 'Bank Transfer', 'Failed'),
(7, '2026-09-15 13:15:00', 'Credit Card', 'Pending'),
(8, '2026-10-10 10:05:00', 'Debit Card', 'Pending'),
(9, '2026-10-18 12:05:00', 'Mobile Money', 'Pending');