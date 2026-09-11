Create Database company_finance;
Use company_finance;
create table financial_data(
Transaction_ID INT primary key,
Date date,
Product varchar(50),
Category varchar(50),
Region varchar(50),
Salesperson varchar(100),
Customer_Type varchar(50),
Revenue decimal(12,2),
Cost decimal(12,2),
Operating_Expense decimal (12,2),
Payment_Method varchar(50)
);

USE company_finance;

SHOW TABLES;

SELECT COUNT(*) AS Rows_In_Financial_Data
FROM financial_data;

SELECT COUNT(*) AS Rows_In_Company_Finance
FROM company_finance;

SELECT COUNT(*) FROM company_finance;

USE company_finance;

SELECT 
    'financial_data' AS Table_Name,
    COUNT(*) AS Total_Rows
FROM financial_data

UNION ALL

SELECT 
    'company_finance' AS Table_Name,
    COUNT(*) AS Total_Rows
FROM company_finance;

USE company_finance;

DESCRIBE company_finance;

DROP TABLE IF EXISTS financial_data;

USE company_finance;

CREATE TABLE financial_data (
    Transaction_ID INT PRIMARY KEY,
    Date DATE,
    Product VARCHAR(50),
    Category VARCHAR(50),
    Region VARCHAR(50),
    Salesperson VARCHAR(100),
    Customer_Type VARCHAR(50),
    Revenue DECIMAL(12,2),
    Cost DECIMAL(12,2),
    Operating_Expense DECIMAL(12,2),
    Payment_Method VARCHAR(50)
);

INSERT INTO financial_data
SELECT
    Transaction_ID,
    STR_TO_DATE(Date, '%m/%d/%Y'),
    Product,
    Category,
    Region,
    Salesperson,
    Customer_Type,
    Revenue,
    Cost,
    Operating_Expense,
    Payment_Method
FROM company_finance;

SELECT COUNT(*) AS Total_Rows
FROM financial_data;

SELECT *
FROM financial_data;
