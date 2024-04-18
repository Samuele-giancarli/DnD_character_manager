<?php

class DatabaseHelper{
    public $db;

    public function __construct($servername, $username, $password, $dbname, $port){
        $this->db = new mysqli($servername, $username, $password, $dbname, $port);
        if ($this->db->connect_error) {
            die("Connection failed: " . $this->db->connect_error);
        }
    }

    public function aggiungiUtente($email, $password){
        $query = "insert into utente (E_mail, Password) values (?, ?)";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("ss", $email, $password);
        $stmt->execute();
        
        try {
            if (!$stmt->execute()) {
                return null;
            } 
        } catch(mysqli_sql_exception $e) {
            return null;
        }
        return $this->db->insert_id;
    }

    public function rimuoviUtente($ID){
        $query = "SELECT COUNT(*) as num_following FROM follow WHERE ID_Seguace = ?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("i", $ID);
        $stmt->execute();
        $result = $stmt->get_result();
        
        return $result->fetch_assoc();
    }
}

?>