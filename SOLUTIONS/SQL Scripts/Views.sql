create view order_summary 
as
(select 
OD.orderNumber,P.productCode,P.productLine,C.customerNumber,OD.quantityOrdered,C.salesRepEmployeeNumber,O.orderDate,O.status,
OD.quantityOrdered * OD.priceEach as 'TotalOrderValue',
OD.quantityordered * P.buyPrice as 'TotalCostPrice',
OD.quantityOrdered * P.MSRP as 'MRP',
(OD.quantityOrdered * OD.priceEach)-(OD.quantityordered * P.buyPrice) as 'Profit',
(OD.quantityOrdered * P.MSRP)-(OD.quantityOrdered * OD.priceEach) as 'Discount'
from orderdetails as OD
join products as P 
on OD.productCode = P.productCode
join orders as O 
on O.orderNumber = OD.orderNumber
join customers as C 
on C.customerNumber = O.customerNumber)

Drop view order_summary; 

select * from order_summary


