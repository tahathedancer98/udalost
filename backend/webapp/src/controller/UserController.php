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
        ];
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
}