--1Affichez tous les livres disponibles dans la table "Livre"
SELECT * FROM book;
-----------------------------------------------
--2Affichez les étudiants qui ont emprunté un livre après une date spécifique
SELECT s.* FROM student s 
JOIN borrow b ON s.id = b.id_student 
WHERE b.Date_borrow > '2022-01-1';
-----------------------------------------------
--3Affichez le nom et le prénom de l'auteur de chaque livre
SELECT b.title, a.name, a.firstname 
FROM book b JOIN author a ON b.id_author = a.id;
-----------------------------------------------
--4Affichez les livres empruntés par un étudiant spécifique en incluant les détails de l'emprunt
SELECT b.title, a.name AS author_name, a.firstname AS author_firstname, br.Date_borrow, br.Date_back_schedulde, br.Date_back
FROM book b 
JOIN author a ON b.id_author = a.id 
JOIN borrow br ON b.id = br.id_book 
WHERE br.id_student = 1;
-----------------------------------------------
--5Comptez le nombre total de livres dans la bibliothèque
SELECT COUNT(*) AS total_books FROM book;
-----------------------------------------------
--6Affichez le nombre total de livres écrits par chaque auteur
SELECT a.name, a.firstname, COUNT(b.id) AS total_books 
FROM author a 
LEFT JOIN book b ON a.id = b.id_author 
GROUP BY a.id;
-----------------------------------------------
--7Affichez les livres qui ont été empruntés au moins une fois
SELECT DISTINCT b.*
FROM book b
JOIN borrow br ON b.id = br.id_book;
-----------------------------------------------
-- 8Afficher la moyenne des années de naissance des auteurs
SELECT DISTINCT b.*
FROM book b
JOIN borrow br ON b.id = br.id_book;
-----------------------------------------------
-- 9Affichez les étudiants qui n'ont pas encore emprunté de livre
SELECT s.*
FROM student s
LEFT JOIN borrow br ON s.id = br.id_student
WHERE br.id_student IS NULL;
-----------------------------------------------
-- 10Afficher la moyenne des années de naissance des auteurs
SELECT AVG(YEAR(birthday)) AS avg_birth_year FROM author;
-----------------------------------------------
--11Affichez le nombre d'emprunts effectués par chaque étudiant
SELECT s.name, s.firstname, COUNT(br.id) AS total_borrows
FROM student s
LEFT JOIN borrow br ON s.id = br.id_student
GROUP BY s.id;
-----------------------------------------------
--12 Affichez les détails des emprunts, y compris le titre du livre, le nom de l'auteur et le nom de l'étudiant
SELECT b.title, a.name AS author_name, a.firstname AS author_firstname, s.name AS student_name, s.firstname AS student_firstname, br.Date_borrow, br.Date_back_schedulde, br.Date_back
FROM borrow br
JOIN book b ON br.id_book = b.id
JOIN author a ON b.id_author = a.id
JOIN student s ON br.id_student = s.id;
-----------------------------------------------
--13 Affichez les livres qui ont été publiés au cours des trois dernières années
SELECT *
FROM book
WHERE year_publish >= YEAR(CURDATE()) - 3;
-----------------------------------------------
-- 14 Affichez les étudiants ayant emprunté plus de trois livres
SELECT s.name, s.firstname, COUNT(br.id) AS total_borrows
FROM student s
JOIN borrow br ON s.id = br.id_student
GROUP BY s.id
HAVING total_borrows > 3;
-----------------------------------------------
-- 15 Affichez les livres, les auteurs et les emprunts associés pour un étudiant spécifique (par exemple, l'étudiant avec l'ID 2)
SELECT b.title, a.name AS author_name, a.firstname AS author_firstname, br.Date_borrow, br.Date_back_schedulde, br.Date_back
FROM book b
JOIN author a ON b.id_author = a.id
JOIN borrow br ON b.id = br.id_book
WHERE br.id_student = 2;
-----------------------------------------------
-- 16 Affichez le nombre d'emprunts tardifs (retour après la date prévue) pour chaque livre
SELECT b.title, COUNT(*) AS late_returns
FROM book b
JOIN borrow br ON b.id = br.id_book
WHERE br.Date_back > br.Date_back_schedulde
GROUP BY b.id;
-----------------------------------------------
-- 17 Affichez le nombre d'emprunts effectués par chaque étudiant, trié par ordre décroissant du nombre d'emprunts
SELECT s.name, s.firstname, COUNT(br.id) AS total_borrows
FROM student s
LEFT JOIN borrow br ON s.id = br.id_student
GROUP BY s.id
ORDER BY total_borrows DESC;
-----------------------------------------------
-- 18 Classez les livres en fonction de leur année de publication en catégories (par exemple, "Avant 2000", "Entre 2000 et 2010", "Après 2010")
SELECT title, 
CASE WHEN year_publish < 2000 
THEN 'Avant 2000' WHEN year_publish BETWEEN 2000 AND 2010 
THEN 'Entre 2000 et 2010' ELSE 'Après 2010' 
END AS publication_category 
FROM book;
-----------------------------------------------
-- 19 Affichez les dix premiers livres empruntés
SELECT b.title, COUNT(br.id) AS total_borrows
FROM book b
LEFT JOIN borrow br ON b.id = br.id_book
GROUP BY b.id
ORDER BY total_borrows DESC
LIMIT 10;
-----------------------------------------------
--Affichez la durée moyenne d'emprunt en jours
SELECT AVG(DATEDIFF(Date_back, Date_borrow)) AS avg_loan_duration 
FROM borrow WHERE Date_back IS NOT NULL;
-----------------------------------------------
--Affichez les livres qui n'ont jamais été empruntés
SELECT b.*
FROM book b
LEFT JOIN borrow br ON b.id = br.id_book
WHERE br.id_book IS NULL;




