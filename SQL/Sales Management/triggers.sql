-- ============================================
-- TRIGGERS (Sales Management System)
-- ============================================

DELIMITER //

-- Q46: Reduce inventory stock after a new order is placed
CREATE TRIGGER trg_UpdateInventory
AFTER INSERT ON OrderDetails
FOR EACH ROW
BEGIN
    UPDATE Inventory
    SET StockQuantity = StockQuantity - NEW.Quantity
    WHERE ProductID = NEW.ProductID;
END //
 

-- Q47: Increase inventory stock when a product is returned
CREATE TRIGGER trg_ReturnInventory
AFTER INSERT ON Returns
FOR EACH ROW
BEGIN
    UPDATE Inventory
    SET StockQuantity = StockQuantity + 1
    WHERE ProductID = NEW.ProductID;
END //
 

-- Q48: Prevent orders with a negative total amount
CREATE TRIGGER trg_CheckTotalAmount
BEFORE INSERT ON Orders
FOR EACH ROW
BEGIN
    IF NEW.TotalAmount < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Total Amount cannot be negative';
    END IF;
END //
 

-- Q49: Auto-update LastUpdated field in Inventory table
CREATE TRIGGER trg_LastUpdated
BEFORE UPDATE ON Inventory
FOR EACH ROW
BEGIN
    SET NEW.LastUpdated = CURDATE();
END //
 

-- Q50: PaymentAudit table + trigger to log payment history

CREATE TABLE PaymentAudit (
    AuditID INT AUTO_INCREMENT PRIMARY KEY,
    PaymentID INT,
    Amount DECIMAL(10,2),
    PaymentDate DATE,
    CreatedOn TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TRIGGER trg_PaymentAudit
AFTER INSERT ON Payments
FOR EACH ROW
BEGIN
    INSERT INTO PaymentAudit (PaymentID, Amount, PaymentDate)
    VALUES (NEW.PaymentID, NEW.Amount, NEW.PaymentDate);
END //

DELIMITER ;
