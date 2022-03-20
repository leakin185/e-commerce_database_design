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
(20,'2021-06-01', DEFAULT, 700,'Samsung Galaxy A80','Tinec');