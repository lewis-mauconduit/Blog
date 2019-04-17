<?php
session_start();

if ($_SESSION != null) {

    include '../Application/bdd_connexion.php';
    /*******************RECUP INFOS AND ADD AUTHOR DANS BDD***********************/
    if (empty($_POST) == false && $_GET['edit'] == 'author') {

        $firstname = $_POST['firstname'];
        $name = $_POST['name'];


        $query = $pdo->prepare(
        'INSERT INTO Author (FirstName, LastName) 
        VALUES (?,?)'
        );

        $query->execute([$firstname,$name]);

        header('Location: admin.php');
        exit();
    }

    /*******************RECUP INFOS AND ADD CATEGORY DANS BDD***********************/
    if (empty($_POST) == false && $_GET['edit'] == 'category') {

        $name = $_POST['name'];

        $query = $pdo->prepare(
        'INSERT INTO Category (Name) 
        VALUES (?)'
        );

        $query->execute([$name]);

        header('Location: admin.php');
        exit();
        
    }


}
else {
    header('Location: ../index.php');
    exit();
}



include 'admin.php';
?>