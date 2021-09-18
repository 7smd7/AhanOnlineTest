CREATE TABLE `sales` (
  `SalesID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `Customer` varchar(4) NOT NULL,
  `Product` varchar(4) NOT NULL,
  `Date` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `UnitPrice` int(11) NOT NULL
);

CREATE TABLE `profit` (
  `Product` varchar(3) NOT NULL,
  `ProfitRatio` int(11) NOT NULL CHECK (`ProfitRatio` BETWEEN 0 AND 100)
);

INSERT INTO `Sales` (`SalesID`, `OrderID`, `Customer`, `Product`, `Date`, `Quantity`, `UnitPrice`) VALUES (1,1,"C1","P1",1,2,100);
INSERT INTO `Sales` (`SalesID`, `OrderID`, `Customer`, `Product`, `Date`, `Quantity`, `UnitPrice`) VALUES (2,1,"C1","P2",1,4,150);
INSERT INTO `Sales` (`SalesID`, `OrderID`, `Customer`, `Product`, `Date`, `Quantity`, `UnitPrice`) VALUES (3,2,"C2","P2",1,5,150);
INSERT INTO `Sales` (`SalesID`, `OrderID`, `Customer`, `Product`, `Date`, `Quantity`, `UnitPrice`) VALUES (4,3,"C3","P4",1,3,550);
INSERT INTO `Sales` (`SalesID`, `OrderID`, `Customer`, `Product`, `Date`, `Quantity`, `UnitPrice`) VALUES (5,4,"C4","P3",1,1,300);
INSERT INTO `Sales` (`SalesID`, `OrderID`, `Customer`, `Product`, `Date`, `Quantity`, `UnitPrice`) VALUES (6,4,"C4","P6",1,6,150);
INSERT INTO `Sales` (`SalesID`, `OrderID`, `Customer`, `Product`, `Date`, `Quantity`, `UnitPrice`) VALUES (7,4,"C4","P4",1,6,550);
INSERT INTO `Sales` (`SalesID`, `OrderID`, `Customer`, `Product`, `Date`, `Quantity`, `UnitPrice`) VALUES (8,5,"C5","P2",1,3,150);
INSERT INTO `Sales` (`SalesID`, `OrderID`, `Customer`, `Product`, `Date`, `Quantity`, `UnitPrice`) VALUES (9,5,"C5","P1",1,6,100);
INSERT INTO `Sales` (`SalesID`, `OrderID`, `Customer`, `Product`, `Date`, `Quantity`, `UnitPrice`) VALUES (10,6,"C2","P3",2,1,300);
INSERT INTO `Sales` (`SalesID`, `OrderID`, `Customer`, `Product`, `Date`, `Quantity`, `UnitPrice`) VALUES (11,6,"C2","P4",2,3,550);
INSERT INTO `Sales` (`SalesID`, `OrderID`, `Customer`, `Product`, `Date`, `Quantity`, `UnitPrice`) VALUES (12,6,"C2","P5",2,6,400);
INSERT INTO `Sales` (`SalesID`, `OrderID`, `Customer`, `Product`, `Date`, `Quantity`, `UnitPrice`) VALUES (13,6,"C2","P1",2,4,100);
INSERT INTO `Sales` (`SalesID`, `OrderID`, `Customer`, `Product`, `Date`, `Quantity`, `UnitPrice`) VALUES (14,7,"C4","P6",2,3,150);
INSERT INTO `Sales` (`SalesID`, `OrderID`, `Customer`, `Product`, `Date`, `Quantity`, `UnitPrice`) VALUES (15,8,"C6","P3",2,2,300);
INSERT INTO `Sales` (`SalesID`, `OrderID`, `Customer`, `Product`, `Date`, `Quantity`, `UnitPrice`) VALUES (16,8,"C6","P4",2,3,550);
INSERT INTO `Sales` (`SalesID`, `OrderID`, `Customer`, `Product`, `Date`, `Quantity`, `UnitPrice`) VALUES (17,9,"C7","P1",2,5,100);
INSERT INTO `Sales` (`SalesID`, `OrderID`, `Customer`, `Product`, `Date`, `Quantity`, `UnitPrice`) VALUES (18,9,"C7","P2",2,3,150);
INSERT INTO `Sales` (`SalesID`, `OrderID`, `Customer`, `Product`, `Date`, `Quantity`, `UnitPrice`) VALUES (19,9,"C7","P3",2,1,300);
INSERT INTO `Sales` (`SalesID`, `OrderID`, `Customer`, `Product`, `Date`, `Quantity`, `UnitPrice`) VALUES (20,10,"C1","P4",3,6,550);
INSERT INTO `Sales` (`SalesID`, `OrderID`, `Customer`, `Product`, `Date`, `Quantity`, `UnitPrice`) VALUES (21,11,"C2","P5",3,3,400);
INSERT INTO `Sales` (`SalesID`, `OrderID`, `Customer`, `Product`, `Date`, `Quantity`, `UnitPrice`) VALUES (22,12,"C8","P1",3,6,100);
INSERT INTO `Sales` (`SalesID`, `OrderID`, `Customer`, `Product`, `Date`, `Quantity`, `UnitPrice`) VALUES (23,12,"C8","P3",3,3,300);
INSERT INTO `Sales` (`SalesID`, `OrderID`, `Customer`, `Product`, `Date`, `Quantity`, `UnitPrice`) VALUES (24,12,"C8","P5",3,5,400);
INSERT INTO `Sales` (`SalesID`, `OrderID`, `Customer`, `Product`, `Date`, `Quantity`, `UnitPrice`) VALUES (25,13,"C9","P2",3,2,150);

INSERT INTO `profit` (`Product`, `ProfitRatio`) VALUES ('P1', 5), ('P2', 25), ('P3', 10), ('P4', 20), ('P5', 10);


-- 1
SELECT SUM(`Quantity` * `UnitPrice`) AS 'total sales'FROM `sales`;

-- 2
SELECT COUNT(DISTINCT `Customer`) AS 'count customer' FROM `sales`;

-- 3
SELECT `Product`,SUM(`Quantity`) AS 'count',  SUM(`Quantity`)*`UnitPrice` AS 'total price' FROM `sales` GROUP BY `Product`;

-- 4
SELECT `Customer` ,SUM(`Quantity`*`UnitPrice`) AS 'sum price', COUNT(DISTINCT `OrderID`) AS 'count order', COUNT(`Product`) AS 'count product' FROM `sales` WHERE `Customer` IN (SELECT `Customer` FROM `sales`  GROUP BY `OrderID` HAVING SUM(`Quantity`*`UnitPrice`) > 1500) GROUP BY `Customer`;

--5
SELECT SUM(`Quantity`*`UnitPrice`*`ProfitRatio`) AS 'Profit', SUM(`Quantity`*`UnitPrice`*`ProfitRatio`)/SUM(`Quantity`*`UnitPrice`) AS 'PrifitRatio' FROM `sales` NATURAL JOIN `profit`;