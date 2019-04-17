<?php
session_start();

if ($_SESSION != null) {

    include '../Application/bdd_connexion.php';
    /*******************REQUEST INFOS LIST ARTICLE FROM BDD_POST ET AFFICHER***********************/

    $query = $pdo->prepare(
        'SELECT Title,Contents,FirstName,LastName,Category.Name,Post.Id
        FROM Author
        INNER JOIN Post
        ON Author.Id = Post.Author_Id
        INNER JOIN Category
        ON Category.Id = Category_Id'
    );

    $query->execute();
    $listArticles = $query->fetchAll(PDO::FETCH_ASSOC);

    /*******************REQUEST INFOS LIST AUTHOR FROM BDD_POST ET AFFICHER***********************/
    $query = $pdo->prepare(
        'SELECT Id,FirstName,LastName
        FROM Author'
    );

    $query->execute();
    $listAuthors = $query->fetchAll(PDO::FETCH_ASSOC);

    /*******************REQUEST INFOS LIST CATEGORY FROM BDD_POST ET AFFICHER***********************/
    $query = $pdo->prepare(
        'SELECT Id,Name
        FROM Category'
    );

    $query->execute();
    $listCategories = $query->fetchAll(PDO::FETCH_ASSOC);


    /*******************REQUEST INFOS LIST USERS FROM BDD_POST ET AFFICHER***********************/

    $query = $pdo->prepare(
        'SELECT Id,email,name,firstname,pseudo,role
        FROM Users'
    );

    $query->execute();
    $listUsers = $query->fetchAll(PDO::FETCH_ASSOC);

    /*******************RECUP INFOS USERS ET MAJ BDD***********************/
    if (empty($_POST) == false) {

        $role = $_POST['role'];
        $id = $_POST['id'];

        $query = $pdo->prepare(
        'UPDATE Users 
        SET role = ?
        WHERE Id = ?'
        );

        $query->execute([$role,$id]);

        header('Location: admin.php');
        exit();
        
    }
}
else {
    header('Location: ../index.php');
    exit();
}

include '../header.phtml';
include '../admin.phtml';
include '../footer.phtml';

?>