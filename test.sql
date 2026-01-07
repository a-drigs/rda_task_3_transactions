USE ShopDB; 

INSERT INTO Orders (ID, CustomerID, Date)
VALUES (1, 1, '2023-01-01');

START TRANSACTION;

INSERT INTO OrderItems (ID, OrderID, ProductID, Count)
VALUES (1, 1, 1, 1);

UPDATE Products
SET WarehouseAmount = WarehouseAmount - 1
WHERE ID = 1;

COMMIT;

-- Check if Order was created 
SELECT IFNULL( (SELECT ID FROM Orders
WHERE ID = '1' and CustomerID = 1) , 
 (SELECT 'Error: Order was not created') ); 

 -- Check if OrderItem was created 
SELECT IFNULL( (SELECT ID FROM OrderItems
WHERE ID = '1' and ProductID = 1 and Count = 1) , 
 (SELECT 'Error: Order item was not created or incorect amount') ); 

-- Check if Products is updated
SELECT IFNULL( (SELECT ID FROM Products
WHERE ID = '1' and WarehouseAmount = 41) , 
 (SELECT 'Error: Product amount is incorrect, expected: 41') ); 
