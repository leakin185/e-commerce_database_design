--for queries Q8aii
-- CREATE VIEW aii AS 
-- SELECT u.UserID, p.Pname
-- FROM Products AS p, Users AS u
-- GROUP BY u.UserID, p.Pname;

-- to have a cross product, can try CROSS JOIN too, but the above suffices


-- in general, might come in use, links all users with all their products bought
CREATE VIEW usersandproducts AS 
SELECT u.UserID, pis.Pname
FROM ProductInShops AS pis, ProductInOrders AS pio, Orders AS o, Users AS u
WHERE pis.SPID = pio.SPID AND pio.orderID = o.OID AND o.UserID = u.userID
GROUP BY u.UserID, pis.Pname;


--for queries Q8b
--link userid and products bought in Aug 2021
-- CREATE VIEW q8b AS 
-- SELECT u.UserID, pis.Pname
-- FROM ProductInShops AS pis, ProductInOrders AS pio, Orders AS o, Users AS u
-- WHERE pis.SPID = pio.SPID AND pio.orderID = o.OID AND o.UserID = u.userID
-- --added this for q8 specifically
-- AND MONTH(o1.date_time) = 8 AND
--     YEAR(o1.date_time) = 2021
-- GROUP BY u.UserID, pis.Pname;