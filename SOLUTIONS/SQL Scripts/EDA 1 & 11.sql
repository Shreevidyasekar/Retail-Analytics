
select O.territory,count(distinct OS.customerNumber) as 'customer_Volume',
count(distinct OS.orderNumber) as 'order_volume',
count(distinct OS.productcode) as 'product_volume',
sum(OS.TotalOrderValue) as 'Revenue',
count(distinct E.employeeNumber) as 'Employee_Volume',
count(distinct O.officeCode) as 'Office_count'
from employees E 
join offices O 
on O.officeCode = E.officeCode
join order_summary OS 
on OS.salesRepEmployeeNumber = E.employeeNumber
group by O.territory
order by Revenue desc;


