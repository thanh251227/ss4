CREATE DATABASE CinemaManagement;
USE CinemaManagement;
CREATE TABLE Movies (
    MovieId VARCHAR(10) PRIMARY KEY,
    MovieTitle VARCHAR(100) NOT NULL,
    Genre VARCHAR(50),
    Duration INT
);
CREATE TABLE Customers (
    CustomerId VARCHAR(10) PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(15) UNIQUE,
    BirthYear INT
);
CREATE TABLE Tickets (
    MovieId VARCHAR(10),
    CustomerId VARCHAR(10),
    ShowDate DATE,
    Price DECIMAL(10,2),

    PRIMARY KEY (MovieId, CustomerId),
    FOREIGN KEY (MovieId) REFERENCES Movies(MovieId),
    FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId)
);
INSERT INTO Movies VALUES
('P01', 'ATicketsngers: Endgame', 'Hanh Dong', 180),
('P02', 'The Notebook', 'Tinh Cam', 120),
('P03', 'Spider-Man: No Way Home', 'Hanh Dong', 150);
INSERT INTO Customers VALUES
('KH01', 'Nguyen Van Tuan', '0912345678', 1995),
('KH02', 'Tran Thi Hoa', '0923456789', 2000),
('KH03', 'Le Van Nam', '0934567890', 1998),
('KH04', 'Pham Thi Lan', '0945678901', 2002),
('KH05', 'Hoang Van Binh', '0956789012', 1990);
INSERT INTO Tickets VALUES
('P01', 'KH01', '2023-11-01', 100000),
('P01', 'KH02', '2023-11-01', 100000),
('P02', 'KH01', '2023-11-02', 80000),
('P03', 'KH02', '2023-11-03', 90000),
('P03', 'KH03', '2023-11-03', 90000),
('P01', 'KH04', '2023-11-05', 100000),
('P02', 'KH05', '2023-11-06', 80000);
UPDATE Movies
SET Duration = 130
WHERE MovieId = 'P02';
UPDATE Tickets
SET Price = 50000
WHERE MovieId = 'P02' AND CustomerId = 'KH01';
DELETE FROM Tickets
WHERE MovieId = 'P02' AND CustomerId = 'KH05';
SELECT MovieId, MovieTitle
FROM Movies
WHERE Genre = 'Hanh Dong';
SELECT MovieId, CustomerId, ShowDate
FROM Tickets
WHERE Price >= 100000;
SELECT *
FROM Customers
WHERE FullName LIKE '%Van%';
SELECT MovieId, CustomerId, ShowDate, Price
FROM Tickets
ORDER BY ShowDate ASC;
