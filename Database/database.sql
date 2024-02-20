
DROP DATABASE IF EXISTS doranco_merise;
CREATE DATABASE doranco_merise;

USE doranco_merise;

CREATE TABLE author (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50),
    firstname VARCHAR(50),
    birthday DATE,
    PRIMARY KEY(id)
);


CREATE TABLE book (
    id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(255),
    year_publish YEAR,
    id_author INT,
    PRIMARY KEY (id),
    FOREIGN KEY (id_author) REFERENCES author(id)
);

CREATE TABLE student (
    id INT AUTO_INCREMENT,
    name VARCHAR(50),
    firstname VARCHAR(50),
    student_number VARCHAR(15),
    PRIMARY KEY (id),
    UNIQUE (student_number)
);


CREATE TABLE borrow (
    id INT PRIMARY KEY,
    Date_borrow DATE,
    Date_back_schedulde DATE,
    Date_back DATE,
    id_book INT,
    id_student INT,
    FOREIGN KEY (id_book) REFERENCES book(id),
    FOREIGN KEY (id_student) REFERENCES student(id)
);


CREATE TABLE genre (
   id INT AUTO_INCREMENT,
   name VARCHAR(50),
   PRIMARY KEY (id)
);

CREATE TABLE book_genre (
     id_book INT,
     id_genre INT,
     PRIMARY KEY (id_book, id_genre),
     FOREIGN KEY (id_book) REFERENCES book(id),
     FOREIGN KEY (id_genre) REFERENCES genre(id)
);



INSERT INTO author (id, name, firstname, birthday) VALUES
    (1, 'Rowling', 'J.K.', '1965-07-31'),
    (2, 'Tolkien', 'J.R.R.', '1892-01-03'),
    (3, 'Martin', 'George R.R.', '1948-09-20');

INSERT INTO book (id, title, year_publish, id_author) VALUES
    (1, 'Harry Potter à l\'école des sorciers', 1997, 1),
    (2, 'Le Seigneur des anneaux', 1954, 2),
    (3, 'Game of Thrones', 1996, 3),
    (4, 'Mistborn: The Final Empire', 2006, 2),
    (5, 'The Blade Itself', 2006, 3),
    (6, 'The Name of the Wind', 2007, NULL);


INSERT INTO student (id, name, firstname, student_number) VALUES
     (1, 'Dupont', 'Alice', 'A12345'),
     (2, 'Martin', 'Luc', 'B67890'),
     (3, 'Leclerc', 'Sophie', 'C54321');

INSERT INTO borrow (id, Date_borrow, Date_back_schedulde, Date_back, id_book, id_student) VALUES
     (1, '2023-02-01', '2023-02-15', '2023-02-14', 1, 1),
     (2, '2023-02-02', '2023-02-16', '2023-02-18', 2, 2),
     (3, '2023-02-03', '2023-02-17', NULL, 3, 3);

INSERT INTO genre (id, name) VALUES
    (1, 'Fantasy'),
    (2, 'Science Fiction'),
    (3, 'Mystery');

INSERT INTO book_genre (id_book, id_genre) VALUES
     (1, 1),
     (2, 1),
     (3, 3);

SELECT * FROM Book;
SELECT DISTINCT Student.*
FROM Student
         JOIN borrow b on Student.id = b.id_student
WHERE b.Date_borrow > '2023-02-01';

SELECT book.title, author.firstname
FROM Book
         JOIN Author ON Book.id_author = Author.id;

SELECT Book.title
FROM Book
         JOIN borrow ON Book.id = borrow.id_book
WHERE borrow.id_student = '3';
SELECT COUNT(*) AS total_books FROM Book;
SELECT Author.id, Author.firstname,  COUNT(Book.id) AS total_books
FROM Author
         LEFT JOIN Book ON Author.id = Book.id_author
GROUP BY Author.id, Author.firstname;

SELECT DISTINCT Book.*
FROM Book
         JOIN borrow ON book.id=borrow.id_book;


SELECT AVG(birthday) AS average_year_of_birth
FROM Author;
SELECT Student.id, Student.firstname, Student.name
FROM student
        LEFT JOIN borrow b on student.id = b.id_book
        GROUP BY Student.id, Student.firstname,b.id_book;
SELECT DISTINCT b.title
FROM book b
         JOIN borrow br ON b.id = br.id_book;

SELECT s.name, s.firstname
FROM student s
         LEFT JOIN borrow br ON s.id = br.id_student
WHERE br.id IS NULL;

SELECT AVG(YEAR(birthday)) AS average_year_of_birth
FROM author;
SELECT s.name, s.firstname, COUNT(br.id) AS num_borrowed_books
FROM student s
         LEFT JOIN borrow br ON s.id = br.id_student
GROUP BY s.id;
SELECT *
FROM book
SELECT s.name, s.firstname
FROM student s
         JOIN (
    SELECT id_student, COUNT(*) AS num_borrowed_books
    FROM borrow
    GROUP BY id_student
) AS borrow_counts ON s.id = borrow_counts.id_student
WHERE borrow_counts.num_borrowed_books > 3;


SELECT b.title AS book_title, a.name AS author_name, a.firstname AS author_firstname, br.Date_borrow, br.Date_back_schedulde, br.Date_back
FROM borrow br
         JOIN book b ON br.id_book = b.id
         JOIN author a ON b.id_author = a.id
WHERE br.id_student = 1;


SELECT b.title AS book_title, a.name AS author_name, a.firstname AS author_firstname, br.Date_borrow, br.Date_back_schedulde, br.Date_back
FROM borrow br
         JOIN book b ON br.id_book = b.id
         JOIN author a ON b.id_author = a.id
WHERE br.id_student = 2;


SELECT b.title AS book_title, COUNT(*) AS late_returns
FROM borrow br
         JOIN book b ON br.id_book = b.id
WHERE br.Date_back > br.Date_back_schedulde
GROUP BY b.id;

SELECT s.name, s.firstname, COUNT(br.id) AS num_loans
FROM student s
         LEFT JOIN borrow br ON s.id = br.id_student
GROUP BY s.id
ORDER BY num_loans DESC;



SELECT title,
       CASE
           WHEN year_publish < 2000 THEN 'Before 2000'
           WHEN year_publish BETWEEN 2000 AND 2010 THEN 'Between 2000 and 2010'
           ELSE 'After 2010'
           END AS publication_category
FROM book;


SELECT b.title, br.Date_borrow, br.Date_back
FROM borrow br
         JOIN book b ON br.id_book = b.id
ORDER BY br.Date_borrow
LIMIT 10;
SELECT AVG(DATEDIFF(Date_back, Date_borrow)) AS average_loan_period
FROM borrow;


SELECT b.title
FROM book b
         LEFT JOIN borrow br ON b.id = br.id_book
WHERE br.id IS NULL;






