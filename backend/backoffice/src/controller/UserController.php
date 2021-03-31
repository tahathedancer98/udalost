<?php

namespace udalost\webapp\controller;

use Slim\Router;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\ModelNotFoundException;

use udalost\webapp\utils\Writer;
use udalost\webapp\models\Utilisateur;

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
            "links"=>[
              "self" => ['href' => $this->c->router->pathFor('utilisateur', ['id'=> $user->id])],
            ],
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

  public function aUser(Request $rq, Response $rs, array $args) : Response {
    $id = $args['id'];
    // $token = $rq->getQueryParam('token', null);

    try {
      // $user = Utilisateur::select(['id', 'nom', 'prenom', 'email', 'username', 'token', 'derniere_connexion'])->with('evenements')->where('id', '=', $id)->where('token', '=', $token)->firstOrFail();
      $user = Utilisateur::select(['id', 'nom', 'prenom', 'email', 'username', 'token', 'derniere_connexion'])->with('evenements')->where('id', '=', $id)->firstOrFail();

      $evenementsCrees = $user->evenementsCrees()->select(['id', 'titre', 'description', 'date', 'heure', 'latitude', 'longitude', 'adresse', 'codePostal', 'ville', 'pays', 'type'])->get();

      //* Mise en forme des événements créés par l'utilisateur
      $eventsCreated_array = [];
      foreach ($evenementsCrees as $evenementCree) {
        $eventsCreated_array[] = [
          "evenementCree"=>[
            "id" => $evenementCree->id,
            "titre" => $evenementCree->titre,
            "description" => $evenementCree->description,
            "date" => $evenementCree->date,
            "heure" => $evenementCree->heure,
            "latitude" => $evenementCree->latitude,
            "longitude" => $evenementCree->longitude,
            "adresse" => $evenementCree->adresse,
            "codePostal" => $evenementCree->codePostal,
            "ville" => $evenementCree->ville,
            "pays" => $evenementCree->pays,
            "type" => $evenementCree->type,
            "links"=>[
              "self" => ['href' => $this->c->router->pathFor('evenement', ['id'=> $evenementCree->id])],
            ],
          ]
        ];
      }

      $evenementsCrees = [
        'count' => count($eventsCreated_array),
        $eventsCreated_array,
      ];
      
      //* Mise en forme de tous les événements de l'utilisateur
      $events_array = [];
      foreach ($user->evenements as $event) {
        $participant = $event->participants()->where('id_utilisateur', '=', $user->id)->firstOrFail();
        $participantValues = Participant::where('id', '=', $participant->pivot->id)->firstOrFail();
        $commentaires = $participantValues->commentaires()->get();

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
            "commentaires" => $commentaires,
            "links"=>[
              "self" => ['href' => $this->c->router->pathFor('evenement', ['id'=> $event->id])],
            ],
          ]
        ];
      }

      $evenements = [
        'count' => count($events_array),
        $events_array,
      ];
      
      //* Mise en forme de tous les attributs de la ressource
      $user_array[] = [
          "id" => $user->id,
          "nom" => $user->nom,
          "prenom" => $user->prenom,
          "email" => $user->email,
          "username" => $user->username,
          "token" => $user->token,
          "derniere_connexion" => date('Y-m-d', strtotime($user->derniere_connexion)),
          "evenements" => $evenements,
          "evenementsCrees" => $evenementsCrees,
        ];

      //* Mise en forme de la ressource
      $data = [
        'type' => 'resource',
        'utilisateur' => $user_array,
      ];

      return Writer::json_output($rs, 200, $data);

    } catch(ModelNotFoundException $e) {

      // ($this->c->get('logger.error'))->error("command $id not found", [404]);
      return Writer::json_error($rs, 404, "user $id not found");
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
