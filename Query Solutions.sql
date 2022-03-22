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
FROM ProductInShop AS pis, ProductInOrder AS pio, Feedback AS f
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

-- get Max scalar value
SELECT MAX(X.Revenue)
FROM(
    SELECT s.name, SUM(pio.Oprice* pio.Oquantity) AS Revenue
    FROM Shops s, Orders o, ProductInShops pis, ProductInOrders pio
    WHERE
-- Join tables
    s.name = pis.Sname AND
        pis.SPID = pio.SPID AND
        pio.orderID = o.OID AND
        MONTH(o.date_time) = 8 AND
        YEAR(o.date_time) = 2021
    GROUP BY s.name) AS X);

----------------------------------------------------------------
-- 7) For users that made the most amount of complaints, find the most expensive products he/she has ever purchased.
SELECT u1.userID, 
FROM Users u1;
    





----------------------------------------------------------------
-- 8) Find products that have never been purchased by some users
--    but are the top 5 most purchased products by other users in August 2021.

-- Justification/Logic:
--      Can split this into 2 parts, according to above paragraphing

--  Part a)
--  Never purchased by some users --> for every user, can have a list of the products they bought, and 

----------------------------------------------------------------
-- 9) Find products that are increasingly being purchased over at least 3 months