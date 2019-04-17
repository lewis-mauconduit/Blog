<?php
session_start();

/*******************REQUEST INFOS FROM BDD_POST ET AFFICHER***********************/

include '../Application/bdd_connexion.php';
$query = $pdo->prepare(
    'SELECT Title,Contents,FirstName,LastName,CreationDate,Post.Id
    FROM Post
    INNER JOIN Author
    ON Author.Id = Post.Author_Id
    WHERE Post.Id = ?'
);

$query->execute([$_GET['Id']]);
$infoArticle = $query->fetch(PDO::FETCH_ASSOC);

/*******************PUT INFOS FROM COMMENT DANS BDD***********************/

if (empty($_POST) == false){

    $pseudo = $_POST['pseudo'];
    $content = $_POST['comment'];


    $query = $pdo->prepare(
        'INSERT INTO Comment (Pseudo, Contents,Post_Id,CreationDate) 
        VALUES (?,?,?,NOW())'
    );
    $query->execute([$pseudo,$content,$infoArticle['Id']]);
    
    header('Location: article.php?Id='.$infoArticle['Id']);
    exit();
}
/*******************REQUEST INFOS FROM BDD_COMMENT ET AFFICHER***********************/

$query = $pdo->prepare(
    'SELECT Pseudo,Contents
    FROM Comment
    WHERE Post_Id = ?'
);

$query->execute([$_GET['Id']]);
$infoComments = $query->fetchAll(PDO::FETCH_ASSOC);

include '../header.phtml';
include '../article.phtml';
include '../footer.phtml';

?>