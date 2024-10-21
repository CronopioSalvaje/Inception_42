<?php
$to = "chrisap@live.fr";
$subject = "Test de connexion Postfix";
$message = "Ceci est un message de test pour vérifier la connexion à Postfix.";
$headers = "From: admin@musicaltheory.42.fr\r\n";
$headers .= "Reply-To: admin@musicaltheory.42.fr\r\n";
$headers .= "X-Mailer: PHP/" . phpversion();

// Définir un temps d'exécution plus long si nécessaire
set_time_limit(300);

// Activer la journalisation des erreurs
ini_set('display_errors', 1);
ini_set('log_errors', 1);
ini_set('error_log', '/chemin/vers/votre/php-error.log');

// Tentative d'envoi d'e-mail
$start_time = microtime(true);
$result = mail($to, $subject, $message, $headers);
$end_time = microtime(true);

// Affichage du résultat
if ($result) {
    echo "E-mail envoyé avec succès.\n";
} else {
    echo "Échec de l'envoi de l'e-mail.\n";
}

echo "Temps d'exécution : " . ($end_time - $start_time) . " secondes.\n";

// Vérification de la configuration Postfix
$postfix_config = shell_exec('postconf');
echo "Configuration Postfix :\n$postfix_config\n";

// Vérification du statut du service Postfix
$postfix_status = shell_exec('service postfix status');
echo "Statut de Postfix :\n$postfix_status\n";
?>