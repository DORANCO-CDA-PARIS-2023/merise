CREATE TABLE Livres (
    id_livre INT PRIMARY KEY AUTO_INCREMENT,
    titre VARCHAR(255),
    id_auteur INT,
    id_genre INT,
    exemplaires_disponibles INT,
    FOREIGN KEY (id_auteur) REFERENCES Auteurs(id_auteur),
    FOREIGN KEY (id_genre) REFERENCES Genres(id_genre)
);

CREATE TABLE Auteurs (
    id_auteur INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(255),
    prenom VARCHAR(255)
);

CREATE TABLE Etudiants (
    id_etudiant INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(255),
    prenom VARCHAR(255)
);

CREATE TABLE Genres (
    id_genre INT PRIMARY KEY AUTO_INCREMENT,
    genre VARCHAR(255)
);

CREATE TABLE Emprunt (
    id_emprunt INT PRIMARY KEY AUTO_INCREMENT,
    id_livre INT,
    id_etudiant INT,
    date_emprunt DATE,
    date_retour DATE,
    FOREIGN KEY (id_livre) REFERENCES Livres(id_livre),
    FOREIGN KEY (id_etudiant) REFERENCES Etudiants(id_etudiant)
);
