CREATE DATABASE Library;

/*
USE Library;

USE master ;  
GO  
DROP DATABASE Library;  
GO  
*/

CREATE TABLE Publishers
(
	PublisherID int NOT NULL PRIMARY KEY,
	PublisherName varchar(50)
);

CREATE TABLE Categories
(
	CategoryID int NOT NULL PRIMARY KEY,
	CategoryName varchar(50)
);

CREATE TABLE Authors
(
	AuthorID int NOT NULL PRIMARY KEY,
	AuthorName varchar(50)
);

CREATE TABLE Books
(
	BookID int NOT NULL PRIMARY KEY,
    BookName varchar(50) NOT NULL,
	AuthorID int NOT NULL,
	PublisherID int NOT NULL,
	CategoryID int NOT NULL,

	CONSTRAINT FK_AuthorIDAuthors FOREIGN KEY (AuthorID)
    REFERENCES Authors(AuthorID),

	CONSTRAINT FK_PublisherIDPublishers FOREIGN KEY (PublisherID)
    REFERENCES Publishers(PublisherID),

	CONSTRAINT FK_CategoryIDCategoris FOREIGN KEY (CategoryID)
    REFERENCES Categories(CategoryID)
);

CREATE TABLE Library_Books
(
	LibraryID int NOT NULL PRIMARY KEY,
	BookID int NOT NULL,
	CONSTRAINT FK_LibraryBooks FOREIGN KEY (LibraryID)
	REFERENCES Books(BookID)
);

CREATE TABLE Libraries 
(
	LibraryID int NOT NULL PRIMARY KEY,
	LibraryName varchar(50),
	Location varchar(100) NOT NULL
	CONSTRAINT FK_LibrariesBooks FOREIGN KEY (LibraryID)
    REFERENCES Library_Books (LibraryID)

);

INSERT INTO Publishers
	VALUES 
	(1,'Polirom'),
	(2, 'Nemira'),
	(3, 'Biblioteca Adevarul'),
	(4, 'Biblioteca pentru toti'),
	(5, 'Cartea rusa'),
	(6, 'Niculescu'),
	(7, 'Noi Media Print'),
	(8, 'Nominatrix'),
	(9, 'Orizonturi'),
	(10, 'Ortodoxia'),
	(11, 'Oscar Print'),
	(12, 'Paideia'),
	(13, 'Art'),
	(14, 'TANA'),
	(15, 'Humanitas'),
	(16, 'Versant')

INSERT INTO Authors
	VALUES 
	(1, 'Mircea Eliade'),
	(2, 'Mihail Drumes'),
	(3, 'Feodor Dostoievski'),
	(4, 'Lev Nicolaevici Tolstoi'),
	(5, 'Goethe'),
	(6, 'Nikolai Gogol'),
	(7, 'Napoleon Hill'),
	(8, 'Dale Carnagie'),
	(9, 'Lucian Blaga'),
	(10, 'Giovanni Papini'),
	(11, 'Umberto Eco'),
	(12, 'Viktor Frankl'),
	(13, 'Eugene'),
	(14, 'Eric Schmit')

INSERT INTO Categories
	VALUES
	(1, 'Comedy'),
	(2, 'Tragedy'),
	(3, 'Children'),
	(4, 'Classic'),
	(5, 'Epic'),
	(6, 'Folklore'),
	(7, 'Historical'),
	(8, 'Philosophical'),
	(9, 'Religious'),
	(10, 'Fantasy'),
	(11, 'Romance'),
	(12, 'Science fiction'),
	(13, 'Academic'),
	(14, 'Personal Biography')

INSERT INTO Books
	VALUES
	(1, 'Invitatie la vals', 2, 13, 11),
	(2, 'Nunta in cer', 1, 14, 11),
	(3, 'Anna Karenina', 4, 1, 4),
	(4, 'Crima si pedeapsa', 3, 1 ,4 ),
	(5, 'Fratii Karamazov', 3, 1, 4 ),
	(6, 'Suferintele tanarului Werther', 5, 4, 11),
	(7, 'Domnul Ibrahim si florile din Coran', 14, 15, 4),
	(8, 'Romanul adolescentului miop', 1, 4, 14),
	(9, 'Omul in cautarea sensului vietii', 12, 16, 14),
	(10, 'Hronicul si cantecul varstelor', 9, 15, 14)





