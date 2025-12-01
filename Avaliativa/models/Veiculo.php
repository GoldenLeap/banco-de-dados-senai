<?php
class Veiculo{
    private static ?PDO $pdo = null;
    private static function getPDO(){

        if(self::$pdo === null){
            self::$pdo = Connect::Conectar();
    
        }
    return self::$pdo;
    }
    public static function getVeiculos(){
        $pdo = self::getPDO();
        $sql = "SELECT * FROM Veiculos";
        $stmt = $pdo->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    public static function addVeiculo($placa, $modelo, $marca, $id_cliente){
        $pdo = self::getPDO();
        $sql = "INSERT INTO Veiculos VALUES(?, ?, ?, ?);";
        $stmt = $pdo->prepare($sql);
        return $stmt->execute([$placa, $modelo, $marca, $id_cliente ]);
        

    }
}