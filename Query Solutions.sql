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
    AND ph.Pname LIKE '%iPhone Xs%'
GROUP BY ph.Pname;

----------------------------------------------------------------
-- 2) Find products that received at least 100 ratings of “5” in August 2021, and order them by their average ratings.

-- Make a template to replace OPID with product name
SELECT pis.Pname, f.rating, f.date_time
INTO R
FROM ProductInShops AS pis, ProductInOrders AS pio, Feedback AS f
WHERE (f.OPID = pio.OPID)
AND (pio.SPID = pis.SPID);

-- Main Query
SELECT DISTINCT Pname, AVG(rating) AS AverageRating
FROM R
WHERE (date_time > '2021-07-31' AND date_time <= '2021-08-31')
AND Pname IN
(
    -- Get the name of product that received at least 100 ratings of "5" in August
    SELECT DISTINCT Pname
    FROM R
    WHERE
    -- Filter: Feedbacks given in August 2021
    (date_time > '2021-07-31' AND date_time <= '2021-08-31')
    -- Filter: Rating of 5
    AND (rating = 5)
    GROUP BY Pname
    -- At least 100 ratings
    HAVING COUNT(Pname) >= 100
)
GROUP BY Pname
ORDER BY AverageRating DESC;

----------------------------------------------------------------
-- 3) For all products purchased in June 2021 that have been delivered, find the average time from the ordering date to the delivery date.
SELECT AVG(DIFF) as AvgDateDifference
FROM (
    SELECT DIFFERENCE(PIO.deliverDate, o.date_time) AS DIFF
    FROM Orders as o, ProductInOrders as PIO
    WHERE (o.OID = PIO.orderID)
        -- Order purchased in June 2021
        AND o.date_time BETWEEN '2021-06-01' AND '2021-07-01'
        -- Has been delivered
        AND (PIO.orderStatus = 'delivered')
) as R

----------------------------------------------------------------
-- 4) Let us define the “latency” of an employee by the average that he/she takes to process a complaint. Find the employee with the smallest latency.
--Find minimum average Latency
SELECT X.EmployeeID
FROM (SELECT EmployeeID, AVG(DATEDIFF(hour, filed_date_time, handled_date_time)) AS [Latency]
    FROM Complaints AS C
    WHERE handled_date_time IS NOT NULL
    GROUP BY EmployeeID) AS X
WHERE Latency =
(SELECT MIN(Latency) AS MinLatency
FROM (SELECT EmployeeID, AVG(DATEDIFF(hour, filed_date_time, handled_date_time)) AS [Latency]
    FROM Complaints AS C
    WHERE handled_date_time IS NOT NULL
    GROUP BY EmployeeID) AS Y)
GROUP BY EmployeeID

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
-- return shop-product ID which uniquely identifies the product and also the user ID which made the most amount of complaints
SELECT s2.UserID, pio1.SPID
FROM Users s2, Orders o1, ProductInOrders pio1
WHERE s2.UserID = o1.UserID AND
    o1.OID = pio1.orderID AND
    pio1.Oprice/pio1.Oquantity = ( 
    -- check this part again 

-- get maximum individual product price the user(s) has ordered 
SELECT MAX(pio.Oprice/pio.Oquantity)
    FROM Users s1, Orders o, ProductInOrders pio
    WHERE s1.UserID = o.UserID AND
        o.OID = pio.orderID AND
        s1.UserID IN (

-- return user(s) that made the most amount of complaints (including both shop and product complaints)
SELECT s.UserID
        FROM Users s, Complaints c
        WHERE s.UserID = c.UserID
        GROUP BY s.UserID
        HAVING COUNT(*) = (

SELECT MAX(X.Count)
        FROM(
SELECT s.UserID, COUNT(*) AS Count
            FROM Users s, Complaints c
            WHERE s.UserID = c.UserID
            GROUP BY s.UserID) AS X)));





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
SELECT *
FROM aii
EXCEPT
    (
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

--//////////////////////IGNORE, WRONG//////////////////
-- SELECT DISTINCT p.Pname
-- FROM Products as p
-- WHERE EXISTS (
--     SELECT *
--     FROM aii
-- EXCEPT
--     (
--     SELECT u.UserID, pis.Pname
--     FROM ProductInShops AS pis, ProductInOrders AS pio, Orders AS o, Users AS u
--     WHERE pis.SPID = pio.SPID AND pio.orderID = o.OID AND o.UserID = u.userID
--         AND p.Pname = pis.Pname
--     --added this line here
--     GROUP BY u.UserID, pis.Pname
--     )
-- )//////////////////////////////////////////////////////

    SELECT DISTINCT p.Pname 
    FROM (
        SELECT * FROM aii EXCEPT (
            SELECT u.UserID, pis.Pname
            FROM ProductInShops AS pis, ProductInOrders AS pio, Orders AS o, Users AS u
            WHERE pis.SPID = pio.SPID AND pio.orderID = o.OID AND o.UserID = u.userID 
            GROUP BY u.UserID, pis.Pname)
	) AS p

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
    SELECT *
    FROM aii
EXCEPT
    (
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
    FROM (
        SELECT * FROM aii EXCEPT (
            SELECT u.UserID, pis.Pname
            FROM ProductInShops AS pis, ProductInOrders AS pio, Orders AS o, Users AS u
            WHERE pis.SPID = pio.SPID AND pio.orderID = o.OID AND o.UserID = u.userID 
            GROUP BY u.UserID, pis.Pname)
	) AS p
)
INTERSECT

    --b)
    (
    SELECT DISTINCT p.Pname
    FROM Products AS p
    WHERE EXISTS(
                                                                    (
                SELECT *
        FROM aii
    EXCEPT
        (
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
--- i. Aggregate total monthly purchases by products as PurchaseByMonth Table 
SELECT pName, MONTH(deliverDate) as PurchaseMonth,
            YEAR(deliverDate) as PurchaseYear, SUM(Oquantity) as totalQuantityPurchased
INTO PurchaseByMonth
FROM (SELECT pName, q.SPID, Oquantity, deliverDate 
FROM  ProductInOrders as p, ProductInShops as q
WHERE p.SPID = q.SPID) as p
GROUP BY pName, MONTH(deliverDate),YEAR(deliverDate);

--- ii. Get products by product name that have sold increasingly for minimally 3 consecutive months
WITH PurchaseRow AS (SELECT PName, totalQuantityPurchased, PurchaseMonth,
                         ROW_NUMBER() OVER(PARTITION BY PName 
                                           ORDER BY PurchaseMonth) rn
                  FROM PurchaseByMonth),

     PurchaseGroup AS (SELECT Base.PName, Base.PurchaseMonth, 
                         MAX(Restart.rn) OVER(PARTITION BY Base.PName
                                              ORDER BY Base.PurchaseMonth) groupingId
                  FROM PurchaseRow Base
                  LEFT JOIN PurchaseRow Restart
                         ON Restart.PName = Base.PName
                            AND Restart.rn = Base.rn - 1
                            AND Restart.totalQuantityPurchased > Base.totalQuantityPurchased)

SELECT PName, 
       COUNT(*) AS consecutiveCount, 
       MIN(PurchaseMonth) AS startMonth, MAX(PurchaseMonth) AS endMonth
INTO QueryNineProducts
FROM PurchaseGroup
GROUP BY PName, groupingId
HAVING COUNT(*) >= 3
ORDER BY PName, startMonth;

--- iii. Get corresponding product details from ProductInShops table
SELECT pName 
FROM QueryNineProducts;

----------------------------------------------------------------------------
--- Get SPIDs with minimally 3 months records (Not needed but keep in case?)
SELECT c.SPID, c.PurchaseMonth, c.PurchaseYear, c.totalQuantityPurchased 
INTO PurchaseByMonthForThreeOrMore
FROM (SELECT a.SPID, COUNT(*) as cnt
FROM PurchaseByMonth as a
GROUP BY a.SPID
HAVING COUNT(*) > 2) as b, PurchaseByMonth as c
WHERE c.SPID = b.SPID