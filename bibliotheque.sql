CREATE TABLE AUTEURS (
    id_auteur INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_auteur)
);

CREATE TABLE GENRE (
    id_genre INT NOT NULL AUTO_INCREMENT,
    nom_genre VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_genre)
);

CREATE TABLE LIVRES (
    id_livre INT NOT NULL AUTO_INCREMENT,
    titre VARCHAR(50) NOT NULL,
    id_auteur INT,
    id_genre INT,
    PRIMARY KEY (id_livre),
    FOREIGN KEY (id_auteur) REFERENCES AUTEURS(id_auteur),
    FOREIGN KEY (id_genre) REFERENCES GENRE(id_genre)
);

CREATE TABLE ETUDIANTS (
    id_etudiant INT NOT NULL AUTO_INCREMENT,
    prenom VARCHAR(50) NOT NULL,
    nom VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_etudiant)
);

CREATE TABLE EMPRUNTS (
    id_emprunt INT NOT NULL AUTO_INCREMENT,
    id_livre INT,
    id_etudiant INT,
    date_sortie DATE NOT NULL,
    date_rendu DATE,
    PRIMARY KEY (id_emprunt),
    FOREIGN KEY (id_livre) REFERENCES LIVRES(id_livre),
    FOREIGN KEY (id_etudiant) REFERENCES ETUDIANTS(id_etudiant)
);
