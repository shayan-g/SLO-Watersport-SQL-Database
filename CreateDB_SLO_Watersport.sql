DROP DATABASE IF EXISTS `watersport`;
CREATE DATABASE `watersport`;
USE `watersport`;

CREATE TABLE IF NOT EXISTS customer
(
Customer_ID INT AUTO_INCREMENT,
C_FName VARCHAR(20),
C_LName VARCHAR(20),
C_Address TEXT,
C_Phone CHAR(10),
C_Email VARCHAR(100),
PRIMARY KEY (Customer_ID)
);

CREATE TABLE IF NOT EXISTS employee
(
Employee_ID INT AUTO_INCREMENT,
Employee_Name VARCHAR(25),
Employee_DOB DATE,
Employee_Hire_Date DATE,
Employee_Salary INTEGER,
Employee_Type VARCHAR(11),
PRIMARY KEY (Employee_ID)
);

CREATE TABLE IF NOT EXISTS transactions
(
Transaction_ID INT AUTO_INCREMENT,
Employee_ID INT,
Customer_ID INT,
Transaction_Date DATE,
PRIMARY KEY (Transaction_ID),
FOREIGN KEY (Employee_ID) REFERENCES employee(Employee_ID),
FOREIGN KEY (Customer_ID) REFERENCES customer(Customer_ID)
);

CREATE TABLE IF NOT EXISTS water_vehicle
(
WaterVehicle_ID INT AUTO_INCREMENT,
WV_Make CHAR(20),
WV_Model CHAR(20),
WV_Year YEAR,
WV_Color CHAR(20),
WV_Type CHAR(40),
PRIMARY KEY (WaterVehicle_ID)
);

CREATE TABLE IF NOT EXISTS order_details
(
Transaction_ID INT,
WaterVehicle_ID INT,
Quantity_Ordered INT,
Sale_Price FLOAT,
PRIMARY KEY (Transaction_ID, WaterVehicle_ID),
FOREIGN KEY (Transaction_ID) REFERENCES transactions (Transaction_ID),
FOREIGN KEY (WaterVehicle_ID) REFERENCES water_vehicle (WaterVehicle_ID)
);


CREATE TABLE IF NOT EXISTS w_sports_boat
(WaterVehicle_ID INT PRIMARY KEY,
FOREIGN KEY (WaterVehicle_ID) REFERENCES water_vehicle(WaterVehicle_ID)
ON DELETE CASCADE
ON UPDATE CASCADE 
);

CREATE TABLE IF NOT EXISTS w_jetski
(WaterVehicle_ID INT PRIMARY KEY,
FOREIGN KEY (WaterVehicle_ID) REFERENCES water_vehicle(WaterVehicle_ID)
ON DELETE CASCADE
ON UPDATE CASCADE 
);

CREATE TABLE IF NOT EXISTS w_paddle_boat
(WaterVehicle_ID INT PRIMARY KEY,
FOREIGN KEY (WaterVehicle_ID) REFERENCES water_vehicle(WaterVehicle_ID)
ON DELETE CASCADE
ON UPDATE CASCADE 
);

CREATE TABLE IF NOT EXISTS e_manager
(
Manager_ID INT AUTO_INCREMENT,
PRIMARY KEY (Manager_ID),
FOREIGN KEY (Manager_ID) REFERENCES employee (Employee_ID)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS e_salesperson
(
Salesperson_ID INT AUTO_INCREMENT,
Commission_Percent FLOAT,
PRIMARY KEY (Salesperson_ID),
FOREIGN KEY (Salesperson_ID) REFERENCES employee (Employee_ID)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS purchase_order
(
PO_id INT AUTO_INCREMENT,
WaterVehicle_ID INT,
Salesperson_ID INT, 
Transaction_ID INT,
Terms Text,
PO_Date DATE,
List_Price FLOAT,
Quantity INT,
Payment_Method VARCHAR(30),
PRIMARY KEY (PO_id),
FOREIGN KEY (WaterVehicle_ID) REFERENCES water_vehicle(WaterVehicle_ID),
FOREIGN KEY (Salesperson_ID) REFERENCES e_salesperson (Salesperson_ID),
FOREIGN KEY(Transaction_ID) REFERENCES transactions (Transaction_ID)
);

CREATE TABLE IF NOT EXISTS vendor
(
Vendor_ID INT AUTO_INCREMENT,
Manager_ID INT,
Vendor_Name VARCHAR(100),
Vendor_Location TEXT,
PRIMARY KEY (Vendor_ID),
FOREIGN KEY (Manager_ID) REFERENCES e_manager (Manager_ID)
);

## customer
INSERT INTO customer(Customer_ID, C_FName, C_LName, C_Address, C_Phone, C_Email) VALUES (NULL, "Shayan", "Golshan", "1234 Highland Dr", "1234567899", "shayangolshan@gmail.com");
INSERT INTO customer(Customer_ID, C_FName, C_LName, C_Address, C_Phone, C_Email) VALUES (NULL, "Madeline", "Willett", "999 Orange Dr", "5234567899", "maddiewillet@gmail.com");
INSERT INTO customer(Customer_ID, C_FName, C_LName, C_Address, C_Phone, C_Email) VALUES (NULL, "Rasa", "Blourtchi", "777 Walnut Ave", "7834567899", "rasablourtchi@gmail.com");
INSERT INTO customer(Customer_ID, C_FName, C_LName, C_Address, C_Phone, C_Email) VALUES (NULL, "Jin", "Burge", "678 Pinewood Dr", "2224567899", "jinburge@gmail.com");
INSERT INTO customer(Customer_ID, C_FName, C_LName, C_Address, C_Phone, C_Email) VALUES (NULL, "Yongcheng", "Zhan", "3456 Cal Poly Dr", "4234567855", "yongchenzhan@gmail.com");

## employee 
INSERT INTO employee (Employee_ID, Employee_Name, Employee_DOB, Employee_Hire_Date, Employee_Salary, Employee_Type) 
VALUES (NULL, "Ricky Bobby", "1989-04-19", "2020-02-11", 45000, "Manager");

INSERT INTO employee (Employee_ID, Employee_Name, Employee_DOB, Employee_Hire_Date, Employee_Salary, Employee_Type) 
VALUES (NULL, "Jason John", "1992-07-12", "2019-11-11", 48000, "Manager");

INSERT INTO employee (Employee_ID, Employee_Name, Employee_DOB, Employee_Hire_Date, Employee_Salary, Employee_Type) 
VALUES (NULL, "Nelly Jojo", "1997-05-15", "2021-10-20", 45000, "Manager");

INSERT INTO employee (Employee_ID, Employee_Name, Employee_DOB, Employee_Hire_Date, Employee_Salary, Employee_Type) 
VALUES (NULL, "Jesse Bach", "2000-03-11", "2022-01-22", 42000, "Manager");

INSERT INTO employee (Employee_ID, Employee_Name, Employee_DOB, Employee_Hire_Date, Employee_Salary, Employee_Type) 
VALUES (NULL, "James Bale", "1974-02-24", "2016-04-27", 80000, "Manager");

INSERT INTO employee (Employee_ID, Employee_Name, Employee_DOB, Employee_Hire_Date, Employee_Salary, Employee_Type) 
VALUES (NULL, "Billy Smith", "1970-04-19", "2010-05-14", 90000, "Salesperson");

INSERT INTO employee (Employee_ID, Employee_Name, Employee_DOB, Employee_Hire_Date, Employee_Salary, Employee_Type) 
VALUES (NULL, "George Paul", "2001-03-11", "2022-05-20", 42000, "Salesperson");

INSERT INTO employee (Employee_ID, Employee_Name, Employee_DOB, Employee_Hire_Date, Employee_Salary, Employee_Type) 
VALUES (NULL, "Nathan Barbosa", "1998-01-08", "2020-03-22", 45000, "Salesperson");

INSERT INTO employee (Employee_ID, Employee_Name, Employee_DOB, Employee_Hire_Date, Employee_Salary, Employee_Type) 
VALUES (NULL, "Jackie Diaz", "1996-09-03", "2019-08-17", 50000, "Salesperson");

INSERT INTO employee (Employee_ID, Employee_Name, Employee_DOB, Employee_Hire_Date, Employee_Salary, Employee_Type) 
VALUES (NULL, "Logan Lerman", "1996-01-03", "2019-08-17", 6000, "Salesperson");

## transaction
INSERT INTO transactions (Transaction_ID, Employee_ID, Customer_ID, Transaction_Date) VALUES (NULL, 1, 1, "2022-12-19");

INSERT INTO transactions (Transaction_ID, Employee_ID, Customer_ID, Transaction_Date) VALUES (NULL, 2, 2, "2022-09-15");

INSERT INTO transactions (Transaction_ID, Employee_ID, Customer_ID, Transaction_Date) VALUES (NULL, 3, 3, "2021-01-09");

INSERT INTO transactions (Transaction_ID, Employee_ID, Customer_ID, Transaction_Date) VALUES (NULL, 4, 4, "2022-07-17");

INSERT INTO transactions (Transaction_ID, Employee_ID, Customer_ID, Transaction_Date) VALUES (NULL, 5, 5, "2021-04-01");

## water vehicle 
INSERT INTO water_vehicle (WaterVehicle_id, WV_Make, WV_Model, WV_Year, WV_Color, WV_Type) VALUES (NULL, "Narke", "STX 160", "2010", "blue", "jetski");

INSERT INTO water_vehicle (WaterVehicle_id, WV_Make, WV_Model, WV_Year, WV_Color, WV_Type) VALUES (NULL, "Yamaha", "Ex", "2020", "black", "jetski");

INSERT INTO water_vehicle (WaterVehicle_id, WV_Make, WV_Model, WV_Year, WV_Color, WV_Type) VALUES (NULL, "Waverunners", "VX", "2021", "purple", "jetski");

INSERT INTO water_vehicle (WaterVehicle_id, WV_Make, WV_Model, WV_Year, WV_Color, WV_Type) VALUES (NULL, "Kawasaki", "STX", "2022", "red", "jetski");

INSERT INTO water_vehicle (WaterVehicle_id, WV_Make, WV_Model, WV_Year, WV_Color, WV_Type) VALUES (NULL, "Yamaha", "STX 160", "2018", "blue", "jetski");

INSERT INTO water_vehicle (WaterVehicle_id, WV_Make, WV_Model, WV_Year, WV_Color, WV_Type) VALUES (NULL, "Narke", "STX 160", "2010", "blue", "paddleboat");

INSERT INTO water_vehicle (WaterVehicle_id, WV_Make, WV_Model, WV_Year, WV_Color, WV_Type) VALUES (NULL, "Yamaha", "Ex", "2020", "black", "paddleboat");

INSERT INTO water_vehicle (WaterVehicle_id, WV_Make, WV_Model, WV_Year, WV_Color, WV_Type) VALUES (NULL, "Waverunners", "VX", "2021", "purple", "paddleboat");

INSERT INTO water_vehicle (WaterVehicle_id, WV_Make, WV_Model, WV_Year, WV_Color, WV_Type) VALUES (NULL, "Kawasaki", "STX", "2022", "red", "paddleboat");

INSERT INTO water_vehicle (WaterVehicle_id, WV_Make, WV_Model, WV_Year, WV_Color, WV_Type) VALUES (NULL, "Yamaha", "STX 160", "2018", "blue", "paddleboat");

INSERT INTO water_vehicle (WaterVehicle_id, WV_Make, WV_Model, WV_Year, WV_Color, WV_Type) VALUES (NULL, "Narke", "STX 160", "2010", "blue", "sports boat");

INSERT INTO water_vehicle (WaterVehicle_id, WV_Make, WV_Model, WV_Year, WV_Color, WV_Type) VALUES (NULL, "Yamaha", "Ex", "2020", "black", "sports boat");

INSERT INTO water_vehicle (WaterVehicle_id, WV_Make, WV_Model, WV_Year, WV_Color, WV_Type) VALUES (NULL, "Waverunners", "VX", "2021", "purple", "sports boat");

INSERT INTO water_vehicle (WaterVehicle_id, WV_Make, WV_Model, WV_Year, WV_Color, WV_Type) VALUES (NULL, "Kawasaki", "STX", "2022", "red", "sports boat");

INSERT INTO water_vehicle (WaterVehicle_id, WV_Make, WV_Model, WV_Year, WV_Color, WV_Type) VALUES (NULL, "Yamaha", "STX 160", "2015", "rainbow", "sports boat");


## jet skis
INSERT INTO w_jetski (WaterVehicle_ID) VALUES (1);

INSERT INTO w_jetski (WaterVehicle_ID) VALUES (2);

INSERT INTO w_jetski (WaterVehicle_ID) VALUES (3);

INSERT INTO w_jetski (WaterVehicle_ID) VALUES (4);

INSERT INTO w_jetski (WaterVehicle_ID) VALUES (5);

## paddle boats
INSERT INTO w_paddle_boat (WaterVehicle_ID) VALUES (6);

INSERT INTO w_paddle_boat (WaterVehicle_ID) VALUES (7);

INSERT INTO w_paddle_boat (WaterVehicle_ID) VALUES (8);

INSERT INTO w_paddle_boat (WaterVehicle_ID) VALUES (9);

INSERT INTO w_paddle_boat (WaterVehicle_ID) VALUES (10);

## sports boat
INSERT INTO w_sports_boat (WaterVehicle_ID) VALUES (11);

INSERT INTO w_sports_boat (WaterVehicle_ID) VALUES (12);

INSERT INTO w_sports_boat (WaterVehicle_ID) VALUES (13);

INSERT INTO w_sports_boat (WaterVehicle_ID) VALUES (14);

INSERT INTO w_sports_boat (WaterVehicle_ID) VALUES (15);

## order_details
INSERT INTO order_details (Transaction_ID, WaterVehicle_ID, Quantity_Ordered, Sale_Price) VALUES (1, 1, 4, 50000.36);

INSERT INTO order_details (Transaction_ID, WaterVehicle_ID, Quantity_Ordered, Sale_Price) VALUES (2, 2, 2, 10040.49);

INSERT INTO order_details (Transaction_ID, WaterVehicle_ID, Quantity_Ordered, Sale_Price) VALUES (3, 3, 6, 7140.49);

INSERT INTO order_details (Transaction_ID, WaterVehicle_ID, Quantity_Ordered, Sale_Price) VALUES (4, 4, 1, 2090.80);

INSERT INTO order_details (Transaction_ID, WaterVehicle_ID, Quantity_Ordered, Sale_Price) VALUES (5, 5, 4, 20090.59);

## manager
INSERT INTO e_manager (Manager_ID)  VALUES (1);
INSERT INTO e_manager (Manager_ID)  VALUES (2);
INSERT INTO e_manager (Manager_ID)  VALUES (3);
INSERT INTO e_manager (Manager_ID)  VALUES (4);
INSERT INTO e_manager (Manager_ID)  VALUES (5);

## salesperson
INSERT INTO e_salesperson (Salesperson_ID, Commission_Percent) VALUES (6, 0.2);
INSERT INTO e_salesperson (Salesperson_ID, Commission_Percent) VALUES (7, 0.2);
INSERT INTO e_salesperson (Salesperson_ID, Commission_Percent) VALUES (8, 0.2);
INSERT INTO e_salesperson (Salesperson_ID, Commission_Percent) VALUES (9, 0.2);
INSERT INTO e_salesperson (Salesperson_ID, Commission_Percent) VALUES (10, 0.2);

## vendor
INSERT INTO vendor (Vendor_ID, Manager_ID, Vendor_Name, Vendor_Location) VALUES (NULL, 1, "Thrills n Spills", "Paso Robles");

INSERT INTO vendor (Vendor_ID, Manager_ID, Vendor_Name, Vendor_Location) VALUES (NULL, 2, "Southern California Jet Skis", "San Diego");

INSERT INTO vendor (Vendor_ID, Manager_ID, Vendor_Name, Vendor_Location) VALUES (NULL, 3, "Extreme Speed", "San Diego");

INSERT INTO vendor (Vendor_ID, Manager_ID, Vendor_Name, Vendor_Location) VALUES (NULL, 4, "Pure Watersports", "Dana Point");

INSERT INTO vendor (Vendor_ID, Manager_ID, Vendor_Name, Vendor_Location) VALUES (NULL, 5, "Water Ski World", "Lake Tahoe");

# purchase_order
INSERT INTO purchase_order (PO_id, WaterVehicle_ID, Salesperson_ID, Transaction_ID, Terms, PO_Date, List_Price, Quantity, Payment_Method)
VALUES (NULL, 1, 6, 1, "The amount on the Purchase Order is the agreed price and shall not be exceeded unless otherwise specified.", "2022-12-13", 10000.31, 4, "Mastercard");

INSERT INTO purchase_order (PO_id, WaterVehicle_ID, Salesperson_ID, Transaction_ID, Terms, PO_Date, List_Price, Quantity, Payment_Method)
VALUES (NULL, 2, 7, 2, "The amount on the Purchase Order is the agreed price and shall not be exceeded unless otherwise specified.", "2022-02-11", 13000.13, 3, "VISA");

INSERT INTO purchase_order (PO_id, WaterVehicle_ID, Salesperson_ID, Transaction_ID, Terms, PO_Date, List_Price, Quantity, Payment_Method)
VALUES (NULL, 3, 8, 3, "The amount on the Purchase Order is the agreed price and shall not be exceeded unless otherwise specified.", "2021-03-03", 1315.31, 7, "Mastercard");

INSERT INTO purchase_order (PO_id, WaterVehicle_ID, Salesperson_ID, Transaction_ID, Terms, PO_Date, List_Price, Quantity, Payment_Method) 
VALUES (NULL, 4, 9, 4, "The amount on the Purchase Order is the agreed price and shall not be exceeded unless otherwise specified.", "2022-04-21", 7050.36, 2, "Discovery");

INSERT INTO purchase_order (PO_id, WaterVehicle_ID, Salesperson_ID, Transaction_ID, Terms, PO_Date, List_Price, Quantity, Payment_Method) 
VALUES (NULL, 5, 8, 5, "The amount on the Purchase Order is the agreed price and shall not be exceeded unless otherwise specified.", "2022-1-04", 20000.70, 7, "Mastercard");