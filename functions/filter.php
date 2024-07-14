<?php
// FONTION DE FILTRE
function executeSearch($pdo) {
        // Base de la requête SQL
        // Si empty search-box
        if (empty($_GET["search-box"])) {
            $sql = "SELECT * FROM true_pretres_civiques___pretres_civiques_obt_240712 WHERE 1=1";
            $params = [];
        
            // "cite" filter
            if (isset($_GET['cite']) && $_GET['cite'] != "all_cite") {
                $sql .= " AND pretre_nom_cite = :cite";
                $params[':cite'] = $_GET['cite'];
            }
        
            // "pretrise" filter
            if (isset($_GET['pretrise']) && $_GET['pretrise'] != "all_pretres") {
                $sql .= " AND nom_pretrise = :pretre";
                $params[':pretre'] = $_GET['pretrise'];
            }
        
            // date range filter
            if (isset($_GET['date_debut']) && $_GET['date_debut'] != "" && isset($_GET['date_fin']) && $_GET['date_fin'] != "") {
                $sql .= " AND datation_debut >= :debut AND datation_fin <= :fin";
                $params[':debut'] = $_GET['date_debut'];
                $params[':fin'] = $_GET['date_fin'];
            }
        
            $stmt = $pdo->prepare($sql);
            $stmt->execute($params);
            $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
        
            // Afficher les résultats
            return $results;
        } 
        
        // Si search-box n'est pas empty
        else {
            $sql = "SELECT * FROM true_pretres_civiques___pretres_civiques_obt_240712 
            WHERE (
                nom_grec LIKE :search 
                OR nom_traduit LIKE :search 
                OR nom_datation LIKE :search 
                OR cite_nom_cite LIKE :search 
                OR type_source LIKE :search 
                OR nom_source LIKE :search 
                OR contenu_source LIKE :search 
                OR contenu_traduit LIKE :search 
                OR nom_corpus LIKE :search
            )";

            $params[':search'] = '%' . trim($_GET['search-box']) . '%';

            $stmt = $pdo->prepare($sql);
            $stmt->execute($params);
            $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
        
            // Afficher les résultats
            return $results;
        }
    }