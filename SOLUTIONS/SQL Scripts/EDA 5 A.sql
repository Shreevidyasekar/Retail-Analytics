select P.productCode,P.productName,P.productLine,P.quantityInStock,sum(os.quantityOrdered) as 'Total_Quantity'
from order_summary os
join products P 
on P.productCode = os.productCode
group by 1
order by Total_Quantity desc
limit 5;


select P.productCode,P.productName,P.productLine, P.quantityInStock,sum(os.quantityOrdered) as 'Total_Quantity'
from order_summary os
join products P 
on P.productCode = os.productCode
group by 1
order by Total_Quantity asc
limit 5;

