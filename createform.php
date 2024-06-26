<?php
require_once("bootstrap.php");

function roll($dado, $times){
    $sum=0;
    for ($i=1;$i<=$times;$i++){
        $sum+=random_int(1, $dado);
    }
    return $sum;
}

function parseDie($dado){
    $strings=explode("d", $dado);
    $dadovita=intval($strings[1]);
    return array($dadovita, intval($strings[0]));
}

$gold=0;

$classe=$_GET["class"];
$str=$_GET["forza"];
$con=$_GET["costituzione"];
$dex=$_GET["destrezza"];
$int=$_GET["intelligenza"];
$wis=$_GET["saggezza"];
$cha=$_GET["carisma"];

$modstr=intdiv($str, 2)-5;
$modcon=intdiv($con, 2)-5;
$moddex=intdiv($dex, 2)-5;
$modint=intdiv($int, 2)-5;
$modwis=intdiv($wis, 2)-5;
$modcha=intdiv($cha, 2)-5;

$nome=$_GET["name"];
$descrizione_aspetto=$_GET["descrizione_aspetto"];
$origine=$_GET["background"];
$dado=$dbh->getDiceFromClass($classe);
$dadovita=parseDie($dado)[0];
$hitpoints=$modcon+$dadovita;
$classearmatura=10+$moddex;
$iniziativa=$dex;
$razza=$_GET["race"];

switch ($classe){
    case "Barbaro":
        $gold=roll(4,2)*10;
        break;
    case "Bardo":
        $gold=roll(4,5)*10;
        break;
    case "Ladro":
        $gold=roll(4,4)*10;
        break;
    case "Mago":
        $gold=roll(4,3)*10;
        break;
    default:
        die("Class not valid");
}

$allineamento = urldecode($_GET["alignment"]);
$sottorazza=urldecode($_GET["subrace"]);
$myvalues=array($str, $con, $dex,$int, $wis, $cha);
$peso_borsa=15*$str;
$reference=array(8,10,12,13,14,15);
sort($myvalues);



$valore=0;
$abilita=$dbh->abilityMatches($classe, $origine);
//var_dump($abilita);
    //if query matches classe e abilita: valore+1, pass into dbAbilita
if ($myvalues==$reference){
    $idborsa=$dbh->addInventory($peso_borsa, $gold);
    $idpersonaggio=$dbh->addCharacter($str, $dex, $con, $int, $wis, $cha, $hitpoints, $nome,$descrizione_aspetto,$classearmatura,$iniziativa,$origine, null, null, $allineamento, $razza,$sottorazza, $idborsa, $_SESSION["ID"]);
    $dbh->updatePossiede($_SESSION["ID"], $idpersonaggio);
    $augmented=$dbh->getAumFromRace($razza, $sottorazza);

    $dbh->updateCharacterSkills($idpersonaggio, $augmented["Caratteristica_Razza"], $augmented["Valore_Razza"]);
    $dbh->updateCharacterSkills($idpersonaggio, $augmented["Caratteristica_Sottorazza"], $augmented["Valore_Sottorazza"]);

    foreach ($abilita as $singolabilita){
        $car_associata=$singolabilita["Caratteristica_Associata"];
        switch ($car_associata){
            case "Destrezza":
                $valore=$moddex;
                break;
            case "Intelligenza":
                $valore=$modint;
                break;
            case "Saggezza":
                $valore=$modwis;
                break;
            case "Carisma":
                $valore=$modcha;
                break;
            case "Costituzione":
                $valore=$modcon;
                break;
            case "Forza":
                $valore=$modstr;
                break;
            default:
                die("Mod not valid");
        }   

        $nomeabilita=$singolabilita["Nome"];
        if (!is_null($singolabilita["Nome_Classe"])){
            $dbh->addCompetenzeAbilita($idpersonaggio, $nomeabilita);
            $valore+=2; 
        }
        if (!is_null($singolabilita["Nome_Origine"])){
            $dbh->addCompetenzeAbilita($idpersonaggio, $nomeabilita);
            $valore+=2;
        }
    $dbh->insertAbilita($idpersonaggio, $nomeabilita, $valore);
    $valore=0;
    }


    //$classe
    $dbh->insertClassChoice($idpersonaggio, $classe, 1);
    $tirisalvezza=$dbh->getSavingThrowsName($classe);
    $livelloclasse=$dbh->getClassLevel($idpersonaggio);
    $bonuscompetenza=$dbh->getClassBonus($idpersonaggio);

    //sono un Bardo lvl 1: ho +2 di bonus_competenza
    //in Carisma e Destrezza
    //ho 15 punteggio Carisma e 10 punteggio Destrezza
    //inoltre aggiungo il modificatore di Carisma e Destrezza (2 e 0)
    //avrò valore 4 in Carisma e 2 in Destrezza nel tiro salvezza

    foreach ($tirisalvezza as $tirosalvezza){
        $nomecaratteristica=$tirosalvezza["Nome_TiroSalvezza"];
        $valoretiro=0;
        $moddex=intdiv($dbh->getCharacterInfo($idpersonaggio)["Car_Destrezza"],2)-5;
        switch ($nomecaratteristica){
            case "Destrezza":
                $valoretiro=$moddex+$bonuscompetenza;
                break;
            case "Intelligenza":
                $valoretiro=$modint+$bonuscompetenza;
                break;
            case "Saggezza":
                $valoretiro=$modwis+$bonuscompetenza;
                break;
            case "Carisma":
                $valoretiro=$modcha+$bonuscompetenza;
                break;
            case "Costituzione":
                $valoretiro=$modcon+$bonuscompetenza;
                break;
            case "Forza":
                $valoretiro=$modstr+$bonuscompetenza;
                break;
            default:
                die("Mod not valid");
        }   
        $dbh->insertSavingThrow($idpersonaggio, $nomecaratteristica, $valoretiro);
    }

        $oggettiorigine=$dbh->getBackgroundInventoryO($origine);
        //var_dump($oggettiorigine);
        foreach ($oggettiorigine as $oggetto){
            $dbh->addBackgroundClassInventory($idborsa, $oggetto["Nome_Oggetto"]);
        }
        
        $backgroundgold=0;
        switch ($origine){
            case "Accolito":
                $backgroundgold=15;
                break;
            case "Archeologo":
                $backgroundgold=25;
                break;
            case "Cavaliere":
                $backgroundgold=25;
                break;
            case "Criminale":
                $backgroundgold=15;
                break;
            case "Marinaio":
                $backgroundgold=10;
                break;
            default:
            die("Invalid Background");
        }

    $dbh->updateGold($backgroundgold, $idborsa);
    $oggetticlasse=$dbh->getClassInventoryC($classe);
    foreach ($oggetticlasse as $oggetto){
        $dbh->addBackgroundClassInventory($idborsa, $oggetto["Nome_Oggetto"]);
    }
    $nuovadestrezza=$dbh->getCharacterInfo($idpersonaggio)["Car_Destrezza"];
    $dbh->updateCharacterInitiative($idpersonaggio, $nuovadestrezza);
   header("Location: index.php");
}else{
   header("Location: create.php");
}
?>