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
CREATE TABLE ProductInShops
(
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
    Sprice DECIMAL(10,2) NOT NULL,
    remarks VARCHAR(255) NOT NULL DEFAULT('Selling') CHECK(remarks ='Not Selling' OR remarks = 'Selling')
);


--PriceHistory
CREATE TABLE PriceHistory
(
    PRIMARY KEY (SPID, startDate, endDate),
    UNIQUE (Pname, Sname, startDate, endDate),
    CONSTRAINT fk_PriceHistory_SPID FOREIGN KEY (SPID) REFERENCES ProductInShops(SPID) ON UPDATE NO ACTION,-- I can't declare it as CASCADE policy. What to do on Delete?
    CONSTRAINT fk_PriceHistory_PSname FOREIGN KEY (Pname, Sname) REFERENCES ProductInShops(Pname, Sname) ON UPDATE NO ACTION,
    -- I can't declare it as CASCADE policy. What to do on Delete?

    id INT NOT NULL IDENTITY(1,1),
    SPID INT NOT NULL,
    startDate DATE NOT NULL DEFAULT Convert(date, GETDATE()),
    endDate DATE NOT NULL DEFAULT '9999-12-31',
    price DECIMAL(10,2) NOT NULL,
    Pname VARCHAR(255) NOT NULL,
    Sname VARCHAR(255) NOT NULL,
    CHECK (endDate > startDate)
);

-- EMPLOYEES
CREATE TABLE Employees
(
    ID INT NOT NULL IDENTITY(1,1),
    PRIMARY KEY(ID),
    Name varchar(255) NOT NULL,
    Salary int NOT NULL
);

-- Users
CREATE TABLE Users
(
    PRIMARY KEY(UserID),
    UserID INT NOT NULL IDENTITY (1,1),
    Uname VARCHAR(255) NOT NULL,
);

-- Order
CREATE TABLE Orders
(
    PRIMARY KEY (OID),
    UNIQUE (UserID, date_time),
    FOREIGN KEY (UserID) REFERENCES Users (UserID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,

    OID INT NOT NULL IDENTITY (1,1),
    date_time DATE NOT NULL,
    UserID INT NOT NULL,
    shipping_address VARCHAR (225) NOT NULL
);

CREATE TABLE ProductInOrders
(
    PRIMARY KEY (OPID),
    UNIQUE (orderID, SPID),
    FOREIGN KEY (SPID) REFERENCES ProductInShops(SPID)
	ON UPDATE CASCADE,
    FOREIGN KEY (orderID) REFERENCES Orders (OID)
	ON DELETE NO ACTION
    ON UPDATE CASCADE,

    OPID INT NOT NULL,
    Oprice DECIMAL(10,2),
    Oquantity INT,
    orderStatus VARCHAR(15) CHECK (orderStatus IN('being processed', 'shipped', 'delivered', 'returned')),
    deliverDate DATE,
    orderID INT,
    SPID INT
);

-- Feedback (Pending for Product in Order 1 to load in) 
-- CREATE TABLE Feedback (
--     PRIMARY KEY (UserID, OPID)
--     FOREIGN KEY (UserID) REFERENCES Users(UserID)
--     ON DELETE CASCADE
--     ON UPDATE CASCADE,
--     FOREIGN KEY (OPID) REFERENCES ProductInOrders1(OPID)
--     ON DELETE CASCADE
--     ON UPDATE CASCADE,

--     UserID INT NOT NULL,
--     OPID INT NOT NULL,
--     rating INT NOT NULL
--     date_time DATE NOT NULL,
--     comment varchar(255) NOT NULL,
-- );

--Complaints
Create TABLE Complaints(
	Primary KEY (ComplaintID),
	UNIQUE(filed_date_time, UserID),
	FOREIGN KEY(EmployeeID) REFERENCES Employees(ID)
    ON  DELETE CASCADE
	ON UPDATE CASCADE,
	FOREIGN KEY(UserID) REFERENCES Users(UserID)
    ON  DELETE CASCADE
	ON UPDATE CASCADE,

	ComplaintID INT Not NULL Identity(1,1),
	text varchar (255) NOT NULL,
	filed_date_time DATETIME NOT NULL DEFAULT Convert(datetime, GETDATE(),3),
	status varchar(225) NOT NULL,
	EmployeeID INT,
	UserID INT NOT NULL,
    handled_date_time DATETIME DEFAULT Convert(datetime, GETDATE()),
	CHECK (handled_date_time > filed_date_time)
);

Create TABLE ComplaintsOnShops(
	Primary KEY (ComplaintID),
	UNIQUE(filed_date_time, UserID),
	FOREIGN KEY(ComplaintID) REFERENCES Complaints(ComplaintID)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	FOREIGN KEY(ShopName) REFERENCES Shops(name)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	FOREIGN KEY (filed_date_time, UserID) REFERENCES Complaints(filed_date_time, UserID)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION,

	ComplaintID INT Not NULL,
	filed_date_time DATETIME NOT NULL DEFAULT Convert(datetime, GETDATE()),
	ShopName varchar(255) Not NULL,
	UserID INT NOT NULL,
);

Create TABLE ComplaintsOnOrders(
	Primary KEY (ComplaintID),
	UNIQUE(filed_date_time, UserID),
	FOREIGN KEY(ComplaintID) REFERENCES Complaints(ComplaintID)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	FOREIGN KEY(OID) REFERENCES Orders(OID),
--	ON DELETE CASCADE	--there's some multiple cascade problems causing error
--	ON UPDATE CASCADE,
--	FOREIGN KEY (filed_date_time, UserID) REFERENCES Complaints(filed_date_time, UserID)	--Problem with using this
--	ON DELETE NO ACTION
--	ON UPDATE NO ACTION,

	ComplaintID INT NOT NULL,
	filed_date_time DATETIME NOT NULL DEFAULT Convert(datetime, GETDATE()),
	OID INT NOT NULL,
	UserID INT NOT NULL,
);