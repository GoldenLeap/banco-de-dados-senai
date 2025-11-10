<?php
    class Servicos{
        static public function GetServicos(){
            $db = Connect::Connect();
            $sql = "SELECT * FROM SERVICOS";
            $sql = $db->prepare($sql);
            $sql->execute();
            $db = null;
            return $sql->fetchAll(PDO::FETCH_ASSOC);
        }
    }