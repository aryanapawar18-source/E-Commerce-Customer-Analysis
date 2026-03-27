create database ECommerece_Customer_Analysis;
use ECommerece_Customer_Analysis;

CREATE TABLE customer_data (
    Customer_ID INT,
    Purchase_Date datetime,
    Product_Category VARCHAR(100),
    Product_Price int,
    Quantity INT,
    Total_Purchase_Amount int,
    Payment_Method VARCHAR(50),
    Customer_Age INT,
    Returns_Value int,
    Customer_Name VARCHAR(100),
    Age int,
    Gender VARCHAR(10),
    Churn INT
);

ALTER TABLE customer_data 
MODIFY Returns_Value DECIMAL(10,2) NULL;

SET GLOBAL local_infile = 1;


SHOW VARIABLES LIKE 'local_infile';

SHOW VARIABLES LIKE 'secure_file_priv';

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/ecommerce_customer_data_large.csv'
INTO TABLE customer_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

 
 
 LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/ecommerce_customer_data_large.csv'
INTO TABLE customer_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Customer_ID, Purchase_Date, Product_Category, Product_Price, Quantity,
 Total_Purchase_Amount, Payment_Method, Customer_Age, @Returns_Value,
 Customer_Name, Gender, Churn)
SET Returns_Value = NULLIF(@Returns_Value, '');




select * from customer_data;