CREATE DATABASE Library;

CREATE TABLE Publishers
(
	PublisherID INT NOT NULL IDENTITY (1,1) PRIMARY KEY ,
	PublisherName VARCHAR(50) UNIQUE
);

CREATE TABLE Categories
(
	CategoryID INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
	CategoryName VARCHAR(50) UNIQUE
);

CREATE TABLE Authors
(
	AuthorID INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
	AuthorName VARCHAR(50) UNIQUE
);

CREATE TABLE Books
(
	BookID INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
    BookName VARCHAR(50) NOT NULL,
	AuthorID INT NOT NULL,
	PublisherID INT NOT NULL,
	CategoryID INT NOT NULL,
	Price INT NOT NULL,
	DiscountPercentage INT DEFAULT 0,
	CHECK (DiscountPercentage >= 0 AND DiscountPercentage <= 100),

CONSTRAINT FK_AuthorIDAuthors FOREIGN KEY (AuthorID)
REFERENCES Authors(AuthorID),

CONSTRAINT FK_PublisherIDPublishers FOREIGN KEY (PublisherID)
REFERENCES Publishers(PublisherID),

CONSTRAINT FK_CategoryIDCategoris FOREIGN KEY (CategoryID)
REFERENCES Categories(CategoryID),
);

ALTER TABLE Books ADD CONSTRAINT uq_Books UNIQUE(BookName, AuthorID)

CREATE TABLE Libraries 
(
	LibraryID INT NOT NULL IDENTITY (1,1)PRIMARY KEY,
	LibraryName VARCHAR(50),
	Location VARCHAR(100) NOT NULL
);

CREATE TABLE LibraryBooks
(
	LibraryID INT NOT NULL,
	BookID INT NOT NULL,

CONSTRAINT LibraryID_BookID_PK PRIMARY KEY (LibraryID, BookID),

CONSTRAINT FK_LibraryBooks FOREIGN KEY (BookID)
REFERENCES Books(BookID),

CONSTRAINT FK_BooksLibrary FOREIGN KEY (LibraryID)
REFERENCES Libraries(LibraryID)
);

CREATE TABLE Departaments
(
	DepartamentID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	DepartamentName VARCHAR(50),
	LibraryID INT,
	Location VARCHAR(50),
);

CREATE TABLE Employees
(
	EmployeeID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	WorkingLibraryID INT NOT NULL,
	FirstName VARCHAR(50) NOT NULL,
	MiddleName VARCHAR(50),
	LastName VARCHAR(50),
	WorkingDepartamentID INT,
	PhoneNumber VARCHAR(15),
	HireDate DATE,
	Job VARCHAR(50),
	Sex VARCHAR(10),
	BirthDate DATE,
	Salary DECIMAL(9,2),
	Bonus DECIMAL(9,2),

CONSTRAINT FK_WorkingLibraryID_Library FOREIGN KEY(WorkingLibraryID)
REFERENCES Libraries(LibraryID)
);

CREATE TABLE DepartamentsEmployees
(
	DepartamentID INT NOT NULL,
	EmployeeID INT NOT NULL,

CONSTRAINT FK_Departaments_Employees FOREIGN KEY (DepartamentID)
REFERENCES Departaments(DepartamentID),

CONSTRAINT FK_Employees_Departaments FOREIGN KEY (EmployeeID)
REFERENCES Employees(EmployeeID),
)

CREATE TABLE SoldBooks
(
	TransactionID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	BookID INT NOT NULL,
	DateSold DATETIME DEFAULT GETDATE(),

CONSTRAINT FK_SoldBookIDBookID FOREIGN KEY (BookID)
REFERENCES Books (BookID)
);

CREATE TABLE RefundedBooks
(
	TransactionID INT NOT NULL,
	BookID INT NOT NULL,
	DateRefund DATETIME DEFAULT GETDATE(),

CONSTRAINT FK_RefundedBookIDSoldBookID FOREIGN KEY (TransactionID)
REFERENCES SoldBooks(TransactionID),
);

CREATE TABLE HistoryLogs
(
	LogID INT IDENTITY(1,1) PRIMARY KEY,
	DateAndTime DATETIME DEFAULT GETDATE(),
	OperationType VARCHAR(50),
	AffectedTable VARCHAR(50),
	AffectedRow INT,
);

CREATE TABLE DeletedBooks
(
	BookID INT,
    BookName VARCHAR(50),
	AuthorID INT,
	PublisherID INT,
	CategoryID INT,
);

CREATE TABLE LoyalCustomers
(
	CustomerID INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
	CustomerFirstName VARCHAR (50) NOT NULL,
	CustomerMiddleName VARCHAR(50) DEFAULT ' ',
	CustomerLastName VARCHAR(50) NOT NULL,
	BirthDay DATE,
	Email VARCHAR(100),
	BookIDs INT,

CONSTRAINT FK_BookIDBookID FOREIGN KEY (BookIDs)
REFERENCES Books(BookID)
);




