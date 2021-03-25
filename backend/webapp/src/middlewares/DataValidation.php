<?php

namespace lbs\commande\middlewares;

use Respect\Validation\Validator as v;


class DataValidation{
    
    /**
     * 
     * Renvoie les validators pour la création d'une commande
     * 
     * @return array $validators : les validators
     * 
     */
    public static function PostCommandValidators()
    {
        return array(
        'nom_client' => v::alnum()->noWhitespace()->length(1, 30),
        'mail_client' => v::email(),
        'livraison' => [
            'date' => v::date('Y-m-d'),
            'heure' => v::date('H:i:s'),
        ]
        );
    }

}