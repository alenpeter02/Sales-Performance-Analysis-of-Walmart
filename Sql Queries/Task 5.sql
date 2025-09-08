-- Task 5: Most Popular Payment Method by City
with payment_count as (
select City, Payment, count(payment) as Payment_Count
from walmart
group by City, Payment),
rank_payment as (
select * , 
dense_rank() over ( partition by City order by Payment_Count Desc) as Rank_Payment
from payment_count)

select City, Payment, Payment_Count 
from rank_payment
where Rank_Payment = 1;