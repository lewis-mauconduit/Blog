<?php

session_start();

include '../Application/hash.php';

$error = false;
$message = '';


if (empty($_POST) == false) {
    include '../Application/bdd_connexion.php';
    $query = $pdo->prepare
        (
            'SELECT *
            FROM Users
            WHERE email = ?'
        
        );
    
    $query->execute([ $_POST['email']]);
    $user = $query->fetch(PDO::FETCH_ASSOC);

    if ($user == false) {
    	
        $error = true;
        $message = "Votre adresse mail n'existe pas...";
    }
    else if ( verifyPassword($_POST['password'], $user['password']) == true ) {
        
        $_SESSION['email'] = $user['email'];
        $_SESSION['passsword'] = $user['password'];
        $_SESSION['name'] = $user['name'];
        $_SESSION['firstname'] = $user['firstname'];
        $_SESSION['pseudo'] = $user['pseudo'];
        $_SESSION['role'] = $user['role'];

        header('Location: ../index.php');
    exit();
    }
    else{
        $error = true;
		$message = "Votre mot de passe est incorrect...";

        var_dump($_SESSION);
    }

    
}


include '../header.phtml';
include '../login.phtml';
include '../footer.phtml';

?>