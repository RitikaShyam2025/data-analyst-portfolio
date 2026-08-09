-- ============================================
-- ANALYTICAL SQL QUERIES (Q1 – Q50)
-- ============================================


-- ============================
-- BASIC LEVEL QUERIES (Q1–Q20)
-- ============================

-- Q1: Retrieve all customer records
SELECT * FROM Customers;

-- Q2: Display customer first name, last name, and city
SELECT FirstName, LastName, City FROM Customers;

-- Q3: Display all active products
SELECT * FROM Products WHERE Status = 'Active';

-- Q4: Display customers from Chennai
SELECT * FROM Customers WHERE City = 'Chennai';

-- Q5: Products with unit price > 1000
SELECT * FROM Products WHERE UnitPrice > 1000;

-- Q6: Employees with salary > 50,000
SELECT * FROM Employees WHERE Salary > 50000;

-- Q7: All delivered orders
SELECT * FROM Orders WHERE OrderStatus = 'Delivered';

-- Q8: Products below reorder level
SELECT * FROM Inventory WHERE StockQuantity < ReorderLevel;

-- Q9: All premium customers
SELECT * FROM Customers WHERE CustomerType = 'Premium';

-- Q10: Top 10 most expensive products
SELECT * FROM Products ORDER BY UnitPrice DESC LIMIT 10;

-- Q11: Total number of customers
SELECT COUNT(*) AS TotalCustomers FROM Customers;

-- Q12: Average salary of employees
SELECT AVG(Salary) AS AverageSalary FROM Employees;

-- Q13: Highest product price
SELECT MAX(UnitPrice) AS HighestPrice FROM Products;

-- Q14: Lowest cost price
SELECT MIN(CostPrice) AS LowestCostPrice FROM Products;

-- Q15: Total stock available
SELECT SUM(StockQuantity) AS TotalStock FROM Inventory;

-- Q16: Customers ordered by latest registration date
SELECT * FROM Customers ORDER BY RegistrationDate DESC;

-- Q17: Products starting with 'S'
SELECT * FROM Products WHERE ProductName LIKE 'S%';

-- Q18: Samsung products
SELECT * FROM Products WHERE Brand = 'Samsung';

-- Q19: Completed returns
SELECT * FROM Returns WHERE ReturnStatus = 'Completed';

-- Q20: Orders placed in 2025
SELECT * FROM Orders
WHERE OrderDate BETWEEN '2025-01-01' AND '2025-12-31';


-- ============================
-- INTERMEDIATE LEVEL QUERIES (Q21–Q40)
-- ============================

-- Q21: Customer names with order details
SELECT o.OrderID, c.FirstName, c.LastName, o.OrderDate
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID;

-- Q22: Product name with category and supplier
SELECT p.ProductName, c.CategoryName, s.SupplierName
FROM Products p
JOIN Categories c ON p.CategoryID = c.CategoryID
JOIN Suppliers s ON p.SupplierID = s.SupplierID;

-- Q23: Employee names with department
SELECT CONCAT(e.FirstName,' ',e.LastName) AS EmployeeName, d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID;

-- Q24: Total number of orders per customer
SELECT c.CustomerID, c.FirstName, COUNT(o.OrderID) AS TotalOrders
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName;

-- Q25: Total sales made by each customer
SELECT c.CustomerID, c.FirstName, SUM(o.TotalAmount) AS TotalSales
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName;

-- Q26: Total quantity sold per product
SELECT p.ProductName, SUM(od.Quantity) AS TotalQuantitySold
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName;

-- Q27: Top 10 best-selling products
SELECT p.ProductName, SUM(od.Quantity) AS TotalSold
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalSold DESC
LIMIT 10;

-- Q28: Customers with more than 5 orders
SELECT c.CustomerID, c.FirstName, COUNT(o.OrderID) AS OrdersCount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName
HAVING COUNT(o.OrderID) > 5;

-- Q29: Total revenue by payment method
SELECT pm.MethodName, SUM(p.Amount) AS TotalRevenue
FROM Payments p
JOIN PaymentMethods pm ON p.PaymentMethodID = pm.PaymentMethodID
GROUP BY pm.MethodName;

-- Q30: Average order amount per region
SELECT r.RegionName, AVG(o.TotalAmount) AS AverageOrderAmount
FROM Orders o
JOIN Regions r ON o.RegionID = r.RegionID
GROUP BY r.RegionName;

-- Q31: Products never ordered
SELECT ProductName
FROM Products
WHERE ProductID NOT IN (SELECT ProductID FROM OrderDetails);

-- Q32: Customers who never placed an order
SELECT CustomerID, FirstName
FROM Customers
WHERE CustomerID NOT IN (SELECT CustomerID FROM Orders);

-- Q33: Latest order date per customer
SELECT CustomerID, MAX(OrderDate) AS LatestOrder
FROM Orders
GROUP BY CustomerID;

-- Q34: Employee who handled the highest number of orders
SELECT e.EmployeeID, e.FirstName, COUNT(o.OrderID) AS TotalOrders
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
GROUP BY e.EmployeeID, e.FirstName
ORDER BY TotalOrders DESC
LIMIT 1;

-- Q35: Monthly sales summary
SELECT YEAR(OrderDate) AS Year, MONTH(OrderDate) AS Month,
       SUM(TotalAmount) AS MonthlySales
FROM Orders
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY Year, Month;

-- Q36: Top 5 customers by total purchase amount
SELECT c.CustomerID, c.FirstName, SUM(o.TotalAmount) AS TotalPurchase
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName
ORDER BY TotalPurchase DESC
LIMIT 5;

-- Q37: Number of products per category
SELECT c.CategoryName, COUNT(p.ProductID) AS TotalProducts
FROM Categories c
JOIN Products p ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryName;

-- Q38: Orders containing more than 3 products
SELECT OrderID, COUNT(ProductID) AS ProductCount
FROM OrderDetails
GROUP BY OrderID
HAVING COUNT(ProductID) > 3;

-- Q39: Total refund amount by return status
SELECT ReturnStatus, SUM(RefundAmount) AS TotalRefund
FROM Returns
GROUP BY ReturnStatus;

-- Q40: Rank products by total sales amount
SELECT p.ProductName, SUM(od.TotalPrice) AS SalesAmount,
       RANK() OVER (ORDER BY SUM(od.TotalPrice) DESC) AS ProductRank
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName;


-- ============================
-- ADVANCED LEVEL QUERIES (Q41–Q50)
-- ============================

-- Q41: Stored procedure – GetCustomerOrders
DELIMITER //

CREATE PROCEDURE GetCustomerOrders(IN p_CustomerID INT)
BEGIN
    SELECT *
    FROM Orders
    WHERE CustomerID = p_CustomerID;
END //
DELIMITER ;

-- Q42: Stored procedure – GetProductsByCategory
DELIMITER //

CREATE PROCEDURE GetProductsByCategory(IN p_CategoryID INT)
BEGIN
    SELECT *
    FROM Products
    WHERE CategoryID = p_CategoryID;
END //

DELIMITER ;


-- Q43: Stored procedure – GetCustomerSales
DELIMITER //

CREATE PROCEDURE GetCustomerSales(IN p_CustomerID INT)
BEGIN
    SELECT SUM(TotalAmount) AS TotalSales
    FROM Orders
    WHERE CustomerID = p_CustomerID;
END //

DELIMITER ;


-- Q44: Stored procedure – GetOrdersBetweenDates
DELIMITER //

CREATE PROCEDURE GetOrdersBetweenDates
(
IN StartDate DATE,
IN EndDate DATE
)
BEGIN
    SELECT *
    FROM Orders
    WHERE OrderDate BETWEEN StartDate AND EndDate;
END //

DELIMITER ;


-- Q45: Stored procedure – GetLowStockProducts
DELIMITER //

CREATE PROCEDURE GetLowStockProducts()
BEGIN
    SELECT *
    FROM Inventory
    WHERE StockQuantity < ReorderLevel;
END //

DELIMITER ;


-- Q46: Trigger – Update Inventory after order
DELIMITER //

CREATE TRIGGER trg_UpdateInventory
AFTER INSERT
ON OrderDetails
FOR EACH ROW
BEGIN
    UPDATE Inventory
    SET StockQuantity = StockQuantity - NEW.Quantity
    WHERE ProductID = NEW.ProductID;
END //

DELIMITER ;


-- Q47: Trigger – Increase Inventory after return
DELIMITER //

CREATE TRIGGER trg_ReturnInventory
AFTER INSERT
ON Returns
FOR EACH ROW
BEGIN
    UPDATE Inventory
    SET StockQuantity = StockQuantity + 1
    WHERE ProductID = NEW.ProductID;
END //

DELIMITER ;


-- Q48: Trigger – Prevent negative order amount
DELIMITER //

CREATE TRIGGER trg_CheckTotalAmount
BEFORE INSERT
ON Orders
FOR EACH ROW
BEGIN
    IF NEW.TotalAmount < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Total Amount cannot be negative';
    END IF;
END //

DELIMITER ;


-- Q49: Trigger – Auto-update LastUpdated in Inventory
DELIMITER //

CREATE TRIGGER trg_LastUpdated
BEFORE UPDATE
ON Inventory
FOR EACH ROW
BEGIN
    SET NEW.LastUpdated = CURDATE();
END //

DELIMITER ;


-- Q50: Trigger – PaymentAudit logging
CREATE TABLE PaymentAudit
(
AuditID INT AUTO_INCREMENT PRIMARY KEY,
PaymentID INT,
Amount DECIMAL(10,2),
PaymentDate DATE,
CreatedOn TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //

CREATE TRIGGER trg_PaymentAudit
AFTER INSERT
ON Payments
FOR EACH ROW
BEGIN
    INSERT INTO PaymentAudit
    (
        PaymentID,
        Amount,
        PaymentDate
    )
    VALUES
    (
        NEW.PaymentID,
        NEW.Amount,
        NEW.PaymentDate
    );
END //

DELIMITER ;

