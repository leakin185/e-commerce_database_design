-- Removal of Product
CREATE TRIGGER not_selling_ProductInShops
ON ProductInShops
AFTER UPDATE
AS
BEGIN
	UPDATE PriceHistory set endDate = Convert(date, GETDATE())
	FROM PriceHistory ph
	INNER JOIN inserted i on ph.SPID = i.SPID AND ph.endDate = '9999-12-31' AND
	i.remarks = 'Not Selling'
END

GO
-- New entry
CREATE TRIGGER new_insert_ProductInShops

ON ProductInShops
AFTER INSERT
AS
BEGIN
	DECLARE @spid INT
	DECLARE @pname VARCHAR(255)
	DECLARE @sname VARCHAR(255)
	DECLARE @sprice DECIMAL(10,2)

	SELECT @spid = i.SPID, @pname = i.Pname, @sname = i.Sname, @sprice = i.Sprice
	FROM inserted i
	INSERT INTO PriceHistory
	VALUES(@spid, default, default, @sprice, @pname, @sname)
	

END

GO
-- Update of Price

CREATE TRIGGER update_new_price_ProductInShops

ON ProductInShops
AFTER UPDATE
AS
IF(UPDATE(sprice))
BEGIN
	DECLARE @spid INT
	DECLARE @pname VARCHAR(255)
	DECLARE @sname VARCHAR(255)
	DECLARE @sprice DECIMAL(10,2)

	SELECT @spid = i.SPID, @pname = i.Pname, @sname = i.Sname, @sprice = i.Sprice
	FROM inserted i
	
	UPDATE PriceHistory set endDate = DATEADD(day, -1, CAST(GETDATE() AS date))
	WHERE SPID = @spid AND endDate = '9999-12-31'

	INSERT INTO PriceHistory
	VALUES(@spid, default, default, @sprice, @pname, @sname)
	

END