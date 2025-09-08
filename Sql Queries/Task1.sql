-- Task 1 Task1Identifying the Top Branch by Sales Growth Rate
with Total_Sales AS (
SELECT Branch, SalesDate,  MONTHNAME(SalesDate) AS MonthName, DATE_FORMAT(SalesDate, '%Y-%m') AS YearMonth, SUM(Total) AS TotalSales    
FROM walmart    
GROUP BY Branch, SalesDate),
Monthly_Summary AS 
(SELECT  Branch,  YearMonth, MonthName, SUM(TotalSales) AS MonthlyTotal    
FROM Total_Sales    
GROUP BY Branch, YearMonth, MonthName),
MonthlyGrowth AS (   
 SELECT Branch,  MonthName,  YearMonth, MonthlyTotal,  
ROUND(((MonthlyTotal - LAG(MonthlyTotal) OVER (PARTITION BY Branch ORDER BY YearMonth)) / LAG(MonthlyTotal) OVER (PARTITION BY Branch ORDER BY YearMonth)) * 100, 2) AS GrowthRate    
FROM Monthly_Summary),AvgGrowthByMonth AS (
SELECT Branch, MonthName, ROUND(AVG(GrowthRate), 2) AS AvgGrowthRate    
FROM MonthlyGrowth  
WHERE GrowthRate is not null
GROUP BY Branch, MonthName)
SELECT *FROM AvgGrowthByMonth
ORDER BY Branch, MonthName;