START TRANSACTION;
CREATE DATABASE bibliotheque;
CREATE TABLE auteurs
(
id INT NOT NULL,
prenom VARCHAR,
nom VARCHAR,
PRIMARY KEY (id)
);
CREATE TABLE genres
(
id INT NOT NULL,
genre VARCHAR
PRIMARY KEY (id)
);
CREATE TABLE livres
(
id INT NOT NULL,
titre VARCHAR,
id_auteur int,
PRIMARY KEY (id),
FOREIGN KEY (id_auteur) REFERENCES auteurs(id)
);
CREATE TABLE etudiants
(
id INT NOT NULL,
prenom VARCHAR,
nom VARCHAR,
email VARCHAR,
PRIMARY KEY (id)
);
CREATE TABLE emprunts
(
id INT NOT NULL,
id_livre int,
id_etudiant int,
PRIMARY KEY (id),
FOREIGN KEY (id_livre) REFERENCES livres(id),
FOREIGN KEY (id_etudiant) REFERENCES etudiants(id),
);
CREATE TABLE appartenances
(
id INT NOT NULL,
id_livre int,
id_genre int,
PRIMARY KEY (id),
FOREIGN KEY (id_livre) REFERENCES livres(id),
FOREIGN KEY (id_genre) REFERENCES genres(id),
);
COMMIT;