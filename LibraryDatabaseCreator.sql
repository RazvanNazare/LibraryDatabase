CREATE DATABASE Library;

/*
USE Library; 
*/

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

	CONSTRAINT FK_AuthorIDAuthors FOREIGN KEY (AuthorID)
    REFERENCES Authors(AuthorID),

	CONSTRAINT FK_PublisherIDPublishers FOREIGN KEY (PublisherID)
    REFERENCES Publishers(PublisherID),

	CONSTRAINT FK_CategoryIDCategoris FOREIGN KEY (CategoryID)
    REFERENCES Categories(CategoryID)
);
ALTER TABLE Books ADD CONSTRAINT uq_Books UNIQUE(BookName, AuthorID)

CREATE TABLE Library_Books
(
	LibraryID INT NOT NULL PRIMARY KEY,
	BookID INT NOT NULL,
	CONSTRAINT FK_LibraryBooks FOREIGN KEY (LibraryID)
	REFERENCES Books(BookID)
);

CREATE TABLE Libraries 
(
	LibraryID INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
	LibraryName VARCHAR(50),
	Location VARCHAR(100) NOT NULL
	CONSTRAINT FK_LibrariesBooks FOREIGN KEY (LibraryID)
    REFERENCES Library_Books (LibraryID)

);

CREATE TABLE HistoryLogs
(
	LogID INT IDENTITY(1,1) PRIMARY KEY,
	DateAndTime DATETIME DEFAULT GETDATE(),
	OperationType VARCHAR(50),
	AffectedTable VARCHAR(50),
	AffectedRow INT,
);

INSERT INTO Publishers
	VALUES 
	('Polirom'),
	('Nemira'),
	('Biblioteca Adevarul'),
	('Biblioteca pentru toti'),
	('Cartea rusa'),
	('Niculescu'),
	('Noi Media Print'),
	('Nominatrix'),
	('Orizonturi'),
	('Ortodoxia'),
	('Oscar Print'),
	('Paideia'),
	('Art'),
	('TANA'),
	('Humanitas'),
	('Versant')

INSERT INTO Authors
	VALUES 
	('Mircea Eliade'),
	('Mihail Drumes'),
	('Feodor Dostoievski'),
	('Lev Nicolaevici Tolstoi'),
	('Goethe'),
	('Nikolai Gogol'),
	('Napoleon Hill'),
	('Dale Carnagie'),
	('Lucian Blaga'),
	('Giovanni Papini'),
	('Umberto Eco'),
	('Viktor Frankl'),
	('Eugene'),
	('Eric Schmit')

INSERT INTO Categories
	VALUES
	('Comedy'),
	('Tragedy'),
	('Children'),
	('Classic'),
	('Epic'),
	('Folklore'),
	('Historical'),
	('Philosophical'),
	('Religious'),
	('Fantasy'),
	('Romance'),
	('Science fiction'),
	('Academic'),
	('Personal Biography')

INSERT INTO Books
	VALUES
	('Invitatie la vals', 2, 13, 11),
	('Nunta in cer', 1, 14, 11),
	('Anna Karenina', 4, 1, 4),
	('Crima si pedeapsa', 3, 1 ,4 ),
	('Fratii Karamazov', 3, 1, 4 ),
	('Suferintele tanarului Werther', 5, 4, 11),
	('Domnul Ibrahim si florile din Coran', 14, 15, 4),
	('Romanul adolescentului miop', 1, 4, 14),
	('Omul in cautarea sensului vietii', 12, 16, 14),
	('Hronicul si cantecul varstelor', 9, 15, 14)
