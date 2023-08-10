select c.city 'Customer_City',o.city 'Office_City', c.country 'Customer_Country', o.country 'Office_Country', count(distinct os.customernumber) 'Customer Volume', 
count(distinct os.ordernumber) 'Order Volume', count(distinct os.productcode) 'Product_Volume', sum(os.totalordervalue) 'Revenue'
from employees E join offices O on O.officeCode= E.officecode join order_summary os on os.salesrepemployeenumber = e.employeenumber
join customers c on c.customernumber = os.customernumber group by c.city,o.city, c.country, o.country order by Revenue desc
