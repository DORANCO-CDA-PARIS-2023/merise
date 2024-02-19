-- Création de la table Livres

CREATE TABLE Livres (
  id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE,
  titre VARCHAR(200) NOT NULL,
  Id_Auteur INTEGER,
  id_Genre INTEGER,
  disponible BOOLEAN DEFAULT true NOT NULL,
  id_emprunt INTEGER
);

-- Création de la table Emprunts

CREATE TABLE Emprunts (
  id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE,
  Date DATE NOT NULL,
  fk_Livre INTEGER,
  id_Etudiant INTEGER,
  retour_prevu DATE NOT NULL
);

-- Création de la table Etudiant

CREATE TABLE Etudiant (
  id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE,
  Nom VARCHAR(50) NOT NULL,
  Prenom VARCHAR(30) NOT NULL
);

-- Création de la table Genre_livre

CREATE TABLE Genre_livre (
  id_livre INTEGER,
  id_genre INTEGER,
  PRIMARY KEY (id_livre, id_genre)
);

-- Création de la table Auteur

CREATE TABLE Auteur (
  id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE,
  Nom VARCHAR(50) NOT NULL,
  Prenom VARCHAR(30) NOT NULL
);

-- Création de la table Genre

CREATE TABLE Genre (
  id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE,
  libellé VARCHAR(30) NOT NULL
);

-- Contraintes de clés étrangères

ALTER TABLE Livres
ADD FOREIGN KEY (Id_Auteur) REFERENCES Auteur(id),
ADD FOREIGN KEY (id_Genre) REFERENCES Genre(id),
ADD FOREIGN KEY (id_emprunt) REFERENCES Emprunts(id);

ALTER TABLE Emprunts
ADD FOREIGN KEY (fk_Livre) REFERENCES Livres(id),
ADD FOREIGN KEY (id_Etudiant) REFERENCES Etudiant(id);
