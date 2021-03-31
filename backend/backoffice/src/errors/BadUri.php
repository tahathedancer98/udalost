<?php

namespace udalost\backoffice\errors;

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;
use udalost\backoffice\utils\Writer;
use Slim\Container as C;

class BadUri {
  public static function error (C $c, Request $rq, Response $rs): Response {
    $uri = $rq->getUri();
    // ($c->get('logger.error'))->error("the request $uri was not recognized : malformed uri", [400]);
    return Writer::json_error($rs, 400, "the request $uri was not recognized : malformed uri");
  }
}