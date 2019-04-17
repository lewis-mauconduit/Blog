<?php
session_start();

include '../Application/hash.php';


/*******************RECUP INFOS FORMULAIRE ET AJOUTER DANS BDD***********************/

if (empty($_POST) == false) {

    include '../Application/bdd_connexion.php';

    $email = $_POST['email'];
    $password = hashPassword($_POST['password']); // Cryptage du mot de passe
    $name = $_POST['name'];
    $firstname = $_POST['firstname'];
    $pseudo = $_POST['pseudo'];


    $query = $pdo->prepare(
    'INSERT INTO Users (email, password, name, firstname, pseudo, role) 
    VALUES (?,?,?,?,?,"user")'
    );

    $query->execute([$email,$password,$name,$firstname,$pseudo]);

    header('Location: ../index.php');
    exit();
    
}

include '../header.phtml';
include '../register.phtml';
include '../footer.phtml';

?>