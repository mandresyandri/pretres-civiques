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
.page {
    width: 80%;
    margin: 0 auto;
    background-color: #fff;
    padding: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
    color: #333;
    /* text-align: center; */
}

h2.elements {
    color: #555;
    font-size: 1.2em;
    margin-bottom: 20px;
}

.reperes {
    display: flex;
    justify-content: space-around;
    margin-bottom: 20px;
}

.caracteristiques {
    display: flex;
    align-items: center;
    padding: 10px;
    background-color: #fafafa;
    border: 1px solid #ddd;
    border-radius: 5px;
    /* width: 45%; */
}

.caracteristiques img {
    width: 50px;
    height: 50px;
    margin-right: 10px;
}

.caracteristiques span {
    font-size: 1em;
    color: #333;
}

/* .caracteristiques strong {
    font-weight: bold;
    color: #000;
} */

.contenu {
    margin-top: 20px;
}

.contenu p {
    font-size: 1em;
    line-height: 1.5;
    color: #666;
}

.contenu strong {
    font-weight: bold;
    color: #333;
}

.lien {
    color: #007BFF;
    text-decoration: none;
}

.lien:hover {
    text-decoration: underline;
}
</style>

<?php 
$page_id = $_GET["id_source"];
// Juste pour le debug
// echo "L'id de la page est -> " . $page_id;

// afficher les datas > base id 
$sql = "SELECT * FROM true_pretres_civiques___pretres_civiques_obt_240712 WHERE id_source = :sources";
$params[':sources'] = $page_id;
$stmt = $pdo->prepare($sql);
$stmt->execute($params);
// Correction de la ligne avec la variable mal orthographiée
$results = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<div class="page">
		<h1><?php echo $results[0]["nom_source"] ?></h1>
		<h2 class="elements">Type de source : <?php echo $results[0]["type_source"];?></h2>

		<div class="reperes">
			<div class="caracteristiques">
				<span>Nom pretrise :</span><span><strong><?php echo $results[0]["nom_pretrise"];?></strong></span>
			</div>

			<div class="caracteristiques">
				<span>  Prêtre associé :</span><strong><span class="lien"><?php echo $results[0]["pretre_associe"];?></strong></span>
			</div>
		</div>


			<div class="contenu">
				<p><strong>Texte :</strong><?php echo $results[0]["contenu_source"];?></p>

				<p><strong>Traduction :</strong> <?php echo $results[0]["contenu_traduit"];?></p>

				<span><strong>Corpus :</strong></span>
				<?php echo !empty($results[0]['lien_corpus']) ? '<a href="' . $results[0]['lien_corpus'] . '" class="lien">' . $results[0]['nom_source'] . '</a>' : $results[0]['nom_source']; ?>


			</div>	

	</div>