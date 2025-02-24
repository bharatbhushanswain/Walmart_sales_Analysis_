use walmart_db; 
select * from walmart;
-- Walmart Sales Analysis Project
-- Business Problem: Analyze sales data to optimize pricing, improve customer satisfaction, and maximize profit.

-- 1. Total sales revenue generated
select sum(total_price) from walmart ;
#	1209726.38 is total sales revenue

-- 2. Total quantity of items sold
select sum(quantity) from walmart;
#23483 is total quantity of item sold

-- 3. Average unit price of items sold
select avg(unit_price) from walmart;
#50.62 is average unit price of items sold

-- 4. Most popular product category by quantity sold
select category,sum(quantity) from walmart group by category 
order by sum(quantity) desc limit 1;
#Fashion accessories are most popular product category by quantity sold

select category,sum(quantity) from walmart group by category 
order by sum(quantity) desc limit 3;
#Fashion accessories,Electronic accessories ,home and lifestyle are most popural category by quantity sold

select category,sum(total_price) from walmart group by category 
order by sum(total_price) desc limit 2;
#Fashion accessories,Home and lifestyle are top 2 most popular category by sales


-- 5. Branch with the highest total sales
select branch,sum(total_price) from walmart group by branch 
order by sum(total_price) desc limit 1;
#WALM009 branch has highest total sales

-- 6. Average rating given by customers
select avg(rating) from walmart;
#5.8 is average rating given by customers

-- find highest avg rating for each branch given by customers
select branch,avg(rating) from walmart group by branch order by avg(rating) desc;
#WALM004 has highest avg rating given by customers

-- 7. City generating the highest profit
select city,sum(profit_margin) from walmart group by city 
order by sum(profit_margin) desc limit 1;
#Weslaco generating the highest profit 

-- 8. Month with the highest sales
select monthname(date) as month,sum(total_price) from walmart group by month 
order by sum(total_price) desc limit 1;

select year(date) as year,monthname(date) as month,sum(total_price) from walmart group by year,month 
order by sum(total_price) desc;
# month november,december with highest sales in each year

-- 9. Most preferred payment method
select payment_method,count(*) from walmart group by payment_method 
order by count(*) desc limit 1;
#credit card is most frequently used payment method

-- 10. Branch with the highest customer satisfaction (rating)
SELECT Branch, AVG(rating) AS avg_branch_rating 
FROM walmart
GROUP BY Branch
ORDER BY avg_branch_rating DESC
LIMIT 1;
#WALM004 branch with the highest customer satisfaction

-- 13. Identify slow-selling categories
SELECT category, SUM(quantity) AS total_quantity 
FROM walmart
GROUP BY category
ORDER BY total_quantity ASC
LIMIT 1;
#Health and beauty slow-selling category

-- 14. Hour of the day with the highest sales
with cte as
(
select *,
		case
			when hour(time) < 12 then 'mornining'
            when hour(time) between 12 and 17 then 'afternoon'
            else 'evening'
		end day_time
from walmart
)
select day_time,sum(total_price) from cte group by day_time 
order by sum(total_price) desc;
#afternoon of the day with the highest sales

-- 15. Branch with the highest average profit margin
SELECT Branch, AVG(profit_margin) AS avg_profit_margin 
FROM walmart
GROUP BY Branch
ORDER BY avg_profit_margin DESC
LIMIT 1;
# branch WALM052 with highest avg profit margin


-- 16. City with the highest average total price per sale
select city,avg(total_price) from walmart group by city 
order by sum(total_price) desc limit 1; 
#weslaco with the highest avg total price per sales

-- 17. Most profitable day of the week
SELECT DAYNAME(date) AS day_of_week, SUM(total_price * profit_margin / 100) AS daily_profit
FROM walmart
GROUP BY day_of_week
ORDER BY daily_profit DESC
LIMIT 2;
#sunday and thursday  most profitable day of the week


-- 18. Top 5 cities by total revenue
SELECT City, SUM(total_price) AS city_revenue 
FROM walmart
GROUP BY City
ORDER BY city_revenue DESC
LIMIT 5;
#Weslaco,Waxahachie,Plano,San Antonio,Port Arthur tp 5 cities by total revenue

-- 21. Average profit margin for each payment method
select payment_method,avg(profit_margin * 100) from walmart group by payment_method;
# ewallet has highest avg profit margin

-- 22. Highest total sales per payment method
SELECT payment_method, SUM(total_price) AS total_sales 
FROM walmart
GROUP BY payment_method
ORDER BY total_sales DESC
LIMIT 1;

-- 23. City with the lowest sales revenue
SELECT City, SUM(total_price) AS total_revenue 
FROM walmart
GROUP BY City
ORDER BY total_revenue ASC
LIMIT 1;
#lake jackson with the lowest sales revenue

-- 24. Identify outliers in unit prices
SELECT * 
FROM walmart
WHERE unit_price > (SELECT AVG(unit_price) + 3 * STDDEV(unit_price) FROM walmart) 
   OR unit_price < (SELECT AVG(unit_price) - 3 * STDDEV(unit_price) FROM walmart);

-- 25. Branch with the lowest average rating
SELECT Branch, AVG(rating) AS avg_branch_rating 
FROM walmart
GROUP BY Branch
ORDER BY avg_branch_rating ASC
LIMIT 1;
#WALM056 with the lowest customer satisfaction.


-- 27. Total number of transactions for each branch
SELECT Branch, COUNT(*) AS total_transactions 
FROM WALMART
GROUP BY Branch
ORDER BY total_transactions DESC LIMIT 5 ;
#WALM058,WALM009,WALM030,WALM069,WALM074 have highest no. of transaction 


  -- 28. Identify the most frequent rating
SELECT rating, COUNT(*) AS rating_count
FROM walmart
GROUP BY rating
ORDER BY rating_count DESC
LIMIT 1;
#rating 6 The most common customer rating.

#-- 29. Seasonal trend analysis: Highest sales by season
SELECT CASE 
            WHEN MONTH(date) IN (12, 1, 2) THEN 'Winter'
            WHEN MONTH(date) IN (3, 4, 5) THEN 'Spring'
            WHEN MONTH(date) IN (6, 7, 8) THEN 'Summer'
            WHEN MONTH(date) IN (9, 10, 11) THEN 'Fall'
       END AS season,
       SUM(total_price) AS seasonal_sales
FROM walmart
GROUP BY season
ORDER BY seasonal_sales DESC;

#winter has highet sales then fall then spring then summer

-- 30. Top 3 product categories by profit
select category,sum(rating) from walmart group by category 
order by sum(rating) desc limit 3;



































































































