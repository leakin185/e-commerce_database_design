--To ensure that there can be no products selling at negative prices
CREATE ASSERTION nonegativeprices
CHECK( NOT EXISTS(
    SELECT * FROM ProductInShops AS p
    WHERE p.sprice < 0
))

--To ensure that there can be no products selling above $10 000, for preventing money laundering purposes, for example
CREATE ASSERTION nopricesabove
CHECK(

    NOT EXISTS(
        SELECT * FROM ProductInShops AS p
        WHERE p.sprice > 10000
    )
)

--To ensure that no salary for employees can be negative 
CREATE ASSERTION nonegativesalary
CHECK(
    NOT EXISTS(
        SELECT * FROM Employees AS e
        WHERE e.salary < 0
    )
)

--To ensure that ratings cannot be above 5, and/or below 0
CREATE ASSERTION ratingscheck
CHECK(
    NOT EXISTS(
        SELECT * FROM Feedback AS f
        WHERE f.rating > 5 OR f.rating < 0
    )
)