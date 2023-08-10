select c.customernumber,count(os.ordernumber),c.creditLimit as 'CreditLimit',
 sum(TotalOrderValue) as 'Total_Revenue', 
round(sum(TotalOrderValue)/c.creditLimit*100,2) as 'Credit Utilization Rate'
 from Order_summary os join customers c on c.customernumber = os.customernumber 
 group by customernumber order by Total_Revenue desc limit 10;