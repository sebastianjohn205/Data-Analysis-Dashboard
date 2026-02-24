-- -----------------------------------------------------------------------
/* COLUMN's */
-- -----------------------------------------------------------------------
-- Q0
select *from financial_sales;
-- Q1
select product_name from financial_sales;
-- Q2
select customer_full_name from financial_sales;

-- --------------------------------
-- Q3
-- (a)
select *from year;
-- (b)
select *from month;
-- (c)
select *from month_name;
-- (d)
select *from quarter;
-- (e)
select *from yearmonth;
-- (f)
select *from week_number;
-- (g)
select *from weekday;
-- (h)
select *from financial_month;
-- (i)
select *from financial_quarter;
-- ------------------------------
-- Q4
select *from sales_amount;
-- Q5
select *from production_cost;
-- Q6
select *from profit;
-- --------------------------------------------------------------------------
/* VISUAL's */
-- --------------------------------------------------------------------------
-- Q7
select *from monthwise_sale_yearly;
-- Q8
select *from yearwise_sales;
-- Q9
select *from monthwise_sales;
-- Q10
select *from quarter_sales;
-- Q11
select *from sales_prodcution_comb;
-- --------------------------------------------------------------------------
/* KPI's */
-- --------------------------------------------------------------------------
-- Q12
-- (a)
select *from total_sales_kpi;
-- (b)
select *from total_profits_kpi;
-- (c)
select *from profit_margin_kpi;
-- --------------------------------------------------------------------------
/* Additional Visual's */
-- --------------------------------------------------------------------------
-- Q13
-- (a)
select *from top_products;
-- (b)
select *from top_customers;
-- (c)
select *from region_performance;
-- --------------------------------------------------------------------------