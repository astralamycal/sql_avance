CREATE MATERIALIZED VIEW mv_synthese_segments AS
SELECT c.segment,
  COUNT(commandes.id),
  ROUND(SUM(commandes.montant_total), 2)
FROM commandes
JOIN clients c ON c.id = commandes.client_id
GROUP BY c.segment;


SELECT segment, nb_commandes, ca_total FROM mv_synthese_segments 
ORDER BY ca_total DESC;


INSERT INTO commandes (client_id, date_commande, statut, montant_total)
VALUES (3, '2026-10-12', 'LIVREE', 3000.00);


REFRESH MATERIALIZED VIEW mv_synthese_segments;


SELECT segment, nb_commandes, ca_total FROM mv_synthese_segments *
ORDER BY ca_total DESC;