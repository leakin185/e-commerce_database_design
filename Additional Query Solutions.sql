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

-- 3. Find the shops whose customer service quality (rating) worsened the most over 3 months
