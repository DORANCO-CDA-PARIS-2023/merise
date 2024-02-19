CREATE TABLE auteur (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nom VARCHAR(100),
    prenom VARCHAR(100)
);

CREATE TABLE genre (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nom VARCHAR(100)
);

CREATE TABLE livre (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    titre VARCHAR(255),
    id_auteur INT,
    id_genre INT,
    FOREIGN KEY (ID_auteur) REFERENCES auteur(id),
    FOREIGN KEY (ID_genre) REFERENCES genre(id)
);

CREATE TABLE etudiant (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nom VARCHAR(100),
    prenom VARCHAR(100)
);

CREATE TABLE emprunt (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_livre INT,
    id_etudiant INT,
    date_emprunt DATE,
    date_retour DATE,
    FOREIGN KEY (id_livre) REFERENCES livre(id),
    FOREIGN KEY (id_etudiant) REFERENCES etudiant(id)
);
