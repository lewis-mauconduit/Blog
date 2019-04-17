<?php
session_start();

/*******************REQUEST INFOS FROM BDD_POST ET AFFICHER***********************/

include 'Application/bdd_connexion.php';
$query = $pdo->prepare(
    'SELECT Title,Contents,CreationDate,FirstName,LastName, Post.Id
    FROM Post 
    INNER JOIN Author 
    ON Author.Id = Post.Author_Id'
);

$query->execute();
$articles = $query->fetchAll(PDO::FETCH_ASSOC);

include 'index.phtml';
include 'footer.phtml';

?>