-- Juste en affichage >> ONE BIG TABLE
SELECT
    pretre.id_pretre,
    pretre.nom_grec,
    pretre.nom_traduit,
    pretre.presentation_p,
    pretre.commentaires_p,
    pretre.nom_datation,
    datation.debut AS datation_debut,
    datation.fin AS datation_fin,
    datation.is_periode AS datation_is_periode,
    pretre.nom_pretrise,
    pretre.nom_cite AS pretre_nom_cite,
    cite.nom_cite AS cite_nom_cite,
    cite.lattitude AS cite_lattitude,
    cite.longitude AS cite_longitude,
    cite.lien_pleiade AS cite_lien_pleiade,
    source.id_source,
    source.type_source,
    source.nom_source,
    source.contenu_source,
    source.contenu_traduit,
    source.nom_cite AS source_nom_cite,
    source.lien_corpus,
    source.pretre_associe,
    corpus.id_corpus,
    corpus.nom_corpus
FROM
    pretre
    LEFT JOIN datation ON pretre.nom_datation = datation.nom_datation
    LEFT JOIN cite ON pretre.nom_cite = cite.id_cite
    LEFT JOIN mentionner ON pretre.id_pretre = mentionner.id_pretre
    LEFT JOIN source ON mentionner.id_source = source.id_source
    LEFT JOIN regrouper ON source.id_source = regrouper.id_source
    LEFT JOIN corpus ON regrouper.id_corpus = corpus.id_corpus;


-- Création de vues
CREATE VIEW pretres_civiques_OBT AS
SELECT
    pretre.id_pretre,
    pretre.nom_grec,
    pretre.nom_traduit,
    pretre.presentation_p,
    pretre.commentaires_p,
    pretre.nom_datation,
    datation.debut AS datation_debut,
    datation.fin AS datation_fin,
    datation.is_periode AS datation_is_periode,
    pretre.nom_pretrise,
    pretre.nom_cite AS pretre_nom_cite,
    cite.nom_cite AS cite_nom_cite,
    cite.lattitude AS cite_lattitude,
    cite.longitude AS cite_longitude,
    cite.lien_pleiade AS cite_lien_pleiade,
    source.id_source,
    source.type_source,
    source.nom_source,
    source.contenu_source,
    source.contenu_traduit,
    source.nom_cite AS source_nom_cite,
    source.lien_corpus,
    source.pretre_associe,
    corpus.id_corpus,
    corpus.nom_corpus
FROM
    pretre
    LEFT JOIN datation ON pretre.nom_datation = datation.nom_datation
    LEFT JOIN cite ON pretre.nom_cite = cite.id_cite
    LEFT JOIN mentionner ON pretre.id_pretre = mentionner.id_pretre
    LEFT JOIN source ON mentionner.id_source = source.id_source
    LEFT JOIN regrouper ON source.id_source = regrouper.id_source
    LEFT JOIN corpus ON regrouper.id_corpus = corpus.id_corpus;
    