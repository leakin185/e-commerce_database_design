
--for queries Q8aii
CREATE VIEW aii AS 
SELECT u.UserID, p.Pname
FROM Products AS p, Users AS u
GROUP BY u.UserID, p.Pname

-- to have a cross product, can try CROSS JOIN too, but the above suffices