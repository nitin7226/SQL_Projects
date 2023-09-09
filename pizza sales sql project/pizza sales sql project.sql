use pizza_sales;

select * from pizza_sales;

-- Total Revenue --
select sum(total_price) as Total_Revenue from pizza_sales;


-- Average Order Value --

select (sum(total_price)/count(distinct(order_id))) as Avg_Order_Value from pizza_sales;


-- Total Pizzas Sold --

select sum(quantity) as Total_Pizzas_Sold from pizza_sales;


-- Total Orders --

select count(distinct(order_id)) as Total_Orders from pizza_sales;


-- Avg Pizza Per Order -- 

SELECT (SUM(quantity) / COUNT(DISTINCT order_id) )
AS Avg_Pizzas_per_order
FROM pizza_sales;



-- Daily Trend for Total Orders --

select dayname(str_to_date(order_date,"%d-%m-%y")) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY dayname(str_to_date(order_date,"%d-%m-%y"))
order by total_orders desc;


-- Monthly Trends For Orders --

select monthname(str_to_date(order_date,"%d-%m-%y")) AS Month_Name, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY monthname(str_to_date(order_date,"%d-%m-%y"));


-- % Of Sales By Pizza Category --

select pizza_category, sum(total_price) as Total_Revenue
,sum(total_price)*100/(select sum(total_price) from pizza_sales)
 as PCT from pizza_sales
group by pizza_category;


-- % Of Sales By Pizza Size --

select pizza_size, sum(total_price) as Total_Revenue
,sum(total_price)*100/(select sum(total_price) from pizza_sales)
 as PCT from pizza_sales
group by pizza_size;


-- Total Pizzas Sold by Pizza Category --

select  pizza_category, sum(quantity) as Total_Pizza_Sold
from pizza_sales group by pizza_category;


-- Top 5 Pizzas by Revenue --

select pizza_name, sum(total_price) as Total_Revenue
from pizza_sales
group by pizza_name 
order by Total_Revenue desc limit 5;


-- Bottom 5 Pizzas by Revenue --

select pizza_name, sum(total_price) as Total_Revenue
from pizza_sales
group by pizza_name 
order by Total_Revenue asc limit 5;

-- Top 5 Pizzas by Quantity --

select pizza_name, sum(quantity) as Total_Quantity from pizza_sales
group by pizza_name
order by Total_Quantity desc limit 5;


-- Bottom 5 Pizzas by Quantity--

select pizza_name, sum(quantity) as Total_Quantity from pizza_sales
group by pizza_name
order by Total_Quantity asc limit 5;


-- Top 5 Pizzas by Total Orders --

select  pizza_name, count(distinct(order_id)) as Total_Order
from pizza_sales group by pizza_name
order by Total_Order desc limit 5;



-- Bottom 5 Pizzas by Total Orders --

select pizza_name, count(distinct(order_id)) as Total_Order
from pizza_sales group by pizza_name
order by Total_Order asc limit 5;