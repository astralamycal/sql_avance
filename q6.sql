WITH RECURSIVE organigramme AS (
  SELECT id, nom, poste, departement, 1 AS niveau, nom FROM employes
  WHERE manager_id IS NULL
  UNION ALL
  SELECT employes.id, employes.nom, employes.poste, 
    employes.departement, 1 + organigramme.niveau  AS niveau, organigramme.nom || ' > ' || 
    employes.nom AS nom
  FROM employes
  JOIN organigramme ON employes.manager_id = organigramme.id
  WHERE organigramme.niveau < 20 )
SELECT id, nom, poste, niveau, nom FROM organigramme
ORDER BY niveau ASC, id ASC;