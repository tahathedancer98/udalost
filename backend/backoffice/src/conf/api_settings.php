<?php
return [
    'settings' => [
        'displayErrorDetails' => true,
        'db' => __DIR__ . '/config.ini',
        'secret' => base64_encode('projetudalostapitoken'),
        "cors" =>[
            "methods" => 'GET,POST,PUT,DELETE,OPTIONS',
            "headers" => 'Origin,Authorization,Content-Type,Accept',
            "maxAge" => 3600
        ],
        'url_udalost'=> 'http://api.udalost.web'
    ],
];