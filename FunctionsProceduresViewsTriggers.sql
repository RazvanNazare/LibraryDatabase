USE Library;

CREATE FUNCTION IsCategoryWantedComedy (@CategoryWanted varchar(50))
RETURNS BIT 
AS
BEGIN

	DECLARE @IsCategoryComedy BIT;

	IF (@CategoryWanted = 'Comedy')
			BEGIN
				SET @IsCategoryComedy = 1;
			END
	ELSE
		BEGIN
			SET @IsCategoryComedy = 0;
		END

	RETURN @IsCategoryComedy;
END
GO

CREATE FUNCTION IsPublisherPolirom(@PublisherWanted VARCHAR(50))
RETURNS BIT 
AS
BEGIN
	DECLARE @IsPublisherPolirom bit;
	IF (@PublisherWanted = 'Polirom')
			BEGIN
				SET @IsPublisherPolirom = 1
			END
	ELSE
		BEGIN
			SET @IsPublisherPolirom = 0
		END
	RETURN @IsPublisherPolirom;
END
GO

CREATE PROCEDURE AddComedyPoliromBook (@BookID INT, @BookName varchar(50), @AuthorID INT, @PublisherID INT, @CategoryID INT)
AS
BEGIN

	DECLARE @CategoryName varchar(50);
	SET @CategoryName = (SELECT CategoryName FROM Categories WHERE CategoryID = @CategoryID)
	DECLARE @PublisherName varchar(50);
	SET @PublisherName = (SELECT PublisherName FROM Publishers WHERE PublisherID = @PublisherID)

	IF dbo.IsCategoryWantedComedy(@CategoryName) = 1 AND dbo.IsPublisherPolirom(@PublisherName) = 1
	BEGIN
		INSERT INTO Books (BookID, BookName, AuthorID, PublisherID, CategoryID)
			VALUES (@BookID, @BookName, @AuthorID, @PublisherID, @CategoryID);
		PRINT 'Comedy polirom book has been added successfully.';
		SELECT * FROM Books
	END
	ELSE
	BEGIN
		PRINT 'The book cannot be added, it is not comedy or polirom';
	END
END
GO

CREATE PROCEDURE DeleteBook (@BookID INT, @BookName VARCHAR(50), @AuthorID INT, @PublisherID INT, @CategoryID INT)
AS
BEGIN
	DELETE FROM Books WHERE @BookID = BookID;
	INSERT INTO DeletedBooks (BookID, BookName, AuthorID, PublisherID, CategoryID)
		VALUES (@BookID, @BookName, @AuthorID, @PublisherID, @CategoryID)
END
GO

CREATE VIEW BooksDetails
AS
	SELECT B.BookName, A.AuthorName, P.PublisherName, C.CategoryName
	FROM Books B 
	INNER JOIN Authors A on B.AuthorID = A.AuthorID
	INNER JOIN Publishers P on B.PublisherID = P.PublisherID
	INNER JOIN Categories C on B.CategoryID = C.CategoryID
GO

CREATE TRIGGER AddAuthorName ON Authors
FOR INSERT 
AS
BEGIN
	SELECT AuthorID, AuthorName
	FROM Authors;
	INSERT INTO HistoryLogs(DateAndTime, OperationType, AffectedTable, AffectedRow)
		VALUES 
			(GETDATE(), 'INSERT', 'AuthorName', @@ROWCOUNT)
END
GO

CREATE TRIGGER UpdateBooks ON Books
FOR UPDATE
AS
BEGIN
	INSERT INTO HistoryLogs(DateAndTime, OperationType, AffectedTable, AffectedRow)
	VALUES (GETDATE(), 'UPDATE', 'Libraries', @@ROWCOUNT)
	SELECT * FROM Books
END
GO

CREATE TRIGGER DontDeleteCategories ON Categories
INSTEAD OF DELETE
AS
BEGIN
	PRINT 'You do not have the permission to delete a category.'
	INSERT INTO HistoryLogs(DateAndTime, OperationType, AffectedTable, AffectedRow)
	VALUES (GETDATE(), 'DELETE', 'Categories', @@ROWCOUNT)
END
GO
