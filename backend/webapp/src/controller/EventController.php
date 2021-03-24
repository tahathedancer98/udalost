<?php

namespace udalost\webapp\controller;

use Slim\Router;
use udalost\webapp\utils\Writer;
use udalost\webapp\models\Evenement;
use \Psr\Http\Message\ResponseInterface as Response;
use \Psr\Http\Message\ServerRequestInterface as Request;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Ramsey\Uuid\Uuid;

class EventController {

  private $c;

  public function __construct(\Slim\Container $c){

    $this->c = $c;

  }

  public function events(Request $rq, Response $rs, array $args) : Response {
    try {
      $events = Evenement::select('id', 'titre', 'description', 'date', 'heure', 'latitude', 'longitude', 'adresse', 'codePostal', 'ville', 'pays', 'type', 'id_utilisateur')->get();


      //* Mise en forme de tous les utilisateurs dans un tableau
      $users_array = [];

      foreach ($events as $event) {
        $users_array[] = [
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
            "id_utilisateur" => $event->id_utilisateur,
          ],
          "links"=>[
            "self" => ['href' => $this->c->router->pathFor('evenement', ['id'=> $event->id])],
        ]];
      }

      //* Mise en forme de la collection d'utilisateurs
      $data = [
        'type' => 'collection',
        'count' => count($events),
        'events' => $users_array
      ];

      return Writer::json_output($rs, 200, $data);
    }

    catch(ModelNotFoundException $e){
      return Writer::json_error($rs, 404, "event not found");
    }
  }

  public function anEvent(Request $rq, Response $rs, array $args) : Response {
    $id = $args['id'];
    // $token = $rq->getQueryParam('token', null);

    try {
      $event = Evenement::select(['id', 'titre', 'description', 'date', 'heure', 'latitude', 'longitude', 'adresse', 'codePostal', 'ville', 'pays', 'type', 'id_utilisateur'])->with('participants')->where('id', '=', $id)->firstOrFail();
      
      $participants_array = [];

      //* Mise en forme de tous les participants
      foreach ($event->participants as $participant) {
        $participants_array[] = [
          "participant"=>[
            "id_utilisateur" => $participant->pivot->id_utilisateur,
            "nom" => $participant->pivot->nom,
            "status" => $participant->pivot->status,
            "message" => $participant->pivot->message,
          ],
        ];
      }

      // //* Mise en forme de tous les utilisateurs (ceux inscrits) de l'événement
      // $users_array = [];

      // //* Mise en forme de tous les utilisateurs
      // foreach ($event->utilisateurs as $user) {
      //   $users_array[] = [
      //     "utilisateur"=>[
      //       "id" => $user->id,
      //       "nom" => $user->nom,
      //       "prenom" => $user->prenom,
      //       "email" => $user->email,
      //       "username" => $user->username,
      //       "token" => $user->token,
      //       "derniere_connexion" => date('Y-m-d', strtotime($user->derniere_connexion)),
      //       "message" => $user->pivot->message,
      //     ],
      //     "links"=>[
      //       "self" => ['href' => $this->c->router->pathFor('utilisateur', ['id'=> $user->id])],
      //     ]
      //   ];
      // }
      
      //* Mise en forme de tous les attributs de la ressource
      $event_array[] = [
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
          // "users" => $users_array,
          "participants" => $participants_array,
        ];

      //* Mise en forme de la ressource
      $data = [
        'type' => 'resource',
        'event' => $event_array,
      ];

      return Writer::json_output($rs, 200, $data);

    } catch(ModelNotFoundException $e) {

      // ($this->c->get('logger.error'))->error("command $id not found", [404]);
      return Writer::json_error($rs, 404, "event $id not found");
    }
  }
}