create database E_Library;

use E_Library; 

CREATE TABLE Member (
    MemberID Varchar(50) PRIMARY KEY,
    Contact_Number VARCHAR(20),
    First_Name VARCHAR(20),
    Last_Name VARCHAR(20),
    Total_Due_Amount DECIMAL(10,2)
);

CREATE TABLE Room_Booking (
    BookingID Varchar(50) PRIMARY KEY,
    MemberID Varchar(50),
    Room_Number VARCHAR(255),
    Check_in_Date DATE,
    Check_out_Date DATE,
    FOREIGN KEY (MemberID) REFERENCES Member(MemberID)
);

CREATE TABLE Publisher (
    PublisherID Varchar(50) PRIMARY KEY,
    Publisher_Name VARCHAR(20),
    Address VARCHAR(20)
);

CREATE TABLE Author (
    AuthorID Varchar(50) PRIMARY KEY,
    Author_Name VARCHAR(20),
    Contact_Number VARCHAR(20)
);

CREATE TABLE AuthorCollabPublisher (
    CollabID Varchar(50) PRIMARY KEY,
    PublisherID Varchar(50),
    AuthorID Varchar(50),
    FOREIGN KEY (PublisherID) REFERENCES Publisher (PublisherID),
    FOREIGN KEY (AuthorID) REFERENCES Author (AuthorID)
);


CREATE TABLE Book (
    ISBN INT PRIMARY KEY,
    Title VARCHAR(255),         
    Description VARCHAR(255),
    Genre VARCHAR(30),           -- Specified data type for Genre
    PublisherID Varchar(50),
    Price DECIMAL(10, 2),        -- Using DECIMAL for price
    Category VARCHAR(255),
    FOREIGN KEY (PublisherID) REFERENCES Publisher(PublisherID)
);

CREATE TABLE AuthorWriteBook (
    AuthorWriteID Varchar(50) PRIMARY KEY,
    AuthorID Varchar(50),
    ISBN INT,
    FOREIGN KEY (AuthorID) REFERENCES Author (AuthorID),
    FOREIGN KEY (ISBN) REFERENCES Book (ISBN)
);

CREATE TABLE Copy (
    CopyID Varchar(50) PRIMARY KEY,
    ISBN INT,
    Status VARCHAR(20),
    FOREIGN KEY (ISBN) REFERENCES Book (ISBN)
);

CREATE TABLE Loan (
    LoanID Varchar(50) PRIMARY KEY,
    MemberID Varchar(50),
    CopyID Varchar(50),
    Loan_Date DATE,
    Return_Date DATE,
    FOREIGN KEY (MemberID) REFERENCES Member (MemberID),
    FOREIGN KEY (CopyID) REFERENCES Copy (CopyID)
);

CREATE TABLE MemberReserveBook (
    ReserveBookID Varchar(50) PRIMARY KEY,
    MemberID Varchar(50),
    ISBN INT,
    Reserve_Date DATE,
    FOREIGN KEY (MemberID) REFERENCES Member (MemberID),
    FOREIGN KEY (ISBN) REFERENCES Book (ISBN)
);

Insert into Author values
('A01', 'Douglas Adam', '0105355313'),
('A02', 'Mitch Albom', '0125674398'),
('A03', 'Maggie Alderson', '0176543897'),
('A04', 'Todd Alexander', '0132451679'),
('A05', 'Pamela Allen', '0187659346'),
('A06', 'Lauren Asher', '0168349806'),
('A07', 'Kate Atkinson', '0112254779'),
('A08', 'Jane Austen', '0166328970'),
('A09', 'Meredith Badger', '0132665789'),
('A10', 'Tessa Bailey', '0198872345'),
('A11', 'David Baldacci', '0133216789'),
('A12', 'Ash Barty', '0154761233'),
('A13', 'Graeme Base', '0168431211'),
('A14', 'Johanna Basford', '0166534998'),
('A15', 'Maeve Bichy', '0133216780'),
('A16', 'Aaron Blabey', '0109945672'),
('A17', 'Nick Bland', '0167201292'),
('A18', 'Enid Blyton', '0145612398'),
('A19', 'Ray Bradbury', '0183946572'),
('A20', 'Michelle Bridges', '0129460186');

Insert into Publisher values
('P01', 'K.Vince', 'Petaling Jaya'),
('P02', 'P.Golden', 'Kepong'),
('P03', 'C.Happy', 'Subang Jaya'),
('P04', 'D.Richards', 'Alor Setar'),
('P05', 'M.Nancy', 'Kuala Lumpur'),
('P06', 'R.Penny', 'Sungai Besi'),
('P07', 'S.Sasha', 'Kepong'),
('P08', 'W.Candy', 'Petaling Jaya'),
('P09', 'K.Wallace', 'Kuala Lummpur'),
('P10', 'B.Jackson', 'Klang'),
('P11', 'F.Bryan', 'Shah Alam'),
('P12', 'T.Alvern', 'Kepong'),
('P13', 'J.Gloria', 'Shah Alam'),
('P14', 'I.Charlotte', 'Kepong'),
('P15', 'G.Emily', 'Sungai Besi'),
('P16', 'A.Henry', 'Klang'),
('P17', 'F.Ricky', 'Petaling Jaya'),
('P18', 'V.Raey', 'Shah Alam'),
('P19', 'R.Cindy', 'Sekinchan'),
('P20', 'D.Francis', 'Sekinchan');

Insert into Book values
('0001','The Buried Mirror','A boy looking for his mothers long lost mirror','Fantasy','P01','30.00','Red-Tagged'),
('0002','The Tomb in the Winter','An adventure to for the ancient tomb','Fantasy','P02','45.00','Red-Tagged'),
('0003','The Voice of the Heir','A group of students on a journey to follow the voice','Fantasy','P03','55.00','Yellow-Tagged'),
('0004','Crown and the Rose','An ancient crown of roses disappeared','Fantasy','P04','25.00','Yellow-Tagged'),
('0005','The Mask Stone','The hidden stone from 1000 years ago','Fantasy','P05','30.00','Green-Tagged'),
('0006','The Bloodless Beauty','The most beautiful queen remains young forever with a secret','Fantasy','P06','25.00','Green-Tagged'),
('0007','Yours Truly','A long distanced relationship','Romance','P07','55.00','Red-Tagged'),
('0008','Peas in a Pod','Childhood best friends end up falling for each other','Romance','P08','10.00','Yellow-Tagged'),
('0009','Before Us','A story of how they met before falling in love','Romance','P09','15.00','Green-Tagged'),
('0010','How to Win a Prince','How will the poor girl win the heart of the prince?','Romance','P10','45.00','Green-Tagged'),
('0011','All My Stars','The day the got together under all the beautiful stars','Romance','P11','60.00','Yellow-Tagged'),
('0012','Atomic Chaos','The world is ending due to the sudden atomic substance','Sci-fi','P12','20.00','Green-Tagged'),
('0013','Attack of Jupiter','How will they save earth from space?','Sci-fi','P13','30.00','Red-Tagged'),
('0014','Legacy Fading','How will they save the legacy from ancient times?','Sci-fi','P14','35.00','Red-Tagged'),
('0015','Metal Angel','Will they find the missing metal angel?','Sci-fi','P15','65.00','Yellow-Tagged'),
('0016','Blue Twin','A girl found out that she has a missing twin who has the same blue skin as her. Will she find her missing twin?','Sci-fi','P16','35.00','Green-Tagged'),
('0017','The Woman in the Picture','The only thing left from the abducter was only a picture of the woman. Will they find her?','Crime','P17','40.00','Green-Tagged'),
('0018','Hidden Evil','A young boy was seen having weird drawings in his room. What could it be?','Crime','P18','20.00','Yellow-Tagged'),
('0019','Wanted for Duty','A prisoner was set free to help investigate on the ongoing serial killer.','Crime','P19','35.00','Yellow-Tagged'),
('0020','Faceless Game','Police are trying to identify a faceless serial killer.','Crime','P20','25.00','Red-Tagged'),
('0021','Tangled','A girl with magical hair was abducted and lock up in the tower. Who will be the one to save her?','Fairy Tale','P20','45.00','Red-Tagged'),
('0022','The Little Mermaid','A little mermaid fell in love with the human prince.','Fairy Tale','P20','30.00','Green-Tagged'),
('0023','Beauty and the Beast','The princess fell in love with the prince who was turned into a beast by an evil witch.','Fairy Tale','P20','20.00','Green-Tagged'),
('0024','Cinderella','A girl who was abused by her step-mother marries the prince.','Fairy Tale','P20','30.00','Yellow-Tagged'),
('0025','Moana','The princess of the sea travels far away to save her island','Fairy Tale','P20','35.00','Yellow-Tagged');

Insert into AuthorWriteBook values
('AWB01','A01','0001'),
('AWB02','A02','0002'),
('AWB03','A03','0003'),
('AWB04','A04','0004'),
('AWB05','A05','0005'),
('AWB06','A06','0006'),
('AWB07','A07','0007'),
('AWB08','A08','0008'),
('AWB09','A09','0009'),
('AWB10','A10','0010'),
('AWB11','A11','0011'),
('AWB12','A12','0012'),
('AWB13','A13','0013'),
('AWB14','A14','0014'),
('AWB15','A15','0015'),
('AWB16','A16','0016'),
('AWB17','A17','0017'),
('AWB18','A18','0018'),
('AWB19','A19','0019'),
('AWB20','A20','0020'),
('AWB21','A20','0021'),
('AWB22','A20','0022'),
('AWB23','A18','0023'),
('AWB24','A18','0024'),
('AWB25','A17','0025');

Insert into AuthorCollabPublisher values
('C01','P01','A01'),
('C02','P02','A02'),
('C03','P03','A03'),
('C04','P04','A04'),
('C05','P05','A05'),
('C06','P06','A06'),
('C07','P07','A07'),
('C08','P08','A08'),
('C09','P09','A09'),
('C10','P10','A10'),
('C11','P11','A11'),
('C12','P12','A12'),
('C13','P13','A13'),
('C14','P14','A14'),
('C15','P15','A15'),
('C16','P16','A16'),
('C17','P17','A17'),
('C18','P18','A18'),
('C19','P19','A19'),
('C20','P20','A20'),
('C21','P20','A18'),
('C22','P20','A17');

Insert into Member values
('M01','0105355314','Jason','Todd',0.00),
('M02','0125674391','Chad','Norris',0.00),
('M03','0132451670','Adam','Rivers',3.00),
('M04','0176543899','Nicole','Blanchette',6.00),
('M05','0187659349','Laura','Winston',0.00),
('M06','0168349807','Anby','Demara',0.00),
('M07','0112254775','Katerina','Zelensky',9.50),
('M08','0166328971','Billy','Joel',0.00),
('M09','0132665788','Stacy','Joel',1.50),
('M10','0198872346','Johnny','Kim',5.00),
('M11','0133216744','Timothy','Drake',0.00),
('M12','0154761230','Dick','Grayson',0.00),
('M13','0168431210','Jayce','Talis',18.50),
('M14','0166534991','Violet','Laurent',1.50),
('M15','0133216783','Joseph','Joestar',9.00),
('M16','0109945677','Edward','Lee',0.00),
('M17','0167201122','Enrico','Pucci',0.00),
('M18','0175612345','Sarah','Fortune',0.00),
('M19','0183946583','Malcolm','Graves',12.50),
('M20','0129460343','Jericho','Swain',0.00);

Insert into Copy values
('C01',0001,'Available'),
('C02',0001,'Unavailable'),
('C03',0002,'Available'),
('C04',0002,'Available'),
('C05',0002,'Available'),
('C06',0003,'Unavailable'),
('C07',0003,'Available'),
('C08',0004,'Unavailable'),
('C09',0005,'Unavailable'),
('C10',0005,'Unavailable'),
('C11',0005,'Available'),
('C12',0006,'Available'),
('C13',0006,'Unavailable'),
('C14',0007,'Available'),
('C15',0007,'Unavailable'),
('C16',0008,'Available'),
('C17',0008,'Available'),
('C18',0009,'Available'),
('C19',0009,'Available'),
('C20',0010,'Available'),
('C21',0010,'Unavailable'),
('C22',0011,'Available'),
('C23',0011,'Unavailable'),
('C24',0012,'Unavailable'),
('C25',0012,'Unavailable'),
('C26',0013,'Unavailable'),
('C27',0014,'Available'),
('C28',0014,'Unavailable'),
('C29',0014,'Available'),
('C30',0015,'Available'),
('C31',0015,'Unavailable'),
('C32',0016,'Unavailable'),
('C33',0016,'Unavailable'),
('C34',0017,'Unavailable'),
('C35',0017,'Available'),
('C36',0018,'Unavailable'),
('C37',0018,'Available'),
('C38',0019,'Available'),
('C39',0020,'Unavailable'),
('C40',0021,'Available'),
('C41',0021,'Available'),
('C42',0021,'Available'),
('C43',0021,'Unavailable'),
('C44',0022,'Unavailable'),
('C45',0022,'Available'),
('C46',0022,'Available'),
('C47',0023,'Available'),
('C48',0024,'Unavailable'),
('C49',0025,'Available'),
('C50',0025,'Unavailable');

Insert into Room_Booking values
('R01','M01','1','2 January 2023','2 January 2023'),
('R02','M03','1','5 January 2023','7 January 2023'),
('R03','M04','2','3 January 2023','3 January 2023'),
('R04','M04','3','4 February 2023','4 February 2023'),
('R05','M07','1','25 February 2023','28 February 2023'),
('R06','M05','5','1 March 2023','1 March 2023'),
('R07','M04','2','18 March 2023','19 March 2023'),
('R08','M09','5','24 April 2023','26 April 2023'),
('R09','M19','3','2 May 2023','7 May 2023'),
('R10','M13','1','11 June 2023','11 June 2023'),
('R11','M10','1','19 June 2023','21 June 2023'),
('R12','M01','5','29 June 2023','29 June 2023'),
('R13','M02','3','14 July 2023','15 July 2023'),
('R14','M15','2','1 August 2023','4 August 2023'),
('R15','M06','5','16 August 2023','16 August 2023'),
('R16','M11','5','8 September 2023','9 September 2023'),
('R17','M20','1','8 September 2023','11 September 2023'),
('R18','M16','2','31 October 2023','1 November 2023'),
('R19','M14','5','30 November 2023','30 November 2023'),
('R20','M04','3','7 January 2024','10 January 2024');

Insert into Loan values
('L01','M03','C08','4 January 2023','6 February 2023'),
('L02','M02','C03','12 January 2023','20 January 2023'),
('L03','M03','C02','3 February 2023','28 February 2023'),
('L04','M04','C06','8 February 2023','5 March 2023'),
('L05','M07','C09','26 February 2023','2 April 2023'),
('L06','M09','C10','27 February 2023','30 March 2023'),
('L07','M07','C13','4 March 2023','20 March 2023'),
('L08','M10','C15','4 March 2023','30 March 2023'),
('L09','M13','C21','16 March 2023','12 April 2023'),
('L10','M13','C01','16 March 2023','26 March 2023'),
('L11','M10','C08','19 March 2023','25 April 2023'),
('L12','M07','C21','1 April 2023','30 April 2023'),
('L13','M14','C43','12 April 2023','2 May 2023'),
('L14','M07','C33','19 April 2023','6 June 2023'),
('L15','M13','C23','20 April 2023','4 June 2023'),
('L16','M07','C11','20 April 2023','22 April 2023'),
('L17','M15','C50','27 April 2023','23 May 2023'),
('L18','M07','C39','5 May 2023','31 May 2023'),
('L19','M13','C49','11 May 2023','31 May 2023'),
('L20','M20','C15','18 May 2023','28 May 2023'),
('L21','M07','C44','3 June 2023','30 June 2023'),
('L22','M13','C38','7 June 2023','14 July 2023'),
('L23','M15','C40','9 June 2023','19 July 2023'),
('L24','M07','C11','24 June 2023','23 July 2023'),
('L25','M19','C03','2 July 2023','4 September 2023'),
('L26','M19','C28','2 July 2023','2 September 2023'),
('L27','M13','C14','15 July 2023','19 July 2023'),
('L28','M19','C31','1 August 2023','26 August 2023'),
('L29','M07','C35','8 August 2023','2 September 2023'),
('L30','M07','C10','8 August 2023','19 August 2023'),
('L31','M13','C49','14 August 2023','1 September 2023'),
('L32','M02','C07','27 September 2023','13 October 2023'),
('L33','M15','C29','6 October 2023','19 November 2023'),
('L34','M11','C17','9 October 2023','30 October 2023'),
('L35','M13','C32','15 October 2023','5 November 2023'),
('L36','M19','C42','26 October 2023','14 November 2023'),
('L37','M13','C15','11 November 2023','30 November 2023'),
('L38','M13','C04','29 November 2023','14 December 2023'),
('L39','M19','C28','26 December 2023','4 February 2024'),
('L40','M05','C09','15 January 2024','3 February 2024');

Insert into MemberReserveBook values
('MRB01','M02',0001,'23 February 2023'),
('MRB02','M02',0003,'23 February 2023'),
('MRB03','M07',0005,'9 March 2023'),
('MRB04','M18',0004,'13 June 2023'),
('MRB05','M19',0012,'23 June 2023'),
('MRB06','M03',0005,'11 July 2023'),
('MRB07','M12',0006,'30 July 2023'),
('MRB08','M09',0012,'7 August 2023'),
('MRB09','M20',0010,'17 August 2023'),
('MRB10','M05',0007,'17 August 2023'),
('MRB11','M04',0011,'3 October 2023'),
('MRB12','M17',0013,'4 October 2023'),
('MRB13','M04',0016,'8 October 2023'),
('MRB14','M01',0018,'20 October 2023'),
('MRB15','M08',0022,'1 November 2023'),
('MRB16','M20',0020,'12 December 2023'),
('MRB17','M08',0014,'4 January 2024'),
('MRB18','M15',0016,'12 January 2024'),
('MRB19','M02',0024,'20 January 2024'),
('MRB20','M16',0025,'31 January 2024');


--1.	List all the book names, descriptions, category name and category description that are currently not on loan and available for loan. The results are sorted in alphabetical order of book name. 
SELECT * FROM Book
WHERE ISBN IN (SELECT ISBN FROM Copy WHERE Status = 'Available')
ORDER BY Title ASC;

--2.	Display the active members and list of books they have borrowed in year 2023. The result must consist of members’ first name, last name, book name, and the borrow date. Sort the result by borrow date in ascending order. 
SELECT Member.MemberID, Member.First_Name, Member.Last_Name, Book.Title, Loan.Loan_Date FROM Loan
JOIN Member on Member.MemberID = Loan.MemberID
JOIN Copy on Copy.CopyID = Loan.CopyID
JOIN Book on Book.ISBN = Copy.ISBN
WHERE Loan.MemberID in (SELECT MemberID FROM Loan GROUP BY MemberID HAVING COUNT(MemberID) >= 10)
ORDER BY Loan.Loan_Date ASC;

--3.	Show members who had paid overdue more than 2 times. The results must consist of their first name, last name, contact number, number of overdue, and total due amount. 
SELECT First_Name, Last_Name, Contact_Number, Total_Due_Amount, COUNT(Loan.LoanID) as Number_of_Overdue FROM Member
join Loan on Member.MemberID = Loan.MemberID
WHERE DATEDIFF(DAY, Loan.Loan_Date, Loan.Return_Date) > 25
GROUP BY Member.First_Name, Member.Last_Name, Member.Contact_Number, Member.Total_Due_Amount
HAVING COUNT(Loan.LoanID) > 2;

-- 4 Display the name and description of the book borrowed most in each tag color. Sort the result by tag color in descending order. 
SELECT Book.ISBN, Book.Title, Book.Description, Book.Category AS Tag_Color,
COUNT(*) AS Borrowed_Count FROM Book
INNER JOIN Copy ON Book.ISBN = Copy.ISBN
INNER JOIN Loan ON Copy.CopyID = Loan.CopyID
GROUP BY Book.ISBN, Book.Title, Book.Description, Book.Category
ORDER BY Borrowed_Count DESC;

-- 5 Show the genre which has the greatest number of books.
SELECT TOP 1 genre, COUNT(*) AS book_count FROM Book GROUP BY genre ORDER BY book_count DESC;

-- 6 Show the total number of books reserved in year 2023.
SELECT COUNT(*) AS Total_Reservations_2023 FROM MemberReserveBook WHERE Reserve_Date BETWEEN '2023-01-01' AND '2023-12-31';

-- 7 Show the publisher whose books are least-in-quantity for yellow tagged books.
SELECT p.PublisherID, p.Publisher_Name FROM Publisher p
JOIN Book b ON p.PublisherID = b.PublisherID WHERE b.Category = 'Yellow-Tagged'
GROUP BY p.PublisherID, p.Publisher_Name
HAVING COUNT(b.ISBN) = (SELECT MIN(BookCount) 
FROM (SELECT COUNT(*) AS BookCount 
FROM Book WHERE Category = 'Yellow-Tagged' GROUP BY PublisherID) AS MinBookCount);

--8
SELECT 
    Author.Author_Name, 
    Author.AuthorID, 
    Author.Contact_Number, 
    Book.Title, 
    Book.Description, 
    Book.Genre, 
    Book.PublisherID, 
    Book.Price, 
    Book.Category, 
    COUNT(Book.ISBN) AS NumberOfBooks
FROM 
    Author
INNER JOIN 
    AuthorWriteBook ON Author.AuthorID = AuthorWriteBook.AuthorID
INNER JOIN 
    Book ON AuthorWriteBook.ISBN = Book.ISBN
GROUP BY 
    Author.Author_Name, 
    Author.AuthorID, 
    Author.Contact_Number, 
    Book.Title, 
    Book.Description, 
    Book.Genre, 
    Book.PublisherID, 
    Book.Price, 
    Book.Category
ORDER BY 
    NumberOfBooks DESC;

--9 Display the name and contact number of member(s) who had at least borrowed book under genre ‘fantasy’ once.
SELECT DISTINCT
    Member.First_Name,
    Member.Last_Name,
    Member.Contact_Number
FROM 
    Member
INNER JOIN 
    Loan ON Member.MemberID = Loan.MemberID
INNER JOIN 
    Copy ON Loan.CopyID = Copy.CopyID
INNER JOIN 
    Book ON Copy.ISBN = Book.ISBN
WHERE 
    Book.Genre = 'fantasy';

--10 Show books that cost more than RM50. Result should show name of the book, description, publisher name and publisher address.
SELECT 
    Book.Title AS Book_Name,
    Book.Description,
    Publisher.Publisher_Name,
    Publisher.Address
FROM 
    Book
INNER JOIN 
    Publisher ON Book.PublisherID = Publisher.PublisherID
WHERE 
    Book.Price > 50;


