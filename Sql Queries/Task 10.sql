select dayname(SalesDate) as Days,
		round(sum(Total),2) as Sales,
        count(InvoiceID) as PurchaseCount
from walmart
group by Days
order by field(Days, 'Monday','Tuesday','Wednesday', 'Thursday', 'Friday', 'Saturday','Sunday');