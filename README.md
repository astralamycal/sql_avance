# sql_avance

TP de Amy Lambert

note: L'architecture utilisé pour les questions a été créé en amont avec les données du début du cours:

Schéma de référence utilisé dans tout le cours
Toutes les requêtes de ce support s'appuient sur le schéma e-commerce et
entreprise nommé DataLab B2 **renommé advanced_sql suite au fichier sql fourni pour le tp** :
- categories (id PK, nom, marge_cible)
- entrepots (id PK, nom, ville, capacite_m3)
- produits (id PK, nom, categorie_id FK, prix_unitaire, stock, entrepot_id FK)
- clients (id PK, nom, email, ville, segment, date_inscription)
- commandes (id PK, client_id FK, date_commande, statut, canal,
montant_total) - 240 commandes sur 2024, 2025, 2026
- lignes_commande (id PK, commande_id FK, produit_id FK, quantite,
prix_unitaire_applique)
- employes (id PK, nom, poste, manager_id FK NULL, departement, salaire) -
hiérarchie sur 4 niveaux
- comptes_bancaires (id PK, titulaire, solde, statut)