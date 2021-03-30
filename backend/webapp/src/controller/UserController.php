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
    $token = $rq->getQueryParam('token', null);

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

  public function createUser(Request $rq, Response $rs,array $args): Response {

      if (!$rq->getAttribute('has_errors')) {
          $json_data = $rq->getParsedBody();

            if(!isset($json_data['nom'])){
              return Writer::json_error($rs, 400, "Missing data: nom");
            }

            if(!isset($json_data['prenom'])){
              return Writer::json_error($rs, 400, "Missing data: prenom");
            }

            if(!isset($json_data['email'])){
              return Writer::json_error($rs, 400, "Missing data: email");
            }

            if(!isset($json_data['motpasse'])){
              return Writer::json_error($rs, 400, "Missing data: password");
            }

            try{
                $user = new Client(["base_uri" => $this->c->settings['url_udalost']]);
                $nom = $json_data["nom"];
                $prenom = $json_data["prenom"];
                $username = $json_data["username"];
                $email = $json_data["email"];
                $motpasse = $json_data["motpasse"];
                $getBody = json_decode($rq->getBody());

                $token = random_bytes(32);
                $token = bin2hex($token);
                //$token = $rq->getQueryParam('token', null);

                $c = new Utilisateur();

                $c->id = Uuid::uuid4();
                $c->nom = (filter_var($nom, FILTER_SANITIZE_STRING));
                $c->prenom = (filter_var($prenom, FILTER_SANITIZE_STRING));
                $c->username = (filter_var($username, FILTER_SANITIZE_STRING));
                $c->email = (filter_var($email, FILTER_SANITIZE_EMAIL));
                $c->motpasse = (password_hash($motpasse, PASSWORD_DEFAULT));
                $c->token = $token;

                $c->save();


                $uri = $rq->getUri();
                $baseUrl = $uri->getBaseUrl();


                return Writer::json_output($rs, 201, ['utilisateurs'=>$c->toArray()])
                  ->withHeader('Location', $baseUrl.$this->c['router']->pathFor('utilisateur', ['id'=>$c->id]));
            }catch(Expeption $e){
                return Writer::json_error($rs, 500, $e->getMessage());
            }
        } else {
            return Writer::json_error($rs, 400, $rq->getAttribute('errors'));
        }
    }

    public function loginUser(Request $rq, Response $rs, array $args) : Response {


      if (!$rq->hasHeader('Authorization')) {
          $rs = $rs->withStatus(401)->withHeader('WWW-authenticate', 'Basic realm="api de login"');
          return Writer::json_error($rs, 401, 'Pas de header Authorization');
      }
  
      $tab_auth = explode(':', base64_decode(explode(" ", $rq->getHeader('Authorization')[0])[1]));
      $email = $tab_auth[0];
      $motpasse = $tab_auth[1];
  
  
      try {
          $user = Utilisateur::select()
              ->where('email', '=', $email)
              ->firstOrFail();
  
          if (!password_verify($motpasse, $user->motpasse)) {
              throw new \Exception('Mauvais mot de passe');
          }
  
      } catch (ModelNotFoundException $e) {
          $rs = $rs->withStatus(401)->withHeader('WWW-authenticate', 'Basic realm="api de login"');
          return Writer::json_error($rs, 401, 'Erreur Authentification');
      } catch (\Exception $e) {
          $rs = $rs->withStatus(401)->withHeader('WWW-authenticate', 'Basic realm="api de login"');
          return Writer::json_error($rs, 401, 'Erreur Authentification');
      }
  
      $secret = $this->c->settings['secret'];
      
      $data[] = ["utilisateur" => $secret];
      $token = JWT::encode( ['iss' => 'https://api.udalost.web:10243/connexion',
          'aud' => 'https://api.udalost.web:10243',
          'lat' => time(),
          'exp' => time()+3600,
          'cid' => $user->id ],
          $secret, 'HS512'); 

      $data = [
      'utilisateur' => $user,
      'token' => $token
      ];

      date_default_timezone_set('Europe/Paris');
      $userDatetime = Utilisateur::find($user->id);
      $userDatetime->derniere_connexion = date('Y-m-d H:i:s');

      $userDatetime->save();
  
      return Writer::json_output($rs, 200, $data);
      
      
    }

    public function editUser(Request $rq, Response $rs, array $args) : Response {
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

              $u = new Client(["base_uri" => $this->c->settings['url_udalost']]);
              $nom = $json_data["nom"];
              $prenom = $json_data["prenom"];
              $username = $json_data["username"];
              $email = $json_data["email"];
              $motpasse = $json_data["motpasse"];

              $getBody = json_decode($rq->getBody());
              
              $user = Utilisateur::find($token->cid);

              $user->nom = (filter_var($nom, FILTER_SANITIZE_STRING));
              $user->prenom = (filter_var($prenom,FILTER_SANITIZE_STRING));
              $user->username = (filter_var($username,FILTER_SANITIZE_STRING));
              $user->email = (filter_var($email, FILTER_SANITIZE_EMAIL));
              $user->motpasse = (password_hash($motpasse,PASSWORD_DEFAULT));

              $user->save();
              
              $uri = $rq->getUri();
              $baseUrl = $uri->getBaseUrl();
              
              return Writer::json_output($rs, 201, ['utilisateurs'=>$user->toArray()])
                  ->withHeader('Location', $baseUrl.$this->c['router']->pathFor('utilisateur', ['id'=>$user->id]));

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
