-- 1. For each shop, come up with its product development strategies
-- 1.1 find the product per category which produces the highest revenue 
-- each shop has 2 categories each and has at least 2 products per category

SELECT Y.name AS ShopName, Y.Category, p1.Pname AS ProductName, Y.MaxRevenue
FROM (
SELECT X.name, X.Category, MAX(Revenue) as MaxRevenue
    FROM(
SELECT s.name, p.Category, p.Pname, SUM(pio.Oprice) as Revenue
        FROM Shops s, Products p, ProductInShops pis, ProductInOrders pio
        WHERE s.name = pis.Sname AND
            pis.SPID = pio.SPID AND
            pis.Pname = p.Pname
        GROUP BY s.name, p.category, p.Pname) as X
    GROUP BY X.name, X.Category ) as Y, Shops s1, Products p1, ProductInShops pis1, ProductInOrders pio1
WHERE s1.name = pis1.Sname AND
    pis1.SPID = pio1.SPID AND
    pis1.Pname = p1.Pname AND
    Y.name = s1.name AND
    Y.Category = p1.category
GROUP BY Y.name, Y.Category, p1.Pname, Y.MaxRevenue
HAVING SUM(pio1.Oprice) = Y.MaxRevenue

-- 1.2 Find the product per category which produces the lowest revenue 

SELECT Y.name AS ShopName, Y.Category, p1.Pname AS ProductName, Y.MinRevenue
FROM (
SELECT X.name, X.Category, MIN(Revenue) as MinRevenue
    FROM(
SELECT s.name, p.Category, p.Pname, SUM(pio.Oprice) as Revenue
        FROM Shops s, Products p, ProductInShops pis, ProductInOrders pio
        WHERE s.name = pis.Sname AND
            pis.SPID = pio.SPID AND
            pis.Pname = p.Pname
        GROUP BY s.name, p.category, p.Pname) as X
    GROUP BY X.name, X.Category ) as Y, Shops s1, Products p1, ProductInShops pis1, ProductInOrders pio1
WHERE s1.name = pis1.Sname AND
    pis1.SPID = pio1.SPID AND
    pis1.Pname = p1.Pname AND
    Y.name = s1.name AND
    Y.Category = p1.category
GROUP BY Y.name, Y.Category, p1.Pname, Y.MinRevenue
HAVING SUM(pio1.Oprice) = Y.MinRevenue

-- 2. For each shop, find the most loyal customer 
-- The definition of the most loyal customer is one who spends the most amount of money in the shop AND ordered the highest amount in the shop AND makes the highest ratings in the shop

--from https://stackoverflow.com/questions/907438/can-i-get-the-position-of-a-record-in-a-sql-result-table
--how to return index of a customer

-- select count(*)
-- from mytable
-- where mycolumn < (select mycolumn from mytable where key = 42)

-- 3. Find the shops whose customer service quality (rating) worsened the most over 3 months

--- i. Aggregate average Ratings for Shops as RatingsByMonth Table 
SELECT Sname, MONTH(date_time) as RatingsMonth,
    YEAR(date_time) as RatingsYear, COUNT(*) as count , CAST(AVG(CAST(rating AS decimal(3,2))) AS decimal(3,2)) as AvgRatings
INTO RatingsByMonth
FROM (SELECT Sname, pIS.SPID, fb.rating, fb.date_time
    FROM Feedback as fb, ProductInOrders as pIO, ProductInShops as pIS
    WHERE fb.OPID = pIO.OPID AND pIO.SPID = pIS.SPID) as r
GROUP BY Sname, MONTH(date_time),YEAR(date_time);

--- ii. Get shops by shop name that have ratings decreased for minimally 3 consecutive months

WITH
    RatingsRow
    AS
    (
        SELECT Sname, AvgRatings, RatingsMonth,
            ROW_NUMBER() OVER(PARTITION BY Sname 
                                           ORDER BY RatingsMonth) rn
        FROM RatingsByMonth
    ),

    RatingsGroup
    AS
    (
        SELECT Base.Sname, Base.RatingsMonth,
            MAX(Restart.rn) OVER(PARTITION BY Base.Sname
                                              ORDER BY Base.RatingsMonth) groupingId
        FROM RatingsRow Base
            LEFT JOIN RatingsRow Restart
            ON Restart.Sname = Base.Sname
                AND Restart.rn = Base.rn - 1
                AND Restart.AvgRatings <= Base.AvgRatings
    )

SELECT Sname,
	COUNT(*) AS consecutiveCount,
    MIN(RatingsMonth) AS startMonth, MAX(RatingsMonth) AS endMonth
INTO QueryRatings
FROM RatingsGroup
GROUP BY Sname, groupingId
HAVING COUNT(*) >= 3
ORDER BY Sname, startMonth;

--- iii. Retrieve corresponding product names 
SELECT Sname
FROM QueryRatings;