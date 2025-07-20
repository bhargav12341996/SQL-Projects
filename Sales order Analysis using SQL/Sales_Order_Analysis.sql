select * from sales_order
select * from customers
select * from products


---(1) fetch all the small shipped orders from august 2003 till the end of year 2003
select *
from sales_order
where deal_size = 'Small'
and status = 'Shipped'
and order_date between to_date('01-08-2003', 'dd-mm-yyyy') and to_date('31-12-2003', 'dd-mm-yyyy');
 --(or)
 select *
from sales_order
where deal_size = 'Small'
and status = 'Shipped'
and order_date between '2003-08-01' and '2003-12-31'

----------------------------------------------------------------------------------------------------------

--(2) find all the orders which do not belong to customers from usa and are still in process 

select 
sa.order_number 
from sales_order sa
join customers cu 
on sa.customer = cu.customer_id 
where sa.status = 'In Process' and cu.country <> 'USA'

----------------------------------------------------------------------------------------------------------

--(3) find all orders for trains, ships ,planes which are neither shipped nor in process nor resolved

select *
 
from sales_order sa
join products pro
on sa.product = pro.product_code
where lower(product_line) in ('trains', 'ships','planes') 
and lower(status) not in ('shipped', 'in process')

----------------------------------------------------------------------------------------------------------

--(4) Find customers whose phone number has either parenthesis "()" or a plus sign "+".
select *
        from Customers
        where phone like '%+%' or phone like '%(%' or phone like '%)%';
		
----------------------------------------------------------------------------------------------------------

--(5)  Find customers whose phone number does not have any space.

select *
        from Customers
        where phone not like '% %';
	
----------------------------------------------------------------------------------------------------------

--6)Fetch all the orders between Feb 2003 and May 2003 where the quantity ordered was an even number.
select *
FROM sales_order 
where
mod(quantity_ordered,2)=0
and order_date between '2003-02-01' and '2003-05-01'

----------------------------------------------------------------------------------------------------------

--7) Find orders which sold the product for price higher than its original price.

select * 
from products pr
join sales_order sa
on pr.product_code =sa.product
where pr.price< sa.price_each

----------------------------------------------------------------------------------------------------------

--8) Find the average sales order price

select round(avg(sales):: decimal,2) from sales_order

----------------------------------------------------------------------------------------------------------

--9) Count total no of orders.

select 
count(order_number) from sales_order

----------------------------------------------------------------------------------------------------------

--10) Find the total quantity sold.

select 
sum(quantity_ordered) from sales_order

----------------------------------------------------------------------------------------------------------

--11) Fetch the first order date and the last order date.

select 
min(order_date) as first_ordered_date,
max(order_date) as last_ordered_date
from sales_order

----------------------------------------------------------------------------------------------------------

 -- (12) calculate year month days difference from 2 dates eg-2022-03-06 and 2023-08-27

select 
age('2023-08-27' :: date, '2022-03-06':: date) as date_difference

----------------------------------------------------------------------------------------------------------

---(13) display the total sales figure for each quarter. Represent each quarter with their respective period.
select 
sum(sales) as qtr_sales,
case when qtr_id = 1 then 'qtr_1'
	when qtr_id = 2 then 'qtr_2'
	when qtr_id = 3 then 'qtr_3'
	when qtr_id = 4 then 'qtr_4' end as quarter
from sales_order
group by qtr_id

----------------------------------------------------------------------------------------------------------

---(14) Identify how many cars, Motorcycles, trains and ships are available in the inventory. Treat all the type of cars as just 'cars'.

select
(CASE WHEN product_line like '%Cars%' then 'Cars' else product_line end ) AS new_product_line,
count(product_line)
from products
where product_line IN ('Classic Cars','Vintage Cars','Motorcycles','Trains','Ships')
group by new_product_line


--(OR)

select
product_line,
count(product_line)
from products
where product_line IN ('Motorcycles','Trains','Ships')
group by product_line
UNION
select
'CARS' AS product_line,
count(product_line)
from products
where product_line like '%Cars%' ;

----------------------------------------------------------------------------------------------------------

---(15) Find the countries which have done more than 10 motorcycle orders.
select c.country ,
count (c.country ) as no_of_orders
from customers c 
join sales_order sa
on sa.customer = c.customer_id
join products p 
on sa.product =p.product_code
where (p.product_line = 'Motorcycles') 
group by c.country
having  count (c.country ) >10
order by no_of_orders desc
limit 3

----------------------------------------------------------------------------------------------------------

--(16) Find out the vehicle which was sold the most and which was sold the least.
---Output should be a single record with 2 columns.
select 
max(pm.total_orders ) as highest_sold, min(pm.total_orders) as lowest_sold
from
(select 
 sum(sa.quantity_ordered) as total_orders,
pr.product_line
from sales_order sa
join products pr 
on sa.product = pr.product_code 
group by pr.product_line 
order by total_orders )as pm

----------------------------------------------------------------------------------------------------------




















































