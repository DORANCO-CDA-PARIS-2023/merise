CREATE TABLE Auteurs (
    id INT PRIMARY KEY,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    date_naissance DATE,
    nationnalite VARCHAR(50)
);

CREATE TABLE Livres (
    id INT PRIMARY KEY,
    titre VARCHAR(255),
    annee_publication INT,
    FOREIGN KEY (id_auteur),
    FOREIGN KEY (id_genre)
);

CREATE TABLE Etudiants (
    id INT PRIMARY KEY,
    nom VARCHAR(100),
    prénom VARCHAR(100),
    date_naissance DATE,
    adresse VARCHAR(255)
);

CREATE TABLE Genre (
    id INT PRIMARY KEY,
    nom VARCHAR(50)
);

CREATE TABLE Emprunts (
    id INT PRIMARY KEY,
    date_emprunt DATE,
    date_retour DATE,
    FOREIGN KEY (id_livre),
    FOREIGN KEY (id_etudiant)
);