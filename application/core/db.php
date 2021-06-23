<?php

class DB {
    protected static $singleton;

    private function __construct() {
        $host = CONFIG_HOST;
        $db   = CONFIG_DB;
        $user = CONFIG_USER;
        $pass = CONFIG_PASS;
        $charset = CONFIG_CHARSET;

        $dsn = "mysql:host=$host;dbname=$db;charset=$charset";
        $opt = [
            PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        ];
        self::$singleton = new PDO($dsn, $user, $pass, $opt);
    }

    public static function get_instance(){
        if(self::$singleton === null)
            new self();

        return self::$singleton;
    }

    public static function pdoSet($allowed, &$values, $source = null) {
        $set = "";
        $values = [];
        if(!isset($source)) $source = $_POST;

        foreach ($allowed as $field)
            if(isset($source[$field])) {
                $set .= "`" . str_replace("`", "``", $field) . "`"."=:$field, "; // names (`asd`=:$asd)
                $values[$field] = $source[$field];                                              // values
            }

        return substr($set, 0, -2); // Не отправляем (, )
    }

    private function __clone() { }
    private function __wakeup() { }
}

