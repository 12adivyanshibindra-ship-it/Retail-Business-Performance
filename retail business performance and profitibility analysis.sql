TRUNCATE TABLE database_db.`sample - superstore new`;
set global local_infile= 'on';
load data local infile 'C:/Users/bindr/Documents/Sample - Superstore new.csv'
into table database_db.`sample - superstore new`
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 lines;
SELECT COUNT(*) from database_db.`sample - superstore new`;
select SUM(Sales) as Total_sales
from `sample - superstore new`;
SELECT SUM(Profit) AS Total_Profit
FROM `sample - superstore new`;
SELECT State,
SUM(Sales) AS Total_Sales_by_state
FROM `sample - superstore new`
GROUP BY State
ORDER BY Total_Sales_by_state DESC;
SELECT State,
ROUND(SUM(Profit),2) AS Total_Profit_by_highest_state
FROM `sample - superstore new`
GROUP BY State
ORDER BY Total_Profit_by_highest_state DESC;
SELECT State,
SUM(Profit) AS Total_Profit_by_lowest_states
FROM `sample - superstore new`
GROUP BY State
HAVING SUM(Profit) < 0
ORDER BY Total_Profit_by_lowest_states;
select Category,
SUM(sales) as Total_sales_by_highest_category
FROM `sample - superstore new`
group by Category
ORDER BY Total_sales_by_highest_category DESC;
SELECT Category,
SUM(Profit) AS Total_profit_by_highest_category
FROM `sample - superstore new`
GROUP BY Category
ORDER BY Total_profit_by_highest_category DESC;
SELECT State,Category,
SUM(Sales) AS Sales_statewise_in_category
FROM `sample - superstore new`
GROUP BY State, Category
ORDER BY  Sales_statewise_in_category DESC;
SELECT State,Category,
SUM(Profit) AS Profit_statewise_in_category
FROM  `sample - superstore new`
GROUP BY State, Category
ORDER BY Profit_statewise_in_category DESC;
SELECT Discount,
AVG(Profit) AS Avg_Profit
FROM `sample - superstore new`
GROUP BY Discount
ORDER BY Discount;
SELECT `Customer Name`,
SUM(Sales) AS Sales_of_highest_customers,
SUM(Profit) AS Profit_of_highest_customers
FROM `sample - superstore new`
GROUP BY `Customer Name`
ORDER BY Profit_of_highest_customers DESC;
SELECT `Customer Name`,
SUM(Profit) AS Profit_of_lowest_customers
FROM `sample - superstore new`
GROUP BY `Customer Name`
HAVING SUM(Profit) < 0
ORDER BY Profit_of_lowest_customers ;
select Discount,
AVG(Profit) AS Avg_Profit
FROM `sample - superstore new`
GROUP BY Discount
ORDER BY Discount;

