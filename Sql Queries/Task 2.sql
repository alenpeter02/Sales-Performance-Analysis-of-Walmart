-- Task 2 Finding the Most Profitable Product Line for Each Branch
WITH ProfitByProduct AS (  
SELECT  Branch, Product_line, round(SUM(gross_income - cogs),2) AS TotalProfit    
FROM walmart    
GROUP BY Branch, Product_line),
ranked_partition as (
select * ,
dense_rank() over (Partition by Branch order by TotalProfit Desc) as Grade
from ProfitByProduct)
select * 
from ranked_partition
where Grade = 1;