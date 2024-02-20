SELECT * FROM book;
SELECT * FROM student JOIN borrow ON student.id = borrow.id_student WHERE date_borrow > '2023-02-01';
SELECT firstname, name FROM author JOIN book ON author.id = book.id_author;
SELECT *, book.title FROM borrow JOIN book ON borrow.id_book = book.id WHERE id_student = 1;
SELECT COUNT(*) AS nombre_livres FROM book;
SELECT id_author, COUNT(*) AS nombre_livres FROM book GROUP BY id_author;
SELECT DISTINCT * FROM book JOIN borrow ON book.id = borrow.id_book;
SELECT DISTINCT * FROM book WHERE id IN (SELECT id_book FROM borrow);
SELECT * FROM student WHERE id NOT IN (SELECT id_student FROM borrow);
SELECT id_student, COUNT(*) AS nombre_emprunts FROM borrow GROUP BY id_student;
SELECT * FROM borrow JOIN student ON borrow.id_student = student.id JOIN book ON borrow.id_book = book.id JOIN author ON book.id_author = author.id;
SELECT * FROM book WHERE year_publish >= '2021';
SELECT student.name, student.firstname, id_student, COUNT(*) AS nombre_emprunts FROM borrow JOIN student ON borrow.id_student = student.id WHERE nombre_emprunts > 3 GROUP BY id_student;
SELECT * FROM borrow JOIN student ON borrow.id_student = student.id JOIN book ON borrow.id_book = book.id JOIN author ON book.id_author = author.id WHERE student.id = 1;
SELECT * FROM borrow JOIN book ON borrow.id_book = book.id WHERE borrow.Date_back > borrow.Date_back_schedulde;
SELECT id_student, COUNT(*) AS nombre_emprunts FROM borrow GROUP BY id_student ORDER BY nombre_emprunts DESC;
 SELECT title AS Titre, year_publish AS 'Année de publication',
 CASE
 WHEN year_publish < 1990 THEN 'Avant 1990'
 when year_publish BETWEEN 1990 AND 2000 THEN 'Entre 90 et 2000'
 ELSE 'Après 2000'
 END AS Catégorie
 FROM book;
 SELECT * FROM book JOIN borrow WHERE book.id = borrow.id_book LIMIT 10;
SELECT AVG(DATEDIFF(date_back, date_borrow)) FROM borrow;
SELECT * FROM book WHERE id NOT IN (SELECT id_book FROM borrow);