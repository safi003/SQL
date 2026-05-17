CREATE TABLE Customer (
    Customer_id NUMBER PRIMARY KEY,
    customer_Name VARCHAR2(100),
    customer_Tel VARCHAR2(20)
);

CREATE TABLE Product (
    Product_id NUMBER PRIMARY KEY,
    Product_Name VARCHAR2(100),
    Price NUMBER(10,2),
    Category VARCHAR2(20)
);

CREATE TABLE Orders (
    Customer_id NUMBER,
    Product_id NUMBER,
    quantity NUMBER(10),
    total_amount NUMBER(10,2),
    OrderDate DATE DEFAULT SYSDATE
    CONSTRAINT fk_customer FOREIGN KEY (Customer_id)
        REFERENCES Customer(Customer_id),

    CONSTRAINT fk_product FOREIGN KEY (Product_id)
        REFERENCES Product(Product_id)
);

-- Display all the data of customers 
SELECT * FROM  Customer

-- Display the product_name and category for products which their price is between 5000 and 10000
SELECT product_name , Category FROM Product WHERE Price >=5000 AND Price <=10000

-- Display all the data of products sorted in descending order of price.
SELECT * FROM Product ORDER BY Price descending DESC

-- Display the total number of orders, the average amount, the highest total amount and the lower total amountFor each product_id, display the number of orders
SELECT COUNT(*) total_amount,
  AVG(total_amount) AS average_amount,
  MAX(total_amount) AS highest_amount,
  MIN(total_amount) AS lowest_amount
FROM Orders

SELECT 
    Product_id,
    COUNT(*) AS number_of_orders
FROM Orders
GROUP BY Product_id;

-- Display the customer_id which has more than 2 orders
SELECT Customer_id FROM Orders GROUP BY Customer_id HAVING COUNT(*) > 2;

-- For each month of the 2020 year, display the number of orders
SELECT 
    EXTRACT(MONTH FROM order_date) AS month,
    COUNT(*) AS number_of_orders
FROM Orders
WHERE EXTRACT(YEAR FROM order_date) = 2020
GROUP BY EXTRACT(MONTH FROM order_date)
ORDER BY month;

-- For each order, display the product_name, the customer_name and the date of the order

SELECT 
    Product.Product_Name,
    Customer.customer_Name,
    Orders.order_date
FROM Orders
INNER JOIN Product
    ON Orders.Product_id = Product.Product_id
INNER JOIN Customer
    ON Orders.Customer_id = Customer.Customer_id;

-- Display all the orders made three months ago
SELECT * FROM Orders WHERE order_date >= ADD_MONTHS(SYSDATE, -3);

-- Display customers (customer_id) who have never ordered a product
SELECT Customer_id
FROM Customer
WHERE Customer_id NOT IN (
    SELECT Customer_id
    FROM Orders
);