select T.productCode,T.productName,t.quantityinstock,count(distinct territory) as 'Marketcount' from 
(select O.territory,P.ProductCode,p.productName,p.quantityinstock, 
sum(OS.TotalOrderValue) 'Total_Sales',round((P.msrp - P.buyPrice)/p.msrp*100,2) as 'Discount%'
from order_summary OS 
join employees E on  E.employeeNumber = OS.salesRepEmployeeNumber 
join offices O on O.officeCode = E.officeCode
right join products P on P.productCode = Os.ProductCode
group by O.territory, P.ProductCode,p.productName
order by Total_Sales) T group by T.productCode,T.productName 
having Marketcount<4 order by Marketcount
