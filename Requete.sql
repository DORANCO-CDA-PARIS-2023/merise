select * FROM book;


SELECT s.name, s.firstname, b.id AS book_id, b.title, bo.Date_borrow
FROM student s
JOIN borrow bo ON s.id = bo.id_student
JOIN book b ON bo.id_book = b.id
WHERE bo.Date_borrow > '2023-02-01';


SELECT b.title AS book_title, a.name AS author_name, a.firstname AS author_firstname
FROM book b
JOIN author a ON b.id_author = a.id;


SELECT s.name AS student_name, s.firstname AS student_firstname, b.title AS book_title,
       bo.Date_borrow, bo.Date_back_schedulde, bo.Date_back
FROM student s
JOIN borrow bo ON s.id = bo.id_student
JOIN book b ON bo.id_book = b.id
WHERE s.student_number = 'A12345';


SELECT COUNT(*) AS total_books
FROM book;


SELECT a.name AS author_name, a.firstname AS author_firstname, COUNT(b.id) AS total_books
FROM author a
LEFT JOIN book b ON a.id = b.id_author
GROUP BY a.id, a.name, a.firstname;


SELECT b.title AS book_title, COUNT(bo.id) AS borrow_count
FROM book b
LEFT JOIN borrow bo ON b.id = bo.id_book
GROUP BY b.id, b.title
HAVING COUNT(bo.id) > 0;


SELECT s.name AS student_name, s.firstname AS student_firstname
FROM student s
LEFT JOIN borrow bo ON s.id = bo.id_student
WHERE bo.id IS NULL;


SELECT AVG(YEAR(birthday)) AS average_birth_year
FROM author;


SELECT s.name AS student_name, s.firstname AS student_firstname, COUNT(bo.id) AS total_borrows
FROM student s
LEFT JOIN borrow bo ON s.id = bo.id_student
GROUP BY s.id, s.name, s.firstname;


SELECT bo.id AS borrow_id, b.title AS book_title, a.name AS author_name, a.firstname AS author_firstname,
       s.name AS student_name, s.firstname AS student_firstname, bo.Date_borrow, bo.Date_back_schedulde, bo.Date_back
FROM borrow bo
JOIN book b ON bo.id_book = b.id
JOIN author a ON b.id_author = a.id
JOIN student s ON bo.id_student = s.id;


SELECT title, year_publish
FROM book
WHERE year_publish >= YEAR(CURDATE()) - 3;


SELECT s.name AS student_name, s.firstname AS student_firstname, COUNT(bo.id) AS total_borrows
FROM student s
JOIN borrow bo ON s.id = bo.id_student
GROUP BY s.id, s.name, s.firstname
HAVING COUNT(bo.id) > 3;


SELECT s.name AS student_name, s.firstname AS student_firstname,
       b.title AS book_title, a.name AS author_name, a.firstname AS author_firstname,
       bo.Date_borrow, bo.Date_back_schedulde, bo.Date_back
FROM student s
JOIN borrow bo ON s.id = bo.id_student
JOIN book b ON bo.id_book = b.id
JOIN author a ON b.id_author = a.id
WHERE s.student_number = 'A12345';


SELECT b.title AS book_title, COUNT(bo.id) AS overdue_borrows
FROM book b
JOIN borrow bo ON b.id = bo.id_book
WHERE bo.Date_back IS NOT NULL AND bo.Date_back > bo.Date_back_schedulde
GROUP BY b.id, b.title;


SELECT s.name AS student_name, s.firstname AS student_firstname, COUNT(bo.id) AS total_borrows
FROM student s
LEFT JOIN borrow bo ON s.id = bo.id_student
GROUP BY s.id, s.name, s.firstname
ORDER BY total_borrows DESC;


SELECT title, 
       year_publish,
       CASE
           WHEN year_publish < 2000 THEN 'Avant 2000'
           WHEN year_publish BETWEEN 2000 AND 2010 THEN 'Entre 2000 et 2010'
           ELSE 'Après 2010'
       END AS publication_category
FROM book
ORDER BY year_publish;