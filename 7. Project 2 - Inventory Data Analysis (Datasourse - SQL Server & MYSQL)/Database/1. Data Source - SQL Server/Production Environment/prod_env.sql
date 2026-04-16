CREATE DATABASE prod_env

USE prod_env

----1. Table 1--------------------------

SELECT *
	FROM [dbo].[Prod+Env+Inventory+Dataset]


SELECT distinct [Order_Date_DD_MM_YYYY]
	FROM [dbo].[Prod+Env+Inventory+Dataset]
		where [Order_Date_DD_MM_YYYY] is null or [Order_Date_DD_MM_YYYY] = ''


SELECT distinct [Product_ID]
	FROM [dbo].[Prod+Env+Inventory+Dataset] 
		order by Product_ID						-- Note: Here we have 22 


----2. Table 2--------------------------

SELECT *
	FROM [dbo].[Products]

SELECT distinct [Product_ID]
	FROM [dbo].[Products]
		order by [Product_ID]			-- NOTE: Here we have only 20



----3. Data Cleaning--------------------

--Here we can see 2 extra [Product_ID] in the [dbo].[Prod+Env+Inventory+Dataset]
-- Imagine the team told you that 
--       - [Product_ID] --> 21    --is basically--> 7
--       - [Product_ID] --> 22    --is basically--> 11

-- And they told you that they will fix this issue like within a week.

-- BUT,
-- You have to create the report now & you need to present the insights.

-- **Q. WHat should I do?**
-- Answer: I shouldn't wait for the team to fix the issue.
-- Rather I can run updates on this table in the production environment only.


--Update Statements--
update [dbo].[Prod+Env+Inventory+Dataset]
	set [Product_ID] = 7 where Product_ID =21

update [dbo].[Prod+Env+Inventory+Dataset]
	set [Product_ID] = 11 where Product_ID =22


----4. JOIN----------------------------------------
select * into new_table from (

select a.[Order_Date_DD_MM_YYYY],
		a.product_id,
		a.availability,
		a.demand,
		b.product_name,
		b.unit_price

	from [dbo].[Prod+Env+Inventory+Dataset] as a
		left join products as b 
			on a.product_id=b.product_id
) x


--Display--
SELECT * 
	FROM [dbo].[new_table]