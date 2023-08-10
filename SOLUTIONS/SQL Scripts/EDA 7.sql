select tt.territory,tt.city,tt.Status,count(*) from
(select O.territory,O.city, case 
when ord.status = 'Disputed' then 'Failure'
when ord.status = 'Cancelled' then 'Failure'
when ord.status = 'On Hold' then 'Failure'
else 'Success' end as 'Status',
Os.ordernumber from Order_summary OS
join employees E on OS.salesRepEmployeeNumber=E.employeeNumber
join  offices O on O.officeCode=E.officeCode 
join Orders ord on ord.ordernumber = os.ordernumber) TT group by  tt.territory,tt.city,tt.Status
