select O.territory 'Territory', O.city, count(os.customernumber) 'Customer Volume',
count(distinct Os.ordernumber) 'Order Volume',count(distinct os.salesRepEmployeeNumber) 'Employee Count', 
round(sum(OS.TotalOrderValue)/count(distinct os.salesRepEmployeeNumber),2) 'Average Sales Per Emp',
sum(OS.TotalOrderValue) 'TotalOrderValue',count(distinct O.officeCode) 'Office Count',
round(avg(C.creditLimit),2) 'Average_CreditLimit',count(distinct Os.productcode) 'No of Products'
 from Order_summary OS
join employees E on OS.salesRepEmployeeNumber=E.employeeNumber
join  offices O on O.officeCode=E.officeCode 
right join customers C on C.customerNumber = OS.customernumber
group by O.territory,O.city having TotalOrderValue is not null order by TotalOrderValue desc;
