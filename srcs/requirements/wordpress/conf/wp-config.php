<?php
define('DB_NAME', 'wordpress_db');
define('DB_USER', 'wordpress_user');
define('DB_PASSWORD', 'CeciEst1SuperMotDePasse!');
define('DB_HOST', 'mariadb:3306');  // Adresse du service MariaDB dans docker-compose

define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

// Clés de sécurité (générées par https://api.wordpress.org/secret-key/1.1/salt/)
define('AUTH_KEY',         'g}-8IWrB-ufP?};tub2+D:_AASou{o3W#5?:zJV(oR@{{.&cz3}?~u-BN>XuYHM?');
define('SECURE_AUTH_KEY',  'miO>R--V?Z!Z%Djn(7r2Mw.^F-c:B:bab913hv@I+%Vh VJjY|M:|M=)=Ye_d@sx');
define('LOGGED_IN_KEY',    'j()yW(ka=-6?uf^gLk}A.)-9vq#nIEONIzbn= Z$e-0#-w#(K+W 4|?1WKK~>lZa');
define('NONCE_KEY',        'n+.~&jfA2TK[6ykZyoiU>*6CUAd34~H9-|q4DW~XQ+bYA_B)R3.rbM/(9ZD~;0F>');
define('AUTH_SALT',        '|a[)k[hAGR6p8qWIe?l+2Rnfra!c--u$qj)@# Rci/K@>b=^i7U&:E|VT*%ab&Z;');
define('SECURE_AUTH_SALT', 'Q+77xF_?i_~/OqeG0T<R3WwMjtOBzNi4/Ge=|=P_>!&dRj2C`QBj}-#fUrz>Gl3)');
define('LOGGED_IN_SALT',   'gj5fthf_18-iQ$jUH?DDDM9)~1+*K@5|1LP:{f!d]CoCcY.%e|43&Jaw#quS ]Vj');
define('NONCE_SALT',       '5|[0%i/64DJ_?R/,tO9.uKF^K{=E4QXR*!e|{VF[j`@twdjAmmPlu98EJ*$iwU(x');

$table_prefix = 'wp_';

define('WP_DEBUG', false);

?>
