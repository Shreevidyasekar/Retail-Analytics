select 
case
when priceEach between 0 and 50 then '0-50' 
when priceEach between 50 and 100 then '50-100'
when priceEach between 100 and 150 then '100-150'
else '150 plus'
end as 'Price_Range',
sum(OD.quantityOrdered*OD.priceEach) as 'ordervalue'
from  order_summary OS
JOIN orderdetails OD
on OS.orderNumber = OD.OrderNumber
group by Price_Range
order by ordervalue desc

