<?php
return [
    'settings' => [
        'displayErrorDetails' => true,
        'db' => __DIR__ . '/config.ini',
        'secret' => base64_encode('projetudalostapitoken'),
        'url_udalost'=> 'http://api.udalost.web'
    ],
];