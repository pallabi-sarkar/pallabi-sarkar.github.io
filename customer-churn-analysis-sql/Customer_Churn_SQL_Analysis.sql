SELECT COUNT(*) AS Total_Customers
FROM customer_churn;

SELECT Churn, COUNT(*) AS Customer_Count
FROM customer_churn
GROUP BY Churn;

SELECT ROUND(
CAST(SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS FLOAT) / COUNT(*) * 100,2
) AS Churn_Rate
FROM dbo.customer_churn

DELETE FROM dbo.customer_churn
WHERE Churn IS NULL;

SELECT
Subscription_Type,
COUNT(*) AS Customers,
SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS Churned_Customers,
ROUND(CAST(SUM(CASE WHEN Churn =1 THEN 1 ELSE 0 END) AS FLOAT) /COUNT(*) *100,2
) AS Churn_Rate
FROM dbo.customer_churn
GROUP BY Subscription_Type
ORDER BY Churn_Rate DESC;

SELECT Support_Calls, COUNT(*) AS Customers,
ROUND(
CAST(SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS FLOAT) / COUNT(*) * 100,2) AS Churn_Rate
FROM dbo.customer_churn
GROUP BY Support_Calls
ORDER BY Support_Calls;

SELECT Contract_Length, COUNT(*) AS Customers,
SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS Churned_Customers,
ROUND(
CAST(SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS FLOAT) /COUNT(*) *100, 2) AS Churn_Rate
FROM dbo.customer_churn
GROUP BY Contract_Length
ORDER BY Churn_Rate DESC;

SELECT Churn, ROUND(AVG(Total_Spend),2)AS Avg_Spend_Churned
FROM dbo.customer_churn
WHERE Churn = 1
GROUP BY Churn;


SELECT
Payment_Delay,
ROUND(
CAST(SUM(CASE WHEN Churn=1 THEN 1 ELSE 0 END) AS FLOAT)
/COUNT(*)*100,2
) AS Churn_Rate
FROM dbo.customer_churn
GROUP BY Payment_Delay
ORDER BY Payment_Delay;