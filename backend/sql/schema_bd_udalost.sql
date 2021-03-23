
use udalost;

CREATE TABLE utilisateur 
(
    id					VARCHAR(36) NOT NULL PRIMARY KEY,
    nom					VARCHAR(24) NOT NULL,
    prenom				VARCHAR(24) NOT NULL,
    email				VARCHAR(24) NOT NULL,
    motpasse			VARCHAR(48) NOT NULL,
    username			VARCHAR(24) NOT NULL,
    token				VARCHAR(24) NULL,
    derniere_connexion	DATETIME
);

CREATE TABLE evenement
(
    id					VARCHAR(36) NOT NULL PRIMARY KEY,
    titre				TEXT NOT NULL,
    description			TEXT NOT NULL,
    date				DATE NOT NULL,
    heure				TIME NOT NULL,
    latitude			DECIMAL(10,7) NOT NULL,
    longitude			DECIMAL(10,7) NULL,
    adresse				VARCHAR(100) NOT NULL,
    codePostal			INT(6) NOT NULL,
    ville				VARCHAR(24) NOT NULL,
    pays				VARCHAR(24) NOT NULL,
	type				BOOL DEFAULT 0, -- 0 - public | 1 - privé
    id_utilisateur		VARCHAR(36) NOT NULL,
    foreign key (id_utilisateur) references utilisateur(id)
);

CREATE TABLE participant
(
	id					INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_evenement		VARCHAR(36) NOT NULL,
	id_utilisateur		VARCHAR(36) NULL,
    nom					VARCHAR(24) NULL,
    status				BOOL, -- 0 - Refuser | 1 - Accepter 
    message	 			TEXT NULL,
    foreign key (id_utilisateur) references utilisateur(id),
    foreign key (id_evenement) references evenement(id)
);

CREATE TABLE commentaire
(
	id					VARCHAR(36) NOT NULL PRIMARY KEY,
    id_participant		INT NOT NULL,
    texte				TEXT NULL,
    lien				TEXT NULL,
    image				MEDIUMBLOB NULL,
    foreign key (id_participant) references participant(id)
);
