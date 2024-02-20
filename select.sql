-- 1/Afficher tous les livres disponibles dans la table "Livre":
SELECT * FROM book;

-- 2/Afficher les étudiants qui ont emprunté un livre après une date spécifique:
SELECT * FROM borrow WHERE Date_borrow > '2023-02-01';

-- 3/Afficher le nom et le prénom de l'auteur de chaque livre:
SELECT book.title, author.name, author.firstname
FROM book
JOIN author ON book.id_author = author.id;

-- 4/Afficher les livres empruntés par un étudiant spécifique en incluant les détails de l'emprunt:
SELECT book.title, borrow.*
FROM borrow
JOIN book ON borrow.id_book = book.id
WHERE borrow.id_student = 1;

-- 5/Compter le nombre total de livres dans la bibliothèque:
SELECT COUNT(*) AS total_books FROM book;

-- 6/Afficher le nombre total de livres écrits par chaque auteur:
SELECT author.name, author.firstname, COUNT(book.id) AS total_books
FROM author
LEFT JOIN book ON author.id = book.id_author
GROUP BY author.id;

-- 7/Afficher les livres qui ont été empruntés au moins une fois:
SELECT DISTINCT book.*
FROM book
JOIN borrow ON book.id = borrow.id_book;

-- 8/Afficher les étudiants qui n'ont pas encore emprunté de livre:
SELECT *
FROM student
WHERE id NOT IN (SELECT DISTINCT id_student FROM borrow);

-- 9/Afficher la moyenne des années de naissance des auteurs:
SELECT AVG(YEAR(birthday)) AS average_birthyear FROM author;

-- 10/Afficher le nombre d'emprunts effectués par chaque étudiant:
SELECT id_student, COUNT(*) AS total_borrows
FROM borrow
GROUP BY id_student;

-- 11/Afficher les détails des emprunts, y compris le titre du livre, le nom de l'auteur et le nom de l'étudiant:
SELECT borrow.*, book.title, author.name AS author_lastname, author.firstname AS author_firstname, student.name AS student_lastname, student.firstname AS student_firstname
FROM borrow
JOIN book ON borrow.id_book = book.id
JOIN author ON book.id_author = author.id
JOIN student ON borrow.id_student = student.id;

-- 12/Afficher les livres qui ont été publiés au cours des trois dernières années:
SELECT *
FROM book
WHERE year_publish >= YEAR(CURDATE()) - 3;

-- 13/Afficher les étudiants ayant emprunté plus de trois livres:
SELECT id_student, COUNT(*) AS total_borrows
FROM borrow
GROUP BY id_student
HAVING COUNT(*) > 3;

-- 14/Afficher les livres, les auteurs et les emprunts associés pour un étudiant spécifique:
SELECT book.title, author.name AS author_lastname, author.firstname AS author_firstname, borrow.*
FROM borrow
JOIN book ON borrow.id_book = book.id
JOIN author ON book.id_author = author.id
WHERE borrow.id_student = 1;

-- 15/Afficher le nombre d'emprunts tardifs (retour après la date prévue) pour chaque livre:
SELECT id_book, COUNT(*) AS late_returns
FROM borrow
WHERE Date_back > Date_back_schedulde
GROUP BY id_book;

-- 16/Afficher le nombre d'emprunts effectués par chaque étudiant, trié par ordre décroissant du nombre d'emprunts:
SELECT id_student, COUNT(*) AS total_borrows
FROM borrow
GROUP BY id_student
ORDER BY total_borrows DESC;

-- 17/Classer les livres en fonction de leur année de publication en catégories (par exemple, "Avant 2000", "Entre 2000 et 2010", "Après 2010"):
SELECT title,
       CASE
           WHEN year_publish < 2000 THEN 'Avant 2000'
           WHEN year_publish >= 2000 AND year_publish <= 2010 THEN 'Entre 2000 et 2010'
           WHEN year_publish > 2010 THEN 'Après 2010'
       END AS publication_category
FROM book;

-- 18/Afficher les dix premiers livres empruntés:
SELECT book.*, COUNT(borrow.id) AS total_borrows
FROM borrow
JOIN book ON borrow.id_book = book.id
GROUP BY book.id
ORDER BY total_borrows DESC
LIMIT 10;

-- 19/Afficher la durée moyenne d'emprunt en jours:
SELECT AVG(DATEDIFF(Date_back, Date_borrow)) AS avg_duration
FROM borrow
WHERE Date_back IS NOT NULL;

-- 20/Afficher les livres qui n'ont jamais été empruntés:
SELECT *
FROM book
WHERE id NOT IN (SELECT DISTINCT id_book FROM borrow);
