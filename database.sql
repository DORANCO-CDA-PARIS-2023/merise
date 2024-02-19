-- Création de la table Livre
CREATE TABLE IF NOT EXISTS Livre (
    idLivre INT PRIMARY KEY AUTO_INCREMENT,
    titre VARCHAR(100),
    idGenre INT,
    idAuteur INT,
    FOREIGN KEY (idGenre) REFERENCES Genre(idGenre),
    FOREIGN KEY (idAuteur) REFERENCES Auteurs(idAuteur)
);

-- Création de la table Emprunts
CREATE TABLE IF NOT EXISTS Emprunts (
    idEmprunt INT PRIMARY KEY AUTO_INCREMENT,
    idLivre INT,
    idEtudiant INT,
    FOREIGN KEY (idLivre) REFERENCES Livre(idLivre),
    FOREIGN KEY (idEtudiant) REFERENCES Etudiant(idEtudiant)
);

-- Création de la table Etudiant
CREATE TABLE IF NOT EXISTS Etudiant (
    idEtudiant INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(150),
    prenom VARCHAR(100),
);

-- Création de la table Genre
CREATE TABLE IF NOT EXISTS Genre (
    idGenre INT PRIMARY KEY AUTO_INCREMENT,
    libelle VARCHAR(50)
);

-- Création de la table Auteurs
CREATE TABLE IF NOT EXISTS Auteurs (
    idAuteur INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100),
    prenom VARCHAR(100)
);