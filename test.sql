USE ShopDB; 

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
