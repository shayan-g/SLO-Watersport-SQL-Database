# San Luis Obispo Watersport SQL Database
A sample SQL database schema for a fictional company—complete with DDL script, updates, and sample queries for business questions.

## Project Scope
This project examines the relationships within SLO Water Sport Vehicles, where customers can purchase items such as sports boats, jet skis, and paddle boats for their summer vacations or leisurely time at the lake. The database for this shop consists of entities to keep track of customers, transactions, order details, water vehicles, purchase orders, employees, vendors, and the relationships among them. The shop sells three variations of water vehicles: sports boats, jet skis, and paddle boats. Salespeople work with customers to assist them with their purchases, while managers work with the vendors to supply the inventory for the shop. 

## Objective
To build a robust SQL database and a set of targeted queries that enable stakeholders to ask questions regarding employee compensation, customer spending habits, and sales performance across different water-vehicle categories and payment methods.

## These queries aim to answer the questions posed by our key stakeholders for the business.

1. Which employees earn more than \$30,000, and how do their salaries rank from highest to lowest?
2. What is the average sale price across all transactions?
3. On average, how much does each customer spend in total?
4. How many employees in our organization serve as salespeople?
5. Which water-vehicle category commands the highest average sale price?
6. Which water-vehicle category has the greatest total quantity ordered?
7. What is the average salary paid to our managers?
8. What is the average base salary of our salespeople, excluding any commission?
9. How much total purchase value is processed through each payment method, and how do they compare when ordered from highest to lowest?
10. Which vehicles have never been ordered?
11. Which customers have not placed any purchase orders?
12. Which water-vehicle category generates the highest total revenue?
13. Which transaction date generated the highest total revenue?

## Running the Project
1. Install MySQL Workbench (or another MySQL client).  
2. Execute the `CreateDB_SLO_Watersport.sql` script from this repository to create and populate the database.  
3. Open and run the query script (`Queries_SLO_Watersport.sql`) in the SQL client to answer the business questions above.
