<?php

namespace udalost\webapp\controller;

use Slim\Router;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\ModelNotFoundException;

use udalost\webapp\utils\Writer;
use udalost\webapp\models\Participant;

use \Psr\Http\Message\ResponseInterface as Response;
use \Psr\Http\Message\ServerRequestInterface as Request;

use Firebase\JWT\JWT;
use Firebase\JWT\ExpiredException;
use Firebase\JWT\SignatureInvalidException ;
use Firebase\JWT\BeforeValidException;

use GuzzleHttp\Client;
use Ramsey\Uuid\Uuid;


class ParticipantController {

  private $c;

  public function __construct(\Slim\Container $c){

    $this->c = $c;

  }

  public function participants(Request $rq, Response $rs, array $args) : Response {
    try {
      $participants = Participant::select('id', 'id_evenement', 'id_utilisateur', 'nom', 'status', 'message')->get();


      //* Mise en forme de tous les participants dans un tableau
      $participants_array = [];
      foreach ($participants as $participant) {
        $participants_array[] = [
          "utilisateur"=>[
            "id" => $participant->id,
            "id_evenement" => $participant->id_evenement,
            "id_utilisateur" => $participant->id_utilisateur,
            "nom" => $participant->nom,
            "status" => $participant->status,
            "message" => $participant->message,
            "links"=>[
              "self" => ['href' => $this->c->router->pathFor('participant', ['id'=> $participant->id])],
            ]
          ],
        ];
      }

      //* Mise en forme de la collection d'utilisateurs
      $data = [
        'type' => 'collection',
        'count' => count($participants),
        'participants' => $participants_array
      ];

      return Writer::json_output($rs, 200, $data);
    }

    catch(ModelNotFoundException $e){
      return Writer::json_error($rs, 404, "participant not found");
    }
  }

  public function aParticipant(Request $rq, Response $rs, array $args) : Response {
    $id = $args['id'];
    // $token = $rq->getQueryParam('token', null);

    try {
      $participant = Participant::select(['id', 'id_evenement', 'id_utilisateur', 'nom', 'status', 'message'])->where('id', '=', $id)->firstOrFail();


      //* Mise en forme de tous les attributs de la ressource
      $event_array[] = [
          "id" => $participant->id,
          "id_evenement" => $participant->id_evenement,
          "id_utilisateur" => $participant->id_utilisateur,
          "nom" => $participant->nom,
          "status" => $participant->status,
          "message" => $participant->message,
        ];

      //* Mise en forme de la ressource
      $data = [
        'type' => 'resource',
        'participant' => $event_array,
      ];

      return Writer::json_output($rs, 200, $data);

    } catch(ModelNotFoundException $e) {

      // ($this->c->get('logger.error'))->error("command $id not found", [404]);
      return Writer::json_error($rs, 404, "participant $id not found");
    }
  }
}