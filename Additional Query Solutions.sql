-- 1. For each shop, come up with its product development strategies
-- 1.1 find the product per category which produces the highest revenue 
-- each shop has 2 categories each and has at least 2 products per category
-- Oprice = total revenue associated with a specific product for a specific order

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


--from https://www.sqlshack.com/overview-of-sql-rank-functions/

--needed to create 2 views then can do the code

CREATE VIEW aq2i AS(
	SELECT o.UserID, pis.Sname, 
	SUM(pio.oprice) AS totalpricespent,
	MAX(f.rating) AS maxrating,
	COUNT(o.OID) AS numorders
	FROM Orders AS o, ProductInShops AS pis, ProductInOrders AS pio, Feedback AS f
	WHERE f.UserID = o.UserID AND o.OID = pio.orderID AND pio.spid = pis.spid
	GROUP BY o.UserID,pis.Sname
)

CREATE VIEW aq2ii AS(
	SELECT UserID, Sname, totalpricespent, maxrating, numorders,
		   ROW_NUMBER() OVER(ORDER BY totalpricespent DESC) RankingPrice,
		   ROW_NUMBER() OVER(ORDER BY maxrating DESC) RankingRating,
		   ROW_NUMBER() OVER(ORDER BY numorders DESC) RankingNumOrders
	FROM aq2i)


CREATE VIEW aq2iii AS (
SELECT TOP 100 PERCENT UserID, Sname, 
				 ROW_NUMBER() OVER(ORDER BY (RankingPrice + RankingRating + RankingNumOrders) / 3) AvgRanking
		FROM aq2ii
		ORDER BY SName, AvgRanking
		)

WITH aq2iv AS (
  SELECT
    *,
    ROW_NUMBER() OVER(PARTITION BY Sname ORDER BY AvgRanking ASC) AS r
  FROM aq2iii
)
SELECT
  Sname, UserID
FROM aq2iv
WHERE r = 1


-- 3. Find the shops whose customer service quality (rating) worsened the most over at least 3 months

--- i. Aggregate average Ratings for Shops as RatingsByMonth Table 
SELECT Sname, MONTH(date_time) as RatingsMonth,
    YEAR(date_time) as RatingsYear, COUNT(*) as count , CAST(AVG(CAST(rating AS decimal(3,2))) AS decimal(3,2)) as AvgRatings
INTO RatingsByMonth
FROM (SELECT Sname, pIS.SPID, fb.rating, fb.date_time
    FROM Feedback as fb, ProductInOrders as pIO, ProductInShops as pIS
    WHERE fb.OPID = pIO.OPID AND pIO.SPID = pIS.SPID) as r
GROUP BY Sname, MONTH(date_time),YEAR(date_time)

SELECT * FROM RatingsByMonth;

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
ORDER BY Sname, startMonth

SELECT * FROM QueryRatings;

--- iii. Retrieve corresponding shop names that have their ratings worsened the most

WITH CompareRatings AS(
	SELECT RBM.Sname, RBM.RatingsMonth, RBM.AvgRatings
	FROM RatingsByMonth AS RBM, QueryRatings AS QR
	WHERE RBM.Sname = QR.Sname AND (RBM.RatingsMonth = QR.startMonth OR RBM.RatingsMonth = QR.endMonth)
)

SELECT X.Sname, (X.AvgRatings - Y.AvgRatings) AS MaxRatingsFell
FROM CompareRatings AS X, CompareRatings AS Y
WHERE X.Sname=Y.Sname AND X.RatingsMonth <> Y.RatingsMonth AND X.AvgRatings < Y.AvgRatings
AND (X.AvgRatings - Y.AvgRatings) = (SELECT MIN(X.AvgRatings - Y.AvgRatings) 
										   FROM CompareRatings AS X, CompareRatings AS Y 
										   WHERE X.Sname=Y.Sname AND X.RatingsMonth <> Y.RatingsMonth AND X.AvgRatings < Y.AvgRatings)
