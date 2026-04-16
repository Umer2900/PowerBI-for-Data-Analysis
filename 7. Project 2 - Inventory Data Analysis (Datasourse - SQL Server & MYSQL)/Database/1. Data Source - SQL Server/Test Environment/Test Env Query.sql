CREATE DATABASE test_env

USE [test_env]

select * from [dbo].[Products]		-- Ctrl + E   is used to run the query
select * from [dbo].[Test+Environment+Inventory+Dataset]


-- Basic Analysis
select distinct [Demand] from 
[dbo].[Test+Environment+Inventory+Dataset]

     ------

select a.[Order_Date_DD_MM_YYYY],
a.product_id,a.availability,a.demand,b.product_name,b.unit_price

from [dbo].[Test+Environment+Inventory+Dataset] as a
left join products as b 
on a.product_id=b.product_id
     ------



-- Doing Left Join and creating a new table with the result
select * into new_table from (
    select a.[Order_Date_DD_MM_YYYY],
            a.product_id,a.availability,
            a.demand,b.product_name,
            b.unit_price

    from [dbo].[Test+Environment+Inventory+Dataset] as a
    left join products as b 
    on a.product_id=b.product_id
) x

select * from new_table
 

