# Retrieve the total number of orders placed.
select * from orders ;
select count(order_id) 
		as total_orders from orders;

#Calculate the total revenue generated from pizza sales.
select * from order_details;
select * from pizzas;
select round (sum(p.price*od.quantity),2)
						as total_revenue from order_details od
		join pizzas p  on od.pizza_id = p.pizza_id ;

# Identify the highest-priced pizza.
select * from pizzas;
select * from pizza_types;
select name , price from pizzas p join pizza_types pt
			on p.pizza_type_id = pt.pizza_type_id order by price desc limit 1  ;

#Identify the most common pizza size ordered.
select * from pizzas;
select * from orders;
select * from order_details;
select size ,count(quantity) as order_count from pizzas p 
				join order_details od on p.pizza_id = od.pizza_id
		group by size  order by order_count desc ;

#List the top 5 most ordered pizza types along with their quantities.
select * from pizza_types;
select * from order_details;
select * from pizzas;
select pt.name, count(quantity) as pizza_count from pizza_types pt  join pizzas p on pt.pizza_type_id = p.pizza_type_id join 
order_details od on od.pizza_id = p.pizza_id group by pt.name  order by pizza_count desc limit 5  ; 






