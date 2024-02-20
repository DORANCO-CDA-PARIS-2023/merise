--1
SELECT * FROM book;

--2
SELECT name, firstname FROM student s LEFT JOIN borrow b ON s.id = b.id_student;

--3
SELECT a.name, a.firstname, b.title FROM author a LEFT JOIN book b ON a.id = b.id_author ORDER BY b.title;

--4
SELECT bk.title, s.name, s.firstname, b.Date_borrow, b.Date_back FROM student s LEFT JOIN borrow b ON s.id = b.id_student LEFT JOIN book bk ON b.id_book = bk.id;

--5
SELECT COUNT(id) FROM book;

--6
SELECT a.name, a.firstname, COUNT(b.id) AS total_book FROM author a LEFT JOIN book b ON a.id = b.id_author GROUP BY a.name, a.firstname ORDER BY a.name;

--7
SELECT b.title FROM book b RIGHT JOIN borrow br ON b.id = br.id_book GROUP BY b.title;

--8
SELECT s.name FROM student s LEFT JOIN borrow b ON s.id = b.id_student WHERE b.id_student IS NULL;

--9
SELECT ROUND(AVG(YEAR(birthday))) AS annee_naissance_moy FROM author;

--10
SELECT s.name, s.firstname, COUNT(b.id) AS total_emprunt FROM student s LEFT JOIN borrow b ON s.id = b.id_student GROUP BY s.name, s.firstname;

--11
SELECT b.Date_borrow, b.Date_back, bk.title AS book_title, a.name AS author_name, s.name AS student_name FROM borrow b LEFT JOIN student s ON b.id_student = s.id LEFT JOIN book bk ON b.id_book = bk.id LEFT JOIN author a ON a.id = bk.id_author;

--12
SELECT s.name, s.firstname, COUNT(b.id) AS total_emprunt FROM student s LEFT JOIN borrow b ON s.id = b.id_student GROUP BY s.name, s.firstname ORDER BY `total_emprunt` ASC
SELECT b.title, b.year_publish FROM book b WHERE year_publish >= YEAR(NOW()) - 3;

--13
SELECT s.name, COUNT(b.id) AS total_emprunt FROM student s JOIN borrow b ON s.id = b.id_student GROUP BY s.id, s.name HAVING COUNT(b.id) > 3;

--14
SELECT bk.title AS book_title, a.name AS author_name, b.Date_borrow, b.Date_back FROM borrow b LEFT JOIN book bk ON b.id_book = bk.id LEFT JOIN author a ON bk.id_author = a.id WHERE b.id_student = 1;

--15
SELECT bk.title AS book_title, COUNT(b.id) AS retour_tardif FROM borrow b JOIN book bk ON b.id_book = bk.id WHERE b.Date_back > b.Date_back_schedulde GROUP BY bk.title;

--16
SELECT s.name, s.firstname, COUNT(b.id) AS total_emprunt FROM student s LEFT JOIN borrow b ON s.id = b.id_student GROUP BY s.name, s.firstname ORDER BY total_emprunt ASC;

--17
SELECT CASE WHEN year_publish < 2000 THEN 'Avant 2000' WHEN year_publish >= 2000 AND year_publish <= 2010 THEN 'Entre 2000 et 2010' ELSE 'Après 2010' END AS category, COUNT(*) AS total_book FROM ( SELECT title, year_publish FROM book ) AS cat GROUP BY category ORDER BY MIN(year_publish);

--18
SELECT bk.title AS book_title, COUNT(b.id) AS total_emprunt FROM borrow b JOIN book bk ON b.id_book = bk.id GROUP BY bk.title ORDER BY total_emprunt DESC LIMIT 10;

--19
SELECT ROUND(AVG(DATEDIFF(Date_back, Date_borrow))) AS moyenne_emprunt FROM borrow WHERE Date_back IS NOT NULL;

--20
SELECT b.title AS book_title FROM book b LEFT JOIN borrow br ON b.id = br.id_book WHERE br.id_book IS NULL;