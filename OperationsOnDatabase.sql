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
	WHERE PublisherID = 12;

INSERT INTO Publishers
	VALUES
	(12, 'Paideia')

SELECT AuthorID, BookName FROM Books
UNION
SELECT AuthorID, AuthorName FROM Authors
ORDER BY AuthorID;
/*
This does not make logical sense but I wanted only to display the "UNION" function
*/

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
/*
Display authors without books in library
*/

SELECT Books.Authorid, Books.BookName, Authors.AuthorName
FROM Books
INNER JOIN Authors
ON Books.AuthorID = Authors.AuthorID;
/*
For every books display its BookName and AuthorName
*/

SELECT Books.AuthorID, Books.BookName
FROM Books
LEFT JOIN Authors ON Books.AuthorID = Authors.AuthorID
ORDER BY AuthorID;
/*
For every author that has a book display his/her AuthorID and its BookName
*/

SELECT Authors.AuthorID, Authors.AuthorName
FROM Authors
RIGHT JOIN Books
ON Authors.AuthorID = Books.AuthorID;
/*
For every author that has at least a books display his/her AuthorID and AuthorName
*/

SELECT Authors.AuthorID, Authors.AuthorName
FROM Authors
FULL OUTER JOIN Books
ON Authors.AuthorID = Books.AuthorID
/*
Display AuthorID and AuthorName for every book they had written, they could appear more than once
*/

SELECT Books.AuthorID, Books.BookName, Books.PublisherID
FROM Books
WHERE AuthorID IN (1, 2, 3, 4, 5);
/*
Display all books that are written by authors with id 1, 2, 3, 4 or 5
*/

SELECT BookName
FROM Books
WHERE EXISTS
(SELECT AuthorID FROM Authors WHERE Books.AuthorID = 1 OR Books.AuthorID = 2);
/*
Similar to the previous
*/

SELECT *
FROM Authors
WHERE Authors.AuthorID <= 10
ORDER BY AuthorID DESC;
/*
Display all authors with id less or equal than 10 in decreasing order
*/

SELECT COUNT (PublisherID) Nr_Books_By_Publisher_ID
FROM Books
GROUP BY PublisherID
/*
Intuitive
*/

SELECT COUNT (BookID) BookID
FROM Books
GROUP BY PublisherID
HAVING COUNT (BookID) < 7;
/*
Display how many books has every of our publishers, with BookID less than 7
*/

SELECT COUNT (BookID) BookID_By_PublisherID
FROM Books
GROUP BY PublisherID
HAVING COUNT (BookID) < 4;
/*
Intuitive
*/
