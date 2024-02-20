1/  SELECT * FROM doranco_merise.book;


2/
SELECT * 
  FROM doranco_merise.borrow
 where Date_borrow > '2023-02-16';
 
 
 3/ SELECT * 
FROM doranco_merise.book
 JOIN author ON book.id_author = author.id;

4/
SELECT 
book.title, borrow.Date_borrow, borrow.Date_back
FROM book
JOIN borrow ON book.id = borrow.id_book
JOIN student ON borrow.id_student = student.id
WHERE student.id = id_student;


5/
SELECT COUNT(*) AS Nombre_Total_de_Livres
FROM book;

6/
SELECT author.name, author.firstname, COUNT(*) AS Nombre_de_Livres
FROM book
JOIN author ON book.id_author = author.id_author
GROUP BY author.name, author.firstname;

7/
SELECT DISTINCT book.*
FROM book
JOIN borrow ON book.id = borrow.id_book;

8/
SELECT student.*
FROM student
LEFT JOIN borrow ON student.id = borrow.id_student
WHERE borrow.id IS NULL;

9/
SELECT AVG(birthday) AS Moyenne_Année_Naissance_des_Auteurs
FROM author;

10/
SELECT student.id, student.name, student.firstname, COUNT(*) AS Nombre_Emprunts
FROM student
JOIN borrow ON student.id = borrow.id_student
GROUP BY  student.id,  student.name, student.firstname;

11/
SELECT book.title, author.name AS Nom_Auteur, Auteur.Prenom AS Prenom_Auteur, Etudiant.Nom AS Nom_Etudiant, Etudiant.Prenom AS Prenom_Etudiant, Emprunt.Date_Emprunt, Emprunt.Date_Retour
FROM borrow
JOIN book ON borrow.id_book= book_id
JOIN author ON book.id_author = auteur.id_author
JOIN student ON borrow.is_student = student.id;

12/
SELECT *
FROM book
WHERE YEAR(year_publish) >= YEAR(CURRENT_DATE()) - 3;

13/
SELECT student.id, student.name, student.firstname, COUNT(*) AS Nombre_Emprunts
FROM student
JOIN borrow ON student.id = borrow.id_student
GROUP BY student.id, student.name, student.firstname
HAVING COUNT(*) > 3;

14/
SELECT Livre.Titre, Auteur.Nom AS Nom_Auteur, Auteur.Prenom AS Prenom_Auteur, Emprunt.Date_Emprunt, Emprunt.Date_Retour
FROM Livre
JOIN Auteur ON Livre.id_author = Auteur.id_author
JOIN Emprunt ON Livre.ID = Emprunt.ID_Livre
JOIN Etudiant ON Emprunt.ID_Etudiant = Etudiant.ID
WHERE Etudiant.ID = [ID_Étudiant];

15/
SELECT Livre.Titre, COUNT(CASE WHEN Emprunt.Date_Retour > Emprunt.Date_Retour_Prevue THEN 1 END) AS Nombre_Emprunts_Tardifs
FROM Livre
JOIN Emprunt ON Livre.ID = Emprunt.ID_Livre
GROUP BY Livre.ID, Livre.Titre;

16/

SELECT Etudiant.ID, Etudiant.Nom, Etudiant.Prenom, COUNT(*) AS Nombre_Emprunts
FROM Etudiant
JOIN Emprunt ON Etudiant.ID = Emprunt.ID_Etudiant
GROUP BY Etudiant.ID, Etudiant.Nom, Etudiant.Prenom
ORDER BY Nombre_Emprunts DESC;

17/
SELECT
    Titre,
    CASE
        WHEN YEAR(Date_Publication) < 2000 THEN 'Avant 2000'
        WHEN YEAR(Date_Publication) BETWEEN 2000 AND 2010 THEN 'Entre 2000 et 2010'
        ELSE 'Après 2010'
    END AS Categorie
FROM
    Livre;
    
    18/
    SELECT Livre.Titre, Emprunt.Date_Emprunt, Emprunt.Date_Retour
FROM book
JOIN borrow ON book_id = Emprunt.ID_Livre
ORDER BY Emprunt.Date_Emprunt
LIMIT 10;

19/
 SELECT AVG(DATEDIFF(Date_Retour, Date_Emprunt)) AS Duree_Moyenne_Emprunt
FROM borrow;


20/
SELECT *
FROM book
WHERE id NOT IN (SELECT id_book FROM borrow);