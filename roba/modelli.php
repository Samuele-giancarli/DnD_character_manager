<?php

class Allineamento {
    public $nome;
    function __construct($key) {
        $this->nome = $key;
    }
}

class Privilegio {
    public $nome;
    public $descrizione;
    function __construct($key) {
        $row=$dbh->getObject("privilegio","Nome","s", $key);
        $this->nome=$row["Nome"];
        $this->descrizione=$row["Descrizione"];
    }
}

class Origine{
    public $nome;
    public $descrizione;
    public $nome_privilegio;
    function __construct($key){
        $row=$dbh->getObject("origine","Nome","s", $key);
        $this->nome=$row["Nome"];
        $this->descrizione=$row["Descrizione"];
        $this->nome_privilegio=new Privilegio($row["Nome_Privilegio"]);
    }
}

class Borsa {
    public $id;
    public $peso_trasportabile;
    public $monete_rame;
    public $monete_argento;
    public $monete_oro;
    public $monete_electrum;
    public $monete_platino;
    function __construct($key) {
        $row=$dbh->getObject("borsa","ID_Borsa","i", $key);
        $this->id=$row["ID_Borsa"];
        $this->peso_trasportabile=$row["Peso_Trasportabile"];
        $this->monete_rame=$row["Monete_Rame"];
        $this->monete_rame=$row["Monete_Argento"];
        $this->monete_rame=$row["Monete_Oro"];
        $this->monete_rame=$row["Monete_Electrum"];
        $this->monete_rame=$row["Monete_Platino"];
    }
}

class Personaggio {
    //You may assign each of these numbers once to one of the abilities: 15,14,13,12,10,8
    
}
?>