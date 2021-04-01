<?php

require_once  __DIR__ . '/../src/vendor/autoload.php';

use udalost\backoffice\connection\DataBaseConnection;
use udalost\backoffice\controller\UserController;
use udalost\backoffice\controller\EventController;
use udalost\backoffice\controller\ParticipantController;
use udalost\backoffice\middlewares\Cors;
use udalost\backoffice\middlewares\DataValidation;
use udalost\backoffice\middlewares\JwtToken;
use udalost\backoffice\middlewares\Token;
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
// Se connecter à son compte 
$app->delete('/utilisateurs/{id}[/]', UserController::class.':deleteUser')->setName('supprimerUtilisateur');

// Événements
// Afficher tous les événements
$app->get('/evenements[/]', EventController::class . ':events')->setName('evenements');
// Supprimer un événement
$app->delete('/evenements/{id}[/]', EventController::class.':deleteEvent')->setName('supprimerEvenement');

try {
    $app->run();
} catch (Throwable $e) {

}