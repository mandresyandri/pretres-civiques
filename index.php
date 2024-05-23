<?php include "includes/navbar.php"; ?>
<?php include "functions/db_connect.php" ?>
<?php include "functions/filter.php" ?>

<?php
// PREALABLE AFFICHER LES ELEMENTS POUR LE FORMULAIRE
// Afficher les prêtres
$pretres = $pdo->prepare("SELECT * FROM pretre");
$pretres->execute();
$results_pretres = $pretres->fetchAll();

// afficher les cites
$cite = $pdo->prepare("SELECT * FROM cite");
$cite->execute();
$results_cite = $cite->fetchAll();
?>  

<!-- Code de la page de recherche -->
<div class="search-content">
    <h1 class="search-title">Rechercher un prêtre</h1>
    <form class="search-form" method="GET" action="">
        <!-- Selection pour cités -->
        <label for="cite">Cités</label>
        <select name="cite" id="cite">
        <option value="all_cite">Choisir la cité</option>
        <!-- Dynamique -->
        <?php
            $unique_cites = array();

            foreach ($results_cite as $cite) {
                $unique_cites[$cite["nom_cite"]] = $cite["id_cite"];
            }

            foreach ($unique_cites as $nom_cite => $id_cite) {
                echo '<option value="' . $id_cite . '">' . $nom_cite . '</option>';
            }
        ?>
        </select>

        <!-- Afficher les prêtres -->
        <label for="pretrise">Prêtrise</label>
        <select name="pretrise" id="pretrise">
        <option value="all_pretres">Choisir la prêtrise</option>
        <!-- Dynamique -->
        <?php 
            $unique_pretres = array();

            foreach ($results_pretres as $pretre) {
                $unique_pretres[$pretre["nom_pretrise"]] = true;
            }
            
            foreach ($unique_pretres as $nom_pretrise => $value) {
                echo '<option value="' . $nom_pretrise . '">' . $nom_pretrise . '</option>';
            }
        ?>
        </select>
        <br/><br/><br/> <!-- CHANGER CELA EN DIV -->

        <!-- Afficher les dates -->
        <div class="get-dates">
            <label for="dates">Dates</label>
            <p class="Descriptions">
                Vous pouvez spécifier la période sur laquelle porte votre recherche (exemple : entre le 15 et 37)
            </p>
            <input type="text" id="date_debut" placeholder="date_debut" name="date_debut">
            <input type="text" id="date_fin" placeholder="date_fin" name="date_fin">
        </div>
        <br/><br/><br/> <!-- CHANGER CELA EN DIV -->

        <!-- Recherche dans toute la base de données -->
        <div class="search-all">
            <label for="search-all">Recherche générale</label>
            <input type="text" id="search" name="search-box" placeholder="Rechercher sur toute la base de données...">
        </div>
        
        <br /><br />
        <input type="submit" value="Submit">
    </form>
</div>

<!-- Code pour afficher les résultats -->
<div class="result-content">
    <!-- Affichage dynamique -->
    <?php
    // Appel de fonction
    $results = executeSearch($pdo);
    var_dump($results);
    ?>
</div>

<?php include "includes/footer.php"; ?>