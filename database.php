<?php

class DatabaseHelper{
    public $db;

    public function __construct($servername, $username, $password, $dbname, $port){
        $this->db = new mysqli($servername, $username, $password, $dbname, $port);
        if ($this->db->connect_error) {
            die("Connection failed: " . $this->db->connect_error);
        }
    }

    public function getObject($tabella, $keyname, $keytype, $key) {
        $query="SELECT * FROM ".$tabella." WHERE ".$keyname."=?";
        $stmt=$this->db->prepare($query);   
        $stmt->bind_param($keytype, $key);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        if (is_null($row)){
            die("Cannot find ".$key." as ".$keyname." in ".$tabella);
        }else{
            return $row;
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

    public function getRaces(){
        $query="SELECT * FROM razza";
        $stmt = $this->db->prepare($query);
        $stmt->execute();
        $result = $stmt->get_result();
        $races=array();
        while ($row = $result->fetch_assoc()){
            $races[]=$row;
        }
        return $races;
    }

    public function getAbilities(){
        $query="SELECT * FROM abilita";
        $stmt = $this->db->prepare($query);
        $stmt->execute();
        $result = $stmt->get_result();
        $abilities=array();
        while ($row = $result->fetch_assoc()){
            $abilities[]=$row;
        }
        return $abilities;
    }

    public function abilityMatches($classe, $origine){
        $query= "SELECT abilita.*, classe_migliora.Nome_Classe, origine_migliora.Nome_Origine FROM abilita LEFT JOIN classe_migliora ON abilita.Nome=classe_migliora.Nome_Abilita AND classe_migliora.Nome_Classe=? LEFT JOIN origine_migliora ON abilita.Nome=origine_migliora.Nome_Abilita AND origine_migliora.Nome_Origine=?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("ss", $classe, $origine);
        $stmt->execute();
        $result = $stmt->get_result();
        $abilities=array();
        while ($row = $result->fetch_assoc()){
            $abilities[]=$row;
        }
        return $abilities;
    }

    public function getRaceInfo($race){
        $query="SELECT * FROM razza WHERE Nome=?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("s", $race);
        $stmt->execute();
        $result = $stmt->get_result();
        $races=array();
        while ($row = $result->fetch_assoc()){
            $races[]=$row;
        }
        return $races;
    }

    /*public function getSubraceName($subrace){
        $query="SELECT Nome_Razza FROM scelta_sottorazza WHERE Nome=?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("s", $subrace);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        return $row["Nome_Razza"];
    }*/

    

    public function getSubclassName($ID){
        $query="SELECT Nome_Sottoclasse FROM scelta_sottoclasse WHERE ID_Personaggio=?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("i", $ID);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        return $row["Nome_Sottoclasse"];
    }

    public function getSubraceInfo($subrace){
        $query="SELECT * FROM sottorazza WHERE Nome=?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("s", $subrace);
        $stmt->execute();
        $result = $stmt->get_result();
        $subraces=array();
        while ($row = $result->fetch_assoc()){
            $subraces[]=$row;
        }
        return $subraces;
    }

    public function getBackgroundInfo($background){
        $query="SELECT * FROM origine WHERE Nome=?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("s", $background);
        $stmt->execute();
        $result = $stmt->get_result();
        $backgrounds=array();
        while ($row = $result->fetch_assoc()){
            $backgrounds[]=$row;
        }
        return $backgrounds;
    }

    public function getPrivilegeInfo($privilege){
        $query="SELECT * FROM privilegio WHERE Nome=?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("s", $privilege);
        $stmt->execute();
        $result = $stmt->get_result();
        $privileges=array();
        while ($row = $result->fetch_assoc()){
            $privileges[]=$row;
        }
        return $privileges;
    }
//by name
    public function getClassInfo($class){
        $query="SELECT * FROM classe WHERE Nome=?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("s", $class);
        $stmt->execute();
        $result = $stmt->get_result();
        $classes=array();
        while ($row = $result->fetch_assoc()){
            $classes[]=$row;
        }
        return $classes;
    }

    public function getAllClassInfo($class){
    $query="SELECT classe.*, barbaro.Bonus_Rabbia, barbaro.Utilizzi_Rabbia_Giornalieri, bardo.Dado_Ispirazione_Bardica,ladro.Bonus_Attacco_Furtivo FROM classe LEFT JOIN barbaro ON classe.Livello=barbaro.Livello_Classe AND classe.Nome=barbaro.Nome_Classe LEFT JOIN bardo ON classe.Livello=bardo.Livello_Classe AND classe.Nome=bardo.Nome_Classe LEFT JOIN ladro ON classe.Livello=ladro.Livello_Classe AND classe.Nome=ladro.Nome_Classe WHERE Nome=?";
    $stmt = $this->db->prepare($query);
        $stmt->bind_param("s", $class);
        $stmt->execute();
        $result = $stmt->get_result();
        $classes=array();
        while ($row = $result->fetch_assoc()){
            $classes[]=$row;
        }
        return $classes;
    }

    public function getCapacitiesByClass($class){
    $query="SELECT Livello, impara_classe.Nome_Capacita FROM classe LEFT JOIN impara_classe ON classe.Livello=impara_classe.Livello_Classe AND classe.Nome=impara_classe.Nome_Classe WHERE Nome=?";
    $stmt = $this->db->prepare($query);
    $stmt->bind_param("s", $class);
    $stmt->execute();
    $result = $stmt->get_result();
    $capacities=array();
    while ($row = $result->fetch_assoc()){
        $capacities[]=$row;
    }
    return $capacities;
}


    public function getClasses(){
        $query="SELECT DISTINCT Nome FROM classe";
        $stmt = $this->db->prepare($query);
        $stmt->execute();
        $result = $stmt->get_result();
        $classes=array();
        while ($row = $result->fetch_assoc()){
            $classes[]=$row;
        }
        return $classes;
    }

public function getLanguages(){
    $query="SELECT * FROM lingue";
    $stmt = $this->db->prepare($query);
    $stmt->execute();
    $result = $stmt->get_result();
    $lingue=array();
    while ($row = $result->fetch_assoc()){
        $lingue[]=$row;
    }
    return $lingue;
}

public function spokenByRace($lingua){
    $query="SELECT Nome_Razza FROM lingue_della_razza WHERE Nome_Lingua=?";
    $stmt = $this->db->prepare($query);
    $stmt->bind_param("s", $lingua);
    $stmt->execute();
    $result = $stmt->get_result();
    $razze=array();
    while ($row = $result->fetch_assoc()){
        $razze[]=$row["Nome_Razza"];
    }
    return $razze;
}


public function spokenByBackground($lingua){
    $query="SELECT Nome_Origine FROM lingue_aggiuntive WHERE Nome_Lingua=?";
    $stmt = $this->db->prepare($query);
    $stmt->bind_param("s", $lingua);
    $stmt->execute();
    $result = $stmt->get_result();
    $origini=array();
    while ($row = $result->fetch_assoc()){
        $origini[]=$row["Nome_Origine"];
    }
    return $origini;
}

    public function getAlignments(){
        $query="SELECT * FROM allineamento";
        $stmt = $this->db->prepare($query);
        $stmt->execute();
        $result = $stmt->get_result();
        $alignments=array();
        while ($row = $result->fetch_assoc()){
            $alignments[]=$row;
        }
        return $alignments;
    }

    public function getSubracesForRace($race){
        $query="SELECT * FROM sottorazza WHERE Nome_Razza=?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("s", $race);
        $stmt->execute();
        $result = $stmt->get_result();
        $subraces=array();
        while ($row = $result->fetch_assoc()){
            $subraces[]=$row;
        }
        return $subraces;
    }

    public function getClassByLevel($level){
        $query="SELECT * FROM classe WHERE Livello=?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("i", $level);
        $stmt->execute();
        $result = $stmt->get_result();
        $subraces=array();
        while ($row = $result->fetch_assoc()){
            $classes[]=$row;
        }
        return $classes;
    }

    public function getBackgrounds(){
        $query="SELECT * FROM origine";
        $stmt = $this->db->prepare($query);
        $stmt->execute();
        $result = $stmt->get_result();
        $backgrounds=array();
        while ($row = $result->fetch_assoc()){
            $backgrounds[]=$row;
        }
        return $backgrounds;
    }

    public function addInventory($peso, $oro){
        $query="INSERT INTO borsa(Peso_Trasportabile, Monete_Rame, Monete_Argento, Monete_Electrum, Monete_Oro, Monete_Platino) VALUES(?,0,0,0,?,0)";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("ii", $peso,$oro);
        $stmt->execute();
        $result=$this->db->insert_id;
        return $result;
    }

    public function getDiceFromClass($nomeclasse){
        $query="SELECT * FROM classe WHERE Nome=?";
        $stmt=$this->db->prepare($query);
        $stmt->bind_param("s", $nomeclasse);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        return $row["Dado_Vita"];
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

    public function addCharacter($Forza, $Destrezza, $Costituzione, $Intelligenza, $Saggezza, $Carisma, $Punti_Ferita, $Nome, $Descrizione,$Classe_Armatura, $Iniziativa, $Punti_esperienza, $Nome_Origine, $Armatura_equipaggiata, $Arma_equipaggiata, $Nome_allineamento, $Nome_razza,$Nome_sottorazza, $ID_Borsa, $ID){
        $query = "INSERT INTO personaggio (Car_Forza, Car_Destrezza, Car_Costituzione, Car_Intelligenza, Car_Saggezza, Car_Carisma, Punti_Ferita, Nome, Descrizione_Aspetto, Classe_Armatura, Iniziativa, Punti_Esperienza, Nome_Origine, Armatura_Equipaggiata, Arma_equipaggiata, Nome_Allineamento, Nome_Razza, Nome_Sottorazza, ID_Borsa, ID_Utente)
        VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("iiiiiiissiiissssssii", $Forza, $Destrezza, $Costituzione, $Intelligenza, $Saggezza, $Carisma, $Punti_Ferita, $Nome, $Descrizione,$Classe_Armatura, $Iniziativa, $Punti_esperienza, $Nome_Origine, $Armatura_equipaggiata, $Arma_equipaggiata, $Nome_allineamento, $Nome_razza, $Nome_sottorazza, $ID_Borsa, $ID);
        if ($stmt->execute()) {
            return $this->db->insert_id;
        } else {
            return null;
        }
    }

    public function updatePossiede($idutente, $idpersonaggio){
        $query="INSERT INTO possiede(ID_Utente, ID_Personaggio) VALUES (?, ?)";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("ii", $idutente, $idpersonaggio);
        $stmt->execute();
    }

    public function updateAbilita($idpersonaggio, $nomeabilita, $valore){
        $query="INSERT INTO abilita_personaggio(ID_Personaggio, Nome_Abilita, Valore) VALUES (?, ?, ?)";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("isi", $idpersonaggio, $nomeabilita, $valore);
        $stmt->execute();
    }


//fino a qui


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

    public function getClassName($ID){
        $query="SELECT Nome_Classe FROM scelta_classe WHERE ID_Personaggio=?";
        $stmt=$this->db->prepare($query);
        $stmt->bind_param("i", $ID);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        return $row["Nome_Classe"];
    }

    public function getLevel($ID){
        $query="SELECT Livello FROM personaggio WHERE ID_Personaggio=?";
        $stmt=$this->db->prepare($query);
        $stmt->bind_param("i", $ID);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        return $row["Livello"];
    }

    public function removeCharacter($ID){
        $query = "DELETE FROM personaggio WHERE ID_Personaggio = ?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("i", $ID);
        $stmt->execute();
    }


    public function getCharacterItems($ID) {
        $stmt = $this->db->prepare("SELECT * FROM Contiene WHERE ID_Borsa = ?");
        $stmt->bind_param("i", $ID);
        $stmt->execute();

        $result = $stmt->get_result();
        $items = array();
        while($row = $result->fetch_assoc()){
            $items[] = $row;
        }
        return $items;
    }
}

?>