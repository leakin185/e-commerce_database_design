-- CREATION
-- Products
CREATE TABLE Products
(
PRIMARY KEY(Pname),
id INT NOT NULL IDENTITY(1,1),
Pname VARCHAR(255),
Maker VARCHAR(255),
Category VARCHAR(255),
);

-- Shops
CREATE TABLE Shops
(
PRIMARY KEY(name),
id INT NOT NULL identity(1,1),
name VARCHAR(255),
);


-- ProductInShops
CREATE TABLE ProductInShops(
    PRIMARY KEY(SPID),
    UNIQUE(Pname, Sname),
	FOREIGN KEY(Pname) REFERENCES Products(Pname)
    ON DELETE CASCADE
    ON UPDATE CASCADE,

    FOREIGN KEY(Sname) REFERENCES Shops(name)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    


    SPID INT NOT NULL IDENTITY (1,1),
    Pname VARCHAR(255) NOT NULL,
    Sname VARCHAR(255) NOT NULL,
    Squantity INT NOT NULL,
	Sprice INT NOT NULL,
);


--PriceHistory
CREATE TABLE PriceHistory(
    PRIMARY KEY (SPID, startDate, endDate),
    UNIQUE (Pname, Sname, startDate, endDate),
    CONSTRAINT fk_PriceHistory_SPID FOREIGN KEY (SPID) REFERENCES ProductInShops(SPID) ON UPDATE NO ACTION,-- I can't declare it as CASCADE policy. What to do on Delete?
	CONSTRAINT fk_PriceHistory_PSname FOREIGN KEY (Pname, Sname) REFERENCES ProductInShops(Pname, Sname) ON UPDATE NO ACTION, -- I can't declare it as CASCADE policy. What to do on Delete?

	id INT NOT NULL IDENTITY(1,1),
    SPID INT NOT NULL, 
    startDate DATE NOT NULL,
    endDate DATE NOT NULL DEFAULT '9999-12-31',
    price REAL NOT NULL,
    Pname VARCHAR(255) NOT NULL,
    Sname VARCHAR(255) NOT NULL,    

	CHECK (endDate > startDate)
    );




