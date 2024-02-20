DROP DATABASE IF EXISTS merise;

CREATE DATABASE merise;

CREATE TABLE IF NOT EXISTS auteur (
    id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS livre (
    id INT NOT NULL AUTO_INCREMENT,
    titre VARCHAR(100) NOT NULL,
    date_de_parution DATETIME,
    auteur_id INT,
    PRIMARY KEY(id),
    FOREIGN KEY(auteur_id) REFERENCES auteur(id)
);

CREATE TABLE IF NOT EXISTS etudiant (
    id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS emprunts (
    id INT NOT NULL AUTO_INCREMENT,
    livre_id INT NOT NULL,
    etudiant_id INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(livre_id) REFERENCES livre(id),
    FOREIGN KEY(etudiant_id) REFERENCES etudiant(id)
);

CREATE TABLE IF NOT EXISTS genre (
    id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(30) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS categories (
    id INT NOT NULL AUTO_INCREMENT,
    livre_id INT NOT NULL,
    genre_id INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(livre_id) REFERENCES livre(id),
    FOREIGN KEY(genre_id) REFERENCES genre(id)
);

INSERT INTO auteur (nom, prenom) VALUES
('Dupont', 'Jean'),
('Martin', 'Marie'),
('Leroy', 'Pierre');

INSERT INTO livre (titre, date_de_parution, auteur_id) VALUES
('L''histoire', '2020-01-01 10:00:00', 1),
('Le voyage', '2019-05-15 14:30:00', 2),
('La découverte', '2021-03-10 09:45:00', 3);

INSERT INTO etudiant (nom, prenom) VALUES
('Dupuis', 'Sophie'),
('Martin', 'Pierre'),
('Leroy', 'Emma');

INSERT INTO emprunts (livre_id, etudiant_id) VALUES
(1, 1),
(2, 2),
(3, 3);

INSERT INTO genre (nom) VALUES
('Fiction'),
('Romance'),
('Science-fiction');

INSERT INTO categories (livre_id, genre_id) VALUES
(1, 1),
(2, 2),
(3, 3);