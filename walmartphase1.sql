use salesdatawalmart;
select * from sales;
select * from sales

-- -----------------------------------Feature Engineering---------------------------------------------
-- ---------------------------------------------------------------------------------------------------

SELECT  time,
    (CASE 
        WHEN time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
        WHEN time BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END) AS time_of_date
FROM sales;

alter table sales add column time_of_day varchar(20);
select * from sales

UPDATE sales
SET time_of_day = 
    CASE 
        WHEN time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
        WHEN time BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END;

select * from sales

-- day_name

select date,
    DAYNAME(date) AS day_name
    from sales;

alter table sales add column day_name varchar(10);
select * from sales

update sales
set day_name = DAYNAME(date);

select * from sales

select
     date,
     MONTHNAME(date)
from sales;

alter table sales add column month_name varchar(10);
select * from sales
-- ---------------------------------
update sales
set month_name = MONTHNAME(date);
select * from sales

-- EDA --------------------------

-- --------------------------------------

-- -------------Generic-------------------------------

-- 1.How many unique cities does the data have?
-- ---------------------------------------------

select
     DISTINCT city
from sales;
select * from sales;

select 
     Distinct city 
from sales;

-- 1.How many unique cities does the data have?
select
     DISTINCT city
from sales;
-- Branch?
select
     DISTINCT branch
from sales;
-- 2. In which city is each branch?
select
     DISTINCT city,
     branch
from sales;

-- -------------------------------------------------------
-- Quetions about PRODUCT -----------
-- 1. How many unique product lines 

select 
     DISTINCT product_line
from sales;
-- count ----------
select 
    count( DISTINCT product_line)
from sales;


-- 2.What is the most common payment method? 
select
	count(payment_method)
from sales;
-- most common
select
	payment_method,
	COUNT(payment_method) AS cnt
from sales
group by payment_method
order by cnt desc;


-- 3. What is the most selling product line?

select
	product_line,
	COUNT(product_line) AS cnt
from sales
group by product_line
order by cnt desc;    

-- 4. What is the total revenue by month?
select
     month_name as month,
     sum(total) as total_revenue
from sales
group by month_name
order by total_revenue desc;

-- 5. What month had the largest COGS?
select 
	month_name AS month,
    sum(cogs) AS cogs
from sales
group by month_name
order by cogs desc;


-- 6.What product line had the largest revenue?
select 
     product_line,
     sum(total) as total_revenue
from sales
group by product_line
order by total_revenue desc;

-- 7. What is the city with the largest revenue?
SELECT 
    city,
    SUM(total) AS total_revenue
FROM 
    sales
GROUP BY 
    city
ORDER BY 
    total_revenue DESC
LIMIT 1;

-- 8. What product line had the largest VAT?

select 
     product_line,
     AVG(VAT) AS avg_tax
from sales
group by product_line
order by avg_tax desc;



-- 9.Fetch each product line and add a column to those product line showing "Good","Bad".Good if its greater 
-- than average sales

SELECT 
    product_line,
    SUM(total) AS total_revenue,
    CASE 
        WHEN SUM(total) > (SELECT AVG(total_revenue) FROM 
                           (SELECT product_line, SUM(total) AS total_revenue 
                            FROM sales 
                            GROUP BY product_line) AS subquery) 
        THEN 'Good' 
        ELSE 'Bad' 
    END AS performance
FROM 
    sales
GROUP BY 
    product_line;


-- 10.Which branch sold more products than average product sold?
select
     branch,
     sum(quantity) as qty
from sales
group by branch
having sum(quantity) > (select avg(quantity) from sales);

-- 11.what is the most common product line by gender?
select
      gender,
      product_line,
      count(gender) as total_cnt
from sales
group by gender, product_line
order by total_cnt desc;

-- 12.What is the average rating of each product line?
select 
	AVG(rating) AS avg_rating,
    product_line
 from sales
group by product_line
order by  avg_rating desc;

select 
	round(AVG(rating), 2) AS avg_rating,
    product_line
 from sales
group by product_line
order by  avg_rating desc;
-- -------------------------------------------------


-- ----------------Sales Quetions----------------------

-- 1.Number of sales made in each time of the day per weekday
select * from sales;
select 
	time_of_day,
    count(*) AS total_sales
from sales
where day_name = "Monday"
group by time_of_day
order by total_sales desc;
-- 1.Number of sales made in each time of the day per weekday
SELECT 
    day_name,
    time_of_day,
    COUNT(*) AS total_sales
FROM 
    sales
GROUP BY 
    day_name, time_of_day
ORDER BY 
    day_name, total_sales DESC;


-- 2. Which of the customer types brings the most revenue?

select 
	customer_type,
    sum(total) AS total_rev
from sales
group by customer_type
order by total_rev desc;

-- 3.Which city has the largest/VAT (Value Added Tax)?

select 
     city,
     avg(VAT) as VAT
from sales
group by city
order by VAT desc;

-- 4.Which customer type pays the most in VAT?

select 
     customer_type,
     avg(VAT) as VAT
from sales
group by customer_type
order by VAT desc;
-- -------------------------------------------------------
-- --------------CUSTOMER Quetions------------------------

-- 1. How many unique customer types does the data have?

select 
	distinct customer_type
from sales;


-- 2.How many unique payment methods does 
-- the data have?
select 
	distinct payment_method
from sales;

-- 3.What is the most customer type?
SELECT 
    customer_type, 
    COUNT(*) AS total_customers
FROM 
    sales
GROUP BY 
    customer_type
ORDER BY 
    total_customers DESC
LIMIT 1;

-- 4. Which customer type buys the most?

select 
	customer_type,
    count(*) as cstm_cnt
from sales
group by customer_type;


-- 5.What is the gender of most of the customers?
select
     gender,
     count(*) as gender_cnt
from sales
group by gender
order by gender_cnt desc;



-- 6.What is the gender distribution per branch?
select
     gender,
     count(*) as gender_cnt
from sales
where branch = "C"
group by gender
order by gender_cnt desc;
-- 6.What is the gender distribution per branch?
SELECT 
    branch,
    gender,
    COUNT(*) AS gender_cnt
FROM 
    sales
GROUP BY 
    branch, gender
ORDER BY 
    branch, gender_cnt DESC;



-- 7.Which time of the day do customers give most ratings?

select 
     time_of_day,
     avg(rating) as avg_rating
from sales
group by time_of_day
order by avg_rating desc;

-- 8.Which time of the day do customers give most ratings 
-- per branch?
select 
     time_of_day,
     avg(rating) as avg_rating
from sales
where branch = "B"
group by time_of_day
order by avg_rating desc;



-- 8.Which time of the day do customers give most ratings 
-- per branch?
SELECT 
    branch,
    time_of_day,
    AVG(rating) AS avg_rating
FROM 
    sales
GROUP BY 
    branch, time_of_day
ORDER BY 
    branch, avg_rating DESC;


-- 9.Which day of the week has the best avg ratings?
select
     day_name,
     AVG(rating) as avg_rating
from sales
group by day_name
order by avg_rating desc;

-- 10.Which day of the week has the best average 
-- ratings per branch?
select
     day_name,
     AVG(rating) as avg_rating
from sales
Where branch = "A"
group by day_name
order by avg_rating desc;

-- 10.Which day of the week has the best average 
-- ratings per branch?
SELECT 
    branch,
    day_name,
    AVG(rating) AS avg_rating
FROM 
    sales
GROUP BY 
    branch, day_name
ORDER BY 
    branch, avg_rating DESC;

-- --------------------------------More extra Quetions -----------------------------------------------------------

-- 1. Retrieve all columns for sales made in a specific branch (e.g., Branch 'A').

SELECT * 
FROM sales 
WHERE Branch = 'A';

-- 2. Find the total sales for each product line.
SELECT Product_line, SUM(Total) AS Total_Sales 
FROM sales 
GROUP BY Product_line
order by total_sales desc;

-- 3. List all sales transactions where the payment method was 'Cash'.

SELECT * 
FROM sales 
WHERE payment_method = 'Cash';

-- 4. Calculate the total gross income generated in each city.
SELECT City, SUM(Gross_income) AS Total_Gross_Income 
FROM sales 
GROUP BY City
order by Total_Gross_Income desc;


-- 5. Find the average rating given by customers in each branch.
SELECT Branch, AVG(Rating) AS Average_Rating 
FROM sales 
GROUP BY Branch;

-- 6.Determine the total quantity of each product line sold.

SELECT Product_line, SUM(Quantity) AS Total_Quantity 
FROM sales 
GROUP BY Product_line;

-- 7. List the top 5 products by unit price.

SELECT * 
FROM sales 
ORDER BY Unit_price DESC 
LIMIT 5;

-- 8.find sales transactions with a gross margin percentage greater than 30%.

SELECT * 
FROM sales 
WHERE gross_margin_pct > 30;

-- 9. Retrieve sales transactions that occurred on weekends.

SELECT * 
FROM sales 
WHERE DAYOFWEEK(Date) IN (1, 7); -- 1 = Sunday, 7 = Saturday

-- 10. Calculate the total sales and gross income for each month.

SELECT DATE_FORMAT(Date, '%Y-%m') AS Month, 
       SUM(Total) AS Total_Sales, 
       SUM(Gross_income) AS Total_Gross_Income 
FROM sales 
GROUP BY DATE_FORMAT(Date, '%Y-%m');

-- 11. Find the number of sales transactions that occurred after 6 PM.

SELECT COUNT(*) AS Transactions_After_6PM 
FROM sales 
WHERE TIME(Time) > '18:00:00';

-- 12. List the sales transactions that have a higher total than the average total of all transactions.

SELECT * 
FROM sales 
WHERE Total > (SELECT AVG(Total) FROM sales);

-- 13. Find customers who made more than 5 purchases in a single month.

SELECT 
    customer_type, 
    YEAR(date) AS year, 
    MONTH(date) AS month, 
    COUNT(*) AS total_purchases
FROM 
    sales
GROUP BY 
    customer_type, YEAR(date), MONTH(date)
HAVING 
    total_purchases > 5;

-- 14. Calculate the cumulative gross income for each branch by date.


SELECT Branch, Date,
	 SUM(Gross_income) OVER (PARTITION BY Branch ORDER BY Date) AS Cumulative_Gross_Income 
FROM sales;


-- 15. Find the total COGS (Cost of Goods Sold) for each customer type in each city.

SELECT City, Customer_type, SUM(COGS) AS Total_COGS 
FROM sales 
GROUP BY City, Customer_type;




