-- 1/ Affichez tous les livres disponibles dans la table "Livre".
SELECT * FROM book;

-- 2/ Affichez les étudiants qui ont emprunté un livre après une date spécifique.
SELECT s.* FROM borrow b JOIN student s ON b.id_student=s.id WHERE b.Date_borrow > '2023-02-01';

-- 3/ Affichez le nom et le prénom de l'auteur de chaque livre.
SELECT b.title, a.name, a.firstname FROM book b JOIN author a ON b.id_author=a.id;

-- 4/ Affichez les livres empruntés par un étudiant spécifique en incluant les détails de l'emprunt.
SELECT s.*, b.id as "Borrow id", b.Date_borrow, b.Date_back_schedulde, b.Date_back 
FROM student s 
JOIN borrow b ON b.id_student=s.id 
WHERE s.id=1;

-- 5/ Comptez le nombre total de livres dans la bibliothèque.
SELECT COUNT(*) AS "Nombre de livres" FROM book;

-- 6/ Affichez le nombre total de livres écrits par chaque auteur.
SELECT a.name, a.firstname, COUNT(*) AS "Livres écrits" 
FROM book b JOIN author a ON b.id_author=a.id 
GROUP BY a.id;

-- 7/ Affichez les livres qui ont été empruntés au moins une fois.
SELECT book.* FROM borrow JOIN book ON borrow.id_book=book.id;


-- 8/ Affichez les étudiants qui n'ont pas encore emprunté de livre.
SELECT * FROM student s WHERE s.id NOT IN (SELECT id_student FROM borrow);

-- 9/ Afficher la moyenne des années de naissance des auteurs.
SELECT AVG(YEAR(birthday)) FROM author;

-- 10/ Affichez le nombre d'emprunts effectués par chaque étudiant.
SELECT s.name, s.firstname, COUNT(b.id) AS "Nombre d'emprunt" FROM student s JOIN borrow b ON s.id=b.id_student GROUP BY b.id;

-- 11/ Affichez les détails des emprunts, y compris le titre du livre, le nom de l'auteur et le nom de l'étudiant.
SELECT borrow.*, book.title, CONCAT(a.name, " ", a.firstname) AS "Auteur", CONCAT(s.name, " ", s.firstname) AS "Étudiant"
FROM borrow 
JOIN book ON borrow.id_book=book.id
JOIN author a ON book.id_author=a.id 
JOIN student s ON borrow.id_student=s.id;

-- 12/ Affichez les livres qui ont été publiés au cours des trois dernières années.
SELECT * FROM book WHERE year_publish >= YEAR(NOW()) - 3;

-- 13/ Affichez les étudiants ayant emprunté plus de trois livres.
SELECT * 
FROM student s 
WHERE s.id IN (
    SELECT s.id 
    FROM student s 
    JOIN borrow b ON s.id=b.id_student 
    GROUP BY b.id 
    HAVING COUNT(*) >= 3
);

-- 14/ Affichez les livres, les auteurs et les emprunts associés pour un étudiant spécifique.
SELECT s.id AS "id_student", borrow.*, book.*, a.*
FROM student s
JOIN borrow ON borrow.id_student=s.id
JOIN book ON book.id=borrow.id_book
JOIN author a ON a.id=book.id_author
WHERE s.id=1;

-- 15/ Affichez le nombre d'emprunts tardifs (retour après la date prévue) pour chaque livre.
SELECT book.title, COUNT(borrow.id) AS "nombre_d_emprunts_tardifs"
FROM book
LEFT JOIN borrow ON book.id = borrow.id_book AND borrow.Date_back > borrow.Date_back_schedulde
GROUP BY book.title;

-- 16/ Affichez le nombre d'emprunts effectués par chaque étudiant, trié par ordre décroissant du nombre  d'emprunts.
SELECT s.name, COUNT(borrow.id) AS "nb_emprunts"
FROM student s
LEFT JOIN borrow ON s.id = borrow.id_student
GROUP BY s.name
ORDER BY nb_emprunts DESC;

-- 17/ Classez les livres en fonction de leur année de publication en catégories (par exemple, "Avant 2000", "Entre 2000 et 2010", "Après 2010").


-- 18/ Affichez les dix premiers livres empruntés.
SELECT book.*
FROM borrow
JOIN book ON borrow.id_book = book.id
ORDER BY borrow.Date_borrow ASC
LIMIT 10;

-- 19/ Affichez la durée moyenne d'emprunt en jours.


-- 20/ Affichez les livres qui n'ont jamais été empruntés.
SELECT *
FROM book
WHERE book.id NOT IN (SELECT borrow.id_book FROM borrow);
