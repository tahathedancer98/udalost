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

$app->add(Cors::class.':checkHeaderOrigin');

DataBaseConnection::startEloquent($api_container->settings['db']);

// print '<h1>API WEB</h1>';

//* Les objets de type requête
// Utilisateurs
// Afficher tous les utilisateurs
$app->get('/utilisateurs[/]', UserController::class . ':users')->setName('utilisateurs');
// Afficher un utilisateur en particulier
$app->get('/utilisateurs/{id}[/]', UserController::class . ':aUser')->setName('utilisateur');
// Créer un utilisateur
$app->post('/utilisateurs[/]', UserController::class.':createUser')->setName('creerUtilisateur');
// Se connecter à son compte 
$app->post('/connexion[/]', UserController::class.':loginUser')->setName('connexion');
// Modifier un utilisateur
$app->put('/utilisateurs/{id}', UserController::class.':editUser')->setName('modifierUtilisateur');
// Supprimer un utilisateur
$app->delete('/utilisateurs/{id}[/]', UserController::class.':deleteUser')->setName('supprimerUtilisateur');


// Événements
// Afficher tous les événements
$app->get('/evenements[/]', EventController::class . ':events')->setName('evenements');
// Afficher un événement en particulier
$app->get('/evenements/{id}[/]', EventController::class . ':anEvent')->setName('evenement');
// Créer un événement
$app->post('/evenements[/]', EventController::class.':addEvent')->setName('creerEvenement');
// Laisser un commentaire sur l'événement
$app->post('/evenements/{id}/commentaires[/]', EventController::class.':addComment')->setName('ajouterCommentaire');
// Modifier un événement
$app->put('/evenements/{id}', EventController::class.':editEvent')->setName('modifierEvenement');
// Rejoindre un événement en tant que participant
$app->put('/evenements/{id}/rejoindre[/]', EventController::class.':joinEvent')->setName('rejoindreEvenement');
// Supprimer un événement
$app->delete('/evenements/{id}[/]', EventController::class.':deleteEvent')->setName('supprimerEvenement');


// Participants
// Afficher tous les participants
$app->get('/participants[/]', ParticipantController::class . ':participants')->setName('participants');
// Afficher un participant en particulier
$app->get('/participants/{id}[/]', ParticipantController::class . ':aParticipant')->setName('participant');

// Déclenche le traitement par le framework de la requête courante et la compare dans l'ordre de chacune des routes
try {
    $app->run();
} catch (Throwable $e) {

}