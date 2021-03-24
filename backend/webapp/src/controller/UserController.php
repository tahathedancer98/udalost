<?php

namespace udalost\webapp\controller;

use Slim\Router;
use udalost\webapp\utils\Writer;
use udalost\webapp\models\Utilisateur;
use \Psr\Http\Message\ResponseInterface as Response;
use \Psr\Http\Message\ServerRequestInterface as Request;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Ramsey\Uuid\Uuid;

class UserController {

  private $c;

  public function __construct(\Slim\Container $c){

    $this->c = $c;

  }

  public function users(Request $rq, Response $rs, array $args) : Response {
    try {
      $users = Utilisateur::select('id', 'nom', 'prenom', 'email', 'username', 'token', 'derniere_connexion')->get();


      //* Mise en forme de tous les utilisateurs dans un tableau
      $users_array = [];

      foreach ($users as $user) {
        $users_array[] = [
          "utilisateur"=>[
            "id" => $user->id,
            "nom" => $user->nom,
            "prenom" => $user->prenom,
            "email" => $user->email,
            "username" => $user->username,
            "token" => $user->token,
            "derniere_connexion" => date('Y-m-d', strtotime($user->derniere_connexion)),
          ],
          "links"=>[
            "self" => ['href' => $this->c->router->pathFor('utilisateur', ['id'=> $user->id], ['token' => $user->token])],
        ]];
      }

      //* Mise en forme de la collection d'utilisateurs
      $data = [
        'type' => 'collection',
        'count' => count($users),
        'users' => $users_array
      ];

      return Writer::json_output($rs, 200, $data);
    }

    catch(ModelNotFoundException $e){
      return Writer::json_error($rs, 404, "user not found");
    }
  }

  public function aUser(Request $rq, Response $rs, array $args) : Response {
    $id = $args['id'];
    $token = $rq->getQueryParam('token', null);

    try {
      $user = Utilisateur::select(['id', 'nom', 'prenom', 'email', 'username', 'token', 'derniere_connexion'])->with('evenements')->where('id', '=', $id)->where('token', '=', $token)->firstOrFail();
      
      //* Mise en forme de tous les événements de l'utilisateur
      $events_array = [];

      //* Mise en forme de tous les événements
      foreach ($user->evenements as $event) {
        $events_array[] = [
          "evenement"=>[
            "id" => $event->id,
            "titre" => $event->titre,
            "description" => $event->description,
            "date" => $event->date,
            "heure" => $event->heure,
            "latitude" => $event->latitude,
            "longitude" => $event->longitude,
            "adresse" => $event->adresse,
            "codePostal" => $event->codePostal,
            "ville" => $event->ville,
            "pays" => $event->pays,
            "type" => $event->type,
          ],
          "links"=>[
            "self" => ['href' => $this->c->router->pathFor('evenement', ['id'=> $event->id])],
        ]
      ];
      }
      
      //* Mise en forme de tous les attributs de la ressource
      $user_array[] = [
          "id" => $user->id,
          "nom" => $user->nom,
          "prenom" => $user->prenom,
          "email" => $user->email,
          "username" => $user->username,
          "token" => $user->token,
          "derniere_connexion" => date('Y-m-d', strtotime($user->derniere_connexion)),
          "events" => $events_array,
        ];

      //* Mise en forme de la ressource
      $data = [
        'type' => 'resource',
        'user' => $user_array,
      ];

      return Writer::json_output($rs, 200, $data);

    } catch(ModelNotFoundException $e) {

      // ($this->c->get('logger.error'))->error("command $id not found", [404]);
      return Writer::json_error($rs, 404, "user $id not found");
    }
  }
}