<?php
    class Servicos{
        static public function GetServicos(){
            $db = Connect::conectar();
            $sql = "SELECT * FROM SERVICOS";
            $sql = $db->prepare($sql);
            $sql->execute();
            $db = null;
            return $sql->fetchAll(PDO::FETCH_ASSOC);
        }
    }