CREATE TABLE Customer (
    Customer_id VARCHAR2(10) PRIMARY KEY,
    customer_Name VARCHAR2(100),
    customer_Tel VARCHAR2(20)
);

CREATE TABLE Product (
    Product_id VARCHAR2(10) PRIMARY KEY,
    Product_Name VARCHAR2(100),
    Price NUMBER(10,2)
);

CREATE TABLE Orders (
    Customer_id VARCHAR2(10),
    Product_id VARCHAR2(10),
    quantity NUMBER(10),
    total_amount NUMBER(10,2),

    CONSTRAINT fk_customer FOREIGN KEY (Customer_id)
        REFERENCES Customer(Customer_id),

    CONSTRAINT fk_product FOREIGN KEY (Product_id)
        REFERENCES Product(Product_id)
);

ALTER TABLE Product ADD Category VARCHAR2(20);

ALTER TABLE Orders ADD OrderDate DATE DEFAULT SYSDATE;

INSERT INTO Product(Product_id, Product_Name, Category, Price)
VALUES ('P01', 'Samsung Galaxy S20', 'Smartphone', 3229);

INSERT INTO Product(Product_id, Product_Name, Category, Price)
VALUES ('P02', 'ASUS Notebook', 'PC', 4599);

INSERT INTO Customer(Customer_id, customer_Name, customer_Tel)
VALUES ('C01', 'Ali', '71321009');

INSERT INTO Customer(Customer_id, customer_Name, customer_Tel)
VALUES ('C02', 'Sara', '72111111');

INSERT INTO Orders(Customer_id, Product_id, quantity, total_amount)
VALUES ('C01', 'P02', 2, 9198);

INSERT INTO Orders(Customer_id, Product_id, OrderDate, quantity, total_amount)
VALUES ('C02', 'P01', TO_DATE('28/05/2020','DD/MM/YYYY'), 2, 3299);