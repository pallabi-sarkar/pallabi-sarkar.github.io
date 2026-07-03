--Check missing values
SELECT *
FROM ecommerce_sales
WHERE
Units_Sold IS NULL
OR Unit_Price IS NULL
OR Discount IS NULL
OR Segment IS NULL;

--check duplicates
SELECT Order_ID,
COUNT(*)
FROM ecommerce_sales
GROUP BY Order_ID
HAVING COUNT(*) > 1;

--standardize categories
SELECT DISTINCT Product_Category
FROM ecommerce_sales;

--Total revenue
SELECT
ROUND(SUM(Sales_Amount),2) AS Total_Revenue
FROM ecommerce_sales;