create database db_retailapp;
use db_retailapp;

#creating tables
DROP TABLE IF EXISTS `Orders`;

CREATE TABLE `Orders` (
  `OrderID` bigint NOT NULL auto_increment,
  `CustomerID` bigint default NULL,
  `visitID` bigint DEFAULT NULL,                                  
  `OrderDate` date default NULL,
 `OrderTotal` decimal(9,2) default null,
  PRIMARY KEY (`OrderID`));
  
  
DROP TABLE IF EXISTS `OrderDetails`;

CREATE TABLE `OrderDetails` (
`OrderID` bigint default NULL,
`ProductID` bigint default NULL,
`Quantity` bigint DEFAULT NULL,                                  
key`OrderID`(`OrderID`),
key `ProductID`(`ProductID`));
  
  
  
DROP TABLE IF EXISTS `Application_Visits`;

CREATE TABLE `Application_Visits` (
  `visitID` bigint NOT NULL auto_increment,
  `CustomerID` bigint default NULL,
  `appopendate` datetime DEFAULT NULL,                                  
  `appclosedate` datetime default NULL,
  PRIMARY KEY (`visitID`),
  key `CustomerID`(`CustomerID`));
 


DROP TABLE IF EXISTS `Customers`;

CREATE TABLE `Customers` (
  `CustomerID` bigint NOT NULL auto_increment,
  `CustFirstName` nvarchar(65) default NULL,
  `CustLastName` nvarchar(65) DEFAULT NULL,
  `dob` date default null,
  `EmailID` nvarchar(65) default null,
  `loyaltyrewardID` bigint default null,
  `TotalCustOrders` decimal(9,2) default null, 
  PRIMARY KEY (`CustomerID`));
  
  DROP TABLE IF EXISTS `Customers_Address`;

CREATE TABLE `Customers_Address` (
  `CustomerID` bigint default NULL,
   `Streetaddress` nvarchar(65) default NULL,
  `City` nvarchar(65) DEFAULT NULL,
  `Zip`bigint default null,
  `State` nvarchar(65) default null,
  `fromdate` date default null,
  `todate` date default null);
  

DROP TABLE IF EXISTS `Products`;

CREATE TABLE `Products`(
  `ProductID` bigint not NULL auto_increment,
  `ProductName` nvarchar(65) default NULL,
  `RetailPrice` decimal(9,2) default null,
  `Currentvolume` bigint default null,
  `Product_order_status` nvarchar(65) default null,
PRIMARY KEY (`ProductID`));
  

DROP TABLE IF EXISTS `Vendors`;

CREATE TABLE `Vendors`(
`VendorID` bigint not null auto_increment,
`VendorName` nvarchar(65) default null,
`VendorAddress` nvarchar(65) default null,
`City`nvarchar(65) default null,
`Zip`bigint default null,
`State` nvarchar(65) default null,
primary key (`VendorID`));

DROP TABLE IF EXISTS `Vendor_Price`;

CREATE TABLE `Vendor_Price`(
`VendorID` bigint default null,
`ProductID` bigint default null,
`VendorPrice` bigint default null);

DROP TABLE IF EXISTS `Vendor_Price_Archive`;

CREATE TABLE `Vendor_Price_Archive`(
`VendorID` bigint default null,
`ProductID` bigint default null,
`VendorPrice` bigint default null,
`SaleStopDate` Date default null);


DROP TABLE IF EXISTS `Departments`;

CREATE TABLE `Departments`(
`DepartmentID` bigint not null auto_increment,
`DepartmentName` nvarchar(65) default null,
`DepartmentemailID` nvarchar(65) default null,
primary key (`DepartmentID`));


DROP TABLE IF EXISTS `Employees`;

CREATE TABLE `Employees`(
`EmployeeID` bigint not null auto_increment,
`EmployeeFirstName` nvarchar(65),
`EmployeeLastName` nvarchar(65),
`DepartmentID` bigint default null,
`ManagerID` nvarchar(65) default null,
primary key (`EmployeeID`));


DROP TABLE IF EXISTS `loyalty_rewards`;

create table `loyalty_rewards`(
`loyaltyrewardID` bigint not null auto_increment,
`loyaltyrewarddesc` nvarchar(65) default null,
`loyaltyrewardcriteria` nvarchar(65) default null,	
primary key (`loyaltyrewardID`));


#Adding foreign key constraints
ALTER TABLE `Orders`
ADD FOREIGN KEY (`CustomerID`) REFERENCES `Customers`(`CustomerID`),
ADD FOREIGN KEY (`visitID`) REFERENCES `Application_Visits`(`visitID`);

ALTER TABLE `OrderDetails`
ADD FOREIGN KEY(`OrderID`) references `Orders`(`OrderID`),
ADD FOREIGN KEY (`ProductID`) references `Products`(`ProductID`);

alter table  `Application_Visits`
ADD FOREIGN KEY (`CustomerID`) REFERENCES `Customers`(`CustomerID`);


alter table  `Customers`
ADD FOREIGN KEY (`loyaltyrewardID`) REFERENCES `loyalty_rewards`(`loyaltyrewardID`);

alter table `Employees`
ADD FOREIGN KEY (`DepartmentID`) REFERENCES `Departments`(`DepartmentID`);

alter table `Vendor_Price`
ADD FOREIGN KEY (`VendorID`) REFERENCES `Vendors`(`VendorID`),
ADD FOREIGN KEY (`ProductID`) REFERENCES `Products`(`ProductID`);

alter table `Vendor_Price_Archive`
ADD FOREIGN KEY (`VendorID`) REFERENCES `Vendors`(`VendorID`),
ADD FOREIGN KEY (`ProductID`) REFERENCES `Products`(`ProductID`);

alter table `Customers_Address`
ADD FOREIGN KEY (`CustomerID`) REFERENCES `Customers`(`CustomerID`);


#inserting values

#inserting values into  all the primary keys first
#OrderID
insert into `Orders`(`OrderID`) values (1001);
insert into `Orders`(`OrderID`) values (1002);
insert into `Orders`(`OrderID`) values (1003);
insert into `Orders`(`OrderID`) values (1004);
insert into `Orders`(`OrderID`) values (1005);
insert into `Orders`(`OrderID`) values (1006);
insert into `Orders`(`OrderID`) values (1007);
insert into `Orders`(`OrderID`) values (1008);
insert into `Orders`(`OrderID`) values (1009);
insert into `Orders`(`OrderID`) values (1010);
insert into `Orders`(`OrderID`) values (1011);
insert into `Orders`(`OrderID`) values (1012);
insert into `Orders`(`OrderID`) values (1013);
insert into `Orders`(`OrderID`) values (1014);
insert into `Orders`(`OrderID`) values (1015);
insert into `Orders`(`OrderID`) values (1016);
insert into `Orders`(`OrderID`) values (1017);
insert into `Orders`(`OrderID`) values (1018);
insert into `Orders`(`OrderID`) values (1019);
insert into `Orders`(`OrderID`) values (1020);

#VisitID
insert into `Application_Visits`(`visitID`) values (123);
insert into `Application_Visits`(`visitID`) values (124);
insert into `Application_Visits`(`visitID`) values (125);
insert into `Application_Visits`(`visitID`) values (126);
insert into `Application_Visits`(`visitID`) values (127);
insert into `Application_Visits`(`visitID`) values (128);
insert into `Application_Visits`(`visitID`) values (129);
insert into `Application_Visits`(`visitID`) values (130);
insert into `Application_Visits`(`visitID`) values (131);
insert into `Application_Visits`(`visitID`) values (132);
insert into `Application_Visits`(`visitID`) values (133);
insert into `Application_Visits`(`visitID`) values (134);
insert into `Application_Visits`(`visitID`) values (135);
insert into `Application_Visits`(`visitID`) values (136);
insert into `Application_Visits`(`visitID`) values (137);
insert into `Application_Visits`(`visitID`) values (138);
insert into `Application_Visits`(`visitID`) values (139);
insert into `Application_Visits`(`visitID`) values (140);
insert into `Application_Visits`(`visitID`) values (141);
insert into `Application_Visits`(`visitID`) values (142);
insert into `Application_Visits`(`visitID`) values (143);
insert into `Application_Visits`(`visitID`) values (144);
insert into `Application_Visits`(`visitID`) values (145);
insert into `Application_Visits`(`visitID`) values (146);
insert into `Application_Visits`(`visitID`) values (147);
insert into `Application_Visits`(`visitID`) values (148);
insert into `Application_Visits`(`visitID`) values (149);
insert into `Application_Visits`(`visitID`) values (150);
insert into `Application_Visits`(`visitID`) values (151);
insert into `Application_Visits`(`visitID`) values (152);
insert into `Application_Visits`(`visitID`) values (153);
insert into `Application_Visits`(`visitID`) values (154);
insert into `Application_Visits`(`visitID`) values (155);
insert into `Application_Visits`(`visitID`) values (156);
insert into `Application_Visits`(`visitID`) values (157);
insert into `Application_Visits`(`visitID`) values (158);
insert into `Application_Visits`(`visitID`) values (159);
insert into `Application_Visits`(`visitID`) values (160);
insert into `Application_Visits`(`visitID`) values (161);
insert into `Application_Visits`(`visitID`) values (162);
insert into `Application_Visits`(`visitID`) values (163);
insert into `Application_Visits`(`visitID`) values (164);
insert into `Application_Visits`(`visitID`) values (165);
insert into `Application_Visits`(`visitID`) values (166);
insert into `Application_Visits`(`visitID`) values (167);
insert into `Application_Visits`(`visitID`) values (168);
insert into `Application_Visits`(`visitID`) values (169);
insert into `Application_Visits`(`visitID`) values (170);
insert into `Application_Visits`(`visitID`) values (171);
insert into `Application_Visits`(`visitID`) values (172);



#CustomerID
insert into `Customers`(`CustomerID`) values (101);
insert into `Customers`(`CustomerID`) values (102);
insert into `Customers`(`CustomerID`) values (103);
insert into `Customers`(`CustomerID`) values (104);
insert into `Customers`(`CustomerID`) values (105);
insert into `Customers`(`CustomerID`) values (106);
insert into `Customers`(`CustomerID`) values (107);
insert into `Customers`(`CustomerID`) values (108);
insert into `Customers`(`CustomerID`) values (109);
insert into `Customers`(`CustomerID`) values (110);
insert into `Customers`(`CustomerID`) values (111);


#ProductID
insert into `Products`(`ProductID`) values (2001);
insert into `Products`(`ProductID`) values (2002);
insert into `Products`(`ProductID`) values (2003);
insert into `Products`(`ProductID`) values (2004);
insert into `Products`(`ProductID`) values (2005);
insert into `Products`(`ProductID`) values (2006);
insert into `Products`(`ProductID`) values (2007);
insert into `Products`(`ProductID`) values (2008);
insert into `Products`(`ProductID`) values (2009);
insert into `Products`(`ProductID`) values (2010);
insert into `Products`(`ProductID`) values (2011);
insert into `Products`(`ProductID`) values (2012);
insert into `Products`(`ProductID`) values (2013);
insert into `Products`(`ProductID`) values (2014);
insert into `Products`(`ProductID`) values (2015);


#VendorID
insert into `Vendors`(`VendorID`) values (10);
insert into `Vendors`(`VendorID`) values (11);
insert into `Vendors`(`VendorID`) values (12);
insert into `Vendors`(`VendorID`) values (13);
insert into `Vendors`(`VendorID`) values (14);
insert into `Vendors`(`VendorID`) values (15);
insert into `Vendors`(`VendorID`) values (16);
insert into `Vendors`(`VendorID`) values (17);
insert into `Vendors`(`VendorID`) values (18);
insert into `Vendors`(`VendorID`) values (19);
insert into `Vendors`(`VendorID`) values (20);
insert into `Vendors`(`VendorID`) values (21);

#DepartmentID
insert into `Departments`(`DepartmentID`) values (345);
insert into `Departments`(`DepartmentID`) values (346);
insert into `Departments`(`DepartmentID`) values (347);
insert into `Departments`(`DepartmentID`) values (348);

#EmployeeID
insert into `Employees`(`EmployeeID`) values (9001);
insert into `Employees`(`EmployeeID`) values (9002);
insert into `Employees`(`EmployeeID`) values (9003);
insert into `Employees`(`EmployeeID`) values (9004);
insert into `Employees`(`EmployeeID`) values (9005);
insert into `Employees`(`EmployeeID`) values (9006);
insert into `Employees`(`EmployeeID`) values (9007);
insert into `Employees`(`EmployeeID`) values (9008);

#loyaltyrewardID
insert into `loyalty_rewards`(`loyaltyrewardID`) values (0011);
insert into `loyalty_rewards`(`loyaltyrewardID`) values (0012);
insert into `loyalty_rewards`(`loyaltyrewardID`) values (0013);


insert into `OrderDetails` values (1001,2001,5),(1002,2002,8),(1003,2003,2),(1004,2004,10),(1005,2004,4),(1006,2004,12),(1007,2005,5),(1008,2006,15),(1009,2007,2),(1010,2007,1),(1011,2006,10),(1012,2008,7),(1013,2009,6),(1014,2010,5),(1015,2010,7),(1016,2010,10),(1017,2011,11),(1018,2012,8),(1019,2013,12),(1020,2014,3),(1001,2001,6),(1002,2002,11),(1003,2003,18),(1004,2015,4),(1005,2001,4),(1011,2002,6),(1012,2003,7),(1013,2007,3),(1014,2008,5),(1015,2002,9);



UPDATE `Orders`
SET `CustomerID` = 101 , `visitID` = 123,  `OrderDate` = '2020-07-04'
WHERE `OrderID`= 1001;

UPDATE `Orders`
SET `CustomerID` = 102 , `visitID` = 124,  `OrderDate` = '2020-07-05'
WHERE `OrderID`= 1002;

UPDATE `Orders`
SET `CustomerID` = 105 , `visitID` = 125,  `OrderDate` = '2020-07-06'
WHERE `OrderID`= 1003;

UPDATE `Orders`
SET `CustomerID` = 106 , `visitID` = 126,  `OrderDate` = '2020-07-06'
WHERE `OrderID`= 1004;

UPDATE `Orders`
SET `CustomerID` = 101 , `visitID` = 127,  `OrderDate` = '2020-07-06'
WHERE `OrderID`= 1017;

UPDATE `Orders`
SET `CustomerID` = 102 , `visitID` = 128,  `OrderDate` = '2020-07-07'
WHERE `OrderID`= 1018;

UPDATE `Orders`
SET `CustomerID` = 107 , `visitID` = 132,  `OrderDate` = '2020-07-09'
WHERE `OrderID`= 1019;

UPDATE `Orders`
SET `CustomerID` = 107 , `visitID` = 138,  `OrderDate` = '2020-07-10'
WHERE `OrderID`= 1020;

UPDATE `Orders`
SET `CustomerID` = 108 , `visitID` = 141,  `OrderDate` = '2020-07-12'
WHERE `OrderID`= 1005;

UPDATE `Orders`
SET `CustomerID` = 109 , `visitID` = 142,  `OrderDate` = '2020-07-12'
WHERE `OrderID`= 1006;

UPDATE `Orders`
SET `CustomerID` = 110 , `visitID` = 145,  `OrderDate` = '2020-07-13'
WHERE `OrderID`= 1007;

UPDATE `Orders`
SET `CustomerID` = 110 , `visitID` = 147,  `OrderDate` = '2020-07-14'
WHERE `OrderID`= 1008;

UPDATE `Orders`
SET `CustomerID` = 110 , `visitID` = 148,  `OrderDate` = '2020-07-14'
WHERE `OrderID`= 1009;

UPDATE `Orders`
SET `CustomerID` = 101 , `visitID` = 150,  `OrderDate` = '2020-07-14'
WHERE `OrderID`= 1010;

UPDATE `Orders`
SET `CustomerID` = 107 , `visitID` = 151,  `OrderDate` = '2020-07-15'
WHERE `OrderID`= 1011;

UPDATE `Orders`
SET `CustomerID` = 104 , `visitID` = 152,  `OrderDate` = '2020-07-17'
WHERE `OrderID`= 1012;

UPDATE `Orders`
SET `CustomerID` = 102 , `visitID` = 162,  `OrderDate` = '2020-07-17'
WHERE `OrderID`= 1013;

UPDATE `Orders`
SET `CustomerID` = 108 , `visitID` = 167,  `OrderDate` = '2020-07-18'
WHERE `OrderID`= 1014;

UPDATE `Orders`
SET `CustomerID` = 101 , `visitID` = 168,  `OrderDate` = '2020-07-19'
WHERE `OrderID`= 1015;

UPDATE `Orders`
SET `CustomerID` = 109 , `visitID` = 170,  `OrderDate` = '2020-07-20'
WHERE `OrderID`= 1016;

UPDATE `Orders`
SET `OrderTotal` = 1595.00
WHERE `OrderID`= 1001;

UPDATE `Orders`
SET `OrderTotal` = 3362.81
WHERE `OrderID`= 1002;

UPDATE `Orders`
SET `OrderTotal` = 2000.00
WHERE `OrderID`= 1003;

UPDATE `Orders`
SET `OrderTotal` = 3200.00
WHERE `OrderID`= 1004;

UPDATE `Orders`
SET `OrderTotal` = 1060.00
WHERE `OrderID`= 1005;

UPDATE `Orders`
SET `OrderTotal` = 1440.00
WHERE `OrderID`= 1006;

UPDATE `Orders`
SET `OrderTotal` = 714.95
WHERE `OrderID`= 1007;

UPDATE `Orders`
SET `OrderTotal` = 1830.00
WHERE `OrderID`= 1008;

UPDATE `Orders`
SET `OrderTotal` = 588.00
WHERE `OrderID`= 1009;

UPDATE `Orders`
SET `OrderTotal` = 294.00
WHERE `OrderID`= 1010;

UPDATE `Orders`
SET `OrderTotal` = 2281.94
WHERE `OrderID`= 1011;

UPDATE `Orders`
SET `OrderTotal` = 1190.00
WHERE `OrderID`= 1012;

UPDATE `Orders`
SET `OrderTotal` = 1481.94
WHERE `OrderID`= 1013;

UPDATE `Orders`
SET `OrderTotal` = 665.00
WHERE `OrderID`= 1014;

UPDATE `Orders`
SET `OrderTotal` = 2033.91
WHERE `OrderID`= 1015;

UPDATE `Orders`
SET `OrderTotal` = 630.00
WHERE `OrderID`= 1016;

UPDATE `Orders`
SET `OrderTotal` = 1089.00
WHERE `OrderID`= 1017;

UPDATE `Orders`
SET `OrderTotal` = 544.00
WHERE `OrderID`= 1018;

UPDATE `Orders`
SET `OrderTotal` = 948.00
WHERE `OrderID`= 1019;

UPDATE `Orders`
SET `OrderTotal` = 473.97
WHERE `OrderID`= 1020;

UPDATE `Application_Visits`
SET `CustomerID` = 101 , `appopendate` = '2020-07-04 17:45',  `appclosedate` = '2020-07-04 19:01'
WHERE `visitID`= 123;

UPDATE `Application_Visits`
SET `CustomerID` = 102 , `appopendate` = '2020-07-05 13:12',  `appclosedate` = '2020-07-05 14:39'
WHERE `visitID`= 124;

UPDATE `Application_Visits`
SET `CustomerID` = 105 , `appopendate` = '2020-07-06 16:23',  `appclosedate` = '2020-07-06 17:10'
WHERE `visitID`= 125;

UPDATE `Application_Visits`
SET `CustomerID` = 106 , `appopendate` = '2020-07-06 22:23',  `appclosedate` = '2020-07-06 23:11'
WHERE `visitID`= 126;

UPDATE `Application_Visits`
SET `CustomerID` = 101 , `appopendate` = '2020-07-06 18:45',  `appclosedate` = '2020-07-06 19:01'
WHERE `visitID`= 127;

UPDATE `Application_Visits`
SET `CustomerID` = 102 , `appopendate` = '2020-07-07 13:01',  `appclosedate` = '2020-07-07 13:39'
WHERE `visitID`= 128;

UPDATE `Application_Visits`
SET `CustomerID` = 107 , `appopendate` = '2020-07-09 12:23',  `appclosedate` = '2020-07-09 13:55'
WHERE `visitID`= 132;

UPDATE `Application_Visits`
SET `CustomerID` = 107 , `appopendate` = '2020-07-10 12:11',  `appclosedate` = '2020-07-10 12:21'
WHERE `visitID`= 138;

UPDATE `Application_Visits`
SET `CustomerID` = 108 , `appopendate` = '2020-07-12 20:01',  `appclosedate` = '2020-07-12 20:25'
WHERE `visitID`= 141;

UPDATE `Application_Visits`
SET `CustomerID` = 109 , `appopendate` = '2020-07-12 19:12',  `appclosedate` = '2020-07-12 19:22'
WHERE `visitID`= 142;

UPDATE `Application_Visits`
SET `CustomerID` = 110 , `appopendate` = '2020-07-13 14:20',  `appclosedate` = '2020-07-13 14:31'
WHERE `visitID`= 145;

UPDATE `Application_Visits`
SET `CustomerID` = 110 , `appopendate` = '2020-07-14 13:07',  `appclosedate` = '2020-07-14 15:12'
WHERE `visitID`= 147;

UPDATE `Application_Visits`
SET `CustomerID` = 110 , `appopendate` = '2020-07-14 18:52',  `appclosedate` = '2020-07-14 19:01'
WHERE `visitID`= 148;

UPDATE `Application_Visits`
SET `CustomerID` = 101 , `appopendate` = '2020-07-14 15:09',  `appclosedate` = '2020-07-14 15:28'
WHERE `visitID`= 150;

UPDATE `Application_Visits`
SET `CustomerID` = 107 , `appopendate` = '2020-07-15 12:08',  `appclosedate` = '2020-07-15 12:44'
WHERE `visitID`= 151;

UPDATE `Application_Visits`
SET `CustomerID` = 108 , `appopendate` = '2020-07-17 19:04',  `appclosedate` = '2020-07-17 20:12'
WHERE `visitID`= 152;

UPDATE `Application_Visits`
SET `CustomerID` = 102 , `appopendate` = '2020-07-17 18:45',  `appclosedate` = '2020-07-17 19:01'
WHERE `visitID`= 162;

UPDATE `Application_Visits`
SET `CustomerID` = 108 , `appopendate` = '2020-07-18 15:13',  `appclosedate` = '2020-07-18 15:56'
WHERE `visitID`= 167;

UPDATE `Application_Visits`
SET `CustomerID` = 101 , `appopendate` = '2020-07-19 20:23',  `appclosedate` = '2020-07-19 20:52'
WHERE `visitID`= 168;

UPDATE `Application_Visits`
SET `CustomerID` = 109 , `appopendate` = '2020-07-20 15:52',  `appclosedate` = '2020-07-20 16:31'
WHERE `visitID`= 170;

UPDATE `Application_Visits`
SET `CustomerID` = 110 , `appopendate` = '2020-07-08 18:22',  `appclosedate` = '2020-07-08 20:01'
WHERE `visitID`= 129;

UPDATE `Application_Visits`
SET `CustomerID` = 102 , `appopendate` = '2020-07-08 11:01',  `appclosedate` = '2020-07-08 11:04'
WHERE `visitID`= 130;

UPDATE `Application_Visits`
SET `CustomerID` = 101 , `appopendate` = '2020-07-08 19:55',  `appclosedate` = '2020-07-08 20:01'
WHERE `visitID`= 131;

UPDATE `Application_Visits`
SET `CustomerID` = 104 , `appopendate` = '2020-07-10 04:10',  `appclosedate` = '2020-07-10 04:55'
WHERE `visitID`= 133;

UPDATE `Application_Visits`
SET `CustomerID` = 108 ,`appopendate` = '2020-07-10 07:22',  `appclosedate` = '2020-07-10 07:31'
WHERE `visitID`= 134;

UPDATE `Application_Visits`
SET `CustomerID` = 107 , `appopendate` = '2020-07-10 09:23',  `appclosedate` = '2020-07-10 10:00'
WHERE `visitID`= 135;

UPDATE `Application_Visits`
SET `CustomerID` = 109 , `appopendate` = '2020-07-10 11:44',  `appclosedate` = '2020-07-10 12:01'
WHERE `visitID`= 136;

UPDATE `Application_Visits`
SET `CustomerID` = 106 , `appopendate` = '2020-07-10 11:45',  `appclosedate` = '2020-07-10 11:52'
WHERE `visitID`= 137;

UPDATE `Application_Visits`
SET `CustomerID` = 101 , `appopendate` = '2020-07-11 07:45',  `appclosedate` = '2020-07-11 07:52'
WHERE `visitID`= 139;

UPDATE `Application_Visits`
SET `CustomerID` = 101 , `appopendate` = '2020-07-11 09:33',  `appclosedate` = '2020-07-11 10:01'
WHERE `visitID`= 140;

UPDATE `Application_Visits`
SET `CustomerID` = 103 , `appopendate` = '2020-07-13 10:22',  `appclosedate` = '2020-07-13 10:25'
WHERE `visitID`= 143;

UPDATE `Application_Visits`
SET `CustomerID` = 109 , `appopendate` = '2020-07-13 11:01',  `appclosedate` = '2020-07-13 11:19'
WHERE `visitID`= 144;

UPDATE `Application_Visits`
SET `CustomerID` = 110 , `appopendate` = '2020-07-14 05:42',  `appclosedate` = '2020-07-14 05:49'
WHERE `visitID`= 146;

UPDATE `Application_Visits`
SET `CustomerID` = 102 , `appopendate` = '2020-07-14 11:12',  `appclosedate` = '2020-07-14 13:39'
WHERE `visitID`= 149;

UPDATE `Application_Visits`
SET `CustomerID` = 103 , `appopendate` = '2020-07-17 01:08',  `appclosedate` = '2020-07-17 01:10'
WHERE `visitID`= 153;

UPDATE `Application_Visits`
SET `CustomerID` = 104 , `appopendate` = '2020-07-17 04:14',  `appclosedate` = '2020-07-17 04:23'
WHERE `visitID`= 154;

UPDATE `Application_Visits`
SET `CustomerID` = 102 , `appopendate` = '2020-07-17 05:55',  `appclosedate` = '2020-07-17 06:02'
WHERE `visitID`= 155;

UPDATE `Application_Visits`
SET `CustomerID` = 103 , `appopendate` = '2020-07-17 06:27',  `appclosedate` = '2020-07-17 06:53'
WHERE `visitID`= 156;

UPDATE `Application_Visits`
SET `CustomerID` = 104 , `appopendate` = '2020-07-17 09:42',  `appclosedate` = '2020-07-17 10:00'
WHERE `visitID`= 157;

UPDATE `Application_Visits`
SET `CustomerID` = 101 , `appopendate` = '2020-07-17 11:22',  `appclosedate` = '2020-07-17 11:23'
WHERE `visitID`= 158;

UPDATE `Application_Visits`
SET `CustomerID` = 102 , `appopendate` = '2020-07-17 11:24',  `appclosedate` = '2020-07-17 11:30'
WHERE `visitID`= 159;

UPDATE `Application_Visits`
SET `CustomerID` = 103 , `appopendate` = '2020-07-17 11:24',  `appclosedate` = '2020-07-17 11:52'
WHERE `visitID`= 160;

UPDATE `Application_Visits`
SET `CustomerID` = 104 , `appopendate` = '2020-07-17 12:21',  `appclosedate` = '2020-07-17 12:30'
WHERE `visitID`= 161;

UPDATE `Application_Visits`
SET `CustomerID` = 104 , `appopendate` = '2020-07-18 02:19',  `appclosedate` = '2020-07-18 02:22'
WHERE `visitID`= 163;

UPDATE `Application_Visits`
SET `CustomerID` = 102 , `appopendate` = '2020-07-18 09:21',  `appclosedate` = '2020-07-18 09:24'
WHERE `visitID`= 164;

UPDATE `Application_Visits`
SET `CustomerID` = 103 , `appopendate` = '2020-07-18 10:32',  `appclosedate` = '2020-07-18 10:34'
WHERE `visitID`= 165;

UPDATE `Application_Visits`
SET `CustomerID` = 104 , `appopendate` = '2020-07-18 10:38',  `appclosedate` = '2020-07-18 11:03'
WHERE `visitID`= 166;

UPDATE `Application_Visits`
SET `CustomerID` = 101 , `appopendate` = '2020-07-19 11:56',  `appclosedate` = '2020-07-19 12:03'
WHERE `visitID`= 169;

UPDATE `Application_Visits`
SET `CustomerID` = 102 , `appopendate` = '2020-07-22 17:57',  `appclosedate` = '2020-07-22 18:39'
WHERE `visitID`= 171;

UPDATE `Application_Visits`
SET `CustomerID` = 103 , `appopendate` = '2020-07-22 19:44',  `appclosedate` = '2020-07-22 20:06'
WHERE `visitID`= 172;


UPDATE  `Vendors`
SET `VendorName` = 'Spacenation', `VendorAddress` ='688 Brandywine Drive' ,  `City` = 'Attleboro' , `Zip` = 02703  , `State` = 'MA'
WHERE `VendorID`= 10;

UPDATE  `Vendors`
SET `VendorName` = 'Weasleyequipments', `VendorAddress` ='5 NE. Iroquois Lane' , `City` = 'Longview',  `Zip` = 73131, `State` = 'TX'
WHERE `VendorID`= 11;

UPDATE  `Vendors`
SET `VendorName` = 'darkweb', `VendorAddress` ='912 Thomas Ave.' , `City` = 'Hialeah' , `Zip` = 33010, `State` = 'FL'
WHERE `VendorID`= 12;

UPDATE  `Vendors`
SET `VendorName` = 'coldwar mania', `VendorAddress` ='707 Lafayette Street' ,  `City` = 'Twin Falls' , `Zip` = 83301, `State` = 'ID'
WHERE `VendorID`= 13;

UPDATE  `Vendors`
SET `VendorName` = 'Cloverfeld', `VendorAddress` ='9323 E. 42nd Street' ,  `City` = 'Marble' , `Zip` = 02705  , `State` = 'MA'
WHERE `VendorID`= 14;

UPDATE  `Vendors`
SET `VendorName` = 'Dragon Bane', `VendorAddress` ='42 Wallaby Way' ,  `City` = 'Sydney' , `Zip` = 02708  , `State` = 'MA'
WHERE `VendorID`= 15;

UPDATE  `Vendors`
SET `VendorName` = 'spiderweb', `VendorAddress` ='522 Greensboro Road' ,  `City` = 'Marble' , `Zip` = 02705  , `State` = 'MA'
WHERE `VendorID`= 16;

UPDATE  `Vendors`
SET `VendorName` = 'Group 4 Incorporated', `VendorAddress` ='3000 Dallas Avenue' , `City` = 'Waverly' , `Zip` = 33022, `State` = 'FL'
WHERE `VendorID`= 17;

UPDATE  `Vendors`
SET `VendorName` = 'mirrorkey',  `VendorAddress` ='1414 Gallagher Lane' , `City` = 'Green Oak' , `Zip` = 09032, `State` = 'NY'
WHERE `VendorID`= 18;

UPDATE  `Vendors`
SET `VendorName` = 'DarkMatter',  `VendorAddress` ='90 N. Second Street' , `City` = 'Austin' , `Zip` = 79102, `State` = 'TX'
WHERE `VendorID`= 19;

UPDATE  `Vendors`
SET `VendorName` = 'Screen Green', `VendorAddress` ='102 Highland Creek Drive' , `City` = 'Murphy' , `Zip` = 72830, `State` = 'TX'
WHERE `VendorID`= 20;

UPDATE  `Vendors`
SET `VendorName` = 'Quantum Pulls', `VendorAddress` ='40210 Valley Lane' ,  `City` = 'Twin Falls' , `Zip` = 83301, `State` = 'ID'
WHERE `VendorID`= 21;

insert into `Vendor_Price` values (10,2001,52),(10,2002,23),(10,2003,29),(11,2001,45),(12,2002,37),(13,2004,55),(14,2005,58),(15,2006,23),(16,2007,29),(17,2008,69),(18,2009,44),(19,2010,48),(19,2011,52),(20,2012,42),(20,2013,30),(14,2014,39),(21,2015,55),(13,2015,52),(13,2009,34),(12,2009,40);


UPDATE  `Departments`
SET `DepartmentName` = 'Analytics',`DepartmentemailID` = 'analytics@ecomm.org' 
WHERE `DepartmentID`= 345;

UPDATE  `Departments`
SET `DepartmentName` = 'Operations',`DepartmentemailID` = 'Operations@ecomm.org' 
WHERE `DepartmentID`= 347;

UPDATE  `Departments`
SET `DepartmentName` = 'SupplyChain',`DepartmentemailID` = 'SupplyChain@ecomm.org' 
WHERE `DepartmentID`= 346;

UPDATE  `Departments`
SET `DepartmentName` = 'Maketing',`DepartmentemailID` = 'Marketing@ecomm.org' 
WHERE `DepartmentID`= 348;


UPDATE  `Employees`
SET `EmployeeFirstName` = 'Lionel',`EmployeeLastName` = 'Messi', `DepartmentID` = 345, `ManagerID` = null
WHERE `EmployeeID`= 9001;

UPDATE  `Employees`
SET `EmployeeFirstName` = 'Franck',`EmployeeLastName` = 'Ribery', `ManagerID` = 9001 , `DepartmentID` = 345
WHERE `EmployeeID`= 9002;

UPDATE  `Employees`
SET `EmployeeFirstName` = 'Cristiano',`EmployeeLastName` = 'Ronaldo',`DepartmentID` = 345 , `ManagerID` = 9001
WHERE `EmployeeID`= 9003;

UPDATE  `Employees`
SET `EmployeeFirstName` = 'Andres',`EmployeeLastName` = 'Iniesta',`DepartmentID` = 347 , `ManagerID` = 9005
WHERE `EmployeeID`= 9004;

UPDATE  `Employees`
SET `EmployeeFirstName` = 'Martin',`EmployeeLastName` = 'Gould',`DepartmentID` = 347 , `ManagerID` = 9007
WHERE `EmployeeID`= 9005;

UPDATE  `Employees`
SET `EmployeeFirstName` = 'Misty',`EmployeeLastName` = 'Bell',`DepartmentID` = 347 , `ManagerID` = null
WHERE `EmployeeID`= 9007;


UPDATE  `Employees`
SET `EmployeeFirstName` = 'Ben',`EmployeeLastName` = 'Higgins',`DepartmentID` = 348 , `ManagerID` = 9008
WHERE `EmployeeID`= 9006;


UPDATE  `Employees`
SET `EmployeeFirstName` = 'Clarence',`EmployeeLastName` = 'Brown',`DepartmentID` = 348 , `ManagerID` = null
WHERE `EmployeeID`= 9008;


update `loyalty_rewards`
set `loyaltyrewardcriteria` = 'Total customer purchase amount is between $250.00 and $499.99' , `loyaltyrewarddesc` = 'BRONZE'
where `loyaltyrewardID` = 0011;

update `loyalty_rewards`
set `loyaltyrewardcriteria` = 'Total customer purchase amount is between $500.00 and $999.99' , `loyaltyrewarddesc` = 'SILVER'
where `loyaltyrewardID` = 0012;

update `loyalty_rewards`
set `loyaltyrewardcriteria` = 'Total customer purchase amount is >= to $1000.00' , `loyaltyrewarddesc` = 'GOLD'
where `loyaltyrewardID` = 0013;


UPDATE `Customers`
SET `CustFirstName` = 'Darth' ,`CustLastName` = 'Vader', `dob` ='1391-01-01' ,`EmailID`='evildad666@gmail.com' ,`loyaltyrewardID` = null, `TotalCustOrders` = null
WHERE `CustomerID`= 101;

UPDATE `Customers`
SET `CustFirstName` = 'Voldemort' ,`CustLastName` = 'Riddle', `dob` ='1926-12-31' ,`EmailID`='riddle@gmail.com' ,`loyaltyrewardID` = null , `TotalCustOrders` = null
WHERE `CustomerID`= 102;

UPDATE `Customers`
SET `CustFirstName` = 'Hannibal' ,`CustLastName` = 'Lecter', `dob` ='1933-05-07' , `EmailID`='flesheater@gmail.com' ,`loyaltyrewardID` = null , `TotalCustOrders` = null
WHERE `CustomerID`= 103;

UPDATE `Customers`
SET `CustFirstName` = 'harley',`CustLastName` = 'Quinn', `dob` ='1990-07-20' , `EmailID`='bathater371@gmail.com' ,`loyaltyrewardID` = null , `TotalCustOrders` = null
WHERE `CustomerID`= 104;

UPDATE `Customers`
SET `CustFirstName` = 'Dock' ,`CustLastName` = 'Ock', `dob` ='1971-10-22' ,`EmailID`='tobeymaguirebestspidey@gmail.com' ,`loyaltyrewardID` = null, `TotalCustOrders` = null
WHERE `CustomerID`= 105;

UPDATE `Customers`
SET `CustFirstName` = 'James' ,`CustLastName` = 'Hetfield', `dob` ='1982-10-22' ,`EmailID`='metallicabest@gmail.com' ,`loyaltyrewardID` = null , `TotalCustOrders` = null
WHERE `CustomerID`= 106;

UPDATE `Customers`
SET `CustFirstName` = 'Lex' ,`CustLastName` = 'Luthor', `dob` ='1992-11-22' , `EmailID`='lexdcvillian@gmail.com',`loyaltyrewardID` = null , `TotalCustOrders` = null
WHERE `CustomerID`= 107;

UPDATE `Customers`
SET `CustFirstName` = 'Louis',`CustLastName` = 'Lane', `dob` ='1971-10-22' , `EmailID`='Loiuslane@gmail.com' ,`loyaltyrewardID` = null , `TotalCustOrders` = null
WHERE `CustomerID`= 108;

UPDATE `Customers`
SET `CustFirstName` = 'Diana' ,`CustLastName` = 'Prince', `dob` ='1991-10-22' ,`EmailID`='Dianaimmortal@gmail.com' ,`loyaltyrewardID` = null, `TotalCustOrders` = null
WHERE `CustomerID`= 109;

UPDATE `Customers`
SET `CustFirstName` = 'Albus' ,`CustLastName` = 'Dumbledore', `dob` ='1962-08-16' ,`EmailID`='albusthewise@gmail.com',`loyaltyrewardID` = null , `TotalCustOrders` = null
WHERE `CustomerID`= 110;

UPDATE `Customers`
SET `CustFirstName` = 'Itachi',`CustLastName` = 'Uchiha', `dob` ='1992-08-16', `EmailID`='itachigenius@gmail.com' ,`loyaltyrewardID` = null , `TotalCustOrders` = null
WHERE `CustomerID`= 111;




insert into `Customers_Address` values (101,'549 Airport Dr.','Amsterdam',12010,'NY','2019-07-04','9999-12-31'); 
insert into `Customers_Address` values (102,'56 Morris Street','Elyria',44035,'OH','2018-04-02','9999-12-31'); 
insert into `Customers_Address` values (103,'7861 Valley View St.','San Diego',92111,'CA','2014-12-02','9999-12-31'); 
insert into `Customers_Address` values (104,'547 Airport Dr.','Amsterdam',12010,'NY','2017-10-22','2019-10-22'); 
insert into `Customers_Address` values (104,'5000 Airport Dr.','Amsterdam',12010,'NY','2019-10-22','9999-12-31'); 
insert into `Customers_Address` values (105,'281 Winchester Dr.','Irvington',07111,'NJ','2016-11-14','9999-12-31'); 
insert into `Customers_Address` values (106,'262 John St.','Plattsburgh',12901,'NY','2014-11-13','9999-12-31'); 
insert into `Customers_Address` values (107,'1900 Airport Dr.','Amsterdam',12010,'NY','2015-11-12','9999-12-31'); 
insert into `Customers_Address` values (108,'622 Theatre St.','Lowell',1244,'MA','2019-10-22','9999-12-31'); 
insert into `Customers_Address` values (109,'9305 Fawn Court','Wadsworth',44281,'OH','2013-07-22','2018-02-11'); 
insert into `Customers_Address` values (109,'662 Vernon Street','Wadsworth',44281,'OH','2018-02-12','9999-12-31'); 
insert into `Customers_Address` values (110,'647 Rockville Rd.','Maplewood',07040,'NJ','2013-10-22','9999-12-31'); 
insert into `Customers_Address` values (111,'1902 Airport Dr.','Spring Hill',12010,'NY','2011-11-03','9999-12-31'); 





UPDATE `Products`
SET `ProductName` = 'Laser Canon',`RetailPrice` = 145.00, `Currentvolume` =11 , `Product_order_status` = 'NO ORDER NEEDED'
WHERE `ProductID`= 2001;

UPDATE `Products`
SET `ProductName` = 'Elder Wand', `RetailPrice` = 176.99, `Currentvolume` =16 , `Product_order_status` = 'NO ORDER NEEDED'
WHERE `ProductID`= 2002;

UPDATE `Products`
SET `ProductName` = 'kellogg extra IQ Einsteinbrain', `RetailPrice` = 100.00, `Currentvolume` =9 , `Product_order_status` = 'ORDER'
WHERE `ProductID`= 2003;

UPDATE `Products`
SET `ProductName` = 'Novichok crackers', `RetailPrice` = 120.00, `Currentvolume` =248 , `Product_order_status` = 'NO ORDER NEEDED'
WHERE `ProductID`= 2004;

UPDATE `Products`
SET `ProductName` = 'light saber',`RetailPrice` = 142.99, `Currentvolume` = 50 , `Product_order_status` = 'NO ORDER NEEDED'
WHERE `ProductID`= 2005;

UPDATE `Products`
SET `ProductName` = 'invisble cloak', `RetailPrice` = 122.00, `Currentvolume` =16 , `Product_order_status` = 'NO ORDER NEEDED'
WHERE `ProductID`= 2006;

UPDATE `Products`
SET `ProductName` = 'vibranium', `RetailPrice` = 294.00, `Currentvolume` =4 , `Product_order_status` = 'ORDER'
WHERE `ProductID`= 2007;
UPDATE `Products`
SET `ProductName` = 'Pixel 6', `RetailPrice` = 70.00, `Currentvolume` =22 , `Product_order_status` = 'NO ORDER NEEDED'
WHERE `ProductID`= 2008;
UPDATE `Products`
SET `ProductName` = 'bracelet', `RetailPrice` = 99.99, `Currentvolume` =42 , `Product_order_status` = 'NO ORDER NEEDED'
WHERE `ProductID`= 2009;
UPDATE `Products`
SET `ProductName` = 'symbiote', `RetailPrice` = 63.00, `Currentvolume` =72 , `Product_order_status` = 'NO ORDER NEEDED'
WHERE `ProductID`= 2010;
UPDATE `Products`
SET `ProductName` = 'Amplifier', `RetailPrice` = 99.00, `Currentvolume` =2 , `Product_order_status` = 'ORDER'
WHERE `ProductID`= 2011;
UPDATE `Products`
SET `ProductName` = 'LED lights', `RetailPrice` = 68.00, `Currentvolume` =8 , `Product_order_status` = 'ORDER'
WHERE `ProductID`= 2012;
UPDATE `Products`
SET `ProductName` = 'Sorcerers stone', `RetailPrice` = 79.00, `Currentvolume` =55 , `Product_order_status` = 'NO ORDER NEEDED'
WHERE `ProductID`= 2013;
UPDATE `Products`
SET `ProductName` = 'RTX 3080', `RetailPrice` = 157.99, `Currentvolume` =11 , `Product_order_status` = 'NO ORDER NEEDED'
WHERE `ProductID`= 2014;
UPDATE `Products`
SET `ProductName` = 'Playstation 5', `RetailPrice` = 500.00, `Currentvolume` =19 , `Product_order_status` = 'NO ORDER NEEDED'
WHERE `ProductID`= 2015;

DELIMITER //  
CREATE PROCEDURE Manager_Name   
(employee_id_param INT)  
BEGIN  
select CONCAT(M.employeefirstname,' ',M.employeelastname) as "Manager Name", m.employeeid as "Manager ID" 
from Employees m  
RIGHT OUTER JOIN Employees e  
ON e.managerid = m.employeeid  
WHERE e.employeeID = employee_id_param;  
END// 

CREATE PROCEDURE order_address () 
BEGIN 
    SELECT OrderID, CustFirstName, CustLastName, concat(streetaddress,', ',city,', ',state,' ',zip) as 'Order Address' 
    from customers_address c 
    inner join orders o 
    on o.customerid = c.customerid 
    inner join customers t 
    on t.customerid = o.customerid 
    where fromdate <= orderdate  
    and todate >= orderdate 
    order by custlastname; 
END // 

DELIMITER // 
CREATE PROCEDURE `topten_price`()  
BEGIN  
select p.productname,quantity,p.retailprice from orderdetails as od,products as p inner join products  
where p.productid = od.productid group by retailprice  
order by retailprice desc limit 10 ; 
END // 

DELIMITER //  
CREATE PROCEDURE `product_update`( 
  in p_id bigint,in p_price decimal(9,2)) 
BEGIN 
             UPDATE products SET retailprice = p_price  WHERE productid = p_id; 
END // 

DELIMITER $$ 
CREATE TRIGGER total_customer_orders 
AFTER INSERT ON orders 
FOR EACH ROW 
BEGIN 
    UPDATE customers c 
    SET c.totalcustorders = (select sum(o.ordertotal) 
    FROM orders o 
    WHERE c.customerid = o.customerid); 
END$$ 
DELIMITER ; 

CREATE TRIGGER LOYALTY_STATUS_UPDATE 
AFTER INSERT on ORDERS 
FOR EACH ROW 
UPDATE CUSTOMERS 
SET LOYALTYREWARDID = 
(SELECT 
    CASE 
        WHEN TOTALCUSTORDERS BETWEEN 250.00 AND 499.99 THEN '11' 
        WHEN TOTALCUSTORDERS BETWEEN 500.00 AND 999.99 THEN '12' 
        WHEN TOTALCUSTORDERS >= 1000 THEN '13' 
        ELSE null END); 

insert into `Orders` values (1021,103,172,'2020-07-22','1089.00');

CREATE TRIGGER ARCHIVE_VENDOR_PRICE 
BEFORE DELETE ON Vendor_Price 
FOR EACH ROW 
INSERT INTO Vendor_Price_Archive 
Set ProductID = Old.ProductID, 
VendorID = Old.VendorID, 
VendorPrice = Old.VendorPrice, 
SaleStopDate = now(); 

CREATE TRIGGER ARCHIVE_VENDOR_PRICECHANGE 
BEFORE UPDATE ON Vendor_Price 
FOR EACH ROW 
INSERT INTO Vendor_Price_Archive 
Set ProductID = Old.ProductID, 
VendorID = Old.VendorID, 
VendorPrice = Old.VendorPrice, 
SaleStopDate = now(); 

CREATE TRIGGER LOW_STOCK
AFTER UPDATE ON PRODUCTS
FOR EACH ROW
UPDATE PRODUCTS
SET PRODUCT_ORDER_STATUS =
     CASE
        WHEN CURRENTVOLUME < 15 THEN 'ORDER'
        WHEN CURRENTVOLUME BETWEEN 16 AND 30 THEN 'REVIEW'
        ELSE 'NO ORDER NEEDED' END;

CREATE VIEW Current_Vendor_Margins AS  
SELECT V.VendorName, V.VendorID, P.ProductName, P.ProductID, (P.RetailPrice - R.VendorPrice) AS 'GrossProfit', Round((((P.RetailPrice - R.VendorPrice)/P.RetailPrice)*100),2) AS 'GrossProfitMargin' 
FROM Vendors V  
INNER JOIN Vendor_Price R ON V.VendorID = R.VendorID  
INNER JOIN Products P ON P.ProductID = R.ProductID  
ORDER BY PRODUCTNAME ASC, 'GrossProfit' DESC; 

CREATE VIEW Products_Sold_Trending AS 
SELECT D.ProductID, P.ProductName, D.Quantity, Month(O.OrderDate) as "Order Month", Year(O.OrderDate) as "Order Year" 
FROM Products P, Orderdetails D, Orders O 
WHERE D.ProductID = P.ProductID 
AND D.OrderID = O.OrderID 
GROUP BY D.ProductID, P.ProductName, Month(O.OrderDate), Year(O.OrderDate) 
ORDER BY Quantity DESC; 

CREATE VIEW Least_Bought AS  
select p.productname, sum(quantity) as Quantity_Ordered  
from orderdetails as od,products as p inner join products  
where p.productid = od.productid  
group by quantity  
order by quantity limit 5 ; 

DELIMITER // 
CREATE FUNCTION get_customer_ID 
(emailaddress_param VARCHAR(65)) 
RETURNS INT 
DETERMINISTIC 
BEGIN 
DECLARE customer_id_Var INT; 
SELECT customerID INTO customer_id_var FROM Customers 
WHERE emailaddress_param = emailid; 
RETURN(Customer_id_var); 
END// 
DELIMITER ; 

DELIMITER // 
CREATE FUNCTION avgorders 
( 
custid int 
) 
returns decimal 
READS SQL DATA 
not DETERMINISTIC  
begin 
declare avgorders decimal; 
select avg(OrderTotal) into avgorders from orders where CustomerID = custid; 
return avgorders; 
END // 

DELIMITER // 
CREATE FUNCTION viscount 
( 
datevalue date 
) 
returns int 
READS SQL DATA 
DETERMINISTIC  
begin 
declare days int; 
select count(CustomerID)  into days  from application_visits  
where date(appopendate) = datevalue; 
return days; 
END // 

# Standard Reports

SELECT ProductID, ProductName, SUM(Quantity) AS 'QuantityOrdered' 
FROM products 
INNER JOIN OrderDetails USING (ProductID) 
GROUP BY 1 
ORDER BY QuantityOrdered DESC 
LIMIT 10; 

SELECT ProductID, ProductName, RetailPrice 
FROM Products 
ORDER BY RetailPrice ASC 
LIMIT 5; 

SELECT CustomerID, CAST(AVG(BrowsingTime) AS CHAR (4)) AS 'AvgBrowsingTime (mmss)' 
FROM  
(SELECT CustomerID, TIMEDIFF(AppCloseDate,AppOpenDate) AS 'BrowsingTime' FROM Application_Visits) sub 
GROUP BY CustomerID; 

SELECT OrderID, OrderDate, ProductID, ProductName, Quantity, RetailPrice*Quantity AS 'ProductOrderTotal' 
FROM Orders 
INNER JOIN OrderDetails USING(OrderID) 
INNER JOIN Products USING(ProductID) 
WHERE CustomerID = 101 
ORDER BY OrderDate DESC; 

SELECT  
(SELECT COUNT(LoyaltyRewardID) FROM Customers WHERE LoyaltyRewardID = 11) AS 'Bronze', 
(SELECT COUNT(LoyaltyRewardID) FROM Customers WHERE LoyaltyRewardID = 12) AS 'Silver', 
(SELECT COUNT(LoyaltyRewardID) FROM Customers WHERE LoyaltyRewardID = 13) AS 'Gold'; 

SELECT DISTINCT M.ProductID, M.ProductName, M.VendorID, M.VendorName, M.GrossProfit, M.GrossProfitMargin,  
(SELECT SUM(D.Quantity) FROM OrderDetails D INNER JOIN Orders O ON O.OrderID = D.OrderID WHERE D.ProductID = M.ProductID) AS 'ProductQuantitySold'  
FROM Current_Vendor_Margins M   
GROUP BY ProductID  
ORDER BY GrossProfitMargin desc  
LIMIT 5; 

SELECT DISTINCT M.ProductID, M.ProductName, M.VendorID, M.VendorName, M.GrossProfit, M.GrossProfitMargin,  
(SELECT SUM(D.Quantity) FROM OrderDetails D INNER JOIN Orders O ON O.OrderID = D.OrderID WHERE D.ProductID = M.ProductID AND O.OrderDate >= current_date()-30) AS 'ProductQuantitySold'  
FROM Current_Vendor_Margins M   
GROUP BY ProductID  
ORDER BY GrossProfitMargin desc  
LIMIT 5; 

SELECT CustomerID AS 'ID', CustFirstName AS 'First Name', CustLastName AS 'Last Name' 
FROM Customers 
UNION 
SELECT EmployeeID, EmployeeFirstName, EmployeeLastName 
FROM Employees; 

select count(a.CustomerID) as statecount, c.State from  
(application_visits a inner join customers_address c on a.CustomerID = c.CustomerID) 
group by c.State 
order by 
statecount desc; 

select o.OrderTotal as avgbystate, c.State from  
(orders o inner join customers_address c on o.CustomerID = c.CustomerID) 
where OrderTotal > (select avg(OrderTotal) from orders) 
group by State 
order by 
avgbystate desc;

select v.visitID, v.customerID, TIMEDIFF(appclosedate,appopendate) as 'Visit Time', o.orderID, o.ordertotal
from application_visits v
left outer join orders o on v.visitid = o.visitid
order by 'Visit Time' desc;



