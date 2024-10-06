<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

echo "=== Test de connexion MySQL ===\n";

// Paramètres de connexion
$host = 'mariadb';
$user = 'wordpress_user';
$pass = 'CeciEst1SuperMotDePasse!';
$db   = 'wordpress_db';

echo "Tentative de connexion à MySQL:\n";
echo "Host: $host\n";
echo "User: $user\n";
echo "Database: $db\n\n";

// Test de résolution DNS
echo "Test de résolution DNS pour $host:\n";
$dns = dns_get_record($host);
print_r($dns);

// Test de connexion avec retry
for ($i = 1; $i <= 3; $i++) {
    echo "\nTentative $i:\n";
    try {
        $start = microtime(true);
        $mysqli = new mysqli($host, $user, $pass, $db);
        $end = microtime(true);
        
        if ($mysqli->connect_errno) {
            echo "Échec de connexion MySQL: " . $mysqli->connect_error . "\n";
        } else {
            echo "Connexion réussie! (temps: " . round(($end - $start) * 1000, 2) . "ms)\n";
            
            // Test de requête simple
            $result = $mysqli->query("SELECT VERSION()");
            if ($result) {
                $row = $result->fetch_row();
                echo "Version MySQL: " . $row[0] . "\n";
            }
            
            // Test des permissions
            echo "\nPermissions de l'utilisateur:\n";
            $result = $mysqli->query("SHOW GRANTS");
            while ($row = $result->fetch_row()) {
                echo $row[0] . "\n";
            }
            
            break;
        }
    } catch (Exception $e) {
        echo "Exception: " . $e->getMessage() . "\n";
    }
    
    if ($i < 3) {
        echo "Attente de 1 seconde avant nouvelle tentative...\n";
        sleep(1);
    }
}
