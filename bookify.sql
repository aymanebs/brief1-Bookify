-- Creation des tableaux
CREATE TABLE employes(
	ID SERIAL PRIMARY KEY ,
	nom VARCHAR(20) NOT NULL,
	prenom VARCHAR(20) NOT NULL,
	sex VARCHAR(5) ,
	num_telephone VARCHAR(20),
	email VARCHAR(20)
	
);

CREATE TABLE reservations(
	ID SERIAL PRIMARY KEY ,
	jour DATE NOT NULL,
	horaire TIME NOT NULL,
	sujet VARCHAR(20),
	EMPLOYE_ID INT ,
	SALLE_ID INT ,
	EQUIPEMENT_ID INT,
	FOREIGN KEY(EMPLOYE_ID) REFERENCES employes(id)
);
CREATE TABLE salles(
	ID SERIAL PRIMARY KEY ,
	disponibilite VARCHAR(5),
	RESERVATION_ID INT ,
	FOREIGN KEY(RESERVATION_ID) REFERENCES reservations(id)
);
CREATE TABLE equipements(
	ID SERIAL PRIMARY KEY ,
	libel VARCHAR(20) NOT NULL,
	disponibilite VARCHAR(5),
	RESERVATION_ID INT ,
	FOREIGN KEY(RESERVATION_ID) REFERENCES reservations(id)
);
-- Ajout des cles etrangeres au tableau reservations
ALTER TABLE reservations
ADD FOREIGN KEY(SALLE_ID) REFERENCES salles(id);
ALTER TABLE reservations
ADD FOREIGN KEY(EQUIPEMENT_ID) REFERENCES equipements(id);

-- Insertion des donnees employes
INSERT INTO employes (nom,prenom,sex,num_telephone,email)
VALUES ('Moussaoui','Ahmad','M','0612768945','mouss@gmail.com');
INSERT INTO employes (nom,prenom,sex,num_telephone,email)
VALUES ('Alj','Yasser','M','0614768945','Alj@gmail.com');
INSERT INTO employes (nom,prenom,sex,num_telephone,email)
VALUES ('Doukkali','Hamid','M','0612768945','Doukkali@gmail.com');
INSERT INTO employes (nom,prenom,sex,num_telephone,email)
VALUES ('Zniber','Hind','F','0612708945','Zniber@gmail.com');
INSERT INTO employes (nom,prenom,sex,num_telephone,email)
VALUES ('Zair','Amine','M','0612768145','Zair@gmail.com');
INSERT INTO employes (nom,prenom,sex,num_telephone,email)
VALUES ('Bakou','Meriem','F','0712768945','Bakou@gmail.com');
INSERT INTO employes (nom,prenom,sex,num_telephone,email)
VALUES ('Hani','Kamal','M','0512768945','Hani@gmail.com');
INSERT INTO employes (nom,prenom,sex,num_telephone,email)
VALUES ('Chifa','Souad','F','0612768946','Chifa@gmail.com');
-- Insertion des donnees reservations
INSERT INTO reservations (jour,horaire,sujet,EMPLOYE_ID)
VALUES ('20/11/2023','10:00','reunion',2);
INSERT INTO reservations (jour,horaire,sujet,EMPLOYE_ID)
VALUES ('23/11/2023','11:00','reunion',3);
INSERT INTO reservations (jour,horaire,sujet,EMPLOYE_ID)
VALUES ('24/11/2023','14:00','reunion',5);
INSERT INTO reservations (jour,horaire,sujet,EMPLOYE_ID)
VALUES ('27/11/2023','09:00','reunion',7);
INSERT INTO reservations (jour,horaire,sujet,EMPLOYE_ID)
VALUES ('05/12/2023','10:30','reunion',8);
-- Insertion des donnees salles
INSERT INTO salles (disponibilite,RESERVATION_ID)
VALUES ('NON',1);
INSERT INTO salles (disponibilite,RESERVATION_ID)
VALUES ('OUI',NULL);
INSERT INTO salles (disponibilite,RESERVATION_ID)
VALUES ('NON',2);
INSERT INTO salles (disponibilite,RESERVATION_ID)
VALUES ('OUI',NULL);
INSERT INTO salles (disponibilite,RESERVATION_ID)
VALUES ('NON',3);
INSERT INTO salles (disponibilite,RESERVATION_ID)
VALUES ('OUI',NULL);
INSERT INTO salles (disponibilite,RESERVATION_ID)
VALUES ('NON',4);
INSERT INTO salles (disponibilite,RESERVATION_ID)
VALUES ('OUI',NULL);
INSERT INTO salles (disponibilite,RESERVATION_ID)
VALUES ('NON',5);
-- Insertion des id salles dans reservations
UPDATE reservations
SET SALLE_ID='1'
WHERE id=1;
UPDATE reservations
SET SALLE_ID='3'
WHERE id=2;
UPDATE reservations
SET SALLE_ID='5'
WHERE id=3;
UPDATE reservations
SET SALLE_ID='7'
WHERE id=4;
UPDATE reservations
SET SALLE_ID='9'
WHERE id=5;
-- Insertion des donnees equipements
INSERT INTO equipements (libel,disponibilite,RESERVATION_ID)
VALUES ('imprimante','NON',1);
INSERT INTO equipements (libel,disponibilite,RESERVATION_ID)
VALUES ('tableau','NON',2);
INSERT INTO equipements (libel,disponibilite,RESERVATION_ID)
VALUES ('projecteur','NON',3);
INSERT INTO equipements (libel,disponibilite,RESERVATION_ID)
VALUES ('Cable HDMI','OUI',NULL);
INSERT INTO equipements (libel,disponibilite,RESERVATION_ID)
VALUES ('Fitres','OUI',NULL);
INSERT INTO equipements (libel,disponibilite,RESERVATION_ID)
VALUES ('scratch pads','OUI',NULL);
-- Insertion des id equipement dans reservations
UPDATE reservations
SET EQUIPEMENT_ID='1'
WHERE id=1;
UPDATE reservations
SET EQUIPEMENT_ID='2'
WHERE id=4;
UPDATE reservations
SET EQUIPEMENT_ID='3'
WHERE id=5;
-- Liste des employes 
SELECT *
from employes;
-- Liste des reservations
SELECT *
from reservations; 
-- Liste des salles
SELECT *
from salles; 
-- Liste des equipements
SELECT *
from equipements; 
--liste des employes par leur nom
SELECT *
from employes
ORDER BY nom; 
--liste des 5 premier employes 
SELECT *
from employes
LIMIT 5;
-- Liste des employes masculin
SELECT *
from employes
WHERE sex = 'M';
--liste des employes par leur nom complet
SELECT   
concat (prenom,' ', nom) AS nom_complet
FROM employes;
--liste des reservations des plus recentes
SELECT *
from reservations
ORDER BY jour DESC; 
-- nombre des employees males
SELECT COUNT (id)
FROM employes;
WHERE sex='M';
-- liste des prenoms des employes et des libels d equipements
SELECT prenom 
FROM employes
UNION
SELECT libel
FROM equipements;
-- liste des employes et date reservations et les equipements reserves
SELECT employes.nom,employes.prenom,reservations.jour,reservations.horaire,equipements.libel
FROM employes
JOIN reservations
ON employes.ID=reservations.EMPLOYE_ID
LEFT JOIN equipements
ON reservations.id=equipements.RESERVATION_ID;



