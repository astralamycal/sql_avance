EXPLAIN ANALYZE
SELECT id, client_id, date_commande, montant_total
FROM commandes
WHERE YEAR(date_commande) = 2026
  AND statut = 'LIVREE'
ORDER BY montant_total DESC
LIMIT 10;

-- Défauts: La fonction year force la commande à faire un seq scan et annule tout effet des indexes (c'est non sargable).
-- Il n'y a pas d'index pour avoir les commandes déjà triées. Toutes les lignes filtrées sont triées en mémoire pour n’en garder que 10 ce qui gache de la mémoire.