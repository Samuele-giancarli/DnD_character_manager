<?php

class DatabaseHelper{
    public $db;

    public function __construct($servername, $username, $password, $dbname, $port){
        $this->db = new mysqli($servername, $username, $password, $dbname, $port);
        if ($this->db->connect_error) {
            die("Connection failed: " . $this->db->connect_error);
        }
    }

    public function aggiungiUtente($email, $password, $username){
        $query = "INSERT INTO utente (E_mail, Password, Username) VALUES (?, ?, ?)";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("sss", $email, $password, $username);
        if ($stmt->execute()) {
            return $this->db->insert_id;
        } else {
            return null;
        }
    }

    public function rimuoviUtente($ID){
        $query = "DELETE FROM utente WHERE ID_Utente = ?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("i", $ID);
        $stmt->execute();
    }


    public function loginUtente($username, $password){
        $query="SELECT * FROM utente WHERE Username=? AND Password=?";
        $stmt=$this->db->prepare($query);
        $stmt->bind_param("ss", $username, $password);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        if (is_null($row)){
            return null;
        }else{
            return $row["ID_Utente"];
        }
    }

    public function characterList($ID){
        $query="SELECT * FROM personaggio WHERE ID_Utente=?";
        $stmt=$this->db->prepare($query);
        $stmt->bind_param("i", $ID);
        $stmt->execute();
        $result = $stmt->get_result();
        $characters = array();
        while($row = $result->fetch_assoc()){
            $characters[] = $row;
        }
        return $characters;
    }
}

?>