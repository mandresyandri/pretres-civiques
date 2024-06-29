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
<h1 class="search-title">Rechercher</h1>
<div class="search-content">
    
    <div class="bandeau">
        <form class="search-form" method="GET" action="">
            <div class="first-row">
                <!-- Selection pour cités -->
                 <div class="cite">
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
                 </div>
    
                <!-- Afficher les prêtres -->
                 <div class="pretrise">
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
                 </div>
            </div>


            <!-- Afficher les dates -->
            <div class="second-row">
                <div class="date-elements">
                    <label for="dates">Dates</label>
                    <p class="Descriptions">
                        <i>Vous pouvez spécifier la période sur laquelle porte votre recherche</i>
                        <br/><i>(exemple : entre le 1 et 10)</i>
                    </p>
                </div>
                <div class="date-inputs">
                    <input type="text" id="date_debut" placeholder="date_debut" name="date_debut">
                    <input type="text" id="date_fin" placeholder="date_fin" name="date_fin">
                </div>
            </div>

            
            <!-- Recherche dans toute la base de données -->
            <div class="general-search">
                <div class="elements-search">
                    <div class="search-and-input">
                        <label for="search-all" style="line-height: 3rem;font-weight: bold;">Recherche générale</label>
                        <input type="text" id="search" name="search-box" placeholder="Rechercher sur toute la base de données...">
                    </div>
                    <input type="submit" value="Recherche">
                </div>
            </div>
            
        </form>
    </div>
</div>

<!-- Rappel de la recherche effectuée -->
<div class="search-reminder" style="background-color: #f2f2f2; padding: 10px; margin-bottom: 20px;">
    <p style="font-weight: bold;">Vous avez recherché :</p>
    <ul>
        <?php 
        if (isset($_GET['cite']) && $_GET['cite'] != 'all_cite') {
            echo '<li>Cité: ' . htmlspecialchars($_GET['cite']) . '</li>'; 
        }
        if (isset($_GET['pretrise']) && $_GET['pretrise'] != 'all_pretres') {
            echo '<li>Prêtrise: ' . htmlspecialchars($_GET['pretrise']) . '</li>'; 
        }
        if (isset($_GET['date_debut']) && !empty($_GET['date_debut'])) {
            echo '<li>Date début: ' . htmlspecialchars($_GET['date_debut']) . '</li>'; 
        }
        if (isset($_GET['date_fin']) && !empty($_GET['date_fin'])) {
            echo '<li>Date fin: ' . htmlspecialchars($_GET['date_fin']) . '</li>'; 
        }
        if (isset($_GET['search-box']) && !empty($_GET['search-box'])) {
            echo '<li>Recherche générale: ' . htmlspecialchars($_GET['search-box']) . '</li>'; 
        }
        ?>
    </ul>
</div>
<!-- Code pour afficher les résultats -->
<button id="exportBtn">Export JSON</button>
<div class="result-content">
    <!-- Affichage dynamique -->
    <?php
    // Appel de fonction
    $results = executeSearch($pdo);
    foreach ($results as $result) {
        echo "<div class='div-answers'>";
        echo "<h2>" . $result['nom_traduit'] . "&nbsp;n°" . $result['id_pretre'] . "</h2>";
        echo "<div class='some-class'> <strong>Nom en grec : </strong>" . $result['nom_grec'] . "</div>";
        echo "<div class='some-class'> <strong>Nom de la prêtrise : </strong>" . $result['nom_pretrise'] . "</div>";
        echo "<div class='some-class'> <strong>Nom de la cité : </strong>" . $result['cite_nom_cite'] . "</div>";
        echo "<a href='./pages/pretres.php?id=" . $result['id_pretre'] . "'>En savoir plus</a>";
        echo "</div>";
    }
    ?>
</div>

<script>
    document.getElementById('exportBtn').addEventListener('click', function() {
        let data = [];
        document.querySelectorAll('.div-answers').forEach(div => {
            let entry = {
                nom_traduit: div.querySelector('h2').innerText.split(' n°')[0],
                id_pretre: div.querySelector('h2').innerText.split(' n°')[1],
                nom_grec: div.querySelectorAll('.some-class')[0].innerText.replace('Nom en grec : ', ''),
                nom_pretrise: div.querySelectorAll('.some-class')[1].innerText.replace('Nom de la prêtrise : ', ''),
                nom_cite: div.querySelectorAll('.some-class')[2].innerText.replace('Nom de la cité : ', ''),
                url: div.querySelector('a').href
            };
            data.push(entry);
        });

        let json = JSON.stringify(data, null, 2);
        let blob = new Blob([json], {type: 'application/json'});
        let url = URL.createObjectURL(blob);
        let a = document.createElement('a');
        a.href = url;
        a.download = 'pretre-data.json';
        document.body.appendChild(a);
        a.click();
        document.body.removeChild(a);
    });
</script>




<?php include "includes/footer.php"; ?>