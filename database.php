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

    public function getSubclasses(){
        $query="SELECT * FROM specializzazione ORDER BY Nome_Classe";
        $stmt = $this->db->prepare($query);
        $stmt->execute();
        $result = $stmt->get_result();
        $subclasses=array();
        while ($row = $result->fetch_assoc()){
            $subclasses[]=$row;
        }
        return $subclasses;
    }

    
    public function getSubclassesByClassAndLevel($classe, $livello){
        $query="SELECT * FROM specializzazione WHERE Nome_Classe=? AND Livello_Classe=? ORDER BY Nome_Classe";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("si", $classe, $livello);
        $stmt->execute();
        $result = $stmt->get_result();
        $subclasses=array();
        while ($row = $result->fetch_assoc()){
            $subclasses[]=$row;
        }
        return $subclasses;
    }

    public function getSubclassesByClassAndID($classe, $idpersonaggio){
        $query="SELECT DISTINCT scelta_sottoclasse.Nome_Sottoclasse FROM scelta_sottoclasse LEFT JOIN specializzazione ON scelta_sottoclasse.Nome_Sottoclasse=specializzazione.Nome_Sottoclasse WHERE Nome_Classe=? AND ID_Personaggio=?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("si", $classe, $idpersonaggio);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_assoc();
    }

    public function getSubraces(){
        $query="SELECT * FROM sottorazza ORDER BY Nome_Razza";
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

    public function getSubraceName($ID_personaggio){
        $query="SELECT Nome_Sottorazza FROM personaggio WHERE ID_Personaggio=?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("i", $ID_personaggio);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        return $row["Nome_Sottorazza"];
    }

    

    public function getSubclassesInfo($ID){
        $query="SELECT * FROM scelta_sottoclasse WHERE ID_Personaggio=?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("i", $ID);
        $stmt->execute();
        $result = $stmt->get_result();
        $info = array();
        while($row = $result->fetch_assoc()){
            $info[] = $row;
        }
        return $info;
    }

    public function getMySubclassLevel($ID, $subclass){
        $query="SELECT Livello_Sottoclasse FROM scelta_sottoclasse WHERE ID_Personaggio=? AND Nome_Sottoclasse=?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("is", $ID, $subclass);
        $stmt->execute();
        $result = $stmt->get_result();
        $info = array();
        while($row = $result->fetch_assoc()){
            $info[] = $row;
        }
        return $info;
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

    public function getCharacterInfo($idpersonaggio){
        $query="SELECT * FROM personaggio WHERE ID_Personaggio=?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("i", $idpersonaggio);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        return $row;
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

    public function getPrivilegeFromBackground($origini){
        $query="SELECT origine.Nome_Privilegio, privilegio.Descrizione FROM origine LEFT JOIN privilegio ON origine.Nome_Privilegio=privilegio.Nome WHERE origine.Nome=?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("s", $origini);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        return $row;
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

public function getCapacitiesOfClassAndLevel($class, $level){
    $query="SELECT * FROM impara_classe LEFT JOIN capacita_di_classe ON impara_classe.Nome_Capacita=capacita_di_classe.Nome WHERE Nome_Classe=? AND Livello_Classe<=?";
    $stmt = $this->db->prepare($query);
    $stmt->bind_param("si", $class, $level);
    $stmt->execute();
    $result = $stmt->get_result();
    $capacities=array();
    while ($row = $result->fetch_assoc()){
        $capacities[]=$row;
    }
    return $capacities;
}

public function getCapacityInfo($cap){
    $query="SELECT * FROM capacita_di_classe WHERE Nome=?";
    $stmt = $this->db->prepare($query);
    $stmt->bind_param("si", $class, $level);
    $stmt->execute();
    $result = $stmt->get_result();
}

public function getCapacitiesOfSubclassAndLevel($subclass, $level){
    $query="SELECT * FROM impara_sottoclasse LEFT JOIN capacita_di_sottoclasse ON impara_sottoclasse.Nome_Capacita=capacita_di_sottoclasse.Nome WHERE Nome_Sottoclasse=? AND Livello_Sottoclasse<=?";
    $stmt = $this->db->prepare($query);
    $stmt->bind_param("si", $subclass, $level);
    $stmt->execute();
    $result = $stmt->get_result();
    $capacities=array();
    while ($row = $result->fetch_assoc()){
        $capacities[]=$row;
    }
    return $capacities;
}

public function getCapacitiesOfSubclass(){
    $query="SELECT capacita_di_sottoclasse.Nome AS Capacita, capacita_di_sottoclasse.Descrizione as Descrizione, impara_sottoclasse.Nome_Sottoclasse as Sottoclasse, impara_sottoclasse.Livello_Sottoclasse as Livello FROM capacita_di_sottoclasse JOIN impara_sottoclasse ON capacita_di_sottoclasse.Nome=impara_sottoclasse.Nome_Capacita";
    $stmt = $this->db->prepare($query);
    $stmt->execute();
    $result = $stmt->get_result();
    $capacities=array();
    while ($row = $result->fetch_assoc()){
        $capacities[]=$row;
    }
    return $capacities;
}

public function getRacialTraits($race){
    $query="SELECT Nome_Tratto FROM tratti_della_razza WHERE Nome_Razza=?";
    $stmt = $this->db->prepare($query);
    $stmt->bind_param("s", $race);
    $stmt->execute();
    $result = $stmt->get_result();
    $traits=array();
    while ($row = $result->fetch_assoc()){
        $traits[]=$row;
    }
    return $traits;
}

public function getTraits(){
    $query="SELECT Nome, Descrizione, tratti_della_razza.Nome_Razza, tratti_della_sottorazza.Nome_Sottorazza FROM tratti_razziali LEFT JOIN tratti_della_razza ON tratti_razziali.Nome=tratti_della_razza.Nome_Tratto LEFT JOIN tratti_della_sottorazza ON tratti_razziali.Nome=tratti_della_sottorazza.Nome_Tratto";
    $stmt = $this->db->prepare($query);
    $stmt->execute();
    $result = $stmt->get_result();
    $traits=array();
    while ($row = $result->fetch_assoc()){
        $traits[]=$row;
    }
    return $traits;
}

public function getBackgroundsPrivileges(){
    $query="SELECT origine.Nome, origine.Descrizione, privilegio.Nome as Privilegio, privilegio.Descrizione as Descrizione_Privilegio FROM origine LEFT JOIN privilegio ON origine.Nome_Privilegio=privilegio.Nome";
    $stmt = $this->db->prepare($query);
    $stmt->execute();
    $result = $stmt->get_result();
    $traits=array();
    while ($row = $result->fetch_assoc()){
        $traits[]=$row;
    }
    return $traits;
}

public function getSpells(){
    $query="SELECT * FROM incantesimo";
    $stmt = $this->db->prepare($query);
    $stmt->execute();
    $result = $stmt->get_result();
    $spells=array();
    while ($row = $result->fetch_assoc()){
        $spells[]=$row;
    }
    return $spells;
}

public function getSpellsByID($ID){
    $query="SELECT * FROM conosce LEFT JOIN incantesimo on conosce.Nome_Incantesimo=incantesimo.Nome WHERE ID_Personaggio=?";
    $stmt = $this->db->prepare($query);
    $stmt->bind_param("i", $ID);
    $stmt->execute();
    $result = $stmt->get_result();
    $spells=array();
    while ($row = $result->fetch_assoc()){
        $spells[]=$row;
    }
    return $spells;
}



public function getSubracialTraits($race){
    $query="SELECT Nome_Tratto FROM tratti_della_sottorazza WHERE Nome_Sottorazza=?";
    $stmt = $this->db->prepare($query);
    $stmt->bind_param("s", $race);
    $stmt->execute();
    $result = $stmt->get_result();
    $traits=array();
    while ($row = $result->fetch_assoc()){
        $traits[]=$row;
    }
    return $traits;
}

public function getWeapons(){
    $query="SELECT Nome, Peso, Valore, Danno, Tipo_Danno, Tipologia, Nome_Proprieta FROM oggetto LEFT JOIN proprieta_arma ON oggetto.Nome=proprieta_arma.Nome_Arma WHERE Tipologia LIKE 'Arma %'";
    $stmt = $this->db->prepare($query);
    $stmt->execute();
    $result = $stmt->get_result();
    $weapons=array();
    while ($row = $result->fetch_assoc()){
        $weapons[]=$row;
    }
    return $weapons;
}

public function getWeaponsFromInventory($IDborsa){
    $query="SELECT contiene.Nome_Oggetto FROM contiene LEFT JOIN oggetto ON contiene.Nome_Oggetto=oggetto.Nome WHERE contiene.ID_Borsa=? AND Tipologia LIKE 'Arma %'";
    $stmt = $this->db->prepare($query);
    $stmt->bind_param("i", $IDborsa);
    $stmt->execute();
    $result = $stmt->get_result();
    $weapons=array();
    while ($row = $result->fetch_assoc()){
        $weapons[]=$row;
    }
    return $weapons;
}

public function getArmors(){
    $query="SELECT Nome, Peso, Valore, Classe_Armatura, Forza_Necessaria, Svantaggio_Furtivita, Tipologia FROM oggetto WHERE Tipologia LIKE 'Armatura %'";
    $stmt = $this->db->prepare($query);
    $stmt->execute();
    $result = $stmt->get_result();
    $weapons=array();
    while ($row = $result->fetch_assoc()){
        $weapons[]=$row;
    }
    return $weapons;
}

public function getArmorsFromInventory($IDborsa){
    $query="SELECT contiene.Nome_Oggetto FROM contiene LEFT JOIN oggetto ON contiene.Nome_Oggetto=oggetto.Nome WHERE contiene.ID_Borsa=? AND Tipologia LIKE 'Armatura %'";
    $stmt = $this->db->prepare($query);
    $stmt->bind_param("i", $IDborsa);
    $stmt->execute();
    $result = $stmt->get_result();
    $armors=array();
    while ($row = $result->fetch_assoc()){
        $armors[]=$row;
    }
    return $armors;
}

public function getGems(){
    $query="SELECT Nome, Valore FROM oggetto WHERE Tipologia LIKE '%Gemma%'";
    $stmt = $this->db->prepare($query);
    $stmt->execute();
    $result = $stmt->get_result();
    $weapons=array();
    while ($row = $result->fetch_assoc()){
        $weapons[]=$row;
    }
    return $weapons;
}

public function getTrinkets(){
    $query="SELECT Nome FROM oggetto WHERE Tipologia LIKE '%Cianfrusaglie%'";
    $stmt = $this->db->prepare($query);
    $stmt->execute();
    $result = $stmt->get_result();
    $weapons=array();
    while ($row = $result->fetch_assoc()){
        $weapons[]=$row;
    }
    return $weapons;
}


public function getPotions(){
    $query="SELECT Nome, Peso, Valore, Tipologia, Descrizione FROM oggetto WHERE (Tipologia LIKE '%Ingerito%') OR (Tipologia LIKE '%Contatto%')";
    $stmt = $this->db->prepare($query);
    $stmt->execute();
    $result = $stmt->get_result();
    $weapons=array();
    while ($row = $result->fetch_assoc()){
        $weapons[]=$row;
    }
    return $weapons;
}
public function getAmmo(){
    $query="SELECT Nome, Peso, Valore FROM oggetto WHERE Tipologia LIKE '%Munizioni%'";
    $stmt = $this->db->prepare($query);
    $stmt->execute();
    $result = $stmt->get_result();
    $weapons=array();
    while ($row = $result->fetch_assoc()){
        $weapons[]=$row;
    }
    return $weapons;
}

public function getTools(){
    $query="SELECT Nome, Peso, Valore, Contenuto FROM oggetto WHERE Contenuto IS NOT NULL";
    $stmt = $this->db->prepare($query);
    $stmt->execute();
    $result = $stmt->get_result();
    $weapons=array();
    while ($row = $result->fetch_assoc()){
        $weapons[]=$row;
    }
    return $weapons;
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

public function subracesByRace($razza){
    $query="SELECT Nome FROM sottorazza WHERE Nome_Razza=?";
    $stmt = $this->db->prepare($query);
    $stmt->bind_param("s", $razza);
    $stmt->execute();
    $result = $stmt->get_result();
    $sottorazze=array();
    while ($row = $result->fetch_assoc()){
        $sottorazze[]=$row["Nome"];
    }
    return $sottorazze;
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
public function getSubclassesFromClass($classe){
    $query="SELECT Nome_Sottoclasse FROM specializzazione WHERE Nome_Classe=?";
    $stmt = $this->db->prepare($query);
    $stmt->bind_param("s", $classe);
    $stmt->execute();
    $result = $stmt->get_result();
    $sottoclassi=array();
    while ($row = $result->fetch_assoc()){
        $sottoclassi[]=$row["Nome_Sottoclasse"];
    }
    return $sottoclassi;
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
        $classes=array();
        while ($row = $result->fetch_assoc()){
            $classes[]=$row;
        }
        return $classes;
    }

    public function getCountOfSpellsByLevelID_B($ID){
        $query="SELECT incantesimo.Livello, COUNT(*) AS Conteggio FROM conosce LEFT JOIN incantesimo ON conosce.Nome_Incantesimo=incantesimo.Nome WHERE incantesimo.ID_Bardo IS NOT NULL AND conosce.ID_Personaggio=? GROUP BY incantesimo.Livello";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("i", $ID);
        $stmt->execute();
        $result = $stmt->get_result();
        $spells=array();
        while ($row = $result->fetch_assoc()){
            $spells[$row["Livello"]]=$row["Conteggio"];
        }
        return $spells;
    }

    public function getCountOfSpellsByLevelID_M($ID){
        $query="SELECT incantesimo.Livello, COUNT(*) AS Conteggio FROM conosce LEFT JOIN incantesimo ON conosce.Nome_Incantesimo=incantesimo.Nome WHERE incantesimo.ID_Mago IS NOT NULL AND conosce.ID_Personaggio=? GROUP BY incantesimo.Livello";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("i", $ID);
        $stmt->execute();
        $result = $stmt->get_result();
        $spells=array();
        while ($row = $result->fetch_assoc()){
            $spells[$row["Livello"]]=$row["Conteggio"];
        }
        return $spells;
    }

    public function getSpellsByLevelM($level){
        $query="SELECT * FROM lancia_mago WHERE ID_Mago=?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("i", $level);
        $stmt->execute();
        $result = $stmt->get_result();
        $spells=array();
        while ($row = $result->fetch_assoc()){
            $spells[]=$row;
        }
        return $spells;
    }

    public function getSpellsByLevelB($level){
        $query="SELECT * FROM lancia_bardo WHERE ID_Bardo=?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("i", $level);
        $stmt->execute();
        $result = $stmt->get_result();
        $spells=array();
        while ($row = $result->fetch_assoc()){
            $spells[]=$row;
        }
        return $spells;
    }

    public function getSpellsExceptLearnt_M($idpersonaggio, $level){
        $query="(SELECT Nome FROM incantesimo WHERE ID_Mago=?) EXCEPT (SELECT conosce.Nome_Incantesimo AS Nome FROM conosce LEFT JOIN incantesimo ON conosce.Nome_Incantesimo=incantesimo.Nome WHERE incantesimo.ID_Mago=? AND conosce.ID_Personaggio=?)";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("iii", $level, $level, $idpersonaggio);
        $stmt->execute();
        $result = $stmt->get_result();
        $spells=array();
        while ($row = $result->fetch_assoc()){
            $spells[]=$row;
        }
        return $spells;
    }

    public function getSpellsExceptLearnt_B($idpersonaggio, $level){
        $query="(SELECT Nome FROM incantesimo WHERE ID_Bardo=?) EXCEPT (SELECT conosce.Nome_Incantesimo AS Nome FROM conosce LEFT JOIN incantesimo ON conosce.Nome_Incantesimo=incantesimo.Nome WHERE incantesimo.ID_Bardo=? AND conosce.ID_Personaggio=?)";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("iii", $level, $level, $idpersonaggio);
        $stmt->execute();
        $result = $stmt->get_result();
        $spells=array();
        while ($row = $result->fetch_assoc()){
            $spells[]=$row;
        }
        return $spells;
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

    public function updateMoney($idborsa, $rame, $argento, $electrum, $oro, $platino){
        $query="UPDATE borsa SET Monete_Rame=Monete_Rame+?, Monete_Argento=Monete_Argento+?, Monete_Electrum=Monete_Electrum+?, Monete_Oro=Monete_Oro+?, Monete_Platino=Monete_Platino+? WHERE ID_Borsa=?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("iiiiii", $rame, $argento, $electrum, $oro, $platino, $idborsa);
        $stmt->execute();
    }

    public function addSingleObjectToInventory($idborsa, $nomeoggetto){
        $query="INSERT INTO contiene(ID_Borsa, Nome_Oggetto, Quantita) VALUES(?,?,1)";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("is", $idborsa,$nomeoggetto);
        $stmt->execute();
    }

    public function getArmorProficiencies($class){
        $query="SELECT Nome_Armatura FROM competenza_della_classe_in_armature WHERE Nome_Classe=?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("s", $class);
        $stmt->execute();
        $result = $stmt->get_result();
        $armors=array();
        while ($row = $result->fetch_assoc()){
            $armors[]=$row;
        }
        return $armors;
    }

    public function getWeaponProficiencies($class){
        $query="SELECT Nome_Arma FROM competenza_della_classe_in_armi WHERE Nome_Classe=?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("s", $class);
        $stmt->execute();
        $result = $stmt->get_result();
        $weapons=array();
        while ($row = $result->fetch_assoc()){
            $weapons[]=$row;
        }
        return $weapons;
    }

    
    public function getToolProficiencies($classe, $origine){
        $query="SELECT DISTINCT Nome_Strumento FROM competenza_della_classe_in_strumenti WHERE Nome_Classe=? UNION SELECT DISTINCT Nome_Strumento FROM competenza_dell_origine_in_strumenti WHERE Nome_Origine=?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("ss", $classe, $origine);
        $stmt->execute();
        $result = $stmt->get_result();
        $tools=array();
        while ($row = $result->fetch_assoc()){
            $tools[]=$row;
        }
        return $tools;
    }

    public function getAllTraits($razza, $sottorazza){
        $query="SELECT DISTINCT tratti_della_razza.Nome_Tratto, tratti_razziali.Descrizione FROM tratti_della_razza LEFT JOIN tratti_razziali ON tratti_della_razza.Nome_Tratto=tratti_razziali.Nome WHERE tratti_della_razza.Nome_Razza=? UNION SELECT DISTINCT tratti_della_sottorazza.Nome_Tratto, tratti_razziali.Descrizione FROM tratti_della_sottorazza LEFT JOIN tratti_razziali ON tratti_della_sottorazza.Nome_Tratto=tratti_razziali.Nome WHERE tratti_della_sottorazza.Nome_Sottorazza=?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("ss", $razza, $sottorazza);
        $stmt->execute();
        $result = $stmt->get_result();
        $traits=array();
        while ($row = $result->fetch_assoc()){
            $traits[]=$row;
        }
        return $traits;
    }

    public function getAllLanguages($origine, $razza){
        $query="SELECT DISTINCT Nome_Lingua FROM lingue_aggiuntive WHERE Nome_Origine=? UNION SELECT DISTINCT Nome_Lingua FROM lingue_della_razza WHERE Nome_Razza=?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("ss", $origine, $razza);
        $stmt->execute();
        $result = $stmt->get_result();
        $lang=array();
        while ($row = $result->fetch_assoc()){
            $lang[]=$row;
        }
        return $lang;
    }


    public function updateGold($oro, $idborsa){
        $query="UPDATE borsa SET Monete_Oro=Monete_Oro+? WHERE ID_Borsa=?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("ii", $oro,$idborsa);
        $stmt->execute();
    }

    public function updateCA($idpersonaggio, $valore){
        $query="UPDATE personaggio SET Classe_Armatura=? WHERE ID_Personaggio=?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("ii", $valore,$idpersonaggio);
        $stmt->execute();
    }

    public function updateCharacterSkills($idpersonaggio, $caratteristica, $valore){
        $query="UPDATE personaggio SET Car_".$caratteristica."=Car_".$caratteristica."+? WHERE ID_Personaggio=?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("ii",$valore, $idpersonaggio);
        $stmt->execute();
    }

    public function updateCharacterInitiative($idpersonaggio, $valore){
        $query="UPDATE personaggio SET Iniziativa=? WHERE ID_Personaggio=?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("ii",$valore, $idpersonaggio);
        $stmt->execute();
    }


    public function updateEquipment($idpersonaggio, $arma, $armatura){
        $query="UPDATE personaggio SET Arma_Equipaggiata=?, Armatura_Equipaggiata=? WHERE ID_Personaggio=?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("ssi", $arma,$armatura, $idpersonaggio);
        if ($stmt->execute()){
            return true;
        }
        return false;
    }

    public function isWeaponEquipped($idpersonaggio, $arma){
        $query="SELECT Arma_Equipaggiata FROM personaggio WHERE ID_Personaggio=? AND Arma_Equipaggiata=?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("is", $idpersonaggio, $arma);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        return !!$row;
    }
    
    public function isArmorEquipped($idpersonaggio, $armatura){
        $query="SELECT Armatura_Equipaggiata FROM personaggio WHERE ID_Personaggio=? AND Armatura_Equipaggiata=?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("is", $idpersonaggio, $armatura);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        return !!$row;
    }

    public function isItemInBag($idborsa, $idoggetto){
        $query="SELECT * FROM contiene WHERE ID_Borsa=? AND Nome_Oggetto=?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("is", $idborsa, $idoggetto);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        return !!$row;
    }

    public function removeEquippedWeapon($idpersonaggio){
        $query="UPDATE personaggio SET Arma_Equipaggiata=NULL WHERE ID_Personaggio=?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("i",$idpersonaggio);
        if ($stmt->execute()){
            return true;
        }
        return false;
    }

    public function removeEquippedArmor($idpersonaggio){
        $query="UPDATE personaggio SET Armatura_Equipaggiata=NULL WHERE ID_Personaggio=?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("i",$idpersonaggio);
        if ($stmt->execute()){
            return true;
        }
        return false;
    }


    public function getBackgroundInventoryO($origine){
        $query="SELECT Nome_Oggetto FROM oggetti_dell_origine WHERE Nome_Origine=?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("s", $origine);
        $stmt->execute();
        $throws = array();
        $result = $stmt->get_result();
        while($row = $result->fetch_assoc()){
            $throws[] = $row;
        }
        return $throws;
    }

    public function getClassInventoryC($classe){
        $query="SELECT Nome_Oggetto FROM oggetti_di_classe WHERE Nome_Classe=?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("s", $classe);
        $stmt->execute();
        $throws = array();
        $result = $stmt->get_result();
        while($row = $result->fetch_assoc()){
            $throws[] = $row;
        }
        return $throws;
    }

    public function addBackgroundClassInventory($idborsa, $nome){
        $query="INSERT IGNORE INTO contiene(ID_Borsa, Nome_Oggetto, Quantita) VALUES(?,?,1)";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("is", $idborsa, $nome);
        if ($stmt->execute()){
        return true;
       }
       return false;
    }
    
    public function insertClassChoice($idpersonaggio, $classe, $livello){
        $query="INSERT IGNORE INTO scelta_classe(ID_Personaggio, Nome_Classe, Livello_Classe) VALUES(?, ?, ?)";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("isi", $idpersonaggio,$classe, $livello);
        if ($stmt->execute()){
            return true;
        }
        return false;
    }

    public function removeOldChoice($idpersonaggio, $classe){
        $query="DELETE FROM scelta_classe WHERE ID_Personaggio=? AND Nome_Classe=? AND Livello_Classe=(SELECT MIN(Livello_Classe) FROM scelta_classe WHERE ID_Personaggio=? AND Nome_Classe=?)";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("isis", $idpersonaggio,$classe,$idpersonaggio, $classe);
        $stmt->execute();
    }

    public function insertSubclassChoice($idpersonaggio, $sottoclasse, $livello){
        $query="INSERT INTO scelta_sottoclasse(ID_Personaggio, Nome_Sottoclasse, Livello_Sottoclasse) VALUES(?, ?, ?)";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("isi", $idpersonaggio,$sottoclasse, $livello);
        if ($stmt->execute()){
            return true;
        }
        return false;
    }

    public function removeOldChoiceSubclass($idpersonaggio, $sottoclasse){
        $query="DELETE FROM scelta_sottoclasse WHERE ID_Personaggio=? AND Nome_Sottoclasse=? AND Livello_Sottoclasse=(SELECT MIN(Livello_Sottoclasse) FROM scelta_sottoclasse WHERE ID_Personaggio=? AND Nome_Sottoclasse=?)";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("isis", $idpersonaggio,$sottoclasse,$idpersonaggio, $sottoclasse);
        $stmt->execute();
    }

    public function chosenSubclassesFromClasses($idpersonaggio){
    $query="SELECT DISTINCT specializzazione.Nome_Classe FROM scelta_sottoclasse LEFT JOIN specializzazione ON scelta_sottoclasse.Nome_Sottoclasse=specializzazione.Nome_Sottoclasse WHERE scelta_sottoclasse.ID_Personaggio=?";
    $stmt = $this->db->prepare($query);
    $stmt->bind_param("i", $idpersonaggio);
    $stmt->execute();
    $subclasses = array();
    $result = $stmt->get_result();
    while($row = $result->fetch_assoc()){
    $subclasses[] = $row;
    }
    return $subclasses;
    }

    public function insertSavingThrow($idpersonaggio, $nomecaratteristica, $valore){
        $query="INSERT INTO tiri_salvezza_personaggio(ID_Personaggio, Nome_Caratteristica, Valore) VALUES(?, ?, ?)";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("isi", $idpersonaggio,$nomecaratteristica, $valore);
        if ($stmt->execute()){
            return true;
        }
        return false;
    }

    public function updateSavingThrows($valore, $idpersonaggio){
        $query="UPDATE tiri_salvezza_personaggio SET Valore=Valore+? WHERE ID_Personaggio=?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("ii", $idpersonaggio, $valore);
        $stmt->execute();
    }

    public function getSavingThrowsName($classe){
        $query="SELECT Nome_TiroSalvezza FROM competenza WHERE Nome_Classe=?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("s", $classe);
        $stmt->execute();
        $throws = array();
        $result = $stmt->get_result();
        while($row = $result->fetch_assoc()){
            $throws[] = $row;
        }
        return $throws;
    }

    public function getSavingThrowsByID($idpersonaggio){
        $query="SELECT * FROM tiri_salvezza_personaggio WHERE ID_Personaggio=?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("i", $idpersonaggio);
        $stmt->execute();
        $throws = array();
        $result = $stmt->get_result();
        while($row = $result->fetch_assoc()){
            $throws[] = $row;
        }
        return $throws;
    }

    public function insertNewSpell($idpersonaggio, $spell){
        $query="INSERT INTO conosce(ID_Personaggio, Nome_Incantesimo) VALUES(?, ?)";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("is", $idpersonaggio,$spell);
        if ($stmt->execute()){
            return true;
        }
        return false;
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

    public function addCharacter($Forza, $Destrezza, $Costituzione, $Intelligenza, $Saggezza, $Carisma, $Punti_Ferita, $Nome, $Descrizione,$Classe_Armatura, $Iniziativa, $Nome_Origine, $Armatura_equipaggiata, $Arma_equipaggiata, $Nome_allineamento, $Nome_razza,$Nome_sottorazza, $ID_Borsa, $ID){
        $query = "INSERT INTO personaggio (Car_Forza, Car_Destrezza, Car_Costituzione, Car_Intelligenza, Car_Saggezza, Car_Carisma, Punti_Ferita, Nome, Descrizione_Aspetto, Classe_Armatura, Iniziativa, Nome_Origine, Armatura_Equipaggiata, Arma_equipaggiata, Nome_Allineamento, Nome_Razza, Nome_Sottorazza, ID_Borsa, ID_Utente)
        VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("iiiiiiissiissssssii", $Forza, $Destrezza, $Costituzione, $Intelligenza, $Saggezza, $Carisma, $Punti_Ferita, $Nome, $Descrizione,$Classe_Armatura, $Iniziativa, $Nome_Origine, $Armatura_equipaggiata, $Arma_equipaggiata, $Nome_allineamento, $Nome_razza, $Nome_sottorazza, $ID_Borsa, $ID);
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

    public function getClassBonus($IDpersonaggio){
        $query="SELECT MAX(Bonus_Competenza) AS Bonus FROM classe JOIN scelta_classe ON classe.Nome=scelta_classe.Nome_Classe AND classe.Livello=scelta_classe.Livello_Classe WHERE ID_Personaggio=?";
        $stmt=$this->db->prepare($query);
        $stmt->bind_param("i", $IDpersonaggio);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        return $row["Bonus"];
    }

    //join tra classe e scelta_classe in cui prendiamo il max tra classe.Bonus_Competenza

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

    public function getAumFromRace($race, $subrace){
        $query="SELECT razza.Aum_Nome_Caratteristica AS Caratteristica_Razza, razza.Aum_Valore_Aggiuntivo AS Valore_Razza, sottorazza.Aum_Nome_Caratteristica AS Caratteristica_Sottorazza, sottorazza.Aum_Valore_Aggiuntivo AS Valore_Sottorazza FROM razza JOIN sottorazza on razza.Nome=sottorazza.Nome_Razza WHERE razza.Nome=? AND sottorazza.Nome=?";
        $stmt=$this->db->prepare($query);
        $stmt->bind_param("ss", $race, $subrace);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        return $row;
    }

    public function getAumFromCapacity($class, $level){
        $query="SELECT impara_classe.Nome_Capacita, capacita_di_classe.Aum_Nome_Caratteristica, capacita_di_classe.Aum_Valore_Aggiuntivo FROM impara_classe LEFT JOIN capacita_di_classe ON impara_classe.Nome_Capacita=capacita_di_classe.Nome WHERE impara_classe.Nome_Classe=? AND impara_classe.Livello_Classe=? AND impara_classe.Nome_Capacita LIKE '%Aumento%'";
        $stmt=$this->db->prepare($query);
        $stmt->bind_param("si", $class, $level);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        return $row;
    }

    
    public function getCurrentWeight($idborsa){
        $query="SELECT SUM(oggetto.Peso * contiene.Quantita) AS Prodotto FROM contiene JOIN oggetto ON contiene.Nome_Oggetto=oggetto.Nome WHERE contiene.ID_Borsa=?";
        $stmt=$this->db->prepare($query);
        $stmt->bind_param("i", $idborsa);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        return $row["Prodotto"];
    }

    public function getSumOfLevels($idpersonaggio){
        $query="SELECT SUM(Livello_Classe) AS Somma FROM scelta_classe WHERE ID_Personaggio=?";
        $stmt=$this->db->prepare($query);
        $stmt->bind_param("i", $idpersonaggio);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        return $row["Somma"];
    }

    public function getBagInfo($IDborsa){
        $query="SELECT * FROM borsa WHERE ID_Borsa=?";
        $stmt=$this->db->prepare($query);
        $stmt->bind_param("i", $IDborsa);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        return $row;
    }

    public function getArmorInfo($armatura){
        $query="SELECT * FROM oggetto WHERE Nome=?";
        $stmt=$this->db->prepare($query);
        $stmt->bind_param("s", $armatura);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        return $row["Classe_Armatura"];

    }
    
    public function getObjectInfo($oggetto){
        $query="SELECT * FROM oggetto WHERE Nome=?";
        $stmt=$this->db->prepare($query);
        $stmt->bind_param("s", $oggetto);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        return $row;
    }

    public function dexterityWeaponChoice(){
        $query="(SELECT oggetto.Nome FROM oggetto WHERE Tipologia LIKE '% A DIstanza') UNION (SELECT proprieta_arma.Nome_Arma FROM proprieta_arma JOIN proprieta ON proprieta_arma.Nome_Proprieta=proprieta.Nome WHERE proprieta_arma.Nome_Proprieta='Precisione')";
        $stmt=$this->db->prepare($query);
        $stmt->execute();
        $result = $stmt->get_result();
        $info = array();
        while($row = $result->fetch_assoc()){
            $info[] = $row;
        }
        return $info;
    }

    public function strengthWeaponChoice(){
        $query="(SELECT oggetto.Nome FROM oggetto WHERE Tipologia LIKE '%Ravvicinata%') UNION (SELECT proprieta_arma.Nome_Arma FROM proprieta_arma JOIN proprieta ON proprieta_arma.Nome_Proprieta=proprieta.Nome WHERE proprieta_arma.Nome_Proprieta='Precisione')";
        $stmt=$this->db->prepare($query);
        $stmt->execute();
        $result = $stmt->get_result();
        $info = array();
        while($row = $result->fetch_assoc()){
            $info[] = $row;
        }
        return $info;
    }


 


    public function getClassesInfo($ID){
        $query="SELECT * FROM scelta_classe WHERE ID_Personaggio=?";
        $stmt=$this->db->prepare($query);
        $stmt->bind_param("i", $ID);
        $stmt->execute();
        $result = $stmt->get_result();
        $info = array();
        while($row = $result->fetch_assoc()){
            $info[] = $row;
        }
        return $info;
    }


    public function getClassLevel($ID){
        $query="SELECT Livello_Classe FROM scelta_classe WHERE ID_Personaggio=?";
        $stmt=$this->db->prepare($query);
        $stmt->bind_param("i", $ID);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        return $row["Livello_Classe"];
    }

    public function getClassLevelByIdAndName($ID, $classe){
        $query="SELECT Livello_Classe FROM scelta_classe WHERE ID_Personaggio=? AND Nome_Classe=?";
        $stmt=$this->db->prepare($query);
        $stmt->bind_param("is", $ID, $classe);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        return $row;
    }

    public function getSubclassLevel($ID){
        $query="SELECT Livello_Sottoclasse FROM scelta_sottoclasse WHERE ID_Personaggio=?";
        $stmt=$this->db->prepare($query);
        $stmt->bind_param("i", $ID);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        return $row["Livello_Sottoclasse"];
    }

    public function getSubclassDesiredLevel($classe, $livello, $sottoclasse){
        $query="SELECT Livello_Sottoclasse FROM specializzazione WHERE Nome_Classe=? AND Livello_Classe=? AND Nome_Sottoclasse=?";
        $stmt=$this->db->prepare($query);
        $stmt->bind_param("sis", $classe, $livello, $sottoclasse);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_assoc();
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

    public function getAllItems() {
        $stmt = $this->db->prepare("SELECT Nome FROM oggetto");
        $stmt->execute();
    
        $result = $stmt->get_result();
        $obj = array();
        while ($row = $result->fetch_assoc()) {
            $obj[] = $row;
        }
        return $obj;
    }

    //aggiunge gli oggetti


    public function addItemToBag($IDborsa, $NomeObj, $quantity) {
        // Controlla se l'oggetto esiste già nella borsa
        $stmtCheck = $this->db->prepare("SELECT Quantita FROM Contiene WHERE ID_Borsa = ? AND Nome_Oggetto = ?");
        $stmtCheck->bind_param("is", $IDborsa, $NomeObj);
        $stmtCheck->execute();
        $result = $stmtCheck->get_result();
        $row = $result->fetch_assoc();

        if ($row) {
            // Se l'oggetto esiste, aggiorna la quantità
            $newQuantity = $row['Quantita'] + $quantity;
            $stmtUpdate = $this->db->prepare("UPDATE Contiene SET Quantita = ? WHERE ID_Borsa = ? AND Nome_Oggetto = ?");
            $stmtUpdate->bind_param("iis", $newQuantity, $IDborsa, $NomeObj);
            $stmtUpdate->execute();
        } else {
            // Se l'oggetto non esiste, inserisci un nuovo record
            $stmtInsert = $this->db->prepare("INSERT INTO Contiene (ID_Borsa, Nome_Oggetto, Quantita) VALUES (?, ?, ?)");
            $stmtInsert->bind_param("isi", $IDborsa, $NomeObj, $quantity);
            $stmtInsert->execute();
        }
    }

    public function removeItemQuantityFromBag($IDborsa, $itemID, $quantity) {
        // Controlla la quantità corrente dell'oggetto nella borsa
        $stmtCheck = $this->db->prepare("SELECT Quantita FROM Contiene WHERE ID_Borsa = ? AND Nome_Oggetto = ?");
        $stmtCheck->bind_param("is", $IDborsa, $itemID);
        $stmtCheck->execute();
        $result = $stmtCheck->get_result();
        $row = $result->fetch_assoc();
    
        if ($row) {
            $currentQuantity = $row['Quantita'];
            if ($currentQuantity <= $quantity) {
                // Se la quantità da rimuovere è maggiore o uguale alla quantità corrente, rimuovi l'oggetto
                $stmtDelete = $this->db->prepare("DELETE FROM Contiene WHERE ID_Borsa = ? AND Nome_Oggetto = ?");
                $stmtDelete->bind_param("is", $IDborsa, $itemID);
                $stmtDelete->execute();
            } else {
                // Altrimenti, aggiorna la quantità
                $newQuantity = $currentQuantity - $quantity;
                $stmtUpdate = $this->db->prepare("UPDATE Contiene SET Quantita = ? WHERE ID_Borsa = ? AND Nome_Oggetto = ?");
                $stmtUpdate->bind_param("iis", $newQuantity, $IDborsa, $itemID);
                $stmtUpdate->execute();
            }
        }
    }

    public function addCompetenzeAbilita($idpersonaggio, $nomeabilita){
        $query="INSERT IGNORE INTO competenze_abilita(ID_Personaggio, Nome_Abilita) VALUES(?,?)";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("is", $idpersonaggio,$nomeabilita);
        $stmt->execute();
    }

    public function getCompetenzeAbilita($ID){
        $query="SELECT Nome_Abilita FROM competenze_abilita WHERE ID_Personaggio=?";
        $stmt=$this->db->prepare($query);
        $stmt->bind_param("i", $ID);
        $stmt->execute();
        $result = $stmt->get_result();
        $abilities = array();
        while($row = $result->fetch_assoc()){
            $abilities[] = $row;
        }
        return $abilities;
    }

    public function getCharacterAbilities($ID){
        $query="SELECT Nome_Abilita, Valore FROM abilita_personaggio WHERE ID_Personaggio=?";
        $stmt=$this->db->prepare($query);
        $stmt->bind_param("i", $ID);
        $stmt->execute();
        $result = $stmt->get_result();
        $abilities = array();
        while($row = $result->fetch_assoc()){
            $abilities[] = $row;
        }
        return $abilities;
    }
}

?>