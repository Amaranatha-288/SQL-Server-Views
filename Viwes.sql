-- Views
-- find the ruuunig total of sales for each month
-- CTE
WITH CTE_Monthly_Summary AS (
SELECT
DATETRUNC (month,OrderDate) OrderMonth,
SUM(Sales) TotalSales,
COUNT(OrderID) TotalOrders,
SUM(Quantity) TotalQuantities
FROM Sales.Orders
GROUP BY DATETRUNC (month,OrderDate)
)

SELECT
OrderMonth,
TotalSales,
SUM(TotalSales) OVER (ORDER BY OrderMonth) AS RunningTotal
FROM  CTE_Monthly_Summary 

--Views

  CREATE VIEW V_Monthly_Summary AS(
	SELECT
	DATETRUNC (month,OrderDate) OrderMonth,
	SUM(Sales) TotalSales,
	COUNT(OrderID) TotalOrders,
	SUM(Quantity) TotalQuantities
	FROM Sales.Orders
	GROUP BY DATETRUNC (month,OrderDate)

)
 
SELECT
*
FROM V_Monthly_Summary
-- 1if want add th new logic then drop the view and create again
-- 2 T-SQL
/* IF OBJECT_ID ("Sales.V_Monthly_Summary','v') IS NOT NULL
   DROP VIEW Sales.V_Monthly_Summary
 GO
  CREATE VIEW V_Monthly_Summary AS(
	SELECT
	DATETRUNC (month,OrderDate) OrderMonth,
	SUM(Sales) TotalSales,
	COUNT(OrderID) TotalOrders,
	SUM(Quantity) TotalQuantities
	FROM Sales.Orders
	GROUP BY DATETRUNC (month,OrderDate)

) then it changes what it need to change like logic */

 
 
 -- Use Case
 -- Hide Complexity
 -- TASK: Provide the view that combines detail from orders,products, customers, and employees
CREATE VIEW Sales.V_Order_Details AS (
SELECT
o.OrderID,
o.OrderDate,
p.product,
p.Category,
COALESCE(c.FirstName,'') + '' +COALESCE(c.LastName,'') CustomerName,
c.Country CustomerCountry,
COALESCE(e.FirstName,'') + '' +COALESCE(e.LastName,'') SalesName,
e.Department,
o.Sales,
o.Quantity,
e.Salary
FROM Sales.Orders o
LEFT JOIN Sales.Products p
ON p.ProductID = o.ProductID
LEFT JOIN Sales.Customers c
ON c.CustomerID = o.CustomerID
LEFT JOIN Sales.Employees e
ON e.EmployeeID = o.SalesPersonID
)
SELECT * FROM  Sales.V_Order_Details

 -- Use Case Data Security
 --Provide a view for the EU Sales Team 
 --That Comnines details from all tables
 --And excludea data related to the USA
 CREATE VIEW Sales.V_Order_Details_EU AS (
 SELECT
o.OrderID,
o.OrderDate,
p.product,
p.Category,
COALESCE(c.FirstName,'') + '' +COALESCE(c.LastName,'') CustomerName,
c.Country CustomerCountry,
COALESCE(e.FirstName,'') + '' +COALESCE(e.LastName,'') SalesName,
e.Department,
o.Sales,
o.Quantity,
e.Salary
FROM Sales.Orders o
LEFT JOIN Sales.Products p
ON p.ProductID = o.ProductID
LEFT JOIN Sales.Customers c
ON c.CustomerID = o.CustomerID
LEFT JOIN Sales.Employees e
ON e.EmployeeID = o.SalesPersonID
WHERE c.Country != 'USA'
)

SELECT * FROM Sales.V_Order_Details_EU












