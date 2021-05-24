USE Library;

UPDATE Authors
	SET AuthorName = 'Eric Emmanuel Schmitt'
	WHERE AuthorName = 'Eric Schmit' OR AuthorID = 13

UPDATE Authors	
	SET AuthorName = 'Eugene Ionesco'
	WHERE AuthorID = 13

UPDATE Authors
	SET AuthorName = 'Johann Wolfgang von Goethe'
	WHERE AuthorID = 5 AND AuthorName = 'Goethe';

DELETE FROM Publishers
	WHERE PublisherID = 9;

INSERT INTO Publishers
	VALUES
	(12, 'Paideia')

SELECT AuthorID, BookName FROM Books
UNION
SELECT AuthorID, AuthorName FROM Authors
ORDER BY AuthorID;

SELECT AuthorID
FROM Books
INTERSECT
SELECT AuthorID
FROM Authors

SELECT AuthorID  
FROM Authors
EXCEPT  
SELECT AuthorID 
FROM Books;

SELECT Books.Authorid, Books.BookName, Authors.AuthorName
FROM Books
INNER JOIN Authors
ON Books.AuthorID = Authors.AuthorID;

SELECT Books.AuthorID, Books.BookName
FROM Books
LEFT JOIN Authors ON Books.AuthorID = Authors.AuthorID
ORDER BY AuthorID;

SELECT Authors.AuthorID, Authors.AuthorName
FROM Authors
RIGHT JOIN Books
ON Authors.AuthorID = Books.AuthorID;

SELECT Authors.AuthorID, Authors.AuthorName
FROM Authors
FULL OUTER JOIN Books
ON Authors.AuthorID = Books.AuthorID

SELECT Books.AuthorID, Books.BookName, Books.PublisherID
FROM Books
WHERE AuthorID IN (1, 2, 3, 4, 5);

SELECT BookName
FROM Books
WHERE EXISTS
(SELECT AuthorID FROM Authors WHERE Books.AuthorID = 1 OR Books.AuthorID = 2);

SELECT *
FROM Authors
WHERE Authors.AuthorID <= 10
ORDER BY AuthorID DESC;

SELECT COUNT (PublisherID) Nr_Books_By_Publisher_ID
FROM Books
GROUP BY PublisherID

SELECT COUNT (BookID) BookID
FROM Books
GROUP BY PublisherID
HAVING COUNT (BookID) < 7;

SELECT COUNT (BookID) BookID_By_PublisherID
FROM Books
GROUP BY PublisherID
HAVING COUNT (BookID) < 4;

SELECT Libraries.LibraryID, Libraries.LibraryName, Books.BookName
FROM Libraries
LEFT OUTER JOIN LibraryBooks 
ON Libraries.LibraryID = LibraryBooks.LibraryID
LEFT OUTER JOIN Books
ON  LibraryBooks.BookID = Books.BookID

