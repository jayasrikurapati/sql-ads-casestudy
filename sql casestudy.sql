create database hospital;
use hospital;
create table patient(patientid int,name varchar(20), address varchar(40),dob date,mobile varchar(10));
insert into patient values(1,'patient1','guntur','2003-07-17','9876543210');
insert into patient values(2,'patient2','hyd','2001-03-14','9876543012');
insert into patient values(3,'patient3','vijayawada','2000-08-22','9876789812');
insert into patient values(4,'patient4','nellore','1993-06-27','9876543219');
insert into patient values(5,'patient5','npt','2001-12-13','9876543218');
select * from patient;
ALTER TABLE patient ADD CONSTRAINT pk PRIMARY KEY (patientid);
select * from patient;
create table medicalhistory(patientid int,diseasename varchar(20),surgeries varchar(20), medications varchar(10));
insert into medicalhistory values(1,'heartattack','bypass','tablets');
ALTER TABLE medicalhistory ADD CONSTRAINT fk1 FOREIGN KEY (patientid) REFERENCES patient (patientid);
desc medicalhistory;
insert into medicalhistory values(1,'appendec','appendectomy','metroni');
insert into medicalhistory values(2,'herina','herin surgery','acetonine');
insert into medicalhistory values(3,'eye-vision','lasic','eco ');
insert into medicalhistory values(4,'mini-heartattack','bypass','tablets');
select *from medicalhistory;
create table prescription (patientid varchar(20),tablets varchar(20),dosage varchar(20), frequency int);
insert into  prescription  values(1,'Acetaminophen','300mg',3);
insert into  prescription  values(2,'Amoxicillin','400mg',4);
insert into  prescription  values(3,'Atorvastatin','100mg',2);
insert into  prescription  values(4,'Omeprazole','200mg',3);
insert into  prescription  values(5,'Metformin','300mg',2);
select * from prescription;
create table labresultstable(patient_id int,bloodtest varchar(10),urinetest varchar(20));
insert into labresultstable values(1,'Normal','good');
insert into labresultstable values(2,'abnormal','bad');
insert into labresultstable values(3,'Normal','good');
insert into labresultstable values(4,'abnormal','bad');
insert into labresultstable values(5,'Normal','good');
select * from labresultstable;
create table outcome(patient_id int,readmission varchar(1),medication varchar(1));
insert into outcome values(1,'Y','Y');
insert into outcome values(2,'Y','N');
insert into outcome values(3,'N','N');
insert into outcome values(4,'N','N');
insert into outcome values(5,'N','Y');
select * from outcome;


create database library;
use library;
create table books(bookid int,title varchar(50),author varchar(50), publisher varchar(50), publicationyear int,isbn int,gener varchar(20),availability varchar(1));
ALTER TABLE books ADD CONSTRAINT PK_books PRIMARY KEY (bookid);
INSERT INTO books (bookid, title, author, publisher, publicationyear, isbn, gener,availability)
VALUES (2, 'To Kill', 'Harper Lee', 'Lippincott & Co.', 1960, 467, 'Fiction','Y');

INSERT INTO books (bookid, title, author, publisher, publicationyear, isbn, gener, availability)
VALUES (1, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Scribner', 1925,565, 'Fiction', 'Y');


INSERT INTO books (bookid, title, author, publisher, publicationyear, gener, availability)
VALUES (3, '1984', 'George Orwell', 'Secker & Warburg', 1949, 'Fiction', 'Y');
INSERT INTO books (bookid, title, author, publisher, isbn, gener, availability)
VALUES (4, 'Pride and Prejudice', 'Jane Austen', 'T. Egerton, Whitehall', 84736, 'Fiction', 'N');

INSERT INTO books (bookid, title, author, publicationyear, isbn, gener, availability)
VALUES (5, 'To the Lighthouse', 'Virginia Woolf', 1927,392, 'Fiction', 'Y');

select * from books;

CREATE TABLE borrowers (borrowerid int,name varchar(50),address varchar(100),phno varchar(20),email varchar(50));
ALTER TABLE borrowers ADD CONSTRAINT PK_borrowers PRIMARY KEY (borrowerid);
INSERT INTO borrowers VALUES (21, 'Jane Smith', '456 Elm St, Another Town', '9290232323','janesmith@example.com');
INSERT INTO borrowers VALUES (22, 'sai', 'guntur ,ap', '9290292323','sai@example.com');
INSERT INTO borrowers VALUES (23, 'sri', 'andhra pradesh', '929023323','sri@example.com');
INSERT INTO borrowers VALUES (24, 'hello2', 'ongole', '9290212323','hello2@example.com');
INSERT INTO borrowers VALUES (25, 'Jane', 'Another Town', '92190232323','jane@example.com');
select * from borrowers;

CREATE TABLE loans (loanid int PRIMARY KEY,bookid int,borrowerid int,date_borrowed date,due_date date,date_returned date);
ALTER TABLE loans ADD CONSTRAINT FK_loans_books FOREIGN KEY (bookid) REFERENCES books (bookid);
ALTER TABLE loans ADD CONSTRAINT FK_loans_borrowers FOREIGN KEY (borrowerid) REFERENCES borrowers (borrowerid);
INSERT INTO loans VALUES (11, 3, 21, '2023-06-15', '2023-07-15', NULL);
INSERT INTO loans VALUES (12, 5, 21, '2023-05-15', '2023-06-15','2023-06-13');
INSERT INTO loans VALUES (13, 2, 23, '2022-05-15', '2022-06-15','2022-06-16');
INSERT INTO loans VALUES (14, 1, 22, '2023-04-01', '2023-05-15','2023-04-27');
INSERT INTO loans VALUES (15, 4, 24, '2023-05-15', '2023-06-15','2023-06-11');
select * from loans;

create table reservations( reservationid int primary key, bookid int, borrowerid int,datereserved date);
ALTER TABLE reservations ADD COLUMN dateneeded date;
ALTER TABLE loans ADD CONSTRAINT FK_reservations_books FOREIGN KEY (bookid) REFERENCES books (bookid);
ALTER TABLE loans ADD CONSTRAINT FK_reservations_borrowers FOREIGN KEY (borrowerid) REFERENCES borrowers (borrowerid);
insert into reservations values(81,1,4,'2022-06-15','2022-07-15');
insert into reservations values(82,2,2,'2023-07-26','2023-08-26');
insert into reservations values(83,3,1,'2023-02-27','2023-09-27');
insert into reservations values(84,4,2,'2022-08-18','2022-10-18');
insert into reservations values(85,5,3,'2023-01-15','2023-02-15');

select * from reservations;
-- toget the details of all books which are available
select * from books where availability='Y';
-- to get the information about all the borrowed books
SELECT Books.Title, Books.Author, Borrowers.Name, Loans.date_borrowed, Loans.due_date
FROM Books
INNER JOIN Loans ON Books.BookID = Loans.BookID
INNER JOIN Borrowers ON Loans.BorrowerID = Borrowers.BorrowerID;

-- to get the information about all the reserved books

SELECT Books.Title, Books.Author, Reservations.DateReserved,Reservations.DateNeeded
FROM Books
INNER JOIN Reservations ON Books. BookID = Reservations.BookID;