<?php


/*Connexion localhost*/

	$pdo = new PDO('mysql:host=localhost;dbname=blog', 'root', '');

/* Connextion serveur

	$pdo = new PDO('mysql:host=localhost;dbname=coden371_blog', 'coden371_lewis', '51Ugnu0jh1');
*/


	$pdo->exec('SET NAMES UTF8');

?>