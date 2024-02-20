CREATE TABLE Livre (
    ID_Livre INT PRIMARY KEY NOT NULL,
    ID_Auteur INT,
    ID_Genre INT,
    Titre VARCHAR(255),
    Annee_publication YEAR,
    ISBN VARCHAR(20),
    FOREIGN KEY (ID_Auteur) REFERENCES Auteur(ID_Auteur),
    FOREIGN KEY (ID_Genre) REFERENCES Genre(ID_Genre)
);

CREATE TABLE Auteur (
    ID_Auteur INT PRIMARY KEY NOT NULL,
    Nom VARCHAR(255),
    Prenom VARCHAR(255),
    Nationalite VARCHAR(255),
);

CREATE TABLE Etudiant (
    ID_Etudiant INT PRIMARY KEY NOT NULL,
    Nom VARCHAR(255),
    Prenom VARCHAR(255),
    Adresse VARCHAR(255),
    Mail VARCHAR(255),
    Téléphone VARCHAR(255),
);

CREATE TABLE Genre (
    ID_Genre INT PRIMARY KEY NOT NULL,
    Nom_genre VARCHAR(255),
    Description VARCHAR(255),
    
);

CREATE TABLE Emprunt (
    ID_Emprunt INT PRIMARY KEY NOT NULL,
    ID_Livre INT,
    ID_Etudiant INT,
    Date_emprunt DATE,
    Date_retour DATE,
    Status VARCHAR(255),
    FOREIGN KEY (ID_Livre) REFERENCES Livre(ID_Livre),
    FOREIGN KEY (ID_Etudiant) REFERENCES Etudiant(ID_Etudiant)
);
