-- Active: 1708418992719@@127.0.0.1@3306@doranco_merise

-- Grâce à mon extension MySQL je peux tester en direct dans vscode mes requêtes et ça me donne un result.json, je conseille de l'installer ça aide bien à debug

-- 1. Affichez tous les livres disponibles dans la table "Livre".
SELECT * FROM book;

-- 2. Affichez les étudiants qui ont emprunté un livre après une date spécifique.
SELECT student.*
FROM student
    JOIN borrow ON student.id = borrow.id_student
WHERE
    Date_borrow > '2023-02-01';
-- j'ai mis cette date pour obtenir des résultats

-- 3. Affichez le nom et le prénom de l'auteur de chaque livre.
SELECT book.title, author.name, author.firstname -- j'ai rajouté le titre du livre pour qu'on comprenne bien à quels livres sont attribués les noms
FROM book
    JOIN author ON book.id_author = author.id;

-- 4. Affichez les livres empruntés par un étudiant spécifique en incluant les détails de l'emprunt.
SELECT book.title, borrow.Date_borrow, borrow.Date_back_scheduled, borrow.Date_back
FROM borrow
    JOIN book ON borrow.id_book = book.id
WHERE
    id_student = 1;

-- 5. Comptez le nombre total de livres dans la bibliothèque.
SELECT COUNT(*) AS total_book FROM book;

-- 6. Affichez le nombre total de livres écrits par chaque auteur.
SELECT author.name, author.firstname, COUNT(book.id) AS bumber_book
FROM author
    JOIN book ON author.id = book.id_author
GROUP BY
    author.id;
-- Sans le Group By ça ne compte qu'un seul auteur qui aurait écrit tous les livres(j'ai galéré à rajouter ça j'avais oublié)

-- 7. Affichez les livres qui ont été empruntés au moins une fois.
SELECT book.*
FROM book
    JOIN borrow ON book.id = borrow.id_book
GROUP BY
    book.id;

-- 8. Affichez les étudiants qui n'ont pas encore emprunté de livre.
SELECT *
FROM student
WHERE
    id NOT IN(
        SELECT id_student
        FROM borrow
    );
-- JSON vide car autant étudiant n'est dans ce cas

-- 9. Afficher la moyenne des années de naissance des auteurs.
SELECT ROUND(AVG(YEAR(BIRTHDAY))) AS MoyenneAnneeNaissance
FROM author;

-- 10. Affichez le nombre d'emprunts effectués par chaque étudiant.
SELECT student.name, student.firstname, COUNT(borrow.id) AS nombre_emprunts
FROM student
    LEFT JOIN borrow ON student.id = borrow.id_student -- j'avais mis juste JOIN avant parce que les infos propres à B on ne s'en sert pas
GROUP BY
    student.id;

-- 11. Affichez les détails des emprunts, y compris le titre du livre, le nom de l'auteur et le nom de l'étudiant.
SELECT book.title, author.name, author.firstname, student.name, student.firstname
FROM
    borrow
    JOIN book ON borrow.id_book = book.id
    JOIN author ON book.id_author = author.id
    JOIN student ON borrow.id_student = student.id;

-- 12. Affichez les livres qui ont été publiés au cours des trois dernières années.
SELECT * FROM book WHERE year_publish > (2021);
-- Rien n'est renvoyé car le livre le plus récent date de 2007

-- 13. Affichez les étudiants ayant emprunté plus de trois livres.
SELECT student.*
FROM student
    JOIN borrow ON student.id = borrow.id_student
GROUP BY
    student.id
HAVING
    COUNT(borrow.id) > 3;
-- Rien n'est renvoyé car personne n'a emprunté plus de 1 livre

-- 14. Affichez les livres, les auteurs et les emprunts associés pour un étudiant spécifique.
SELECT book.title, author.name, author.firstname, borrow.*
FROM borrow
    JOIN book ON borrow.id_book = book.id
    JOIN author ON book.id_author = author.id
WHERE
    borrow.id_student = 1;

-- 15. Affichez le nombre d'emprunts tardifs (retour après la date prévue) pour chaque livre.
SELECT book.title, COUNT(*) AS late
FROM borrow
    JOIN book ON borrow.id_book = book.id
WHERE
    Date_back > Date_back_scheduled
GROUP BY
    book.id;

-- 16. Affichez le nombre d'emprunts effectués par chaque étudiant, trié par ordre décroissant du nombre  d'emprunts.
SELECT student.name, student.firstname, COUNT(borrow.id) AS number_borrow
FROM student
    JOIN borrow ON student.id = borrow.id_student
GROUP BY
    student.id
ORDER BY number_borrow DESC;

-- 17. Classez les livres en fonction de leur année de publication en catégories (par exemple, "Avant 2000", "Entre 2000 et 2010", "Après 2010").
-- ne sais pas

-- 18. Affichez les dix premiers livres empruntés.
SELECT book.title
FROM borrow
    JOIN book ON borrow.id_book = book.id
GROUP BY
    book.id
ORDER BY COUNT(borrow.id) DESC;

-- 19.Affichez la durée moyenne d'emprunt en jours.
SELECT AVG(
        DATEDIFF(Date_back, Date_borrow)
    ) AS DuréeMoyenneEmprunt
FROM borrow;
--Source correction : https://sql.sh/fonctions/datediff

-- 20. Affichez les livres qui n'ont jamais été empruntés.
SELECT * FROM book WHERE id NOT IN( SELECT id_book FROM borrow );