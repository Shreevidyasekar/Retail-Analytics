select ordernumber,count(os.productcode) as 'no_of_products_per_order', 
sum(TotalOrderValue) as 'Total_Revenue'
 from Order_summary os 
 join customers c on c.customernumber = os.customernumber
group by ordernumber order by Total_Revenue desc limit 10;

