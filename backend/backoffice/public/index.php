<?php

require_once __DIR__ . '/../src/vendor/autoload.php' ;

$api_settings = require_once __DIR__ . '/../src/conf/api_settings.php';
$api_errors = require_once __DIR__ . '/../src/conf/api_errors.php';

//use udalost\backend\controller\CommandeController;
use udalost\backend\models\Utilisateur;

$api_container = new \Slim\Container(array_merge($api_settings, $api_errors));

$app = new \Slim\App($api_container);

\udalost\backend\connection\DataBaseConnection::startEloquent($api_container->settings['db']);

print '<h1>API BACKOFFICE</h1>';

$requete = Utilisateur::select();
$lignes = $requete->get();
foreach ($lignes as $v) {
  echo "<br>Nom du propriétaire : $v->nom";
}