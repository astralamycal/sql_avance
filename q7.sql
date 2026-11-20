SELECT id, nom FROM employes
WHERE id NOT IN (
  SELECT manager_id FROM employes);
-- La manager a manager_id = NULL ce qui casse la requête et ne renvoie rien


SELECT employes.id, employes.nom FROM employes 
WHERE NOT EXISTS (
  SELECT 1 FROM employes WHERE employes.manager_id = employes.id);
-- On évite la comparaison avec NULL en testant l'existance d'une ligne seulement.