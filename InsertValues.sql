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
	('Invitatie la vals', 2, 13, 11, 20, ' '),
	('Nunta in cer', 1, 14, 11, 20, ' '),
	('Anna Karenina', 4, 1, 4, 50, ' '),
	('Crima si pedeapsa', 3, 1 ,4 , 20, ' ' ),
	('Fratii Karamazov', 3, 1, 4, 20, ' '),
	('Suferintele tanarului Werther', 5, 4, 11 , 22, ' '),
	('Domnul Ibrahim si florile din Coran', 14, 15, 4 , 15, ' '),
	('Romanul adolescentului miop', 1, 4, 14, 20, ' '),
	('Omul in cautarea sensului vietii', 12, 16, 14, 25, ' '),
	('Hronicul si cantecul varstelor', 9, 15, 14, 21, ' ')

INSERT INTO Libraries
	VALUES
	('GoodBooks', 'Street "Mantuleasa" No 30'),
	('Central Library', 'Street "Nevski Prospect" No 20')

INSERT INTO LibraryBooks (LibraryID, BookID)
	VALUES
		(1,1),
		(1,2),
		(1,3),
		(1,4),
		(1,5),
		(1,6),
		(1,7),
		(1,8),
		(1,9),
		(1,10),
		(2,1),
		(2,2),
		(2,3),
		(2,4),
		(2,5)