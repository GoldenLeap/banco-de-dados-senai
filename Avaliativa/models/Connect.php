<?php 
    class Connect {
        private static $pdo = null;
        public static function Conectar(){
            if(self::$pdo === null){
                self::$pdo = new PDO("mysql:host=localhost;dbname=mecanica;", 'root', 'senaisp');
            }
            return self::$pdo;
        }
    }