-- READ COMMITTED: calculé à chaque instruction -> 2eème select voit le changement de la deuxième requête ce qui change la valeur.
-- REPEATABLE READ résout ce problème en gardant les valeurs du début de la requête ce qui permet de garder la même valeur pour les deux select.

-- WAL permet d'annuler les écritures non validées en cas de coupure en plein virement.