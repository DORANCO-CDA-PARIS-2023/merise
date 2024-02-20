-- ** Exercice SELECT **

-- 1. Affichez tous les livres disponibles dans la table "Livre".

SELECT * FROM book;

-- 2. Affichez les étudiants qui ont emprunté un livre après une date spécifique.

SELECT s.name, s.firstname, br.Date_borrow
     FROM borrow br
     JOIN student s ON br.id_student = s.id
     WHERE br.Date_borrow > '2023-01-01';

-- 3. Affichez le nom et le prénom de l'auteur de chaque livre.

SELECT a.name, a.firstname, b.title
     FROM author a
     JOIN book b ON b.id_author = a.id;

-- 4. Affichez les livres empruntés par un étudiant spécifique en incluant les détails de l'emprunt.

SELECT s.name, s.firstname,b.title, br.Date_borrow, br.Date_back_schedulde, br.Date_back
     FROM borrow br
     JOIN student s ON br.id_student= s.id
     JOIN book b ON br.id_book = b.id
    -> WHERE s.id = 1;

-- 5. Comptez le nombre total de livres dans la bibliothèque.

SELECT COUNT(*) FROM book;

-- 6. Affichez le nombre total de livres écrits par chaque auteur.

SELECT a.name AS author_name, a.firstname AS author_firstname, COUNT(b.id) AS total_books
     FROM author a
     LEFT JOIN book b ON a.id = b.id_author
     GROUP BY a.id, a.name, a.firstname;

-- 7. Affichez les livres qui ont été empruntés au moins une fois.

SELECT b.title, br.Date_borrow, br.Date_back_schedulde
     FROM book b
     JOIN borrow br ON br.id_book = b.id;

-- 8. Affichez les étudiants qui n'ont pas encore emprunté de livre.

SELECT s.name, s.firstname
     FROM student s
     LEFT JOIN borrow br ON s.id = br.id_student
     WHERE br.id_student IS NULL;

-- 9. Afficher la moyenne des années de naissance des auteurs.

SELECT AVG(YEAR(birthday)) FROM author;

-- 10. Affichez le nombre d'emprunts effectués par chaque étudiant.

SELECT s.name, s.firstname, COUNT(br.id)
     FROM student s
     LEFT JOIN borrow br ON br.id_student = s.id
     GROUP BY s.id;

-- 11. Affichez les détails des emprunts, y compris le titre du livre, le nom de l'auteur et le nom de l'étudiant.

SELECT br.Date_borrow, br.Date_back_schedulde, br.Date_back, b.title,a.name, a.firstname, s.name, s.firstname
     FROM borrow br
     JOIN book b ON br.id_book = b.id
     JOIN student s ON br.id_student = s.id
     JOIN author a ON b.id_author = a.id;

-- 12. Affichez les livres qui ont été publiés au cours des trois dernières années.

SELECT *
     FROM book
     WHERE year_publish >= YEAR(CURDATE()) - 3;

-- 13. Affichez les étudiants ayant emprunté plus de trois livres.

SELECT s.name, s.firstname, COUNT(br.id)
FROM student s
JOIN borrow br ON s.id = br.id_student
GROUP BY s.id
HAVING COUNT(br.id) > 3;


-- 14. Affichez les livres, les auteurs et les emprunts associés pour un étudiant spécifique.

SELECT s.name, s.firstname, b.title, a.name, a.firstname, br.Date_borrow, br.Date_back_schedulde, br.Date_back
     FROM borrow br
     JOIN student s ON br.id_student= s.id
     JOIN book b ON br.id_book = b.id
     JOIN author a ON b.id_author = a.id
     WHERE s.id = 1;

-- 15. Affichez le nombre d'emprunts tardifs (retour après la date prévue) pour chaque livre.

SELECT b.title, COUNT(br.id)
     FROM borrow br
     JOIN book b ON br.id_book = b.id
     WHERE br.Date_back > br.Date_back_schedulde
     GROUP BY b.id;

-- 16. Affichez le nombre d'emprunts effectués par chaque étudiant, trié par ordre décroissant du nombre  d'emprunts.

SELECT s.name, s.firstname, COUNT(br.id)
     FROM student s
     JOIN borrow br ON s.id = br.id_student
     GROUP BY s.id
     ORDER BY COUNT(br.id) DESC;

-- 17. Classez les livres en fonction de leur année de publication en catégories (par exemple, "Avant 2000", "Entre 2000 et 2010", "Après 2010").
-- 18. Affichez les dix premiers livres empruntés.
-- 19. Affichez la durée moyenne d'emprunt en jours.
-- 20.  Affichez les livres qui n'ont jamais été empruntés.