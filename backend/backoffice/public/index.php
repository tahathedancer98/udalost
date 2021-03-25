<?php

require_once __DIR__ . '/../src/vendor/autoload.php' ;

use udalost\backoffice\connection\DataBaseConnection;
//use udalost\webapp\controller\UserController;
//use udalost\webapp\controller\EventController;
use udalost\backoffice\models\Utilisateur as Utilisateur;


$api_settings = require_once __DIR__ . '/../src/conf/api_settings.php';
$api_errors = require_once __DIR__ . '/../src/conf/api_errors.php';

<<<<<<< Updated upstream
//use udalost\backend\controller\CommandeController;
use udalost\backend\models\Utilisateur;
=======
>>>>>>> Stashed changes

$api_container = new \Slim\Container(array_merge($api_settings, $api_errors));

$app = new \Slim\App($api_container);

DataBaseConnection::startEloquent($api_container->settings['db']);

print '<h1>API BACKOFFICE</h1>';

$requete = Utilisateur::select();
$lignes = $requete->get();
foreach ($lignes as $v) {
  echo "<br>Nom du propriétaire : $v->nom";
}