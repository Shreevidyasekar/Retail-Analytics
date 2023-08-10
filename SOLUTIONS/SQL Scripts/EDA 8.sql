select o.city,count(os.ordernumber),month(os.orderdate) 'Mon' from  employees E 
join offices O 
on O.officeCode = E.officeCode
join order_summary OS 
on OS.salesRepEmployeeNumber = E.employeeNumber group by o.city, month(os.orderdate) order by city,Mon

