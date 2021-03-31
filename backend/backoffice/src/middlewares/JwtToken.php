<?php

namespace udalost\webapp\middlewares;

use Exception;
use Firebase\JWT\JWT;
use udalost\webapp\utils\Writer;
use \Psr\Http\Message\ResponseInterface as Response;
use \Psr\Http\Message\ServerRequestInterface as Request;

class JwtToken{
    
    private $c;

    public function __construct(\Slim\Container $c){
        $this->c = $c;
    }
    
    private function decode(string $h){
        $tokenstring = sscanf($h, "Bearer %s")[0];
        $secret = $this->c->settings['secret'];
        $token = JWT::decode($tokenstring, $secret, ['HS512']);
        return $token;
    }
    
    
    public function checkToken( Request $rq, Response $rs, callable $next)
    {
        if ($rq->hasHeader('Authorization')) {
            try {
                $token = $this->decode($rq->getHeader('Authorization')[0]); 
            } catch (Exception $e) {
                return Writer::json_error($rs, 401, $e);
            }

            

            
            $body_data = $rq->getParsedBody();

            if (is_null($body_data) || is_null($body_data['id'])) {
                return Writer::json_error($rs, 400, "Pas d'id d'utilisateur'");  
            }

            // $token_carte_id = $token->cid;
            // $route_carte_id = $rq->getParsedBody()['id'];

            // if ($route_carte_id != $token_carte_id) {
            //     return Writer::json_error($rs, 401, 'Carte de Paiement invalide');
            // }

            $rq = $rq->withAttribute('token', $token);

        }else{
            $rq = $rq->withAttribute('token', false);
        }
        
        $rs = $next($rq, $rs);

        return $rs;
    }

}