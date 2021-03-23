<?php

return [
    'notFoundHandler' => function($c){
        return function($rq, $rs) use ($c){
            return \lbs\commande\api\errors\BadUri::error($c,$rq,$rs);
        };
    },

    'notAllowedHandler' => function($c){
        return function($rq, $rs, $methods) use ($c){
            return \lbs\commande\api\errors\NotAllowed::error($c,$rq,$rs,$methods);
        };
    },

    'phpErrorHandler' => function($c){
        return function($rq, $rs, $error) use ($c){
            return \lbs\commande\api\errors\Internal::error($c,$rq,$rs,$error);
        };
    }

];