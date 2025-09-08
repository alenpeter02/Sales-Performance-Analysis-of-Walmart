-- Task 9: Finding Top 5 Customers by Sales Volume
select distinct CustomerID,
		Round(sum(Total),2) as TotalSales,
        count(InvoiceID) as PurchaseCount
from walmart 
group by CustomerID
order by TotalSales Desc
limit 5;