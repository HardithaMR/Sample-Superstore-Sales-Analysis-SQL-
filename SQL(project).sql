CREATE DATABASE SQLproject;
use SQLproject;
DROP database project;
SHOW tables;
RENAME TABLE samplesuperstore to store;
SELECT * FROM store;
SELECT Ship_mode from store;

SELECT DISTINCT category FROM store;

SELECT city,state FROM store WHERE profit<0;

SELECT segment,category FROM store WHERE state='North Carolina';

SELECT * FROM store WHERE city='Los Angeles' AND segment='Corporate';

SELECT Sub_Category,Sales FROM store WHERE Profit>10 AND sales BETWEEN 200 AND 400;

SELECT Profit, Region FROM store WHERE Quantity in(2,4,7) AND Profit>0;

SELECT Ship_mode, Category FROM store WHERE Region LIKE '_______' AND Category LIKE 'T%';

SELECT Sales, Quantity FROM store WHERE Discount=0;

SELECT Category,count(*) FROM store GROUP BY Category;

SELECT AVG(Profit),Sales FROM store WHERE Quantity!=3 AND State LIKE 'C%' GROUP BY Sales;

SELECT Region,sum(Sales),sum(profit) FROM store group by Region having sum(Profit)>0 order by sum(Profit) desc;

SELECT State, sum(Sales) FROM store group by State having sum(sales)>(select sum(Sales) from store where state='Kentucky');

SELECT Sub_Category, Profit From store where Profit>ANY (Select Profit from store where Category='Furniture');

SELECT Postal_code,Sub_Category,Sales FROM store where Sales>ALL(SELECT Sales from store where city='Madison');

SELECT MAX(sales) 
FROM store
WHERE sales < (SELECT MAX(sales) FROM store
      WHERE sales < (SELECT MAX(sales)
            FROM store
            WHERE region = 'East'
        )
  );
  
SELECT state
FROM store
WHERE region = 'East'
UNION
SELECT state
FROM store
WHERE region = 'West';

SELECT Ship_mode, Category, Discount from store where Discount > 0.2 and Quantity>5;

SELECT sub_category, profit
FROM store
WHERE sub_category LIKE '%s' AND profit < 0;

SELECT ship_mode, COUNT(*) AS total_orders, SUM(quantity) AS total_quantity
FROM store
GROUP BY ship_mode
HAVING COUNT(*) >= 100
ORDER BY total_quantity DESC;

SELECT region, city, SUM(profit)
FROM store
GROUP BY region, city
HAVING SUM(profit) > 0
ORDER BY region, Sum(Profit) DESC
LIMIT 3;

SELECT length(Category) From store;

SELECT CONCAT(State,'-',Quantity) FROM store;

SELECT segment, city, sales
FROM store
WHERE segment NOT IN('Consumer');

SELECT Region, City, Sales, Profit
FROM store
WHERE Region = 'south'
AND (Profit > 0 OR Sales > 1000);

SELECT sub_category, SUM(profit) 
FROM store
GROUP BY sub_category
HAVING SUM(profit) < 0
ORDER BY SUM(profit);

SELECT region, category, SUM(sales), SUM(profit)
FROM store
GROUP BY region, category
HAVING SUM(sales) > 3000
ORDER BY SUM(sales) DESC;




