create database pizza_hut;
create table orders(
order_id int not null , 
order_date date not null,
order_time time not null,
primary key (order_id));
select * from orders;
create table order_details(
orderdetailes_id int primary key ,
order_id int not null ,
pizza_id text not null,
quantity int not null);

select * from order_details;
describe order_details;
select * from pizzas;
select * from pizza_types;
select * from orders;
select * from order_details;
