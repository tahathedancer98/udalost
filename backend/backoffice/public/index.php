<?php

require_once  __DIR__ . '/../src/vendor/autoload.php';

use udalost\webapp\connection\DataBaseConnection;
use udalost\webapp\controller\UserController;
use udalost\webapp\controller\EventController;
use udalost\webapp\controller\ParticipantController;
use udalost\webapp\middlewares\Cors;
use udalost\webapp\middlewares\DataValidation;
use udalost\webapp\middlewares\JwtToken;
use udalost\webapp\middlewares\Token;
use Symfony\Component\Console\Command\Command;

$api_settings = require_once __DIR__ . '/../src/conf/api_settings.php';
$api_errors = require_once __DIR__ . '/../src/conf/api_errors.php';

$api_container = new \Slim\Container(array_merge($api_settings, $api_errors));

$app = new \Slim\App($api_container);

/*$app->add(Cors::class.':checkHeaderOrigin');*/

DataBaseConnection::startEloquent($api_container->settings['db']);


// Utilisateurs
// Afficher tous les utilisateurs
$app->get('/utilisateurs[/]', UserController::class . ':users')->setName('utilisateurs');
// Afficher un utilisateur en particulier
$app->get('/utilisateurs/{id}[/]', UserController::class . ':aUser')->setName('utilisateur');
// Se connecter à son compte 
$app->delete('/utilisateurs/{id}[/]', UserController::class.':deleteUser')->setName('supprimerUtilisateur');

// Événements
// Afficher tous les événements
$app->get('/evenements[/]', EventController::class . ':events')->setName('evenements');
// Afficher un événement en particulier
$app->get('/evenements/{id}[/]', EventController::class . ':anEvent')->setName('evenement');
// Supprimer un événement
$app->delete('/evenements/{id}[/]', EventController::class.':deleteEvent')->setName('supprimerEvenement');

try {
    $app->run();
} catch (Throwable $e) {

}