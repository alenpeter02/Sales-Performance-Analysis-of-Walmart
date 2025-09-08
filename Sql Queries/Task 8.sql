-- Task 8: Identifying Repeat Customers
with Repeatdate as(
select a.CustomerID, a.SalesDate as FirstPurchase,
		b.SalesDate as RpeatPurchase,
        Datediff(b.SalesDate, a.SalesDate) as DaysBetween
From walmart a
join walmart b on a.CustomerID = b.CustomerID
and b.SalesDate > a.SalesDate
and datediff( b.SalesDate, a.SalesDate) <= 30),
RepeatCustomers as (
Select distinct CustomerID 
from Repeatdate),
CustomerSales as (
select CustomerID, Round(sum(Total),2) as TotalSales,
		count(InvoiceID) as PurchaseCount
from walmart
group by CustomerID)

select rc.CustomerID,
		cs.TotalSales,
        cs.PurchaseCount
from RepeatCustomers rc
join CustomerSales cs on rc.CustomerID = cs.CustomerID
Order by PurchaseCount desc;