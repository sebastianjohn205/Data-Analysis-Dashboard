create database Project;
-- --------------------------------------------------------------------------
select *from financial_sales;
select *from dimproducts;
select *from dimsalesterritory;
-- --------------------------------------------------------------------------



/* Select Queries */
-- --------------------------------------------------------------------------
-- --------------------------------------------------------------------------
/* COLUMN's */
-- Q3
-- (a)
select year(orderdatekey) as Year from financial_sales;
-- (b)
select month(orderdatekey) as Month from financial_sales;
-- (c)
select monthname(orderdatekey) as Month_Name from financial_sales;
-- (d)
select concat("Q", quarter(orderdatekey))as Quarter from financial_sales;
-- (e)
select concat( year(orderdatekey),"-",monthname(orderdatekey))as YearMonth from financial_sales;
-- (f)
select week(orderdatekey) as Weekday_no from financial_sales;
-- (g)
select dayname(orderdatekey) as Weekday_name from financial_sales;
-- (h)
select 
concat('FM','-',
case 
when month(orderdatekey) >=4 then month(orderdatekey)-3 
else month(orderdatekey)+9 
end) as Financial_Month from financial_sales;
-- (i)
select 
concat('FQ','-',
case 
when month(orderdatekey) between 4 and 6 then 1 
when month(orderdatekey)between 7 and 9 then 2 
when month(orderdatekey)between 10 and 12 then 3 
else 4 
end) as Financial_Quarter from financial_sales;

-- --------------------------------------------------------------------------
-- Q4
select round((unitprice)*(orderquantity)*(1-(UnitPriceDiscountPct))) as Sales from financial_sales;
-- --------------------------------------------------------------------------
-- Q5
select round((ProductStandardCost)*(orderquantity)) as Production_cost from financial_sales;
-- --------------------------------------------------------------------------
-- Q6
select round((salesamount)-((ProductStandardCost)*(orderquantity))) as Profit from financial_sales; -- ---
-- --------------------------------------------------------------------------

-- --------------------------------------------------------------------------
-- --------------------------------------------------------------------------
/* VISUAL's */
-- Q7
select year(orderdatekey) as year, 
month(orderdatekey) as Month, 
concat(round(sum(salesamount)/1000,2),' K') as Sales 
from financial_sales 
group by year(orderdatekey), month(orderdatekey) 
order by year(orderdatekey);
-- --------------------------------------------------------------------------
-- Q8
select year(orderdatekey) as year, 
concat(round(sum(salesamount)/1000,2),' K') as Sales 
from financial_sales 
group by year(orderdatekey) 
order by year(orderdatekey);
-- --------------------------------------------------------------------------
-- Q9
select month(orderdatekey) as Month, 
concat(round(sum(salesamount)/1000000,2),' M') as Sales 
from financial_sales 
group by month(orderdatekey) 
order by month(orderdatekey);
-- --------------------------------------------------------------------------
-- Q10
select concat("Q-",quarter(orderdatekey)) as Quarter, 
concat(round(sum(salesamount)/1000000,2),' M') as Sales 
from financial_sales 
group by concat("Q-",quarter(orderdatekey)) 
order by concat("Q-",quarter(orderdatekey));
-- --------------------------------------------------------------------------
-- Q11
select concat(round(sum(salesamount)/1000000,2),' M') as Sales_Amount, 
concat(round(sum((ProductStandardCost)*(orderquantity))/1000000,2),' M') as Production_cost from 
financial_sales; -- ---
-- --------------------------------------------------------------------------

-- --------------------------------------------------------------------------
-- --------------------------------------------------------------------------
/* KPI's */
-- Q12
-- (a)
select concat(round(sum(SalesAmount)/1000000,2),' M') as Total_Sales_KPI from financial_sales;
-- (b)
select concat(round(sum(profit)/1000000,2),' M') as Total_Profits_KPI from financial_sales;
-- (c)
select concat(round((sum(profit)/sum(SalesAmount))*100,2),' %') as Profit_Margin_KPI from financial_sales;
-- --------------------------------------------------------------------------

-- --------------------------------------------------------------------------
-- --------------------------------------------------------------------------
/* Additional Visual's */
-- Q13
-- (a)
SELECT
    Customer_Full_Name,
    concat(ROUND(SUM(SalesAmount) / 1000, 2),' k') AS TotalSales
FROM financial_sales
GROUP BY Customer_Full_Name
ORDER BY TotalSales DESC
LIMIT 10;

-- (b)
SELECT
    t.SalesTerritoryRegion AS Region,
    concat(ROUND(SUM(s.SalesAmount) / 1000000, 2),' M') AS TotalSales
FROM financial_sales s
JOIN dimsalesterritory t
    ON s.SalesTerritoryKey = t.SalesTerritoryKey
GROUP BY Region;

-- (c)
SELECT
    Product_Name,
    concat(ROUND(SUM(SalesAmount) / 1000000, 2),' M') AS TotalSales
FROM financial_sales
GROUP BY Product_Name
ORDER BY TotalSales DESC
LIMIT 10;
-- --------------------------------------------------------------------------

/* Tables Creation */
-- --------------------------------------------------------------------------
-- --------------------------------------------------------------------------
-- --------------------------------------------------------------------------
/* COLUMN's */
-- Q3
-- (a)
 select year(orderdatekey) as Year from financial_sales;
-- (b)
create table month as select month(orderdatekey) as Month from financial_sales;
-- (c)
create table Month_Name as select monthname(orderdatekey) as Month_Name from financial_sales;
-- (d)
create table Quarter as select concat("Q", quarter(orderdatekey))as Quarter from financial_sales;
-- (e)
create table YearMonth as select concat( year(orderdatekey),"-",monthname(orderdatekey))as YearMonth from financial_sales;
-- (f)
create table Week_Number as select week(orderdatekey) as Weekday_no from financial_sales;
-- (g)
create table Weekday as select dayname(orderdatekey) as Weekday_name from financial_sales;
-- (h)
create table Financial_Month as select 
concat('FM','-',
case 
when month(orderdatekey) >=4 then month(orderdatekey)-3 
else month(orderdatekey)+9 
end) as Financial_Month from financial_sales;
-- (i)
create table Financial_Quarter as select 
concat('FQ','-',
case 
when month(orderdatekey) between 4 and 6 then 1 
when month(orderdatekey)between 7 and 9 then 2 
when month(orderdatekey)between 10 and 12 then 3 
else 4 
end) as Financial_Quarter from financial_sales;

-- --------------------------------------------------------------------------
-- Q4
create table Sales_Amount as select round((unitprice)*(orderquantity)*(1-(UnitPriceDiscountPct))) as Sales from financial_sales;
-- --------------------------------------------------------------------------
-- Q5
create table Production_Cost as select round((ProductStandardCost)*(orderquantity)) as Production_cost from financial_sales;
-- --------------------------------------------------------------------------
-- Q6
create table Profit as select round((salesamount)-((ProductStandardCost)*(orderquantity))) as Profit from financial_sales; -- ---
-- --------------------------------------------------------------------------

-- --------------------------------------------------------------------------
-- --------------------------------------------------------------------------
/* VISUAL's */
-- Q7
create table Monthwise_sale_Yearly as 
select year(orderdatekey) as year, 
month(orderdatekey) as Month, 
concat(round(sum(salesamount)/1000,2),' K') as Sales 
from financial_sales 
group by year(orderdatekey), month(orderdatekey) 
order by year(orderdatekey);
-- --------------------------------------------------------------------------
-- Q8
create table Yearwise_Sales as 
select year(orderdatekey) as year, 
concat(round(sum(salesamount)/1000,2),' K') as Sales 
from financial_sales 
group by year(orderdatekey) 
order by year(orderdatekey);
-- --------------------------------------------------------------------------
-- Q9
create table Monthwise_Sales as 
select month(orderdatekey) as Month, 
concat(round(sum(salesamount)/1000000,2),' M') as Sales 
from financial_sales 
group by month(orderdatekey) 
order by month(orderdatekey);
-- --------------------------------------------------------------------------
-- Q10
create table Quarter_Sales as 
select concat("Q-",quarter(orderdatekey)) as Quarter, 
concat(round(sum(salesamount)/1000000,2),' M') as Sales 
from financial_sales 
group by concat("Q-",quarter(orderdatekey)) 
order by concat("Q-",quarter(orderdatekey));
-- --------------------------------------------------------------------------
-- Q11
create table Sales_Prodcution_comb as 
select concat(round(sum(salesamount)/1000000,2),' M') as Sales_Amount, 
concat(round(sum((ProductStandardCost)*(orderquantity))/1000000,2),' M') as Production_cost 
from financial_sales; -- ---
-- --------------------------------------------------------------------------

-- --------------------------------------------------------------------------
-- --------------------------------------------------------------------------
/* KPI's */
-- Q12
-- (a)
create table Total_Sales_KPI as select concat(round(sum(SalesAmount)/1000000,2),' M') as Total_Sales_KPI from financial_sales;
-- (b)
create table Total_Profits_KPI as select concat(round(sum(profit)/1000000,2),' M') as Total_Profits_KPI from financial_sales;
-- (c)
create table Profit_Margin_KPI as select concat(round((sum(profit)/sum(SalesAmount))*100,2),' %') as Profit_Margin_KPI from financial_sales;
-- --------------------------------------------------------------------------

-- --------------------------------------------------------------------------
-- --------------------------------------------------------------------------
/* Additional Visual's */
-- Q13
-- (a)
CREATE TABLE top_customers AS
SELECT
    Customer_Full_Name,
    concat(ROUND(SUM(SalesAmount) / 1000, 2),' k') AS TotalSales
FROM financial_sales
GROUP BY Customer_Full_Name
ORDER BY TotalSales DESC
LIMIT 10;

-- (b)
CREATE TABLE Region_Performance AS
SELECT
    t.SalesTerritoryRegion AS Region,
    concat(ROUND(SUM(s.SalesAmount) / 1000000, 2),' M') AS TotalSales
FROM financial_sales s
JOIN dimsalesterritory t
    ON s.SalesTerritoryKey = t.SalesTerritoryKey
GROUP BY Region;

-- (c)
CREATE TABLE top_products AS
SELECT
    Product_Name,
    concat(ROUND(SUM(SalesAmount) / 1000000, 2),' M') AS TotalSales
FROM financial_sales
GROUP BY Product_Name
ORDER BY TotalSales DESC
LIMIT 10;
-- --------------------------------------------------------------------------




