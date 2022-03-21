-- QUERY SOLUTIONS

-- 1)
SELECT ph.Pname, AVG(ph.price) AS AveragePrice--ph.startDate, ph.endDate, ph.price
FROM  PriceHistory ph
WHERE
-- Product price changed in August 2021
(ph.endDate <= '2021-08-31' AND ph.endDate >= '2021-08-01') OR
-- Product price started before end of Aug 2021 and persists till after Aug 
(ph.endDate > '2021-08-31' AND ph.startDate <= '2021-08-31')
AND ph.Pname = 'Apple iPhone Xs 2022'
GROUP BY ph.Pname;

-- 5i)
SELECT p.Pname
FROM Products p
WHERE p.Maker = 'samsung.sg'

-- 5ii)
SELECT p.Pname, COUNT(pis.Sname) AS numShops
FROM ProductInShops pis, Products p 
WHERE
-- Join tables by Pname
pis.Pname = p.Pname AND
p.maker = 'samsung.sg' AND
pis.remarks = 'Selling'
GROUP BY p.Pname
