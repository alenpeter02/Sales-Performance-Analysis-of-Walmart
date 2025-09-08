-- Task 6: Monthly Sales Distribution by Gender
with monthlysales as ( 
select Gender, 
Customer_type,
monthname(SalesDate) as Months,
round(sum(Total), 2) as TotalSales,
count(Total) as TranscationCount,
round(avg(Total),2) as Avg_Transaction
from walmart
group by Gender, Months, Customer_type)
select 
Months,
Gender,
Customer_type,
TotalSales,
TranscationCount,
Avg_Transaction,
round(TotalSales/Sum(TotalSales) over (partition by Months) * 100, 1) as SalesPercentage
from monthlysales
order by 
    Months, Gender, Customer_type;
