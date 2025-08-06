# 1. Provide the Employees with Salary greater than 30000 and display the Salaries in Descending Order
SELECT * FROM
employee
WHERE Employee_Salary  > 30000
ORDER BY Employee_Salary DESC;

# 2. Provide the average Sale Price of all the transactions
SELECT AVG(sale_price) AS AverageSalePrice
FROM order_details;

# 3. Provide the average Total Spend of customers
SELECT AVG(TOTAL_TABLE.Sum_Spend) AS AverageSUMSpend
FROM 
(SELECT SUM(Quantity_Ordered*Sale_Price) AS SUM_Spend
FROM order_details) TOTAL_TABLE;

# 4. Provide the number of Employees that are Salespeople
SELECT COUNT(*) as CountOfEmployees
FROM employee
WHERE Employee_Type = 'Salesperson';

# 5. Provide the Water Vehicle Type with the highest average Sale Price
SELECT WV_Type, AVG(Sale_Price) AS AvgSale_Price
FROM order_details od JOIN water_vehicle wv 
ON od.WaterVehicle_ID = wv.WaterVehicle_ID
GROUP BY WV_Type
ORDER BY AVG(Sale_Price) DESC
LIMIT 1;

# 6. Provide the Water Vehicle Type with the highest total Quantity Ordered
SELECT WV_Type, SUM(Quantity_Ordered) AS TotalOrders
FROM order_details od JOIN water_vehicle wv 
ON od.WaterVehicle_ID = wv.WaterVehicle_ID
GROUP BY WV_Type
ORDER BY SUM(Quantity_Ordered)  DESC
LIMIT 1;

# 7. Provide the average Salary of Managers
SELECT Employee_Type, AVG(Employee_Salary) AS AVG_Salary
FROM employee 
GROUP BY Employee_Type
HAVING Employee_Type = 'Manager';

# 8. Provide the average Salary of Salespeople, not including commission
SELECT Employee_Type, AVG(Employee_Salary) AS AVG_Salary
FROM employee 
GROUP BY Employee_Type
HAVING Employee_Type = 'Salesperson';

# 9. Provide the Total Purchase Amount for each payment method in descending order
SELECT Payment_Method, SUM(Quantity*List_Price) AS TotalPurchase_Amount
FROM purchase_order 
GROUP BY Payment_Method
ORDER BY TotalPurchase_Amount DESC;

# 10. Which vehicles have never been ordered?
SELECT
  wv.WaterVehicle_ID,
  wv.WV_Type,
  wv.WV_Model
FROM water_vehicle AS wv
LEFT JOIN order_details AS od
  ON wv.WaterVehicle_ID = od.WaterVehicle_ID
WHERE od.WaterVehicle_ID IS NULL;

# 11. Which customers have not placed any purchase orders? (should return 0, because all customers get a PO)

SELECT
  c.Customer_ID,
  c.C_FName,
  c.C_LName,
  t.Transaction_ID
FROM customer AS c
LEFT JOIN transactions AS t
  ON c.Customer_ID = t.Customer_ID
LEFT JOIN purchase_order AS po
  ON t.Transaction_ID = po.Transaction_ID
WHERE po.PO_ID IS NULL;

# 12. Which water-vehicle category generates the highest total revenue?
SELECT
  wv.WV_Type,
  SUM(od.Quantity_Ordered * od.Sale_Price) AS TotalRevenue
FROM order_details AS od
JOIN water_vehicle AS wv
  ON od.WaterVehicle_ID = wv.WaterVehicle_ID
GROUP BY wv.WV_Type
ORDER BY TotalRevenue DESC
LIMIT 1;

# 13. Which transaction date generated the highest total revenue?

SELECT
  t.Transaction_Date,
  SUM(od.Quantity_Ordered * od.Sale_Price) AS TotalRevenue
FROM transactions AS t
JOIN order_details AS od
  ON t.Transaction_ID = od.Transaction_ID
GROUP BY
  t.Transaction_Date
ORDER BY
  TotalRevenue DESC
LIMIT 1;