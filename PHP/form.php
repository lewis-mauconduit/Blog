<?php
session_start();

include '../Application/bdd_connexion.php';
    
/*******************REQUEST AUTHOR FORM***********************/
$query = $pdo->prepare(
	'SELECT *
	FROM Author'
);

$query->execute();
$authors = $query->fetchAll(PDO::FETCH_ASSOC);

/*******************REQUEST CATEGORY FORM***********************/
$query = $pdo->prepare(
    'SELECT *
    FROM Category'
);

$query->execute();
$categories = $query->fetchAll(PDO::FETCH_ASSOC);

/*******************RECUP INFOS FORMULAIRE ET AJOUTER DANS BDD***********************/
if (empty($_POST) == false) {

    $title = $_POST['title'];
    $content = $_POST['contents'];
    $author_Id = $_POST['author'];
    $category = $_POST['category'];


    $query = $pdo->prepare(
    'INSERT INTO Post (Title, Contents, CreationDate, Author_Id, Category_Id) 
    VALUES (?,?,now(),?,?)'
    );

    $query->execute([$title,$content,$author_Id,$category]);

    header('Location: ../index.php');
    exit();
}


include '../header.phtml';
include '../form.phtml';
include '../footer.phtml';

?>