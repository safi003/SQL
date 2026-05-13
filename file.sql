CREATE TABLE Customer (
    Customer_id NUMBER PRIMARY KEY,
    customer_Name VARCHAR2(100),
    customer_Tel VARCHAR2(20)
);

CREATE TABLE Product (
    Product_id NUMBER PRIMARY KEY,
    Product_Name VARCHAR2(100),
    Price NUMBER(10,2)
);

CREATE TABLE Orders (
    Customer_id NUMBER,
    Product_id NUMBER,
    quantity NUMBER(10),
    total_amount NUMBER(10,2),

    CONSTRAINT fk_customer FOREIGN KEY (Customer_id)
        REFERENCES Customer(Customer_id),

    CONSTRAINT fk_product FOREIGN KEY (Product_id)
        REFERENCES Product(Product_id)
);

ALTER TABLE Product ADD Category VARCHAR2(20);

ALTER TABLE Orders ADD OrderDate DATE DEFAULT SYSDATE;