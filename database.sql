CREATE TABLE auteur (
    ID_auteur INT PRIMARY KEY,
    nom VARCHAR(100),
    prenom VARCHAR(100)
);

CREATE TABLE genre (
    ID_genre INT PRIMARY KEY,
    nom VARCHAR(100)
);

CREATE TABLE livre (
    ID_livre INT PRIMARY KEY,
    titre VARCHAR(255),
    ID_auteur INT,
    ID_genre INT,
    FOREIGN KEY (ID_auteur) REFERENCES auteur(ID_auteur),
    FOREIGN KEY (ID_genre) REFERENCES genre(ID_genre)
);

CREATE TABLE etudiant (
    ID_etudiant INT PRIMARY KEY,
    nom VARCHAR(100),
    prenom VARCHAR(100)
);

CREATE TABLE emprunt (
    ID_emprunt INT PRIMARY KEY,
    ID_livre INT,
    ID_etudiant INT,
    date_emprunt DATE,
    date_retour DATE,
    FOREIGN KEY (ID_livre) REFERENCES livre(ID_livre),
    FOREIGN KEY (ID_etudiant) REFERENCES etudiant(ID_etudiant)
);
