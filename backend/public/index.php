<?php

require_once __DIR__ . '/../src/vendor/autoload.php' ;

$api_settings = require_once __DIR__ . '/../src/conf/api_settings.php';
$api_errors = require_once __DIR__ . '/../src/conf/api_errors.php';
use udalost\backend\controller\CommandeController;

$api_container = new \Slim\Container(array_merge($api_settings, $api_errors));

$app = new \Slim\App($api_container);

\udalost\backend\connection\DataBaseConnection::startEloquent($api_container->settings['db']);


/*$evenement = Carte::where('id', '=', 42)->first();
echo "\n		Afficher la carte n° 42 et ses commandes.
	  \nID de la carte : $carte->id \n\n";
foreach ($liste_commandes as $v) {
  echo "Commande n° $v->id\nClient : $v->nom_client\nDe la Carte n° $v->carte_id\n\n";
}*/