select o.territory,sum(os.totalordervalue),month(os.orderdate) 'Monthly' from  employees E 
join offices O 
on O.officeCode = E.officeCode
join order_summary OS 
on OS.salesRepEmployeeNumber = E.employeeNumber group by o.territory, month(os.orderdate) order by o.territory,Monthly

