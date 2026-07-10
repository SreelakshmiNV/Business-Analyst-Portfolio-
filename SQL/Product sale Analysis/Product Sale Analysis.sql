CREATE TABLE product (productName VARCHAR(200),price DECIMAL (10,2))


SELECT * FROM  product
INSERT INTO product(productName,price)
VALUES 
('Apple',2.50),
('Banana',1.50),
('Orange',3.00),
('Mango',2.00);

  SELECT * FROM product
  
 CREATE TABLE orders(OrderID INT,productID INT, Quantity INT, Sales DECIMAL(4,2))
  
  INSERT INTO orders(OrderID,ProductID,Quantity,Sales)
  VALUES
  (1,1,10,25.00),
  (2,1,5,12.50),
  (3,2,8,12.00),
  (4,3,12,36.00),
  (5,4,6,12.00);
  
  SELECT * FROM orders
  ALTER TABLE product ADD COLUMN productID INT;
  
  UPDATE product SET productID=1 WHERE productName ='Apple';
  UPDATE product SET productID=2 WHERE productName ='Banana';
  UPDATE product SET productID=3 WHERE productName ='Orange';
  UPDATE product SET productID=4 WHERE productName ='Mango';
  
  
 SELECT * FROM product;
 
SELECT productName ,(sum( quantity*price ))AS TotalRevenue,rank() OVER(ORDER BY(sum( quantity*price ))DESC)
 FROM  product p JOIN orders o ON p.ProductID=o.ProductID GROUP BY productname ORDER BY totalrevenue DESC;
 

  
  
  
  
  
  
  
  
  
  
  