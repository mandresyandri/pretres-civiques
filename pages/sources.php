<?php include "../functions/db_connect.php" ?>
<?php include "../includes/navbar.php"; ?>



<?php 
$page_id = $_GET["id"];

// afficher les datas > base id 
$sql = "SELECT * FROM pretres_civiques_obt WHERE id_source = :sources";
$params[':sources'] = $page_id;
$stmt = $pdo->prepare($sql);
$stmt->execute($params);
$$results = $stmt->fetchAll(PDO::FETCH_ASSOC);
?> 

<div class="page">
		<h1><?php echo $page_id; ?></h1>
		<h2 class="elements">Type de source : <?php echo $results[0]["type_source"];?></h2>

		<div class="reperes">
			<div class="caracteristiques">
				<img src="temple.png" alt="Photo de temple"/><span>  <strong><?php echo $results[0]["nom_pretrise"];?></span>
			</div>

			<div class="caracteristiques">
				<img src="pretre.png" alt="Photo de pretre"/><span>  <strong>Prêtre associé :</strong></span> <span class="lien"><?php echo $results[0]["pretre_associe"];?></span>
			</div>
		</div>


			<div class="contenu">
				<p><strong>Texte :</strong><?php echo $results[0]["contenu_source"];?></p>

				<p><strong>Traduction :</strong> <?php echo $results[0]["contenu_traduit"];?></p>

				<span><strong>Corpus :</strong>  </span><span class="lien"><?php echo $results[0]["nom_source"];?></span>
			</div>	

	</div>