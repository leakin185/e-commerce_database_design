-- QUERY SOLUTIONS

----------------------------------------------------------------
-- 1) Find the average price of “iPhone Xs” on Shiokee from 1 August 2021 to 31 August 2021.

SELECT ph.Pname, AVG(ph.price) AS AveragePrice--ph.startDate, ph.endDate, ph.price
FROM PriceHistory ph
WHERE
-- Product price changed in August 2021
(ph.endDate <= '2021-08-31' AND ph.endDate >= '2021-08-01') OR
    -- Product price started before end of Aug 2021 and persists till after Aug 
    (ph.endDate > '2021-08-31' AND ph.startDate <= '2021-08-31')
    AND ph.Pname = 'Apple iPhone Xs 2022'
GROUP BY ph.Pname;

----------------------------------------------------------------
-- 2) Find products that received at least 100 ratings of “5” in August 2021, and order them by their average ratings.

-- Make a template to replace OPID with product name
SELECT pis.Pname, f.rating, f.date_time
INTO R
FROM ProductInShop AS pis, ProductInOrders AS pio, Feedback AS f
WHERE (f.OPID = pio.OPID)
    AND (pio.SPID = pis.SPID);

-- Main Query
SELECT R.Pname, AVG(R.rating) AS AverageRating
FROM R
WHERE 
(R.date_time > '2021-07-31' AND R.date_time <= '2021-08-31')
    AND R.Pname in 
(
    -- Get the name of product that received at least 100 ratings of "5" in August
    SELECT DISTINCT R.name
    FROM R
    WHERE
    -- Filter: Feedbacks given in August 2021
    (R.date_time > '2021-07-31' AND R.date_time <= '2021-08-31')
        -- Filter: Rating of 5
        AND (R.rating = 5)
    GROUP BY R.Pname
    -- At least 100 ratings
    HAVING COUNT(R.Pname) >= 100
)
ORDER BY AverageRating DESC;

----------------------------------------------------------------
-- 3) For all products purchased in June 2021 that have been delivered, find the average time from the ordering date to the delivery date.
SELECT AVG(R.Difference) as AvgDateDifference
FROM (
    SELECT o.date_time, PIO.date_time, PIO.date_time - o.date_time as Difference
    FROM Orders as o, ProductInOrders as PIO
    WHERE (o.OPID = PIO.OPID)
        -- Order pruchased in June 2021
        AND (o.date_time > '2021-05-31' AND o.date_time <= '2021-06-31')
        -- Has been delivered
        AND (PIO.status = 'delivered')
) as R

----------------------------------------------------------------
-- 4) Let us define the “latency” of an employee by the average that he/she takes to process a complaint. Find the employee with the smallest latency.
--Find minimum averge Latency
SELECT X.EmployeeID FROM (SELECT EmployeeID, AVG(DATEDIFF(hour, filed_date_time, handled_date_time)) AS [Latency]
FROM Complaints AS C WHERE handled_date_time IS NOT NULL GROUP BY EmployeeID) AS X GROUP BY EmployeeID
HAVING MIN(Latency) =
(SELECT MIN(Latency) AS MinLatency FROM (SELECT EmployeeID, AVG(DATEDIFF(hour, filed_date_time, handled_date_time)) AS [Latency]
FROM Complaints AS C WHERE handled_date_time IS NOT NULL GROUP BY EmployeeID) AS Y)

----------------------------------------------------------------
-- 5i) Produce a list that contains (i) all products made by Samsung
SELECT p.Pname
FROM Products p
WHERE p.Maker = 'samsung.sg'

-- 5ii)for each of them, the number of shops on Shiokee that sell the product. 
SELECT p.Pname, COUNT(pis.Sname) AS numShops
FROM ProductInShops pis, Products p
WHERE
-- Join tables by Pname
    pis.Pname = p.Pname AND
    p.maker = 'samsung.sg' AND
    pis.remarks = 'Selling'
GROUP BY p.Pname

----------------------------------------------------------------
-- 6) Find shops that made the most revenue in August 2021.
-- outline: 
-- for each shop, find their orders made in August 2021, and calculated the revenue from their products in orders with price * quantity 

SELECT s.name, SUM(pio.Oprice* pio.Oquantity) AS Revenue
FROM Shops s, Orders o, ProductInShops pis, ProductInOrders pio
WHERE
-- Join tables
    s.name = pis.Sname AND
    pis.SPID = pio.SPID AND
    pio.orderID = o.OID AND
    MONTH(o.date_time) = 8 AND
    YEAR(o.date_time) = 2021
GROUP BY s.name
HAVING SUM(pio.Oprice* pio.Oquantity)= (

-- get Max scalar value for Revenue
SELECT MAX(X.Revenue)
FROM(
    SELECT s1.name, SUM(pio1.Oprice* pio1.Oquantity) AS Revenue
    FROM Shops s1, Orders o1, ProductInShops pis1, ProductInOrders pio1
    WHERE
-- Join tables
        s1.name = pis1.Sname AND
        pis1.SPID = pio1.SPID AND
        pio1.orderID = o1.OID AND
        MONTH(o1.date_time) = 8 AND
        YEAR(o1.date_time) = 2021
    GROUP BY s1.name) AS X);

----------------------------------------------------------------
-- 7) For users that made the most amount of complaints, find the most expensive products he/she has ever purchased.
    





----------------------------------------------------------------
--8) Find products that have never been purchased by some users
--    but are the top 5 most purchased products by other users in August 2021.

-- Justification/Logic:
---->Can split this into 2 parts, according to above paragraphing
---->Also included some intermediate tables in the excel under q8 ans checking sheet

--  Part a) Products never purchased by some users 
----> ai) for every user, can have a list of the products they bought, 
----> aii) and thus a list of products they never bought can be generated by GlobalSet - AboveTable (in SQL, prob something like SELECT * FROM XXX EXCEPT (abovetable))
----> aiii) aggregate the list above for every user, this gives us list of DISTINCT products that have never been purchased by at least one user 
--**actually, does "some" mean "at least one" or "more than one"? ITS >=1 according to TA

----> if >=1, for every product, as long as there it exists in the list above, it fufils the criteria for a)
----> if >1, for every product, if COUNT(numoftimesitappear) >1, then it fufils a) criterias

--ai) for every user, products they bought
SELECT pis.Pname, u.UserID 
FROM ProductInShops AS pis, ProductInOrders AS pio, Orders AS o, Users AS u
WHERE pis.SPID = pio.SPID AND pio.orderID = o.OID AND o.UserID = u.userID
GROUP BY u.UserID, pis.Pname;

-- aii) need to create global set of all products, for each user --> try create view? create view need its own file so yea refer to VIEWS.sql
--CREATE VIEW aii AS SELECT * 
--FROM Product AS p, Users AS u
--GROUP BY u

-- aiii) select distinct

--SELECT DISTINCT p.Pname
--FROM product as p
--WHERE p.Pname IN (SELECT * FROM aii EXCEPT ai subquery here)

--the () subquery above should return for each user, what prooducts they nvr buy

--subquery for selecting products, for each user, that they NVR buy before
SELECT * FROM aii EXCEPT (
    SELECT u.UserID, pis.Pname
    FROM ProductInShops AS pis, ProductInOrders AS pio, Orders AS o, Users AS u
    WHERE pis.SPID = pio.SPID AND pio.orderID = o.OID AND o.UserID = u.userID
    GROUP BY u.UserID, pis.Pname
    );


--so now need to get aggregate/remove duplicates from this list?
--like not bought by at least one user
--so select from above subquery as long as pname exists?

--so final subquery for a) looks like:
--only run this AFTER creating the aii view!
SELECT DISTINCT p.Pname 
FROM Products as p
WHERE EXISTS (
    SELECT * FROM aii EXCEPT (
    SELECT u.UserID, pis.Pname
    FROM ProductInShops AS pis, ProductInOrders AS pio, Orders AS o, Users AS u
    WHERE pis.SPID = pio.SPID AND pio.orderID = o.OID AND o.UserID = u.userID 
    AND p.Pname = pis.Pname --added this line here
    GROUP BY u.UserID, pis.Pname
    )
)
--LMAO this just ends up being the entire product list again (14 products)

-- Joining a) and b)
---> Use INTERSECT, although its "but", logically seems more like "and"

-- b) top 5 most purchased products by other users in August 2021
----> this is messy haha, 
----> taking absolute number,

----> top 5 would require for every user, a SELECT TOP 5 (attribute) FROM xxx GROUP BY userID ORDER BY COUNT(numofpurchases) DESC
----> and filter by date WHERE ...
----> but need OTHER users, so need take the above table and minus all the users from part a)

--bi) select top 5 products for each user
--had to outsource to stackoverflow for this one, this is tricky
--https://stackoverflow.com/questions/176964/select-top-10-records-for-each-category

SELECT r.UserID, r.Pname
FROM
(
    --everything in this subquery returns for every user, the products they bought *sorted by COUNT(products they bought across all orders)
    --used a view to link all users with all products they bought
	SELECT *,
	ROW_NUMBER() OVER(PARTITION BY r.UserID
					  ORDER BY (
							SELECT COUNT(r.Pname) AS numofproducts
							FROM q8b as r)
					  DESC) rownum
	FROM q8b AS r --q8b is a view
) r
WHERE r.rownum <= 5
ORDER BY r.UserID ASC

--bii) filter by date 
--alr done in creation of q8b view

--biii) remove users that have appeared in a)
----> by doing a) (but without the product projection/filtering) EXCEPT (query above)

-- FINAL QUERY b), filter only pname column
SELECT DISTINCT p.Pname
FROM Products AS p
WHERE EXISTS(
    (
        SELECT * FROM aii EXCEPT (
        SELECT u.UserID, pis.Pname
        FROM ProductInShops AS pis, ProductInOrders AS pio, Orders AS o, Users AS u
        WHERE pis.SPID = pio.SPID AND pio.orderID = o.OID AND o.UserID = u.userID 
        GROUP BY u.UserID, pis.Pname
        )
    )
    EXCEPT
    (
        SELECT r.UserID, r.Pname
        FROM
        (
            --everything in this subquery returns for every user, the products they bought *sorted by COUNT(products they bought across all orders)
            --used a view to link all users with all products they bought
            SELECT *,
            ROW_NUMBER() OVER(PARTITION BY r.UserID
                            ORDER BY (
                                    SELECT COUNT(r.Pname) AS numofproducts
                                    FROM q8b as r)
                            DESC) rownum
            FROM q8b AS r --q8b is a view
        ) r
        WHERE r.rownum <= 5
    )
)

--Now, do a) INTERSECT b)

-----------------------------------------FINAL Q8 QUERY (finally)--------------------------
--a)
(
    SELECT DISTINCT p.Pname 
    FROM Products as p
    WHERE EXISTS (
        SELECT * FROM aii EXCEPT (
        SELECT u.UserID, pis.Pname
        FROM ProductInShops AS pis, ProductInOrders AS pio, Orders AS o, Users AS u
        WHERE pis.SPID = pio.SPID AND pio.orderID = o.OID AND o.UserID = u.userID 
        AND p.Pname = pis.Pname --added this line here
        GROUP BY u.UserID, pis.Pname
        )
    )
)
INTERSECT

--b)
(
    SELECT DISTINCT p.Pname
    FROM Products AS p
    WHERE EXISTS(
        (
            SELECT * FROM aii EXCEPT (
            SELECT u.UserID, pis.Pname
            FROM ProductInShops AS pis, ProductInOrders AS pio, Orders AS o, Users AS u
            WHERE pis.SPID = pio.SPID AND pio.orderID = o.OID AND o.UserID = u.userID 
            GROUP BY u.UserID, pis.Pname
            )
        )
        EXCEPT
        (
            SELECT r.UserID, r.Pname
            FROM
            (
                --everything in this subquery returns for every user, the products they bought *sorted by COUNT(products they bought across all orders)
                --used a view to link all users with all products they bought
                SELECT *,
                ROW_NUMBER() OVER(PARTITION BY r.UserID
                                ORDER BY (
                                        SELECT COUNT(r.Pname) AS numofproducts
                                        FROM q8b as r)
                                DESC) rownum
                FROM q8b AS r --q8b is a view
            ) r
            WHERE r.rownum <= 5
        )
    )
)

--it returns all products!! ?? !! 
--lmao
----------------------------------------------------------------
-- 9) Find products that are increasingly being purchased over at least 3 months