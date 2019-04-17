<?php


/*******************DELETE ARTICLE FROM BDD***********************/

include '../Application/bdd_connexion.php';

if (isset($_GET['Post_Id']) == true) {
    $query = $pdo->prepare(
        'DELETE 
        FROM Post 
        WHERE Id = ?'
    );

    $query->execute([$_GET['Post_Id']]);
    $query = $pdo->prepare(
        'DELETE 
        FROM Comment 
        WHERE Post_Id = ?'
    );

    $query->execute([$_GET['Post_Id']]);
}

/*******************DELETE AUTHOR FROM BDD***********************/
if (isset($_GET['Author_Id']) == true) {
    $query = $pdo->prepare(
        'DELETE 
        FROM Author 
        WHERE Id = ?'
    );

    $query->execute([$_GET['Author_Id']]);
}

/*******************DELETE CATEGORY FROM BDD***********************/
if (isset($_GET['Category_Id']) == true) {

    $query = $pdo->prepare(
        'DELETE 
        FROM Category 
        WHERE Id = ?'
    );

    $query->execute([$_GET['Category_Id']]);
}

/*******************DELETE USER FROM BDD***********************/
if (isset($_GET['User_Id']) == true) {
    $query = $pdo->prepare(
        'DELETE 
        FROM Users 
        WHERE Id = ?'
    );

    $query->execute([$_GET['User_Id']]);
}

include 'admin.php';

?>