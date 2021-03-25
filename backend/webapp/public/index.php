<?php

require_once  __DIR__ . '/../src/vendor/autoload.php';

use udalost\webapp\connection\DataBaseConnection;
use udalost\webapp\controller\UserController;
use udalost\webapp\controller\EventController;
use udalost\webapp\middlewares\Cors;
use udalost\webapp\middlewares\DataValidation;
use udalost\webapp\middlewares\JwtToken;
use udalost\webapp\middlewares\Token;
use Symfony\Component\Console\Command\Command;

$api_settings = require_once __DIR__ . '/../src/conf/api_settings.php';
$api_errors = require_once __DIR__ . '/../src/conf/api_errors.php';

$api_container = new \Slim\Container(array_merge($api_settings, $api_errors));

$app = new \Slim\App($api_container);


//*Config et Connexion à la BDD
DataBaseConnection::startEloquent($api_container->settings['db']);




// print '<h1>API WEB</h1>';

//* Les objets de type requête
$app->get('/utilisateurs[/]', UserController::class . ':users')->setName('utilisateurs')->add(Cors::class.':checkHeaderOrigin')->add(Cors::class.':headersCORS');

$app->get('/utilisateurs/{id}[/]', UserController::class . ':aUser')
    // ->add(Token::class . ':checkToken')
    ->setName('utilisateur')->add(Cors::class.':checkHeaderOrigin')->add(Cors::class.':headersCORS');

$app->get('/evenements[/]', EventController::class . ':events')->setName('evenements')->add(Cors::class.':checkHeaderOrigin')->add(Cors::class.':headersCORS');

$app->get('/evenements/{id}[/]', EventController::class . ':anEvent')
    ->setName('evenement')->add(Cors::class.':checkHeaderOrigin')->add(Cors::class.':headersCORS');


$app->post('/utilisateurs[/]', UserController::class.':createUser')->setName('newUtilisateur')->add(Cors::class.':checkHeaderOrigin')->add(Cors::class.':headersCORS');

$app->post('/login[/]', UserController::class.':loginUser')->setName('loginUtilisateur')->add(Cors::class.':checkHeaderOrigin')->add(Cors::class.':headersCORS');

$app->post('/evenements[/]', EventController::class.':addEvent')->add(Cors::class.':checkHeaderOrigin')->add(Cors::class.':headersCORS');


//* Déclenche le traitement par le framework de la requête courante et la compare dans l'ordre de chacune des routes
try {
  $app->run();
} catch (Throwable $e) {

}