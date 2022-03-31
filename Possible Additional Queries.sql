-- 1. Shoppers who have purchased more than 2 items per shop for at least 5 shops in the last 30 days. Who are the top 3 frequent shoppers in terms of the
-- Total cost of the items they have purchased?

-- 2. Popular shops are shops which have sold more than 3 items in the last 30 days. Who are the top three shoppers in these popular shops in terms of the numbers of items they have purchased?
-- assume today is 2021-08-31 



-- TODO: select the top 3 for each shop

-- for each shop, for each user ID, return the number of orders ordered in descending order
SELECT X.Sname, o1.UserID, SUM(pio1.Oquantity) as numItems
FROM(
-- return popular shops
SELECT pis.Sname, COUNT(*) AS Num
    FROM Orders o, ProductInOrders pio, ProductInShops pis
    WHERE o.OID = pio.orderID AND
        pio.SPID = pis.SPID AND
        o.date_time <= '2021-08-31' AND
        o.date_time >= '2021-08-01'
    GROUP BY pis.Sname
    HAVING COUNT(*) > 3) AS X, Orders o1, ProductInOrders pio1, ProductInShops pis1
WHERE X.Sname = pis1.Sname AND
    o1.OID = pio1.orderID AND
    pio1.SPID = pis1.SPID
GROUP BY X.Sname, o1.UserID
ORDER BY x.Sname, numItems DESC


-- 3. Find the lowest history price of ‘iPhone Xs’ across all shops. List the corresponding shopID, timestamp and prices
SELECT ph1.Sname, ph1.startDate, ph1.endDate, ph1.price
FROM (
SELECT ph.Sname, ph.Pname, MIN(price) AS MinPrice
    FROM PriceHistory ph
    WHERE ph.Pname LIKE '%iPhone Xs%'
    GROUP BY ph.Sname, ph.Pname) AS X, PriceHistory ph1
WHERE ph1.Sname = X.Sname AND
    ph1.Pname = X.Pname AND
    ph1.price = X.MinPrice
