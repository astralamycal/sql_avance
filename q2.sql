CREATE INDEX idx_commandes_date_statut ON commandes (date_commande, statut);


CREATE TABLE commandes_part (
  id INT NOT NULL,
  client_id INT NOT NULL,
  date_commande DATE NOT NULL,
  statut VARCHAR(20),
  canal VARCHAR(20),
  montant_total NUMERIC(10, 2),
  PRIMARY KEY (id, date_commande)
) PARTITION BY RANGE (date_commande);

CREATE TABLE 2024 PARTITION OF commandes_part FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');
CREATE TABLE 2025 PARTITION OF commandes_part FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');
CREATE TABLE 2026 PARTITION OF commandes_part FOR VALUES FROM ('2026-01-01') TO ('2027-01-01');


EXPLAIN ANALYZE
SELECT id, client_id, date_commande, montant_total
FROM commandes
WHERE statut = 'LIVREE'
  AND date_commande >= '2026-01-01'
  AND date_commande <  '2027-01-01'
ORDER BY montant_total DESC
LIMIT 10;

-- Le "Partition Pruning" sert de filtre pré-créé. Il dirige directement vers la partion de la bonne année ce qui optimise la requête.