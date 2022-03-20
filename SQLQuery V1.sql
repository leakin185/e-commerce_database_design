CREATE DATABASE Shiokee;
USE Shiokee;

-- CREATION
-- Products
CREATE TABLE Products
(
PRIMARY KEY(Pname),
id INT NOT NULL IDENTITY(1,1),
Pname VARCHAR(255),
Maker VARCHAR(255),
Category VARCHAR(255),
);

-- Shops
CREATE TABLE Shops
(
PRIMARY KEY(name),
id INT NOT NULL identity(1,1),
name VARCHAR(255),
);


-- ProductInShops
CREATE TABLE ProductInShops(
    PRIMARY KEY(SPID),
    UNIQUE(Pname, Sname),
	FOREIGN KEY(Pname) REFERENCES Products(Pname)
    ON DELETE CASCADE
    ON UPDATE CASCADE,

    FOREIGN KEY(Sname) REFERENCES Shops(name)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    


    SPID INT NOT NULL IDENTITY (1,1),
    Pname VARCHAR(255) NOT NULL,
    Sname VARCHAR(255) NOT NULL,
    Squantity INT NOT NULL,
	Sprice INT NOT NULL,
);


--PriceHistory
CREATE TABLE PriceHistory(
    PRIMARY KEY (SPID, startDate, endDate),
    UNIQUE (Pname, Sname, startDate, endDate),
    CONSTRAINT fk_PriceHistory_SPID FOREIGN KEY (SPID) REFERENCES ProductInShops(SPID) ON UPDATE NO ACTION,-- I can't declare it as CASCADE policy. What to do on Delete?
	CONSTRAINT fk_PriceHistory_PSname FOREIGN KEY (Pname, Sname) REFERENCES ProductInShops(Pname, Sname) ON UPDATE NO ACTION, -- I can't declare it as CASCADE policy. What to do on Delete?

	id INT NOT NULL IDENTITY(1,1),
    SPID INT NOT NULL, 
    startDate DATE NOT NULL,
    endDate DATE NOT NULL DEFAULT '9999-12-31',
    price REAL NOT NULL,
    Pname VARCHAR(255) NOT NULL,
    Sname VARCHAR(255) NOT NULL,    
    );




--INSERTION

-- Products

INSERT INTO Products VALUES
('Quick Drying Casual Long Pants Men Trousers M-5XL','Conwe.sg','Mens Wear'),
 ('Lapel Loose Turn-Down-Collar Long Sleeve Casual','Zanzea','Womens Apparel'),
('Apple AirPods Pro (w Magsafe Wireless Charging) 2021','apple.flagshipstore','Mobile & Gadgets'),
('Premier 3ply Deluxe Bathroom Tissue 200pc, 10 rolls','shopeesupermarket.sg','Home & Living'),
('LEGO Police Helicopter Chase Playset','LEGO','Toys, Kinds and Babies'),
('Harmuni Vegetable Oil, Rspo, 5L (Halal)','shopeesupermarket.sg','Food & Beverages'),
('Man Polo Shirt Brand Summer Breatheable Cloth','Deyuanxin.sg','Mens Wear'),
('Kodomo Baby Powder Smooth Comfort','shopeesupermarket.sg','Toys, Kinds and Babies'),
('Lango 10000mAh Powerbank','premiumsg','Mobile & Gadgets'),
('Storage Drawer Home Organizer Plastic Container','easyhome.sg','Home & Living'),
('Samsung Galaxy S22 Ultra 2021','samsung.sg','Mobile & Gadgets'),
('Samsung Galaxy A80','samsung.sg','Mobile & Gadgets'),
('Samsung Galaxy Tab S7','samsung.sg','Mobile & Gadgets'),
('Apple iPhone Xs 2022','apple.flagshipstore','Mobile & Gadgets');


-- Shops

INSERT INTO Shops VALUES
('Diageo'),
('Epitex'),
('Tinec'),
('Nintendo'),
('Dibea'),
('Houze'),
('Mega'),
('Taylor'),
('Luca'),
('Sigma');


-- ProductInShops

INSERT INTO ProductInShops VALUES
('LEGO Police Helicopter Chase Playset','Diageo',28, 22),
('Quick Drying Casual Long Pants Men Trousers M-5XL','Diageo',16, 35),
('Apple iPhone Xs 2022','Dibea',43, 792),
('Samsung Galaxy Tab S7','Dibea',84, 1158),
('Samsung Galaxy S22 Ultra 2021','Epitex',7, 840),
('Harmuni Vegetable Oil, Rspo, 5L (Halal)','Epitex',69, 65),
('Samsung Galaxy Tab S7','Houze',29, 646),
('Apple iPhone Xs 2022','Houze',60, 932),
('Apple iPhone Xs 2022','Luca',43, 856),
('Lango 10000mAh Powerbank','Luca',54, 61),
('Apple iPhone Xs 2022','Mega',16, 1028),
('Apple AirPods Pro (w Magsafe Wireless Charging) 2021','Mega',93, 1146),
('Samsung Galaxy Tab S7','Nintendo',29, 1153),
('Kodomo Baby Powder Smooth Comfort','Nintendo',65, 9),
('Apple iPhone Xs 2022','Sigma',38, 760),
('Lango 10000mAh Powerbank','Sigma',77, 73),
('Premier 3ply Deluxe Bathroom Tissue 200pc, 10 rolls','Taylor',50, 52),
('Apple iPhone Xs 2022','Taylor',62, 854),
('Samsung Galaxy S22 Ultra 2021','Tinec',1, 905),
('Samsung Galaxy A80','Tinec',5, 700);


-- PriceHistory
INSERT INTO PriceHistory VALUES
(3,'2021-08-01','2021-08-31', 1000,'Apple iPhone Xs 2022','Dibea'),
(3,'2021-09-01','9999-12-31', 792,'Apple iPhone Xs 2022','Dibea'),
(8,'2021-08-01','2021-08-15', 950,'Apple iPhone Xs 2022','Houze'),
(8,'2021-08-16','2021-08-31', 900,'Apple iPhone Xs 2022','Houze'),
(8,'2021-09-01','9999-12-31', 932,'Apple iPhone Xs 2022','Houze'),
(9,'2021-07-01','2021-08-31', 1100,'Apple iPhone Xs 2022','Luca'),
(9,'2021-09-01','9999-12-31', 600,'Apple iPhone Xs 2022','Luca'),
(11,'2021-12-01','2021-12-31', 800,'Apple iPhone Xs 2022','Mega'),
(11,'2022-01-01','9999-12-31', 1028,'Apple iPhone Xs 2022','Mega'),
(18,'2021-08-01','2021-12-31', 750,'Apple iPhone Xs 2022','Taylor'),
(18,'2022-01-01','9999-12-31', 854,'Apple iPhone Xs 2022','Taylor'),
(15,'2021-05-01','2021-07-01', 990,'Apple iPhone Xs 2022','Sigma'),
(15,'2021-07-02','9999-12-31', 760,'Apple iPhone Xs 2022','Sigma'),
(1,'2021-05-01','9999-12-31', 22,'LEGO Police Helicopter Chase Playset','Diageo'),
(2,'2021-06-01','9999-12-31', 35,'Quick Drying Casual Long Pants Men Trousers M-5XL','Diageo'),
(4,'2021-07-01','9999-12-31', 1158,'Samsung Galaxy Tab S7','Dibea'),
(5,'2021-08-01','9999-12-31', 840,'Samsung Galaxy S22 Ultra 2021','Epitex'),
(6,'2021-09-01','9999-12-31', 65,'Harmuni Vegetable Oil, Rspo, 5L (Halal)','Epitex'),
(7,'2021-10-01','9999-12-31', 646,'Samsung Galaxy Tab S7','Houze'),
(10,'2021-11-01','9999-12-31', 61,'Lango 10000mAh Powerbank','Luca'),
(12,'2021-12-01','9999-12-31', 1146,'Apple AirPods Pro (w Magsafe Wireless Charging) 2021','Mega'),
(13,'2022-01-01','9999-12-31', 1153,'Samsung Galaxy Tab S7','Nintendo'),
(14,'2022-02-01','9999-12-31', 9,'Kodomo Baby Powder Smooth Comfort','Nintendo'),
(16,'2022-03-01','9999-12-31', 73,'Lango 10000mAh Powerbank','Sigma'),
(17,'2022-02-01','9999-12-31', 52,'Premier 3ply Deluxe Bathroom Tissue 200pc, 10 rolls','Taylor'),
(19,'2021-05-01','9999-12-31', 905,'Samsung Galaxy S22 Ultra 2021','Tinec'),
(20,'2021-06-01','9999-12-31', 700,'Samsung Galaxy A80','Tinec');


-- ALTERATIONS
ALTER TABLE Shops ALTER COLUMN name VARCHAR(255) not null;

ALTER TABLE Shops ADD PRIMARY KEY(name);


-- DELETION
DELETE FROM Products;
DELETE FROM Shops;
DELETE FROM ProductInShops;
DELETE FROM PriceHistory;



-- SELECT STATEMENTS

SELECT * FROM Products ORDER BY id;

SELECT * FROM Shops ORDER BY id;

SELECT * FROM ProductInShops ORDER BY SPID;

SELECT * FROM PriceHistory ORDER BY id;

-- QUERY SOLUTIONS

-- 1)
SELECT ph.Pname, AVG(ph.price) AS AveragePrice--ph.startDate, ph.endDate, ph.price
FROM PriceHistory ph
WHERE
-- Product price changed in August 2021
(ph.endDate <= '2021-08-31' AND ph.endDate >= '2021-08-01') OR
-- Product price started before end of Aug 2021 and persists till after Aug 
(ph.endDate > '2021-08-31' AND ph.startDate <= '2021-08-31')
AND ph.Pname = 'Apple iPhone Xs 2022'
GROUP BY ph.Pname

-- 5i)
SELECT p.Pname
FROM Products p
WHERE p.Maker = 'samsung.sg'

-- 5ii)
SELECT p.Pname, COUNT(pis.Sname) AS numShops
FROM ProductInShops pis, Products p 
WHERE
-- Join tables by Pname
pis.Pname = p.Pname AND
p.maker = 'samsung.sg'
GROUP BY p.Pname



-- DROP
DROP TABLE Products;
DROP TABLE Shops;
DROP TABLE ProductInShops;
DROP TABLE PriceHistory;

