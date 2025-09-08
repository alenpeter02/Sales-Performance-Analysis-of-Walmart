-- Task 7: Best Product Line by Customer Type
with productsale as (
Select Customer_type, Product_line, sum(Total) as TotalSales
from walmart
group by Customer_type, Product_line),
rankproducts as (
select * , 
rank () over (partition by Customer_type order by TotalSales Desc) as Rank_ProductLine
from productsale)
select Customer_type, Product_line, Round(TotalSales,2) as Sales
from rankproducts
where Rank_ProductLine = 1;