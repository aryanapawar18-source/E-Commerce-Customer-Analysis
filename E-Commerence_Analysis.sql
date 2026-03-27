use ECommerece_Customer_Analysis;

select count(customer_id) from customer_data;

-- Total Revenue
select sum(total_purchase_amount) from customer_data;

-- Total Orders
select count(customer_id) from customer_data;

-- Average Order Value (AOV)
select sum(total_purchase_amount)/count(customer_id) from customer_data;

-- Total Quantity Sold
select sum(quantity) from customer_data;

-- Revenue Per Customer
select sum(total_purchase_amount)/count(distinct(customer_id)) from customer_data;


-- Churn Rate
select sum(churn)/count(customer_id)*100 from customer_data;

-- Returns Rate
select sum(returns_value)/count(customer_id)*100 from customer_data;

-- Average Customer Age
select avg(customer_age) from customer_data;

--  Revenue By Product Category
select product_category,sum(total_purchase_amount) as total_revenue
from customer_data
group by 1
order by total_revenue desc;

-- Sales Trend Over Time
select year(purchase_date) as purchase_year,sum(total_purchase_amount)
from customer_Data
group by purchase_year
order by purchase_year asc;


-- Payment Method Distribution
select payment_method,sum(total_purchase_amount) as total_revenue
from customer_data
group by payment_method
order by total_revenue desc;

-- Quantity Sold By Category
select product_category,sum(quantity) as total_quantity
from customer_data
group by product_category
order by total_quantity desc;


-- Churn VS Non Churn 
select churn,count(customer_id)
from customer_data
group by churn;

-- Top 5 Customer By Revenue
select customer_name,sum(total_purchase_amount) as total_revenue
from customer_data
group by customer_name
order by total_revenue desc
limit 5;

-- Top 5 customer By quantity sold
select customer_name,sum(total_purchase_amount) as total_revenue
from customer_data
group by customer_name
order by total_revenue desc
limit 5;



