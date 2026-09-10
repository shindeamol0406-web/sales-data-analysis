-- Sales Data Analysis

-- 1. Total Sales
SELECT SUM(Sales) AS total_sales
FROM sales_data;

-- 2. Total Profit
SELECT SUM(Profit) AS total_profit
FROM sales_data;

-- 3. Total Orders
SELECT COUNT(DISTINCT Order_ID) AS total_orders
FROM sales_data;

-- 4. Total Quantity Sold
SELECT SUM(Quantity) AS total_quantity
FROM sales_data;

-- 5. Region-wise Sales and Profit
SELECT Region,
       SUM(Sales) AS total_sales,
       SUM(Profit) AS total_profit
FROM sales_data
GROUP BY Region
ORDER BY total_sales DESC;

-- 6. Category-wise Sales and Profit
SELECT Category,
       SUM(Sales) AS total_sales,
       SUM(Profit) AS total_profit
FROM sales_data
GROUP BY Category
ORDER BY total_sales DESC;

-- 7. Top 10 Products by Sales
SELECT Product,
       SUM(Sales) AS total_sales
FROM sales_data
GROUP BY Product
ORDER BY total_sales DESC
LIMIT 10;

-- 8. Top 10 Customers by Sales
SELECT Customer_ID,
       Customer_Name,
       SUM(Sales) AS total_sales
FROM sales_data
GROUP BY Customer_ID, Customer_Name
ORDER BY total_sales DESC
LIMIT 10;

-- 9. Monthly Sales Trend
SELECT
    DATE_FORMAT(Order_Date, '%Y-%m') AS month,
    SUM(Sales) AS total_sales
FROM sales_data
GROUP BY month
ORDER BY month;

-- 10. Payment Mode Performance
SELECT Payment_Mode,
       COUNT(DISTINCT Order_ID) AS orders,
       SUM(Sales) AS total_sales
FROM sales_data
GROUP BY Payment_Mode
ORDER BY total_sales DESC;

-- 11. Average Order Value
SELECT
    SUM(Sales) / COUNT(DISTINCT Order_ID) AS average_order_value
FROM sales_data;

-- 12. Profit Margin
SELECT
    (SUM(Profit) / SUM(Sales)) * 100 AS profit_margin_percentage
FROM sales_data;
