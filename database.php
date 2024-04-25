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

    public function addCharacter($Forza, $Destrezza, $Costituzione, $Intelligenza, $Saggezza, $Carisma, $Punti_Ferita, $Nome, $Descrizione,$Classe_Armatura, $Iniziativa, $Punti_esperienza, $Nome_Origine, $Armatura_equipaggiata, $Arma_equipaggiata, $Nome_allineamento, $Nome_razza, $ID_Borsa, $ID){
        $query = "INSERT INTO personaggio (Car_Forza, Car_Destrezza, Car_Costituzione, Car_Intelligenza, Car_Saggezza, Car_Carisma, Punti_Ferita, Nome, Descrizione_Aspetto, Classe_Armatura, Iniziativa, Punti_Esperienza, Nome_Origine, Armatura_Equipaggiata, Arma_equipaggiata, Nome_Allineamento, Nome_Razza, ID_Borsa, ID_Utente)
        VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("iiiiiiissiiisssssii", $Forza, $Destrezza, $Costituzione, $Intelligenza, $Saggezza, $Carisma, $Punti_Ferita, $Nome, $Descrizione,$Classe_Armatura, $Iniziativa, $Punti_esperienza, $Nome_Origine, $Armatura_equipaggiata, $Arma_equipaggiata, $Nome_allineamento, $Nome_razza, $ID_Borsa, $ID);
        if ($stmt->execute()) {
            return $this->db->insert_id;
        } else {
            return null;
        }
    }

    public function getStrength($ID){
        $query="SELECT Car_Forza FROM personaggio WHERE ID_Personaggio=?";
        $stmt=$this->db->prepare($query);
        $stmt->bind_param("i", $ID);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        return $row["Car_Forza"];
    }

    public function getDexterity($ID){
        $query="SELECT Car_Destrezza FROM personaggio WHERE ID_Personaggio=?";
        $stmt=$this->db->prepare($query);
        $stmt->bind_param("i", $ID);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        return $row["Car_Destrezza"];
    }

    public function getConstitution($ID){
        $query="SELECT Car_Costituzione FROM personaggio WHERE ID_Personaggio=?";
        $stmt=$this->db->prepare($query);
        $stmt->bind_param("i", $ID);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        return $row["Car_Costituzione"];
    }

    public function getIntelligence($ID){
        $query="SELECT Car_Intelligenza FROM personaggio WHERE ID_Personaggio=?";
        $stmt=$this->db->prepare($query);
        $stmt->bind_param("i", $ID);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        return $row["Car_Intelligenza"];
    }

    public function getWisdom($ID){
        $query="SELECT Car_Saggezza FROM personaggio WHERE ID_Personaggio=?";
        $stmt=$this->db->prepare($query);
        $stmt->bind_param("i", $ID);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        return $row["Car_Saggezza"];
    }

    public function getCharisma($ID){
        $query="SELECT Car_Carisma FROM personaggio WHERE ID_Personaggio=?";
        $stmt=$this->db->prepare($query);
        $stmt->bind_param("i", $ID);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        return $row["Car_Carisma"];
    }

    public function getHitPoints($ID){
        $query="SELECT Punti_Ferita FROM personaggio WHERE ID_Personaggio=?";
        $stmt=$this->db->prepare($query);
        $stmt->bind_param("i", $ID);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        return $row["Punti_Ferita"];
    }

    public function getName($ID){
        $query="SELECT Nome FROM personaggio WHERE ID_Personaggio=?";
        $stmt=$this->db->prepare($query);
        $stmt->bind_param("i", $ID);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        return $row["Nome"];
    }

    public function getDescription($ID){
        $query="SELECT Descrizione_Aspetto FROM personaggio WHERE ID_Personaggio=?";
        $stmt=$this->db->prepare($query);
        $stmt->bind_param("i", $ID);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        return $row["Descrizione_Aspetto"];
    }

    public function getArmorClass($ID){
        $query="SELECT Classe_Armatura FROM personaggio WHERE ID_Personaggio=?";
        $stmt=$this->db->prepare($query);
        $stmt->bind_param("i", $ID);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        return $row["Classe_Armatura"];
    }

    public function getInitiative($ID){
        $query="SELECT Iniziativa FROM personaggio WHERE ID_Personaggio=?";
        $stmt=$this->db->prepare($query);
        $stmt->bind_param("i", $ID);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        return $row["Iniziativa"];
    }

    public function getExperiencePoints($ID){
        $query="SELECT Punti_Esperienza FROM personaggio WHERE ID_Personaggio=?";
        $stmt=$this->db->prepare($query);
        $stmt->bind_param("i", $ID);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        return $row["Punti_Esperienza"];
    }

    public function getOriginName($ID){
        $query="SELECT Nome_Origine FROM personaggio WHERE ID_Personaggio=?";
        $stmt=$this->db->prepare($query);
        $stmt->bind_param("i", $ID);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        return $row["Nome_Origine"];
    }

    public function getEquippedArmor($ID){
        $query="SELECT Armatura_Equipaggiata FROM personaggio WHERE ID_Personaggio=?";
        $stmt=$this->db->prepare($query);
        $stmt->bind_param("i", $ID);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        return $row["Armatura_Equipaggiata"];
    }

    public function getEquippedWeapon($ID){
        $query="SELECT Arma_equipaggiata FROM personaggio WHERE ID_Personaggio=?";
        $stmt=$this->db->prepare($query);
        $stmt->bind_param("i", $ID);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        return $row["Arma_equipaggiata"];
    }

    public function getAlignmentName($ID){
        $query="SELECT Nome_Allineamento FROM personaggio WHERE ID_Personaggio=?";
        $stmt=$this->db->prepare($query);
        $stmt->bind_param("i", $ID);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        return $row["Nome_Allineamento"];
    }

    public function getRaceName($ID){
        $query="SELECT Nome_Razza FROM personaggio WHERE ID_Personaggio=?";
        $stmt=$this->db->prepare($query);
        $stmt->bind_param("i", $ID);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        return $row["Nome_Razza"];
    }

    public function getBagID($ID){
        $query="SELECT ID_Borsa FROM personaggio WHERE ID_Personaggio=?";
        $stmt=$this->db->prepare($query);
        $stmt->bind_param("i", $ID);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        return $row["ID_Borsa"];
    }

    public function removeCharacter($ID){
        $query = "DELETE FROM personaggio WHERE ID_Personaggio = ?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("i", $ID);
        $stmt->execute();
    }
}

?>