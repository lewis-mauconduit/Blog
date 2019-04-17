<?php
session_start();

/*******************REQUEST INFOS FROM BDD_POST ET AFFICHER***********************/
include '../Application/bdd_connexion.php';
$query = $pdo->prepare(
    'SELECT Title,Contents,Id
    FROM Post
    WHERE Id = ?'
);

$query->execute([$_GET['Id']]);
$InfosArticle = $query->fetch(PDO::FETCH_ASSOC);

/*******************MAJ BDD***********************/
if (empty($_POST) == false) {

    $title = $_POST['title'];
    $content = $_POST['contents'];

    $query = $pdo->prepare(
        'UPDATE Post 
        SET Title = ?,Contents = ?
        WHERE Id = ?'
    );

    $query->execute([$title, $content, $_GET['Id']]);

    header('Location: admin.php');
    exit();
}



include '../header.phtml';
include '../modifArticle.phtml';
include '../footer.phtml';

?>