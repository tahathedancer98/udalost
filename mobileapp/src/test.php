<?php
/**
 * Created by PhpStorm.
 * User: canals5
 * Date: 11/02/2020
 * Time: 16:52
 */

function test() {

    try {
        $db = new PDO('mysql:host=db;dbname=com', 'com', 'com',
            [PDO::ATTR_PERSISTENT => true,
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            ]
        );
    } catch (PDOException $e) {
        print 'could not connect \n';
        print $e->getMessage() . '\n';
    }
    print '<h1>Backend 1</h1>h1>';
    print '<h4>connected to mysql </h4>';
    phpinfo();
}