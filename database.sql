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
    auteur_id INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(livre_id) REFERENCES livre(id),
    FOREIGN KEY(auteur_id) REFERENCES auteur(id)
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