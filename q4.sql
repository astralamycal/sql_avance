CREATE TABLE departements (
  id INT PRIMARY KEY,
  nom VARCHAR(50) NOT NULL
);

CREATE TABLE 3fn_employes (
  id INT PRIMARY KEY,
  nom VARCHAR(50) NOT NULL,
  departement_id INT NOT NULL REFERENCES departements(id)
);

CREATE TABLE chefs_projet (
  id INT PRIMARY KEY,
  nom VARCHAR(50) NOT NULL,
  telephone VARCHAR(20)
);

CREATE TABLE projets (
  id INT PRIMARY KEY,
  nom VARCHAR(50) NOT NULL,
  chef_projet_id INT NOT NULL REFERENCES chefs_projet(id)
);

CREATE TABLE affectations (
  employe_id INT REFERENCES 3fn_employes(id),
  projet_id INT REFERENCES projets(id),
  PRIMARY KEY (employe_id, projet_id)
);

-- Dépendances: employe_id -> employe_nom, dept_nom,projet -> chef_projet, chef_projet -> chef_projet_tel

-- Clés primaires / étrangères :
-- departements -> primaire id
-- employes_3fn -> primaire id - étrangère departement_id -> departements(id)
-- chefs_projet -> primaire id
-- projets -> primaire id - étrangère chef_projet_id -> chefs_projet(id)
-- affectations -> primaire (employe_id, projet_id) - étrangère employe_id -> employes_3fn(id), étrangère projet_id -> projets(id)