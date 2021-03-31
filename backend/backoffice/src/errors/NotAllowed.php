<?php

namespace udalost\webapp\errors;

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;
use udalost\webapp\utils\Writer;
use Slim\Container as C;

class NotAllowed {
  public static function error (C $c, Request $rq, Response $rs, $methods): Response {
    $method = $rq->getMethod();

    $uri = $rq->getUri();

    // ($c->get('logger.error'))->error("method $method not allowed for uri $uri - (should be ". implode(', ',$methods).')', [405]);

    return Writer::json_error($rs, 405, "method $method not allowed for uri $uri - (should be ". implode(', ',$methods).')')->withHeader('Allow', implode(', ',$methods));
  }
}