select * from [SuperStoreOrders ]

-- overall view of superstore sales dataset --
select 
count (order_id) as Total_no_of_orders,
count (distinct country) as Total_countries,
count (distinct product_name) as Total_products,
count (distinct category) as Total_categories,
count (distinct sub_category) as Total_subcategories,
count (distinct year) as Total_years,
sum (sales) as Total_sales,
sum (quantity) as Total_quantity_of_product_sold,
avg (profit) as Avg_profit,
avg (discount) as Avg_discount
from dbo.SuperStoreOrders 

-- sales performance analysis --

select top 10
product_name ,
category,
sum (sales) as Total_sales,
sum (quantity) as Total_quantity_sold
from dbo.SuperStoreOrders  
group by 
product_name , 
category
order by 
sum (sales) desc

-- sales over years --

select 
sum (sales) as Total_sales,
year 
from dbo.SuperStoreOrders 
group by year
order by 
sum (sales) desc

-- customer segmentation --

select 
segment ,
count (distinct customer_name) as Total_customers,
sum (sales) as Total_sales
from dbo.SuperStoreOrders  
group by segment
order by sum (sales) desc

-- shipping and order management --

select 
ship_mode,
Avg (shipping_cost) as Avg_shipping_cost,
Avg (profit) as Avg_profit
from dbo.SuperStoreOrders  
group by ship_mode
order by avg (profit) desc

-- Profitability and Cost Analysis --

select 
product_name ,
category ,
sub_category ,
avg(profit) as Avg_profit ,
avg(discount) as Avg_discount 
from dbo.SuperStoreOrders  
group by product_name ,
category ,
sub_category  
order by avg (profit) desc

-- Global Sales/Product Quantity Overview --

select 
country ,
product_name ,
sum (sales) as Total_sales ,
sum (quantity) as Total_quantity  
from dbo.SuperStoreOrders  
group by country , product_name 
order by sum (sales) desc

-- State-Level Category Exploration --

select 
product_name ,
category , 
sum (sales) as Total_sales ,
sum (quantity) as Total_quantity 
from dbo.SuperStoreOrders  
group by product_name ,category  
order by sum (quantity) desc

-- Regional Sub-Category Analysis --

select 
sub_category ,
region ,
sum (quantity) as Total_quantity 
from dbo.SuperStoreOrders  
group by sub_category,region  
order by sum (quantity) desc


