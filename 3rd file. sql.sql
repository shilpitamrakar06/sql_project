#Intermediate:
# 1Join the necessary tables to find the total quantity of each pizza category ordered.
select * from order_details;
select * from orders;
select * from pizzas;
select * from pizza_types;
select category , sum(quantity) as total_quantity 
				from pizza_types pt join  pizzas  p on
		 	pt.pizza_type_id = p.pizza_type_id join order_details od 
						on od.pizza_id = p.pizza_id group by category ;

#2 Determine the distribution of orders by hour of the day.
select * from orders;
select * from order_details;
select (hour(order_time)) as dayhour,count(order_id) as total_order 
				from orders  group by dayhour ; 

#3 Join relevant tables to find the category-wise distribution of pizzas.
select * from pizza_types;
select * from pizzas;
select  count(pizza_type_id) as pizzasss  ,category 
from pizza_types group by category ;

#4 Group the orders by date and calculate the average number of pizzas ordered per day. 
select * from orders;
select * from order_details;

select avg(total_order) as avg_pizza_per_day  from 
(select o.order_date , sum(od.quantity) as total_order from orders o join order_details od 
on o.order_id = od.order_id group by o.order_date) as oe;
            

#Determine the top 3 most ordered pizza types based on revenue.
select * from pizza_types;
select * from pizzas;
select * from order_details;

select round(sum(price*quantity),2) as revenue , 
name  from  pizza_types pt 
join pizzas p on pt.pizza_type_id = p.pizza_type_id join order_details 
od on od.pizza_id = p.pizza_id group by name order by revenue desc limit 3 ;