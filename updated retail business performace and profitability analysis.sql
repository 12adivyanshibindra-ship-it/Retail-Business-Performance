CREATE database superstore_analysis;
use superstore_analysis;
show tables;
select * from `sample - superstore`;
describe `sample - superstore`;
SELECT COUNT(*) as total_rows FROM `sample - superstore`;

## null values check 
select 
	count(*) as total_rows,
    SUM(CASE WHEN `Order ID`IS NULL THEN 1 ELSE 0 END) AS missing_order_id,
    SUM(CASE WHEN `Order Date` IS NULL THEN 1 ELSE 0 END) AS missing_order_date,
    SUM(CASE WHEN `Sales` IS NULL THEN 1 ELSE 0 END) AS missing_sales,
    SUM(CASE WHEN `Profit` IS NULL THEN 1 ELSE 0 END) AS missing_profit
FROM `sample - superstore`;

## duplicates check 
select `row id`,
	count(*) from `sample - superstore`
    group by `row id`
    having count(*)>1;

## total sales done, number of items sold, total profit
select 
	sum(sales) as overall_sales,
	sum(profit) as overall_profit,
	count(distinct `order id`) as items_order,
    sum(profit)/nullif(SUM(Sales), 0) * 100 AS profit_margin
    from `sample - superstore`;
    
## category wise profit 
select category, 
	sum(profit)/nullif(SUM(Sales), 0) * 100 AS profit_margin
    from`sample - superstore`
    group by category
    order by profit_margin desc;
    
##products causing loss
select category, `product Name` ,
	sum(profit) as total_profit
    from `sample - superstore`
    group by category, `product Name`
    having total_profit<0;
    
## subcatory wise profit margin
select `sub-category`,sum(profit)/nullif(SUM(Sales), 0) * 100 AS profit_margin
from `sample - superstore`
group by `sub-category`
order by profit_margin asc;

## region wise category profit
select region, category,
	 sum(profit) as total_profit
     from `sample - superstore`
     group by region, category
     order by total_profit desc;
     
## season wise sales 
update `sample - superstore`
set `Order Date` = str_to_date(`Order Date` , '%m/%d/%Y');
ALTER TABLE `sample - superstore`
MODIFY COLUMN `Order Date` DATE;

select category,
	CASE 
    WHEN MONTH(`Order Date`) IN (12, 1, 2) THEN 'Winter'
    WHEN MONTH(`Order Date`) IN (3, 4, 5) THEN 'Spring'
    WHEN MONTH(`Order Date`) IN (6, 7, 8) THEN 'Summer'
    WHEN MONTH(`Order Date`) IN (9, 10, 11) THEN 'Fall'
END AS Season,
 sum(sales) as total_sales,
 sum(profit) as total_profit
from `sample - superstore`
GROUP BY season, category
    order by total_sales desc;
    
## statewise sales
SELECT State,
	SUM(Sales) AS Total_Sales
	FROM `sample - superstore new`
	GROUP BY State
	ORDER BY Total_Sales DESC;

##top and low products
select `product name`, sum(sales), sum(profit)
	from `sample - superstore`
    group by `product name`
    order by sum(profit) desc;
select `product name`, sum(sales), sum(profit)
	from `sample - superstore`
    group by `product name`
    order by sum(profit) asc;
 
 ##discount on category 
SELECT 
    category,
    AVG(discount) * 100 AS avg_discount,
    SUM(Profit) / NULLIF(SUM(Sales), 0) * 100 AS profit_margin
FROM
    `sample - superstore`
GROUP BY category
ORDER BY profit_margin ASC;
 
 ##state with most profitable product
 SELECT
    State,
    Category,
    SUM(Profit) AS Total_Profit
FROM `sample - superstore new`
GROUP BY State, Category
ORDER BY Total_Profit DESC;
 
 
 
    




