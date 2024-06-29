<?php include "../functions/db_connect.php" ?>
<?php include "../includes/navbar.php"; ?>
<style>
navbar{
    padding-left: 10%;
    height : 126.09px;
    display: flex;
    align-items: center;
    justify-content: center;
}

.titre{
    display: flex; 
    flex-direction: column;
}

#titre1{
    font-family: Ubuntu;
    font-weight: 500;
    font-size: 24px;
    line-height: 43.5px;
}

#soustitre{
    font-family: Ubuntu;
    font-size: 12.8px;
    line-height: 28.9px;
    color: #EDAB33;
}

.navbar{
    font-family: Ubuntu ;
    font-weight: 500;
    font-size: 13.6px;
    line-height: 21.76px;
    text-transform: uppercase;
    list-style-type: none;
    display: flex

}

.navbar li {
    margin: 14px;
}

.navbar a {
    text-decoration: none;
    color : black;
}

.navbar a:hover {
    color : #E5831A;
}

.navbar a::after {
    content: "";
   
    display: block;
    height: 2px;
    background: #E5831A;
    transform: scale(0);
    transition: 0.5s;
  }

  .navbar a:hover::after {
    transform:scale(1);
}
</style>

<?php 
    $page_id = $_GET["id"];

    // afficher les datas > base id 
    $sql = "SELECT * FROM pretres_civiques_obt WHERE id_pretre = :pretre";
    $params[':pretre'] = $page_id;
    $stmt = $pdo->prepare($sql);
    $stmt->execute($params);
    $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
?> 

<div class="page">

		<h1>n°<?php echo $page_id; ?></h1>
		<h2 class="elements">Nom grec : <?php echo $results[0]["nom_grec"];?> </h2>
		<h2 class="elements">Transcription : <?php echo $results[0]["nom_traduit"];?> </h2>

		<div class="reperes">
			<div class="caracteristiques">
				<img src="datation.png" alt="Photo de calendrier"/><span>  <strong>Datation :</strong> <?php echo $results[0]["nom_datation"];?></span>
			</div>

			<div class="caracteristiques">
				<img src="pretrise.png" alt="Photo de laurier"/><span>  
					<strong>Prêtrise :</strong></span> 
					<!-- SOLUTION TEMPORAIR >>> NE PAS REFAIRE DES PAGES INUTILEMENT -->
					<a class="lien" href="../?cite=all_cite&pretrise=<?php echo $results[0]["nom_pretrise"];?>&date_debut=&date_fin=&search-box=">
						<?php echo $results[0]["nom_pretrise"];?>
					</a>
			</div>

			<div class="caracteristiques">
				<img src="temple.png" alt="Photo de temple"/><span>  
					<strong>Cité :</strong></span> 
					<a class="lien" href="../?cite=<?php echo $results[0]["pretre_nom_cite"];?>&pretrise=all_pretres&date_debut=&date_fin=&search-box=">
						<?php echo $results[0]["cite_nom_cite"];?>
					</a>
			</div>
		</div>
			<div class="contenu">
				<p><strong>Présentation :</strong> <?php echo $results[0]["presentation_p"];?></p>
				<p><strong>Notes :</strong> <?php echo $results[0]["commentaires_p"];?></p>
				<span><strong>Source(s) :</strong>  </span><a class="lien" href="pages/sources.php/?id_source"> <?php echo $results[0]["contenu_traduit"];?> </a>
				<p><strong>Bibliographie :</strong> <?php echo $results[0]["nom_source"];?></p>
			</div>	

	</div>