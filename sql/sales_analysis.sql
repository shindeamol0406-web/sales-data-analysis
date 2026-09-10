-- Sales Data Analysis Project
-- Database table: sales_data
-- Purpose: Portfolio-level SQL analysis

-- 1. Total Sales
SELECT SUM(Sales) AS Total_Sales
FROM sales_data;

-- 2. Total Profit
SELECT SUM(Profit) AS Total_Profit
FROM sales_data;

-- 3. Total Orders
SELECT COUNT(DISTINCT Order_ID) AS Total_Orders
FROM sales_data;

-- 4. Total Quantity Sold
SELECT SUM(Quantity) AS Total_Quantity
FROM sales_data;

-- 5. Region-wise Sales and Profit
SELECT Region,
       SUM(Sales) AS Total_Sales,
       SUM(Profit) AS Total_Profit
FROM sales_data
GROUP BY Region
ORDER BY Total_Sales DESC;

-- 6. Category-wise Sales and Profit
SELECT Category,
       SUM(Sales) AS Total_Sales,
       SUM(Profit) AS Total_Profit
FROM sales_data
GROUP BY Category
ORDER BY Total_Sales DESC;

-- 7. Top 10 Products by Sales
SELECT Product,
       SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Product
ORDER BY Total_Sales DESC
LIMIT 10;

-- 8. Top 10 Customers by Sales
SELECT Customer_Name,
       SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Customer_Name
ORDER BY Total_Sales DESC
LIMIT 10;

-- 9. Monthly Sales Trend
-- MySQL syntax
SELECT YEAR(Order_Date) AS Sales_Year,
       MONTH(Order_Date) AS Sales_Month,
       SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY YEAR(Order_Date), MONTH(Order_Date)
ORDER BY Sales_Year, Sales_Month;

-- 10. Payment Mode Performance
SELECT Payment_Mode,
       COUNT(DISTINCT Order_ID) AS Total_Orders,
       SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Payment_Mode
ORDER BY Total_Sales DESC;

-- 11. Average Order Value
SELECT AVG(Sales) AS Average_Order_Value
FROM sales_data;

-- 12. Profit Margin
SELECT
    ROUND(SUM(Profit) / NULLIF(SUM(Sales), 0) * 100, 2) AS Profit_Margin_Percent
FROM sales_data;

-- 13. Orders with Sales Above Average
SELECT Order_ID,
       Customer_Name,
       Sales,
       Profit
FROM sales_data
WHERE Sales > (SELECT AVG(Sales) FROM sales_data)
ORDER BY Sales DESC;

-- 14. Category with Highest Sales
SELECT Category,
       SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Category
ORDER BY Total_Sales DESC
LIMIT 1;

-- 15. High-Value Orders with Good Profit
SELECT Order_ID,
       Customer_Name,
       Product,
       Sales,
       Profit
FROM sales_data
WHERE Sales > 50000
  AND Profit > 10000
ORDER BY Profit DESC;
