
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
    (1, 'Harry Potter à l''école des sorciers', 1997, 1),
    (2, 'Le Seigneur des anneaux', 1954, 2),
    (3, 'Game of Thrones', 1996, 3),
    (4, 'Mistborn: The Final Empire', 2006, 2),
    (5, 'The Blade Itself', 2006, 3),
    (6, 'The Name of the Wind', 2007, NULL);


INSERT INTO student (id, name, firstname, student_number) VALUES
     (1, 'Dupont', 'Alice', 'A12345'),
     (2, 'Martin', 'Luc', 'B67890'),
     (3, 'Leclerc', 'Sophie', 'C54321'),
     (4, 'Albert', 'Martin', 'D98765');

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




