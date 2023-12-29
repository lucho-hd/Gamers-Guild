<?php header("Access-Control-Allow-Origin: *");

class DBConexion{
    public const DB_HOST     = "localhost";
    public const DB_USER     = 'id21064144_gamersguild';
    public const DB_PASS     = 'Gamersguild_2023';  
    public const DB_NAME     = 'id21064144_caruso_luciano_app_moviles';

    /**@var PDO */
    private static ?PDO $db = null;

    public static function conectar(){
        $dsn = 'mysql:host=' . self::DB_HOST . ';dbname=' . self::DB_NAME . ';charset=utf8mb4';
        self::$db = new PDO($dsn, self::DB_USER, self::DB_PASS);
        self::$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }

    public static function getConexion(): PDO{
        if(!self::$db){
            self::conectar();
        }
        return self::$db;
    }
}

