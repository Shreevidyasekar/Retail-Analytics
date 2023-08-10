select C.customerNumber,count(distinct os.orderNumber) as 'Total_orders',
count(distinct os.productCode) as 'Products',
count(distinct E.officeCode) as 'Office_Count',
sum(os.quantityOrdered) as 'Total_Quantity',
sum(os.TotalOrderValue) as 'Total_sales',
round(avg(os.TotalOrderValue),2) as 'Average_ordervalue',
round(sum(os.TotalOrderValue)/C.creditLimit*100,2) as 'Credit_Utilisation'
from order_summary os join customers C on C.customerNumber = os.customerNumber
join employees E on E.employeeNumber = os.salesRepEmployeeNumber
group by 1 order by Total_sales desc limit 10