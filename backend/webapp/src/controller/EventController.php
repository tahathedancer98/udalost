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
      $events = Evenement::select('id', 'titre', 'description', 'date', 'heure', 'latitude', 'longitude', 'adresse', 'codePostal', 'ville', 'pays', 'type')->get();


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
            "links"=>[
              "self" => ['href' => $this->c->router->pathFor('evenement', ['id'=> $event->id])],
            ]
          ],
        ];
      }

      //* Mise en forme de la collection d'utilisateurs
      $data = [
        'type' => 'collection',
        'count' => count($events),
        'evenements' => $users_array
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

      $createur = $event->createur()->select(['id', 'nom', 'prenom', 'email', 'username', 'token', 'derniere_connexion'])->get();
      $participantsNonInscrits = $event->participantsNonInscrits()->select(['id', 'nom', 'status', 'message'])->get();

      //* Mise en forme du créateur
      $creators_array = [];
      foreach ($createur as $createur) {
        $creators_array[] = [
          "id" => $createur->id,
          "nom" => $createur->nom,
          "prenom" => $createur->prenom,
          "email" => $createur->email,
          "username" => $createur->username,
          "token" => $createur->token,
          "derniere_connexion" => $createur->derniere_connexion,
          "links"=>[
            "self" => ['href' => $this->c->router->pathFor('utilisateur', ['id'=> $createur->id], ['token' => $createur->token])],
          ],
        ];
      }

      //* Mise en forme de tous les participants (inscrits)
      $participants_array = [];
      foreach ($event->participants as $participant) {
        $participants_array[] = [
          "participant"=>[
            "id_utilisateur" => $participant->pivot->id_utilisateur,
            "nom" => $participant->nom,
            "prenom" => $participant->prenom,
            "email" => $participant->email,
            "username" => $participant->username,
            "token" => $participant->token,
            "derniere_connexion" => date('Y-m-d', strtotime($participant->derniere_connexion)),
            // "nom" => $participant->pivot->nom,
            "status" => $participant->pivot->status,
            "message" => $participant->pivot->message,
            "links"=>[
              "self" => ['href' => $this->c->router->pathFor('utilisateur', ['id'=> $participant->id], ['token' => $participant->token])],
            ],
          ],
        ];
      }

      //* Mise en forme de tous les participants (non inscrits)
      $participantsNotRegistered = [];
      foreach ($event->participantsNonInscrits as $participantNonInscrit) {
        $participantsNotRegistered[] = [
          "participantNonInscrit"=>[
            "id" => $participantNonInscrit->id,
            "nom" => $participantNonInscrit->nom,
            "status" => $participantNonInscrit->status,
            "message" => $participantNonInscrit->message,
          ],
        ];
      }
      
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
          "createur" => $creators_array,
          "participants" => $participants_array,
          "participantsNonInscrits" => $participantsNotRegistered,
        ];

      //* Mise en forme de la ressource
      $data = [
        'type' => 'resource',
        'evenement' => $event_array,
      ];

      return Writer::json_output($rs, 200, $data);

    } catch(ModelNotFoundException $e) {

      // ($this->c->get('logger.error'))->error("command $id not found", [404]);
      return Writer::json_error($rs, 404, "event $id not found");
    }
  }
}