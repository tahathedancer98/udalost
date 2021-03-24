<?php
use udalost\webapp\errors\BadUri;
use udalost\webapp\errors\NotAllowed;
use udalost\webapp\errors\Internal;

return [
    'notFoundHandler' => function($c){
        return function($rq, $rs) use ($c){
            return BadUri::error($c,$rq,$rs);
        };
    },

    'notAllowedHandler' => function($c){
        return function($rq, $rs, $methods) use ($c){
            return NotAllowed::error($c,$rq,$rs,$methods);
        };
    },

    'phpErrorHandler' => function($c){
        return function($rq, $rs, $error) use ($c){
            return Internal::error($c,$rq,$rs,$error);
        };
    }

];