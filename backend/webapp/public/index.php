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


//Config et Connexion à la BDD
DataBaseConnection::startEloquent($api_container->settings['db']);

// print '<h1>API WEB</h1>';

//* Les objets de type requête
// Utilisateurs
// Afficher tous les utilisateurs
$app->get('/utilisateurs[/]', UserController::class . ':users')->setName('utilisateurs')->add(Cors::class.':checkHeaderOrigin')->add(Cors::class.':headersCORS');
// Afficher un utilisateur en particulier
$app->get('/utilisateurs/{id}[/]', UserController::class . ':aUser')->setName('utilisateur')->add(Cors::class.':checkHeaderOrigin')->add(Cors::class.':headersCORS');
// Créer un utilisateur
$app->post('/utilisateurs[/]', UserController::class.':createUser')->setName('creerUtilisateur')->add(Cors::class.':checkHeaderOrigin')->add(Cors::class.':headersCORS');
// Se connecter à son compte 
$app->post('/connexion[/]', UserController::class.':loginUser')->setName('connexion')->add(Cors::class.':checkHeaderOrigin')->add(Cors::class.':headersCORS');
// Modifier un utilisateur
$app->put('/utilisateurs/{id}', UserController::class.':editUser')->setName('modifierUtilisateur')->add(Cors::class.':checkHeaderOrigin')->add(Cors::class.':headersCORS');
// Supprimer un utilisateur
$app->delete('/utilisateurs/{id}[/]', UserController::class.':deleteUser')->setName('supprimerUtilisateur')->add(Cors::class.':checkHeaderOrigin')->add(Cors::class.':headersCORS');


// Événements
// Afficher tous les événements
$app->get('/evenements[/]', EventController::class . ':events')->setName('evenements')->add(Cors::class.':checkHeaderOrigin')->add(Cors::class.':headersCORS');
// Afficher un événement en particulier
$app->get('/evenements/{id}[/]', EventController::class . ':anEvent')->setName('evenement')->add(Cors::class.':checkHeaderOrigin')->add(Cors::class.':headersCORS');
// Créer un événement
$app->post('/evenements[/]', EventController::class.':addEvent')->setName('creerEvenement')->add(Cors::class.':checkHeaderOrigin')->add(Cors::class.':headersCORS');
// Modifier un événement
$app->put('/evenements/{id}', EventController::class.':editEvent')->setName('modifierEvenement')->add(Cors::class.':checkHeaderOrigin')->add(Cors::class.':headersCORS');
// Rejoindre un événement en tant que participant
$app->put('/evenements/{id}/rejoindre[/]', EventController::class.':joinEvent')->setName('rejoindreEvenement')->add(Cors::class.':checkHeaderOrigin')->add(Cors::class.':headersCORS');
// Laisser un commentaire sur l'événement
$app->post('/evenements/{id}/comment[/]', EventController::class.':addComment')->setName('ajouterCommentaire')->add(Cors::class.':checkHeaderOrigin')->add(Cors::class.':headersCORS');
// Supprimer un événement
$app->delete('/evenements/{id}[/]', EventController::class.':deleteEvent')->setName('supprimerEvenement')->setName('suppEvenement')->add(Cors::class.':checkHeaderOrigin')->add(Cors::class.':headersCORS');


// Participants
// Afficher tous les participants
$app->get('/participants[/]', ParticipantController::class . ':participants')->setName('participants')->add(Cors::class.':checkHeaderOrigin')->add(Cors::class.':headersCORS');
// Afficher un participant en particulier
$app->get('/participants/{id}[/]', ParticipantController::class . ':aParticipant')->setName('participant')->add(Cors::class.':checkHeaderOrigin')->add(Cors::class.':headersCORS');

// Déclenche le traitement par le framework de la requête courante et la compare dans l'ordre de chacune des routes
try {
    $app->run();
} catch (Throwable $e) {

}