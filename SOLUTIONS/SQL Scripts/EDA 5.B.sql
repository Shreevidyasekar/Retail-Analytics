select P.productCode 'Product Code',P.productName 'Product Name',P.productLine 'Product Line',
P.quantityInStock 'Quantity in Stock',sum(os.quantityOrdered) as 'Total_Quantity'
from order_summary os
join products P 
on P.productCode = os.productCode
group by 1
order by Total_Quantity
limit 5;
