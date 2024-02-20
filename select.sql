use doranco_merise;

-- 1 Affichez tous les livres disponibles dans la table "Livre".
SELECT * FROM book;

-- 2 Affichez les étudiants qui ont emprunté un livre après une date spécifique.
SELECT st.name, st.firstname, borrow.Date_back
FROM borrow
    JOIN student st ON borrow.id_student = st.id
WHERE Date_borrow > '2023-01-01';

-- 3 Affichez le nom et le prénom de l'auteur de chaque livre.
SELECT book.title, author.name, author.firstname
FROM book
JOIN author ON book.id_author = author.id;

-- 4 Affichez les livres empruntés par un étudiant spécifique en incluant les détails de l'emprunt.
SELECT student.firstname, book.title, borrow.Date_borrow, borrow.Date_back
FROM book
JOIN borrow ON book.id = borrow.id_book
JOIN student ON borrow.id_student = student.id
WHERE borrow.id_student = 2;

-- 5 Comptez le nombre total de livres dans la bibliothèque.
SELECT COUNT(*) AS TotalBooks FROM book;

-- 6 Affichez le nombre total de livres écrits par chaque auteur.
SELECT author.name, author.firstname, COUNT(book.id) AS TotalBooks
FROM author
JOIN book ON author.id = book.id_author
GROUP BY author.id;

-- 7 Affichez les livres qui ont été empruntés au moins une fois.
SELECT * FROM book WHERE id IN (SELECT id_book FROM borrow);

-- 8 Affichez les étudiants qui n'ont pas encore emprunté de livre.
SELECT * FROM student WHERE id NOT IN (SELECT id_student FROM borrow);


SELECT firstname, name as 'borrow_id'
FROM student
LEFT JOIN borrow ON borrow.id_student = student.id
WHERE borrow.id IS NULL;

-- 9 Afficher la moyenne des années de naissance des auteurs.
SELECT ROUND(AVG(YEAR(birthday))) AS MoyenneAnneeNaissance FROM author;

-- 10 Affichez le nombre d'emprunts effectués par chaque étudiant.
SELECT student.id, student.name, student.firstname, COUNT(borrow.id) AS TotalBorrows
FROM student
LEFT JOIN borrow ON student.id = borrow.id_student
GROUP BY student.id;

-- 11 Affichez les détails des emprunts, y compris le titre du livre, le nom de l'auteur et le nom de l'étudiant.
SELECT book.title, author.name AS AuthorName, author.firstname AS AuthorFirstname, student.name AS StudentName, borrow.Date_borrow, borrow.Date_back
FROM book
         JOIN author ON book.id_author = author.id
         JOIN borrow ON book.id = borrow.id_book
         JOIN student ON borrow.id_student = student.id;

-- 12 Affichez les livres qui ont été publiés au cours des trois dernières années.
SELECT * FROM book WHERE year_publish >= YEAR(NOW()) - 3;

-- 13 Affichez les étudiants ayant emprunté plus de trois livres.
SELECT * FROM student WHERE id IN (SELECT id_student FROM borrow GROUP BY id_student HAVING COUNT(*) > 3);

-- 14 Affichez les livres, les auteurs et les emprunts associés pour un étudiant spécifique.
SELECT book.title, author.name AS AuthorName, author.firstname AS AuthorFirstname, student.name AS StudentName, borrow.Date_borrow, borrow.Date_back
FROM book
         JOIN author ON book.id_author = author.id
         JOIN borrow ON book.id = borrow.id_book
         JOIN student ON borrow.id_student = student.id
WHERE student.id = 3;

-- 15 Affichez le nombre d'emprunts tardifs (retour après la date prévue) pour chaque livre.
SELECT book.title, COUNT(borrow.id) AS NombreEmpruntsEnRetard
FROM book
         JOIN borrow ON book.id = borrow.id_book
WHERE borrow.Date_back > borrow.Date_back_schedulde
GROUP BY book.title;

-- 16 Affichez le nombre d'emprunts effectués par chaque étudiant, trié par ordre décroissant du nombre  d'emprunts.
SELECT student.id, student.name, student.firstname, COUNT(borrow.id) AS TotalBorrows
FROM student
         LEFT JOIN borrow ON student.id = borrow.id_student
GROUP BY student.id
ORDER BY TotalBorrows DESC;

-- 17 Classez les livres en fonction de leur année de publication en catégories (par exemple, "Avant 2000", "Entre 2000 et 2010", "Après 2010").
SELECT title,
       CASE
           WHEN year_publish < 2000 THEN 'Avant 2000'
           WHEN year_publish BETWEEN 2000 AND 2010 THEN 'Entre 2000 et 2010'
           ELSE 'Après 2010'
           END AS CatégoriePublication
FROM book;

-- 18 Affichez les dix premiers livres empruntés.
SELECT * FROM borrow
ORDER BY Date_borrow
LIMIT 10;

-- 19 Affichez la durée moyenne d'emprunt en jours.
SELECT AVG(DATEDIFF(Date_back, Date_borrow)) AS DuréeMoyenneEmprunt FROM borrow;
SELECT DATEDIFF(Date_back, Date_borrow) FROM borrow;

-- 20 Affichez les livres qui n'ont jamais été empruntés.
SELECT * FROM book
WHERE id NOT IN (SELECT id_book FROM borrow);

