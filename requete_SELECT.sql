----------- 1 --------------

SELECT *
FROM Livre;

----------- 2 --------------

SELECT DISTINCT Etudiant.*
FROM Etudiant
JOIN Emprunt ON Etudiant.id = Emprunt.etudiant_id
WHERE Emprunt.date_emprunt > 'date_specifique';

----------- 3 --------------

SELECT Livre.titre, Auteur.nom, Auteur.prenom
FROM Livre
JOIN Auteur ON Livre.auteur_id = Auteur.id;

----------- 4 --------------

SELECT Livre.*, Emprunt.*
FROM Livre
JOIN Emprunt ON Livre.id = Emprunt.livre_id
WHERE Emprunt.etudiant_id = 'id_etudiant_specifique';

----------- 5 --------------

SELECT COUNT(*)
FROM Livre;

----------- 6 --------------

SELECT Auteur.nom, Auteur.prenom, COUNT(Livre.id) AS nombre_de_livres
FROM Auteur
JOIN Livre ON Auteur.id = Livre.auteur_id
GROUP BY Auteur.id;

----------- 7 --------------

SELECT Livre.*
FROM Livre
JOIN Emprunt ON Livre.id = Emprunt.livre_id;

----------- 8 --------------

SELECT *
FROM Etudiant
WHERE id NOT IN (SELECT etudiant_id FROM Emprunts);

----------- 9 --------------

SELECT AVG(annee_naissance) AS moyenne_annee_naissance
FROM Auteur;

----------- 10 --------------

SELECT Etudiant.nom, Etudiant.prenom, COUNT(Emprunts.id) AS nombre_emprunts
FROM Etudiant
LEFT JOIN Emprunts ON Etudiant.id = Emprunts.etudiant_id
GROUP BY Etudiant.id;

----------- 11 --------------

SELECT Livre.titre, Auteur.nom AS nom_auteur, Auteur.prenom AS prenom_auteur, Etudiant.nom AS nom_etudiant, Etudiant.prenom AS prenom_etudiant
FROM Emprunts
JOIN Livre ON Emprunts.livre_id = Livre.id
JOIN Auteur ON Livre.auteur_id = Auteur.id
JOIN Etudiant ON Emprunts.etudiant_id = Etudiant.id;

----------- 12 --------------

SELECT *
FROM Livre
WHERE annee_publication >= YEAR(CURDATE()) - 3;

----------- 13 --------------

SELECT Etudiant.*, COUNT(Emprunts.id) AS nombre_emprunts
FROM Etudiant
JOIN Emprunts ON Etudiant.id = Emprunts.etudiant_id
GROUP BY Etudiant.id
HAVING COUNT(Emprunts.id) > 3;

----------- 14 --------------

SELECT Livre.*, Auteur.nom AS nom_auteur, Auteur.prenom AS prenom_auteur, Emprunts.*
FROM Emprunts
JOIN Livre ON Emprunts.livre_id = Livre.id
JOIN Auteur ON Livre.auteur_id = Auteur.id
WHERE Emprunts.etudiant_id = 'id_etudiant_specifique';

----------- 15 --------------

SELECT Livre.titre, COUNT(CASE WHEN Emprunts.date_retour > Emprunts.date_retour_prevue THEN 1 END) AS nombre_emprunts_tardifs
FROM Emprunts
JOIN Livre ON Emprunts.livre_id = Livre.id
GROUP BY Livre.id;

----------- 16 --------------

SELECT Etudiant.nom, Etudiant.prenom, COUNT(Emprunts.id) AS nombre_emprunts
FROM Etudiant
LEFT JOIN Emprunts ON Etudiant.id = Emprunts.etudiant_id
GROUP BY Etudiant.id
ORDER BY COUNT(Emprunts.id) DESC;

----------- 17 --------------

SELECT titre,
       CASE
           WHEN annee_publication < 2000 THEN 'Avant 2000'
           WHEN annee_publication >= 2000 AND annee_publication <= 2010 THEN 'Entre 2000 et 2010'
           ELSE 'Après 2010'
       END AS categorie_publication
FROM Livre;

----------- 18 --------------

SELECT Livre.*, COUNT(Emprunts.id) AS nombre_emprunts
FROM Livre
JOIN Emprunts ON Livre.id = Emprunts.livre_id
GROUP BY Livre.id
ORDER BY COUNT(Emprunts.id) DESC
LIMIT 10;

----------- 19 --------------

SELECT AVG(DATEDIFF(date_retour, date_emprunt)) AS duree_moyenne_emprunt
FROM Emprunts;

----------- 20 --------------

SELECT *
FROM Livre
WHERE id NOT IN (SELECT livre_id FROM Emprunts);