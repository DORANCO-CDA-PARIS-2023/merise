CREATE TABLE Livre (
    ID_livre INT PRIMARY KEY,
    Titre VARCHAR(255),
    Année_publication INT,
    ISBN VARCHAR(20)
);

CREATE TABLE Auteur (
    ID_auteur INT PRIMARY KEY,
    Nom VARCHAR(100),
    Prénom VARCHAR(100),
    Date_naissance DATE
);

CREATE TABLE Étudiant (
    ID_étudiant INT PRIMARY KEY,
    Nom VARCHAR(100),
    Prénom VARCHAR(100),
    Date_naissance DATE
);

CREATE TABLE Genre (
    ID_genre INT PRIMARY KEY,
    Nom_genre VARCHAR(50)
);

CREATE TABLE Emprunt (
    ID_emprunt INT PRIMARY KEY,
    ID_livre INT,
    ID_étudiant INT,
    Date_emprunt DATE,
    Date_retour DATE,
    FOREIGN KEY (ID_livre) REFERENCES Livre(ID_livre),
    FOREIGN KEY (ID_étudiant) REFERENCES Étudiant(ID_étudiant)
);

