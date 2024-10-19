<?php
$servername = "mariadb";  // Nom de ton conteneur ou IP
$username = "wordpress_user";  // Nom d'utilisateur de ta base de données
$password = "CeciEst1SuperMotDePasse!";  // Mot de passe de ta base de données
$dbname = "wordpress_db";  // Nom de ta base de données

// Créer une connexion
$conn = new mysqli($servername, $username, $password, $dbname);

// Vérifier la connexion
if ($conn->connect_error) {
    die("Échec de connexion : " . $conn->connect_error);
}
echo "Connexion réussie";
?>
