CREATE DATABASE CinemaDb

USE CinemaDb

CREATE TABLE Actors(
	Id int primary key identity,
	FullName nvarchar(100)
)

CREATE TABLE Movies(
	Id int primary key identity,
	Name nvarchar(100)
)

CREATE TABLE Genres(
	Id int primary key identity,
	Type nvarchar(50)
)

CREATE TABLE MovieActor(
	Id int primary key identity,
	ActorsId int references Actors(Id),
	MoviesId int references Movies(Id)
)

CREATE TABLE MovieGenre(
	Id int primary key identity,
	MoviesId int references Movies(Id),
	GenresId int references Genres(Id)
)

CREATE TABLE Customers(
	Id int primary key identity,
	FullName nvarchar(100)
)

CREATE TABLE Halls(
	Id int primary key identity,
	Name nvarchar(50)
)

CREATE TABLE Sessions(
	Id int primary key identity,
	Time datetime,
	MoviesId int references Movies(Id),
	HallsId int references Halls(Id)
)

CREATE TABLE Ticket(
	Id int primary key identity,
	SessionsId int references Sessions(Id),
	CustomersId int references Customers(Id)
)

INSERT INTO Actors
VALUES('Actor A'),
	  ('Actor B'),
	  ('Actor C'),
	  ('Actor D')

INSERT INTO Movies
VALUES('Movie 1'),
	  ('Movie 2'),
	  ('Movie 3')

INSERT INTO Genres
VALUES('Genre 1'),
	  ('Genre 2')

INSERT INTO MovieActor
VALUES(1,4),
	  (2,1),
	  (3,2),
	  (4,3)

INSERT INTO MovieGenre
VALUES(2,1),
	  (3,2),
	  (1,1)

INSERT INTO Customers
VALUES('Customer 1'),
	  ('Customer 2'),
	  ('Customer 3'),
	  ('Customer 4'),
	  ('Customer 5')

INSERT INTO Halls
VALUES('Hall 1'),
	  ('Hall 2'),
	  ('Hall 3')

INSERT INTO Sessions
VALUES(10,2,3),
	  (6,1,2),
	  (8,1,3)

INSERT INTO Ticket
VALUES(4,2),
	  (3,1),
	  (1,1),
	  (5,3)

	  
CREATE VIEW v_GetCinemaInfo
AS 
SELECT SessionsId,CustomersId,GenresId,HallsId,MoviesId FROM Ticket t

JOIN Customers c
ON c.Id = t.CustomersId

JOIN Sessions s
ON t.SessionsId= s.Id

JOIN Movies m
ON t.SessionsId = m.Id

JOIN MovieGenre mg
ON m.Id = mg.MoviesId

JOIN Genres g
ON g.Id = mg.GenresId

JOIN Halls h
ON h.Id = s.HallsId	
