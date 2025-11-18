<?php
class Cliente{
    private static ?PDO $pdo = null;
    private static function getPDO() : PDO {
        if (self::$pdo === null){
            self::$pdo = Connect::Conectar();
        }
        return self::$pdo;
    }
    public static function getClientes(){
        $pdo = self::getPDO();
        $sql = "SELECT * FROM Clientes";
        $stmt = $pdo->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll();
    }
    public static function setClienteName($id, $nome){
        $pdo = self::getPDO();
        $sql = "UPDATE Clientes SET Nome_cliente=? WHERE ID_Cliente =?";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([$nome, $id]);
        
    }
    public static function setClienteTelefone($id, $telefone){
        $pdo = self::getPDO();
        $sql = "UPDATE Clientes SET Telefone=? WHERE ID_Cliente = ?";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([$telefone, $id]);
    }
    
    public static function getClienteById($id){
        $pdo = self::getPDO();
        $sql = "SELECT * FROM Clientes WHERE ID_Cliente = ?";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([$id]);
        return $stmt->fetch();
    }

    public static function deleteCliente($id){
        $pdo = self::getPDO();
        $sql = "DELETE FROM Clientes WHERE ID_Cliente=?";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([$id]);
    }
    public static function addCliente($cpf, $nome, $telefone){
        $pdo = self::getPDO();
        $sql = "INSERT INTO Clientes(CPF, Nome_cliente, Telefone) VALUES(?, ?, ?);";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([$cpf, $nome, $telefone]);
    }
}