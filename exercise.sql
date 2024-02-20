-- Exercice SELECT  

-- Affichez tous les livres disponibles dans la table "Livre".
SELECT * FROM book;

-- Affichez les étudiants qui ont emprunté un livre après une date spécifique.
SELECT s.name, s.firstname, b.title, br.Date_borrow
FROM student s
JOIN borrow br ON s.id = br.id_student
JOIN book b ON br.id_book = b.id
WHERE br.Date_borrow > '2023-02-02';

-- Affichez les livres empruntés par un étudiant spécifique en incluant les détails de l'emprunt.
SELECT s.name AS student_name, s.firstname AS student_firstname, b.title AS book_title, br.Date_borrow, br.Date_back_schedulde, br.Date_back
FROM student s
JOIN borrow br ON s.id = br.id_student
JOIN book b ON br.id_book = b.id
WHERE s.name = 'Dupont';

-- Comptez le nombre total de livres dans la bibliothèque.
SELECT COUNT(*) AS total_books
FROM book;

-- Affichez le nombre total de livres écrits par chaque auteur.
SELECT a.name AS author_name, COUNT(*) AS total_books
FROM author a
JOIN book b ON a.id = b.id_author
GROUP BY a.id, a.name;

-- Affichez les livres qui ont été empruntés au moins une fois.
SELECT b.title
FROM book b
JOIN borrow br ON b.id = br.id_book;

-- Affichez les étudiants qui n'ont pas encore emprunté de livre.
SELECT * FROM student WHERE id NOT IN (SELECT id_student FROM borrow);

-- Afficher la moyenne des années de naissance des auteurs.
SELECT ROUND(AVG(YEAR(birthday))) AS average_birth_year
FROM author;

-- Affichez le nombre d'emprunts effectués par chaque étudiant.
SELECT s.name, s.firstname, COUNT(br.id) AS num_borrows
FROM student s
LEFT JOIN borrow br ON s.id = br.id_student
GROUP BY s.id, s.name, s.firstname;

-- Affichez les détails des emprunts, y compris le titre du livre, le nom de l'auteur et le nom de l'étudiant.
SELECT b.title AS book_title, a.name AS author_name, s.name AS student_name, s.firstname AS student_firstname, br.Date_borrow, br.Date_back_schedulde, br.Date_back
FROM borrow br
JOIN book b ON br.id_book = b.id
JOIN author a ON b.id_author = a.id
JOIN student s ON br.id_student = s.id;

-- Affichez les livres qui ont été publiés au cours des trois dernières années.
SELECT *
FROM book
WHERE year_publish >= YEAR(CURRENT_DATE()) - 3;

-- Affichez les étudiants ayant emprunté plus de 2 livres.
-- Affichez les livres, les auteurs et les emprunts associés pour un étudiant spécifique.
-- Affichez le nombre d'emprunts tardifs (retour après la date prévue) pour chaque livre.
-- Affichez le nombre d'emprunts effectués par chaque étudiant, trié par ordre décroissant du nombre  d'emprunts.
-- Classez les livres en fonction de leur année de publication en catégories (par exemple, "Avant 2000", "Entre 2000 et 2010", "Après 2010").
-- Affichez les dix premiers livres empruntés.
-- Affichez la durée moyenne d'emprunt en jours.
-- Affichez les livres qui n'ont jamais été empruntés.