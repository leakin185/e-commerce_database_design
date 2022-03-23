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


-- EMPLOYEES
INSERT INTO Employees(ID, name, salary) VALUES
('1','Alicia Summer','14524'),
('2','Allycia Elder','11475'),
('3','Saylor Peck','13186'),
('4','Cherette Sadler','14288'),
('5','Tang Fu Xuan','3297'),
('6','Ronda Foster','4634'),
('7','Tina Hubbard','12286'),
('8','Shena Armistead','1022'),
('9','Kennith Bella Abram','10852'),
('10','Tai Yawen Xie, Christine','3319');

-- Users
INSERT INTO Users(Uname) VALUES
('Mary'),
('Cathy'),
('Caleb'),
('Valerie'),
('Kate'),
('Jake'),
('Gabriel'),
('Andrew'),
('Janelle'),
('Marcus'),
('George'),
('Lea'),
('KS'),
('YZ'),
('Yuzie'),
('Leah'),
('Leanne'),
('Hyun'),
('Andre'),
('Russell'),
('Phileon'),
('Goh'),
('Lew'),
('Jian Fu '),
('Wanru'),
('Wanrui'),
('XinHui'),
('XinRui'),
('XinFu'),
('Youzi'),
('Bluez'),
('Redz'),
('Yozi'),
('Rainbow'),
('Kirk'),
('NTU'),
('NUS'),
('SMU'),
('Jax'),
('Lim'),
('Alex'),
('Alexis'),
('KZ'),
('KF'),
('Pavan'),
('Pava '),
('Phillips'),
('Phil'),
('Debbie'),
('Anne'),
('Annie'),
('Jamie'),
('Jacie'),
('Rena'),
('YiKai'),
('YK'),
('Joel'),
('Choy'),
('JiaXian'),
('Rose'),
('Ong'),
('Stella'),
('MinXuan'),
('Jenny'),
('Jen '),
('Dimitri'),
('JunXiang'),
('ZC'),
('XinHao'),
('zw'),
('Hendro'),
('ZhiWei'),
('Regine'),
('WanYun'),
('Chong Yu'),
('Kai'),
('Chin'),
('Kai Chin'),
('Edmund'),
('Kin Kou'),
('Wang'),
('Wong'),
('Ellen'),
('Karina'),
('Anthony'),
('Jie Hui'),
('JH'),
('Geoffrey'),
('Geoff'),
('Kelvin'),
('Soh'),
('Leon'),
('Leo '),
('Jenny '),
('Tan'),
('Lim'),
('Xin Hao'),
('He '),
('Reg'),
('Ninja'),
('Bot'),
('He'),
('Shi '),
('Min '),
('ShiMin'),
('Sweeney'),
('Dev '),
('Brandon'),
('Donki'),
('Don '),
('Andy '),
('Han Quan'),
('Xiao Qi'),
('Jonathon'),
('John'),
('Johny'),
('Wei'),
('Chao'),
('Kong'),
('Ben');

-- Orders
INSERT INTO Orders(date_time, shipping_address, user_ID) VALUES
('2021-09-12','80 Genting Lane 04-03 Ruby Industrial Complex-genting Block', 1), 
('2021-07-31','BLK 665 BUFFALO ROAD, #02-149', 2), 
('2021-08-23','Skytech 2 Bukit Batok Street 24 #01-09', 3), 
('2021-06-25','19 Defu Lane 10 01-308', 4), 
('2021-07-10','26 Bayshore Road, 06-08', 5), 
('2021-06-22','58, Amoy St', 6), 
('2021-05-27','5068 Ang Mo Kio Industrial Park 2 #01-1415', 7), 
('2021-04-14','Blk 46B Toh Tuck Road ,03-09', 8), 
('2021-08-01','1815 Geylang Bahru 01-02', 9), 
('2021-06-05','1091 Lower Delta Road 01-05', 10), 
('2021-04-03','HDB Bedok 528 Bedok North Street 3 #16-528', 11), 
('2021-04-05','511 Guillemard Road #02-12 Grandlink Square', 12), 
('2021-04-07','Frankel Estate 685A East Coast Road', 13), 
('2021-04-09','20 Havelock Rd #01-06', 14), 
('2021-04-12','17 Hillview Avenue #01-1306', 15), 
('2021-04-14','35 Jalan Pemimpin #06-02 WEDGE MOUNT INDUSTRIAL BUILDING', 16), 
('2021-04-17','BLK 164 BT MERAH CENTRAL', 17), 
('2021-04-19','728, Ang Mo Kio Ave 6, #01-4214', 18), 
('2021-04-24','31 Shipyard Road', 19), 
('2021-05-01','2 Lor 8 Geylang #01-01', 20), 
('2021-05-27','1 Yishun Street 23 06-1', 21), 
('2021-05-31','9 Jurong Town Hall Road #01-29 Ihub', 22), 
('2021-06-11','180 Paya Lebar Road ,10-02 Yiguang Building', 23), 
('2021-06-23','6A Duxton Hill', 24), 
('2021-06-24','81 Genting Lane 04-03 Ruby Industrial Complex-genting Block', 25), 
('2021-07-10','BLK 665 BUFFALO ROAD, #02-150', 26), 
('2021-07-12','Skytech 2 Bukit Batok Street 24 #01-10', 27), 
('2021-07-15','20 Defu Lane 10 01-308', 28), 
('2021-07-26','27 Bayshore Road, 06-08', 29), 
('2021-07-29','58, Amoy St', 30), 
('2021-08-09','5069 Ang Mo Kio Industrial Park 2 #01-1415', 31), 
('2021-08-25','Blk 46B Toh Tuck Road ,03-10', 32), 
('2021-09-02','1816 Geylang Bahru 01-02', 33), 
('2021-09-18','1092 Lower Delta Road 01-05', 34), 
('2021-09-21','181 Paya Lebar Road ,10-02 Yiguang Building', 35), 
('2021-03-31','23 Malacca Street 14-02 Royal Brothers Building', 36), 
('2021-04-02','172 Tras Street 08-173 Union Building', 37), 
('2021-04-05','UOB - Junction 8 Shopping Centre, 9 Bishan Place,', 38), 
('2021-04-08','7 Napier Road #09-15 Gleneagles Medical Centre', 39), 
('2021-04-13','10 Joo Koon Road', 40), 
('2021-04-14','HDB Bedok 528 Bedok North Street 3 #16-529', 41), 
('2021-05-03','512 Guillemard Road #02-12 Grandlink Square', 42), 
('2021-05-05','Frankel Estate 685A East Coast Road', 43), 
('2021-05-09','21 Havelock Rd #01-06', 44), 
('2021-05-11','18 Hillview Avenue #01-1306', 45), 
('2021-06-02','36 Jalan Pemimpin #06-02 WEDGE MOUNT INDUSTRIAL BUILDING', 46), 
('2021-06-05','BLK 164 BT MERAH CENTRAL', 47), 
('2021-06-11','728, Ang Mo Kio Ave 6, #01-4215', 48), 
('2021-06-16','32 Shipyard Road', 49), 
('2021-06-25','3 Lor 8 Geylang #01-01', 50), 
('2021-07-03','2 Yishun Street 23 06-1', 51), 
('2021-07-17','10 Jurong Town Hall Road #01-29 Ihub', 52), 
('2021-07-22','181 Paya Lebar Road ,10-02 Yiguang Building', 53), 
('2021-08-25','6A Duxton Hill', 54), 
('2021-08-29','82 Genting Lane 04-03 Ruby Industrial Complex-genting Block', 55), 
('2021-09-01','BLK 665 BUFFALO ROAD, #02-151', 56), 
('2021-09-03','Skytech 2 Bukit Batok Street 24 #01-11', 57), 
('2021-09-11','21 Defu Lane 10 01-308', 58), 
('2021-09-13','28 Bayshore Road, 06-08', 59), 
('2021-09-20','58, Amoy St', 60), 
('2021-04-04','5070 Ang Mo Kio Industrial Park 2 #01-1415', 61), 
('2021-04-11','Blk 46B Toh Tuck Road ,03-11', 62), 
('2021-04-15','1817 Geylang Bahru 01-02', 63), 
('2021-04-16','1093 Lower Delta Road 01-05', 64), 
('2021-05-07','182 Paya Lebar Road ,10-02 Yiguang Building', 65), 
('2021-05-11','24 Malacca Street 14-02 Royal Brothers Building', 66), 
('2021-05-18','173 Tras Street 08-173 Union Building', 67), 
('2021-05-22','UOB - Junction 8 Shopping Centre, 9 Bishan Place,', 68), 
('2021-05-26','8 Napier Road #09-15 Gleneagles Medical Centre', 69), 
('2021-05-29','11 Joo Koon Road', 70), 
('2021-06-07','HDB Bedok 528 Bedok North Street 3 #16-530', 71), 
('2021-06-11','513 Guillemard Road #02-12 Grandlink Square', 72), 
('2021-06-17','Frankel Estate 685A East Coast Road', 73), 
('2021-06-27','22 Havelock Rd #01-06', 74), 
('2021-06-29','19 Hillview Avenue #01-1306', 75), 
('2021-06-30','37 Jalan Pemimpin #06-02 WEDGE MOUNT INDUSTRIAL BUILDING', 76), 
('2021-07-09','BLK 164 BT MERAH CENTRAL', 77), 
('2021-07-15','728, Ang Mo Kio Ave 6, #01-4216', 78), 
('2021-07-19','33 Shipyard Road', 79), 
('2021-07-25','4 Lor 8 Geylang #01-01', 80), 
('2021-07-28','3 Yishun Street 23 06-1', 81), 
('2021-08-02','11 Jurong Town Hall Road #01-29 Ihub', 82), 
('2021-08-12','182 Paya Lebar Road ,10-02 Yiguang Building', 83), 
('2021-09-04','6A Duxton Hill', 84), 
('2021-09-20','83 Genting Lane 04-03 Ruby Industrial Complex-genting Block', 85), 
('2021-03-27','BLK 665 BUFFALO ROAD, #02-152', 86), 
('2021-04-13','Skytech 2 Bukit Batok Street 24 #01-12', 87), 
('2021-04-30','22 Defu Lane 10 01-308', 88), 
('2021-05-22','29 Bayshore Road, 06-08', 89), 
('2021-05-29','58, Amoy St', 90), 
('2021-06-01','5071 Ang Mo Kio Industrial Park 2 #01-1415', 91), 
('2021-06-16','Blk 46B Toh Tuck Road ,03-12', 92), 
('2021-06-17','1818 Geylang Bahru 01-02', 93), 
('2021-06-18','1094 Lower Delta Road 01-05', 94), 
('2021-06-19','183 Paya Lebar Road ,10-02 Yiguang Building', 95), 
('2021-06-27','25 Malacca Street 14-02 Royal Brothers Building', 96), 
('2021-07-01','174 Tras Street 08-173 Union Building', 97), 
('2021-07-15','UOB - Junction 8 Shopping Centre, 9 Bishan Place,', 98), 
('2021-07-17','9 Napier Road #09-15 Gleneagles Medical Centre', 99), 
('2021-07-29','12 Joo Koon Road', 100), 
('2021-08-02','HDB Bedok 528 Bedok North Street 3 #16-531', 101), 
('2021-08-03','514 Guillemard Road #02-12 Grandlink Square', 102), 
('2021-08-06','Frankel Estate 685A East Coast Road', 103), 
('2021-08-08','23 Havelock Rd #01-06', 104), 
('2021-08-10','20 Hillview Avenue #01-1306', 105), 
('2021-08-14','38 Jalan Pemimpin #06-02 WEDGE MOUNT INDUSTRIAL BUILDING', 106), 
('2021-08-17','BLK 164 BT MERAH CENTRAL', 107), 
('2021-09-09','728, Ang Mo Kio Ave 6, #01-4217', 108), 
('2021-09-11','34 Shipyard Road', 109), 
('2021-09-14','5 Lor 8 Geylang #01-01', 110), 
('2021-07-25','4 Yishun Street 23 06-1', 111), 
('2021-08-08','12 Jurong Town Hall Road #01-29 Ihub', 112), 
('2021-08-09','183 Paya Lebar Road ,10-02 Yiguang Building', 113), 
('2021-07-25','6A Duxton Hill', 114);

-- ProductInOrders
INSERT INTO ProductInOrders(OPID, Oprice, Oquantity, orderStatus, deliverDate, orderID, SPID) VALUES
    (91, 176.00, 8, 'delivered', '2021-08-08', 9, 1),
    (161, 22.00, 1, 'delivered', '2021-08-23', 16, 1),
    (1131, 198.00, 9, 'delivered', '2021-08-25', 113, 1),
    (751, 88.00, 4, 'delivered', '2021-08-28', 75, 1),
    (991, 88.00, 4, 'delivered', '2021-08-06', 99, 1),
    (72, 175.00, 5, 'delivered', '2021-06-03', 7, 2),
    (1122, 210.00, 6, 'delivered', '2021-08-30', 112, 2),
    (23, 7128.00, 9, 'delivered', '2021-08-07', 2, 3),
    (1103, 5544.00, 7, 'delivered', '2021-08-07', 110, 3),
    (94, 1158.00, 1, 'delivered', '2021-08-08', 9, 4),
    (74, 3474.00, 3, 'delivered', '2021-06-03', 7, 4),
    (214, 4632.00, 4, 'delivered', '2021-08-02', 21, 4),
    (55, 840.00, 1, 'delivered', '2021-07-17', 5, 5),
    (85, 5040.00, 6, 'delivered', '2021-04-21', 8, 5),
    (105, 1680.00, 2, 'delivered', '2021-06-12', 10, 5),
    (515, 7560.00, 9, 'delivered', '2021-08-31', 51, 5),
    (125, 2520.00, 3, 'delivered', '2021-08-09', 12, 5),
    (26, 390.00, 6, 'delivered', '2021-08-07', 2, 6),
    (648, 5592.00, 6, 'delivered', '2021-08-21', 64, 8),
    (518, 7456.00, 8, 'delivered', '2021-08-26', 51, 8),
    (1028, 7456.00, 8, 'delivered', '2021-08-08', 102, 8),
    (10310, 610.00, 10, 'delivered', '2021-08-29', 103, 10),
    (3110, 61.00, 1, 'delivered', '2021-08-04', 31, 10),
    (8811, 8224.00, 8, 'delivered', '2021-08-22', 88, 11),
    (112, 2292.00, 2, 'delivered', '2021-08-19', 1, 12),
    (212, 4584.00, 4, 'delivered', '2021-08-07', 2, 12),
    (312, 3438.00, 3, 'delivered', '2021-08-30', 3, 12),
    (412, 2292.00, 2, 'delivered', '2021-08-02', 4, 12),
    (1112, 1146.00, 1, 'delivered', '2021-04-10', 11, 12),
    (1212, 6876.00, 6, 'delivered', '2021-04-12', 12, 12),
    (1312, 3438.00, 3, 'delivered', '2021-04-14', 13, 12),
    (1412, 1146.00, 1, 'delivered', '2021-04-16', 14, 12),
    (1512, 3438.00, 3, 'delivered', '2021-04-19', 15, 12),
    (1612, 1146.00, 1, 'delivered', '2021-04-21', 16, 12),
    (1712, 5730.00, 5, 'delivered', '2021-04-24', 17, 12),
    (1812, 1146.00, 1, 'delivered', '2021-04-26', 18, 12),
    (1912, 8022.00, 7, 'delivered', '2021-05-01', 19, 12),
    (2012, 2292.00, 2, 'delivered', '2021-05-08', 20, 12),
    (2112, 5730.00, 5, 'delivered', '2021-06-03', 21, 12),
    (2212, 8022.00, 7, 'delivered', '2021-06-07', 22, 12),
    (2312, 5730.00, 5, 'delivered', '2021-06-18', 23, 12),
    (2412, 6876.00, 6, 'delivered', '2021-06-30', 24, 12),
    (2512, 1146.00, 1, 'delivered', '2021-07-01', 25, 12),
    (2612, 6876.00, 6, 'delivered', '2021-07-17', 26, 12),
    (2712, 5730.00, 5, 'delivered', '2021-07-19', 27, 12),
    (2812, 4584.00, 4, 'delivered', '2021-07-22', 28, 12),
    (2912, 2292.00, 2, 'delivered', '2021-08-02', 29, 12),
    (3012, 3438.00, 3, 'delivered', '2021-08-05', 30, 12),
    (3112, 4584.00, 4, 'delivered', '2021-08-16', 31, 12),
    (3212, 4584.00, 4, 'delivered', '2021-09-01', 32, 12),
    (3312, 2292.00, 2, 'delivered', '2021-09-09', 33, 12),
    (3412, 1146.00, 1, 'delivered', '2021-09-25', 34, 12),
    (3512, 1146.00, 1, 'delivered', '2021-09-28', 35, 12),
    (3612, 8022.00, 7, 'delivered', '2021-04-07', 36, 12),
    (3712, 6876.00, 6, 'delivered', '2021-04-09', 37, 12),
    (3812, 1146.00, 1, 'delivered', '2021-04-12', 38, 12),
    (3912, 8022.00, 7, 'delivered', '2021-04-15', 39, 12),
    (4012, 8022.00, 7, 'delivered', '2021-04-20', 40, 12),
    (4112, 2292.00, 2, 'delivered', '2021-04-21', 41, 12),
    (4212, 4584.00, 4, 'delivered', '2021-05-10', 42, 12),
    (4312, 8022.00, 7, 'delivered', '2021-05-12', 43, 12),
    (4412, 5730.00, 5, 'delivered', '2021-05-16', 44, 12),
    (4512, 6876.00, 6, 'delivered', '2021-05-18', 45, 12),
    (4612, 4584.00, 4, 'delivered', '2021-06-09', 46, 12),
    (4712, 5730.00, 5, 'delivered', '2021-06-12', 47, 12),
    (4812, 2292.00, 2, 'delivered', '2021-06-18', 48, 12),
    (4912, 4584.00, 4, 'delivered', '2021-06-23', 49, 12),
    (5012, 1146.00, 1, 'delivered', '2021-07-02', 50, 12),
    (5112, 8022.00, 7, 'delivered', '2021-07-10', 51, 12),
    (5212, 5730.00, 5, 'delivered', '2021-07-24', 52, 12),
    (5312, 3438.00, 3, 'delivered', '2021-07-29', 53, 12),
    (5412, 1146.00, 1, 'delivered', '2021-09-01', 54, 12),
    (5512, 3438.00, 3, 'delivered', '2021-09-05', 55, 12),
    (5612, 3438.00, 3, 'delivered', '2021-09-08', 56, 12),
    (5712, 5730.00, 5, 'delivered', '2021-09-10', 57, 12),
    (5812, 8022.00, 7, 'delivered', '2021-09-18', 58, 12),
    (5912, 6876.00, 6, 'delivered', '2021-09-20', 59, 12),
    (6012, 4584.00, 4, 'delivered', '2021-09-27', 60, 12),
    (6112, 1146.00, 1, 'delivered', '2021-04-11', 61, 12),
    (6212, 2292.00, 2, 'delivered', '2021-04-18', 62, 12),
    (6312, 2292.00, 2, 'delivered', '2021-04-22', 63, 12),
    (6412, 2292.00, 2, 'delivered', '2021-04-23', 64, 12),
    (6512, 1146.00, 1, 'delivered', '2021-05-14', 65, 12),
    (6612, 3438.00, 3, 'delivered', '2021-05-18', 66, 12),
    (6712, 6876.00, 6, 'delivered', '2021-05-25', 67, 12),
    (6812, 4584.00, 4, 'delivered', '2021-05-29', 68, 12),
    (6912, 3438.00, 3, 'delivered', '2021-06-02', 69, 12),
    (7012, 6876.00, 6, 'delivered', '2021-06-05', 70, 12),
    (7112, 3438.00, 3, 'delivered', '2021-06-14', 71, 12),
    (7212, 2292.00, 2, 'delivered', '2021-06-18', 72, 12),
    (7312, 8022.00, 7, 'delivered', '2021-06-24', 73, 12),
    (7412, 5730.00, 5, 'delivered', '2021-07-04', 74, 12),
    (7512, 6876.00, 6, 'delivered', '2021-07-06', 75, 12),
    (7612, 2292.00, 2, 'delivered', '2021-07-07', 76, 12),
    (7712, 3438.00, 3, 'delivered', '2021-07-16', 77, 12),
    (7812, 2292.00, 2, 'delivered', '2021-07-22', 78, 12),
    (7912, 8022.00, 7, 'delivered', '2021-07-26', 79, 12),
    (8012, 8022.00, 7, 'delivered', '2021-08-01', 80, 12),
    (8112, 6876.00, 6, 'delivered', '2021-08-04', 81, 12),
    (8212, 5730.00, 5, 'delivered', '2021-08-09', 82, 12),
    (8312, 2292.00, 2, 'delivered', '2021-08-19', 83, 12),
    (8412, 8022.00, 7, 'delivered', '2021-09-11', 84, 12),
    (8512, 3438.00, 3, 'delivered', '2021-09-27', 85, 12),
    (8612, 4584.00, 4, 'delivered', '2021-04-03', 86, 12),
    (8712, 6876.00, 6, 'delivered', '2021-04-20', 87, 12),
    (8812, 2292.00, 2, 'delivered', '2021-05-07', 88, 12),
    (8912, 3438.00, 3, 'delivered', '2021-05-29', 89, 12),
    (9012, 3438.00, 3, 'delivered', '2021-06-05', 90, 12),
    (9112, 8022.00, 7, 'delivered', '2021-06-08', 91, 12),
    (9212, 6876.00, 6, 'delivered', '2021-06-23', 92, 12),
    (9312, 1146.00, 1, 'delivered', '2021-06-24', 93, 12),
    (9412, 4584.00, 4, 'delivered', '2021-06-25', 94, 12),
    (9512, 1146.00, 1, 'delivered', '2021-06-26', 95, 12),
    (9612, 5730.00, 5, 'delivered', '2021-07-04', 96, 12),
    (9712, 4584.00, 4, 'delivered', '2021-08-08', 97, 12),
    (9812, 2292.00, 2, 'delivered', '2021-08-22', 98, 12),
    (9912, 6876.00, 6, 'delivered', '2021-08-24', 99, 12),
    (10012, 8022.00, 7, 'delivered', '2021-08-05', 100, 12),
    (10112, 5730.00, 5, 'delivered', '2021-08-09', 101, 12),
    (10212, 3438.00, 3, 'delivered', '2021-08-10', 102, 12),
    (10312, 3438.00, 3, 'delivered', '2021-08-13', 103, 12),
    (10412, 5730.00, 5, 'delivered', '2021-08-15', 104, 12),
    (10512, 8022.00, 7, 'delivered', '2021-08-17', 105, 12),
    (10612, 4584.00, 4, 'delivered', '2021-08-21', 106, 12),
    (10712, 8022.00, 7, 'delivered', '2021-08-24', 107, 12),
    (10812, 3438.00, 3, 'delivered', '2021-08-16', 108, 12),
    (10912, 6876.00, 6, 'delivered', '2021-08-18', 109, 12),
    (11012, 6876.00, 6, 'delivered', '2021-08-21', 110, 12),
    (11112, 1146.00, 1, 'delivered', '2021-08-01', 111, 12),
    (11212, 5730.00, 5, 'delivered', '2021-08-15', 112, 12),
    (11312, 4584.00, 4, 'delivered', '2021-08-16', 113, 12),
    (913, 5765.00, 5, 'delivered', '2021-08-16', 9, 13),
    (7213, 8071.00, 7, 'delivered', '2021-08-19', 72, 13),
    (213, 8071.00, 7, 'delivered', '2021-08-27', 2, 13),
    (15414, 27.00, 3, 'delivered', '2021-08-18', 64, 14),
    (3914, 63.00, 7, 'delivered', '2021-08-21', 39, 14),
    (1815, 760.00, 1, 'delivered', '2021-08-24', 18, 15),
    (6715, 1520.00, 2, 'delivered', '2021-08-26', 67, 15),
    (10515, 6840.00, 9, 'delivered', '2021-08-28', 105, 15),
    (6616, 146.00, 2, 'delivered', '2021-08-22', 66, 16),
    (14416, 438.00, 6, 'delivered', '2021-08-25', 84, 16),
    (617, 52.00, 1, 'delivered', '2021-06-29', 6, 17),
    (117, 468.00, 9, 'delivered', '2021-08-13', 1, 17),
    (17417, 312.00, 6, 'delivered', '2021-08-23', 94, 17),
    (15417, 208.00, 4, 'delivered', '2021-08-31', 53, 17),
    (918, 854.00, 1, 'delivered', '2021-08-08', 9, 18),
    (11718, 6832.00, 8, 'delivered', '2021-08-30', 112, 18),
    (319, 1810.00, 2, 'delivered', '2021-08-30', 3, 19),
    (15219, 9050.00, 10, 'delivered', '2021-08-29', 102, 19),
    (9720, 1400.00, 2, 'delivered', '2021-08-12', 97, 20),
    (3420, 5600.00, 8, 'delivered', '2021-08-15', 34, 20),
    (320, 4900.00, 7, 'delivered', '2021-08-20', 3, 20);
    
-- Feedback
INSERT INTO Feedback(UserID, OPID, rating, date_time, comment) VALUES
(1,112,5,'2021-10-03','very good'),
(2,212,4,'2021-08-21','good'),
(3,312,5,'2021-09-13','very good'),
(4,412,5,'2021-07-16','very good'),
(5,55,5,'2021-07-31','very good'),
(6,617,5,'2021-07-13','very good'),
(7,72,5,'2021-06-17','very good'),
(8,85,5,'2021-05-05','very good'),
(9,91,5,'2021-08-22','very good'),
(10,105,5,'2021-06-26','very good'),
(2,26,5,'2021-08-21','very good'),
(3,319,5,'2021-09-13','very good'),
(9,94,5,'2021-08-22','very good'),
(9,918,5,'2021-08-22','very good'),
(2,23,5,'2021-08-21','very good'),
(7,74,5,'2021-06-17','very good'),
(11,1112,5,'2021-04-24','very good'),
(12,1212,5,'2021-04-26','very good'),
(13,1312,3,'2021-04-28','Average'),
(14,1412,5,'2021-04-30','very good'),
(15,1512,5,'2021-05-03','very good'),
(16,1612,5,'2021-05-05','very good'),
(17,1712,5,'2021-05-08','very good'),
(18,1812,5,'2021-05-10','very good'),
(19,1912,5,'2021-05-15','very good'),
(20,2012,5,'2021-05-22','very good'),
(21,2112,5,'2021-06-17','very good'),
(22,2212,5,'2021-06-21','very good'),
(23,2312,5,'2021-07-02','very good'),
(24,2412,5,'2021-07-14','very good'),
(25,2512,5,'2021-07-15','very good'),
(26,2612,5,'2021-07-31','very good'),
(27,2712,5,'2021-08-02','very good'),
(28,2812,1,'2021-08-05','Terrible'),
(29,2912,5,'2021-08-16','very good'),
(30,3012,5,'2021-08-19','very good'),
(31,3112,5,'2021-08-30','very good'),
(32,3212,5,'2021-09-15','very good'),
(33,3312,5,'2021-09-23','very good'),
(34,3412,5,'2021-10-09','very good'),
(35,3512,5,'2021-10-12','very good'),
(36,3612,5,'2021-04-21','very good'),
(37,3712,5,'2021-04-23','very good'),
(38,3812,5,'2021-04-26','very good'),
(39,3912,5,'2021-04-29','very good'),
(40,4012,5,'2021-05-04','very good'),
(41,4112,5,'2021-05-05','very good'),
(42,4212,5,'2021-05-24','very good'),
(43,4312,5,'2021-05-26','very good'),
(44,4412,5,'2021-05-30','very good'),
(45,4512,5,'2021-06-01','very good'),
(46,4612,5,'2021-06-23','very good'),
(47,4712,5,'2021-06-26','very good'),
(48,4812,5,'2021-07-02','very good'),
(49,4912,5,'2021-07-07','very good'),
(50,5012,5,'2021-07-16','very good'),
(51,5112,5,'2021-07-24','very good'),
(52,5212,1,'2021-08-07','Terrible'),
(53,5312,5,'2021-08-12','very good'),
(54,5412,5,'2021-09-15','very good'),
(55,5512,5,'2021-09-19','very good'),
(56,5612,5,'2021-09-22','very good'),
(57,5712,5,'2021-09-24','very good'),
(58,5812,5,'2021-10-02','very good'),
(59,5912,5,'2021-10-04','very good'),
(60,6012,5,'2021-10-11','very good'),
(61,6112,5,'2021-04-25','very good'),
(62,6212,5,'2021-05-02','very good'),
(63,6312,5,'2021-05-06','very good'),
(64,6412,5,'2021-05-07','very good'),
(65,6512,5,'2021-05-28','very good'),
(66,6612,5,'2021-06-01','very good'),
(67,6712,5,'2021-06-08','very good'),
(68,6812,5,'2021-06-12','very good'),
(69,6912,5,'2021-06-16','very good'),
(70,7012,5,'2021-06-19','very good'),
(71,7112,5,'2021-06-28','very good'),
(72,7212,5,'2021-07-02','very good'),
(73,7312,5,'2021-07-08','very good'),
(74,7412,5,'2021-07-18','very good'),
(75,7512,5,'2021-07-20','very good'),
(76,7612,5,'2021-07-21','very good'),
(77,7712,5,'2021-07-30','very good'),
(78,7812,5,'2021-08-05','very good'),
(79,7912,5,'2021-08-09','very good'),
(80,8012,5,'2021-08-15','very good'),
(81,8112,5,'2021-08-18','very good'),
(82,8212,5,'2021-08-23','very good'),
(83,8312,5,'2021-09-02','very good'),
(84,8412,5,'2021-09-25','very good'),
(85,8512,5,'2021-10-11','very good'),
(86,8612,5,'2021-04-17','very good'),
(87,8712,5,'2021-05-04','very good'),
(88,8812,5,'2021-05-21','very good'),
(89,8912,5,'2021-06-12','very good'),
(90,9012,5,'2021-06-19','very good'),
(91,9112,5,'2021-06-22','very good'),
(92,9212,5,'2021-07-07','very good'),
(93,9312,5,'2021-07-08','very good'),
(94,9412,5,'2021-07-09','very good'),
(95,9512,5,'2021-07-10','very good'),
(96,9612,5,'2021-07-18','very good'),
(97,9712,5,'2021-07-22','very good'),
(98,9812,5,'2021-08-05','very good'),
(99,9912,5,'2021-08-07','very good'),
(100,10012,5,'2021-08-19','very good'),
(101,10112,5,'2021-08-23','very good'),
(102,10212,5,'2021-08-24','very good'),
(103,10312,5,'2021-08-27','very good'),
(104,10412,5,'2021-08-29','very good'),
(105,10512,5,'2021-08-31','very good'),
(106,10612,5,'2021-09-04','very good'),
(107,10712,5,'2021-09-07','very good'),
(108,10812,5,'2021-09-30','very good'),
(109,10912,5,'2021-10-02','very good'),
(110,11012,5,'2021-10-05','very good'),
(111,11112,5,'2021-08-15','very good'),
(112,11212,5,'2021-08-29','very good'),
(113,11312,5,'2021-08-30','very good'),
(114,11412,5,'2021-08-15','very good');

--Complaints
INSERT INTO Complaints(text, filed_date_time, status, EmployeeID, UserID, handled_date_time) VALUES
('Order came late','2021-09-19 11:23:50 AM', 'Addressed', 1 ,1 ,'2021-10-19 12:28:50 AM'),
('Products damaged on arrivial','2021-08-07 07:00', 'Pending', NULL ,2 , NULL),
('Missing Products','2021-08-30 13:24:28', 'Addressed', 3 ,3 ,'2021-08-31 14:00:25'),
('I want a refund','2021-08-30 10:22:50', 'Addressed', 3 ,4 ,'2021-09-02 14:22:50'),
('Packinging Damage','2021-07-17 15:23:40', 'Being Handled', 4 ,5 , NULL),
('Diageo is not good','2021-06-29 18:56:25', 'Addressed', 6 ,1 ,'2021-07-02 13:05:54'), 
('Epitex needs improvement','2021-06-03 09:24:43', 'Being Handled', 7 ,2 , NULL), 
('Tinec too expensive','2021-04-21 17:43:12', 'Pending', NULL ,3 ,NULL), 
('Nintendo overrated','2021-08-08 10:21:25', 'Addressed', 9 ,4 ,'2021-08-09 10:21:25'), 
('Dibea needs better customer service','2021-10-08 13:24:25', 'Being Handled', 9 ,5 ,NULL),
('Order came late','2021-04-12 12:00:25', 'Addressed', 9 ,5 ,'2021-04-12 18:00:25'), 
('Products damaged on arrivial','2021-04-13 07:00:45', 'Pending', NULL ,6 , NULL), 
('Missing Products','2021-04-14 11:23:43', 'Addressed', 3 ,7 ,'2021-04-17 11:23:43'), 
('I want a refund','2021-04-16 15:23:34', 'Addressed', 6 ,8 ,'2021-04-19 15:23:34'), 
('Packinging Damage','2021-04-21 19:56:34', 'Being Handled', 4 ,9 , NULL), 
('Diageo is not good','2021-12-12 08:23:12 ', 'Addressed', 9 ,1 ,'2021-12-13 08:23:12 '), 
('Epitex needs improvement','2021-09-23 10:24:23', 'Being Handled', 3 ,1 , NULL), 
('Tinec too expensive','2021-04-22 17:23:22', 'Pending', NULL ,1 , NULL), 
('Nintendo overrated','2021-08-09 19:23:12', 'Addressed', 9 ,1 ,'2021-08-10 20:23:12'), 
('Dibea needs better customer service','2021-06-12 23:12:23', 'Being Handled', 3 ,1 , NULL);

--Complaints ON Shops
INSERT INTO ComplaintsOnShops(ComplaintID, ShopName, filed_date_time, UserID) VALUES
(6,'Diageo' ,'2021-06-29 18:56:25', 1),
(7,'Epitex' ,'2021-06-03 09:24:43', 2),
(8,'Tinec' ,'2021-04-21 17:43:12', 3),
(9,'Nintendo' ,'2021-08-08 10:21:25', 4),
(10,'Dibea' ,'2021-10-08 13:24:25', 5),
(16,'Diageo' ,'2021-12-12 08:23:12 ', 1),
(17,'Epitex' ,'2021-09-23 10:24:23', 1),
(18,'Tinec' ,'2021-04-22 17:23:22', 1),
(19,'Nintendo' ,'2021-08-09 19:23:12', 1),
(20,'Dibea' ,'2021-06-12 23:12:23', 1);

--Complaints ON Orders
INSERT INTO ComplaintsOnOrders(ComplaintID, OID, filed_date_time, UserID) VALUES
(1, 1 ,'2021-09-19 11:23:50', 1),
(2, 2 ,'2021-08-07 07:00:23', 2),
(3, 3 ,'2021-08-30 13:24:28', 3),
(4, 4 ,'2021-08-30 10:22:50', 4),
(5, 5 ,'2021-07-17 15:23:40', 1),
(11, 11 ,'2021-04-12 12:00:25', 5),
(12, 12 ,'2021-04-13 07:00:45', 6),
(13, 13 ,'2021-04-14 11:23:43', 7),
(14, 14 ,'2021-04-16 15:23:34', 8),
(15, 15 ,'2021-04-21 19:56:34', 9);