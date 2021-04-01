<?php

namespace udalost\backoffice\controller;

use Slim\Router;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\ModelNotFoundException;

use udalost\backoffice\utils\Writer;
use udalost\backoffice\models\Utilisateur;

use \Psr\Http\Message\ResponseInterface as Response;
use \Psr\Http\Message\ServerRequestInterface as Request;

use Firebase\JWT\JWT;
use Firebase\JWT\ExpiredException;
use Firebase\JWT\SignatureInvalidException ;
use Firebase\JWT\BeforeValidException;

use GuzzleHttp\Client;
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
        'utilisateurs' => $users_array
      ];

      return Writer::json_output($rs, 200, $data);
    }

    catch(ModelNotFoundException $e){
      return Writer::json_error($rs, 404, "user not found");
    }
  }


  public function deleteUser(Request $rq, Response $rs, array $args) : Response {
      $id = $args['id'];

      try {
        $user = Utilisateur::where('id','=', $id);
        $user->delete();

          $data = [
              'response' => 'success user n°' . $id . ' is deleted.'
          ];

          return Writer::json_output($rs, 200, $data);
        }catch(Expeption $e){
        return Writer::json_error($rs, 500, $e->getMessage());
      }
      return $rs->getBody()->write($id . 'deleted');
  }
}
