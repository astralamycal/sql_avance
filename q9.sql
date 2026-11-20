-- Suite aux tableaux du cours et à la grille de décision:

-- Suivi GPS des véhicules - Cassandra (PA/EL)
--   1) Cohérence : cohérence éventuelle acceptable ; un petit décalage n'a pas d'impact
--   2) Scalabilité : montée en charge horizontale élevée
--   3) Modèle de données : séries temporelles indexées par véhicule et date
--   4) Motif d'accès : flux d'écritures soutenu et continu
--   Propriété PA/EL : privilégie la disponibilité et une faible latence, même en coupure réseau

-- Facturation bancaire - PostgreSQL (PC/EC)
--   1) Cohérence : transactions ACID strictes ; aucune perte / incohérence financière tolérée
--   2) Scalabilité : montée en charge verticale complétée par des réplicas de lecture
--   3) Modèle de données : relationnel normalisé
--   4) Motif d'accès : jointures complexes et requêtes analytiques
--   Propriété PC/EC : privilégie l'exactitude et rejette l'écriture au lieu d'exposer des mauvaises données

-- Recherche d'amis communs à 3 degrés - Neo4j (Base graphe)
--   1) Cohérence : cohérence éventuelle acceptable ; suggestion pas critique
--   2) Scalabilité : faible volume d'écritures ; les relations évoluent à un rythme modéré
--   3) Modèle de données : graphe fortement connecté
--   4) Motif d'accès : traversée de graphe sur 3 degrés de séparation, coûteuse en SQL à cause des multiples auto-jointures