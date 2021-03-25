<?php


namespace udalost\backoffice\connection;

use \Illuminate\Database\Capsule\Manager;

class DataBaseConnection{
    public static function startEloquent($file){
        $conf = parse_ini_file($file);
        $db = new Manager();

        $db->addConnection($conf);
        $db->setAsGlobal();
        $db->bootEloquent();
    }
}
