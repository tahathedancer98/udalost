<?php

namespace udalost\webapp\controller;

use Slim\Router;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\ModelNotFoundException;

use udalost\webapp\utils\Writer;
use udalost\webapp\models\Evenement;

use \Psr\Http\Message\ResponseInterface as Response;
use \Psr\Http\Message\ServerRequestInterface as Request;

use Firebase\JWT\JWT;
use Firebase\JWT\ExpiredException;
use Firebase\JWT\SignatureInvalidException ;
use Firebase\JWT\BeforeValidException;

use GuzzleHttp\Client;
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


  // public function addEvent(Request $rq, Response $rs, array $args) : Response {
  //   if($rq->getAttribute('has_errors')){
  //     return Writer::json_error($rs, 400, $rq->getAttribute('errors'));
  //   }

  //   $event_data = $rq->getParsedBody();

  //   try {

  //     $c = new Evenement();

  //     $c->id = Uuid::uuid4();
  //     // $c->nom = filter_var($event_data['nom_client'], FILTER_SANITIZE_STRING);
  //     // $c->mail = filter_var($event_data['mail_client'], FILTER_SANITIZE_EMAIL);
  //     // $c->livraison = \Datetime::createFromFormat('d-m-Y H:i',
  //     //   $event_data['livraison']['date'] . ' ' .
  //     //   $event_data['livraison']['heure']);
  //     // $c->status = Evenement::CREATED;

  //     // $c->token = bin2hex(random_bytes(32));
  //     $c->titre = 'Test pour créer un événement';
  //     $c->description = 'La description super précise sur le test';
  //     $c->date = '2100-01-25';
  //     $c->heure = '22:30:00';
  //     $c->latitude = '48.039549';
  //     $c->longitude = '7.418101';
  //     $c->adresse = '12 rue du Riesling';
  //     $c->codePostal = '68280';
  //     $c->ville = 'Sundhoffen';
  //     $c->pays = 'France';
  //     $c->type = 0;
  //     $c->id_utilisateur = '3fe96bf8-8bb3-11eb-8dcd-0242ac130003';

  //     $c->save();

  //     return Writer::json_output($rs, 201, ['evenement'=> $c])
  //       ->withHeader('Location', $this->c->router->pathFor('evenement', ['id'=> $c->id]));

  //   } catch (\Exception $e) {
  //     return Writer::json_error($rs, 500, $e->getMessage());
  //   }
  // }

    public function addEvent(Request $rq, Response $rs,array $args): Response{
      //si le header Autorization existe on va entrer
      if($rq->hasHeader('Authorization')){
          try{
              //Prendre les secret du fichier settings
              $secret = $this->c->settings['secret'];

              //Enregistrer le header Authorization
              $h = $rq->getHeader('Authorization')[0];

              //Decodage du token
              $tokenstring= sscanf($h, "Bearer %s")[0];
              $token = JWT::decode($tokenstring, $secret, ['HS512']);

              $json_data = $rq->getParsedBody();
  
              $user = new Client(["base_uri" => $this->c->settings['url_udalost']]);
              $titre = $json_data["titre"];
              $description = $json_data["description"];
              $date = $json_data["date"];
              $heure = $json_data["heure"];
              $latitude = $json_data["latitude"];
              $longitude = $json_data["longitude"];
              $adresse = $json_data["adresse"];
              $codePostal = $json_data["codePostal"];
              $ville = $json_data["ville"];
              $pays = $json_data["pays"];
              $type = $json_data["type"];

              $getBody = json_decode($rq->getBody());
              
              $event = new Evenement();
              
              $event->id = Uuid::uuid4();
              $event->titre = (filter_var($titre, FILTER_SANITIZE_STRING));
              $event->description = (filter_var($description, FILTER_SANITIZE_STRING));
              $event->date = (filter_var($date, FILTER_SANITIZE_STRING));
              $event->heure = (filter_var($heure, FILTER_SANITIZE_STRING));
              $event->latitude = (filter_var($latitude, FILTER_SANITIZE_STRING));
              $event->longitude = (filter_var($longitude, FILTER_SANITIZE_STRING));
              $event->adresse = (filter_var($adresse, FILTER_SANITIZE_STRING));
              $event->codePostal = (filter_var($codePostal, FILTER_SANITIZE_NUMBER_INT));
              $event->ville = (filter_var($ville, FILTER_SANITIZE_STRING));
              $event->pays = (filter_var($pays, FILTER_SANITIZE_STRING));
              $event->type = (filter_var($type, FILTER_SANITIZE_NUMBER_INT));
              // L'ID de l'utilisateur qu'on récupère grâce au token
              $event->id_utilisateur = $token->cid;

              $event->save();
              
              $uri = $rq->getUri();
              $baseUrl = $uri->getBaseUrl();
              
              return Writer::json_output($rs, 201, ['evenements'=>$event->toArray()])
                  ->withHeader('Location', $baseUrl.$this->c['router']->pathFor('evenement', ['id'=>$event->id]));

          //Nous traitons les erreurs
          }catch(ExpiredException $e){
              $rs = $rs->withStatus(401)->withHeader('Content-Type','application/json');
              $rs->getBody()->write(json_encode($e));
              return $rs;
          //Nous traitons les erreurs
          }
      
      }else{
          //Nous traitons les erreurs
          $rs = $rs->withStatus(401)
          ->withHeader('Content-Type','application/json')->withHeader('WWW-authenticate');
          $rs->getBody()->write(
              json_encode(
                  array(
                      'type' => 'error',
                      'error' => 401,
                      'message' => 'No authorization header present'
                  )
              )
          );
          return $rs;
      }
  }
}