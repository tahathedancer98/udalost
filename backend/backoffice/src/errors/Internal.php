<?php

namespace udalost\backoffice\errors;

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;
use udalost\backoffice\utils\Writer;
use Slim\Container as C;

class Internal {
  public static function error (C $c, Request $rq, Response $rs, $error): Response {

    $uri = $rq->getUri();

    // ($c->get('logger.error'))->error("internal server error: $error", [500]);

    return Writer::json_error($rs, 500, "internal server error : {$error->getMessage()} trace : {$error->getTraceAsString()} file : {$error->getFile()} line : {$error->getLine()}");
  }
}