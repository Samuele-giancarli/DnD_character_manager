<?php
    require_once("bootstrap.php");

    function Flatten1($x){
        return $x["Nome"];
    }

    function Flatten2($y){
        return $y["Nome_Classe"];
    }

    $idpersonaggio=$_GET["idpersonaggio"];
    //var_dump($idpersonaggio);
    $livellopersonaggio=$_GET["livellopersonaggio"];
    //var_dump($livellopersonaggio);
    $tutteclassi=$dbh->getClasses();
    $classiottenute=$dbh->getClassesInfo($idpersonaggio);
    $sottoclassi=$dbh->getSubclasses();

    //tutte le tue classi: vedere a che livello ottengono la prima sottoclasse
    //in specializzazione
    //fare la select: e sceglierla
    
    if (isset($_GET["classlevel"])){
        $scelta=$_GET["classlevel"];
        $livellopersonaggio+=1;
        $arrayscelta=explode(" ", $scelta);
        $nomeclasse=$arrayscelta[0];
        $livelloclasse=$arrayscelta[1];

        //abbiamo preso nome e livello della classe di cui stiamo aumentando il lvl
        $dbh->insertClassChoice($idpersonaggio, $nomeclasse, $livelloclasse);
        //if nome classe e livello classe -> aumento * in capacita_di_classe join impara_classe
        //allora prendo Nome Caratteristica e Valore, e lo aumento con updateCharacterSkills

        if (!is_null($dbh->getAumFromCapacity($nomeclasse, $livelloclasse))){
            $nomecaratteristica=$dbh->getAumFromCapacity($nomeclasse, $livelloclasse)["Aum_Nome_Caratteristica"];
            $valorecaratteristica=$dbh->getAumFromCapacity($nomeclasse, $livelloclasse)["Aum_Valore_Aggiuntivo"];
            $dbh->updateCharacterSkills($idpersonaggio, $nomecaratteristica, $valorecaratteristica);
            if ($nomecaratteristica="Destrezza"){
                $nuovadestrezza=$dbh->getCharacterInfo($idpersonaggio)["Car_Destrezza"];
                $dbh->updateCharacterInitiative($idpersonaggio, $nuovadestrezza);
            }
        }

        // aumento il lvl della classe
        $sottoclassiGiaScelte=$dbh->chosenSubclassesFromClasses($idpersonaggio);
        // ho la lista delle classi che ho già specializzato "first time"
        $flattenedScelte=array_map("Flatten2", $sottoclassiGiaScelte);
        // tengo solo i nomi di queste classi
        $sottoclasseDaLivellare=$dbh->getSubclassesByClassAndID($nomeclasse, $idpersonaggio)["Nome_Sottoclasse"];
        // trovo la sottoclasse che sto livellando
        $livellosottoclasse=$dbh->getMySubclassLevel($idpersonaggio, $sottoclasseDaLivellare);
        // trovo il suo livello attuale
        $livelloTarget=$dbh->getSubclassDesiredLevel($nomeclasse,$livelloclasse,$sottoclasseDaLivellare);
        //trovo il livello target in questo momento
        //se la classe che sto aumentando è tra quelle che ho specializzato, e ho una sottoclasse
        //risultante dalla query tra classe e livello
        if (in_array($nomeclasse, $flattenedScelte)&&!is_null($sottoclasseDaLivellare)&&!is_null($livelloTarget)){
            //aumento di lvl la sottoclasse e rimuovo il vecchio livello
           $dbh->removeOldChoiceSubclass($idpersonaggio, $sottoclasseDaLivellare);
           $dbh->insertSubclassChoice($idpersonaggio, $sottoclasseDaLivellare, $livelloTarget["Livello_Sottoclasse"]);
        }
        //rimuovo il vecchio livello
        if ($livelloclasse>=2){
        $dbh->removeOldChoice($idpersonaggio, $nomeclasse);
        }

        header("Location: levelup.php?idpersonaggio=".$idpersonaggio."&livellopersonaggio=".$livellopersonaggio);
        exit();
    }

    if (isset($_GET["subclasschoice"])){
        $scelta=$_GET["subclasschoice"];
        $dbh->insertSubclassChoice($idpersonaggio, $scelta, 1);
    }

    if (isset($_POST["newspell"])){
        $spell=urldecode($_POST["newspell"]);
        $dbh->insertNewSpell($idpersonaggio, $spell);
        header("Location: levelup.php?idpersonaggio=".$idpersonaggio."&livellopersonaggio=".$livellopersonaggio);
        exit();
    }

?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DND Aider - Dungeons and Dragons Character Sheet</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .card {
            margin-top: 50px;
            background-color: #d2b48c;
            border: 1px solid #8b4513;
        }
        .card-header {
            background-color: #8b4513;
            color: #fff;
        }
        .btn-primary {
            background-color: #8b4513;
            border: 1px solid #8b4513;
        }
        table, th, td{
            border: 1px solid black;
             border-collapse:collapse;
        }

    </style>
</head>
<body>

<header><nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="index.php">DND Aider</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
<!-- nella home vedo la lista dei miei personaggi e il pulsante "crea"-->
      </li>
      <?php
      if (isset($_SESSION["ID"])){
      ?>
       <li class="nav-item">
        <a class="nav-link" href="logout.php">Logout</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="create.php">Crea</a>
      </li>
      <?php
      }else{
      ?>
      <li class="nav-item">
        <a class="nav-link" href="login.php">Login</a>
      </li>
      <?php
    } ?>
      <li class="nav-item">
        <a class="nav-link" href="guide.php">Guide</a>
      </li>
    </ul>
  </div>
</nav></header>

<div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header"><a href=<?php echo "\"characterSheet.php?ID=".$idpersonaggio."\""; ?>>Sei salito di livello!</a></div>
                    <div class="card-body">
                    <legend>Scegli la tua sottoclasse</legend>
                    <form action="levelup.php" method="GET">

                    <?php

                    $sottoclassiGiaScelte=$dbh->chosenSubclassesFromClasses($idpersonaggio);
                    $flattenedScelte=array_map("Flatten2", $sottoclassiGiaScelte);
                    $cansubmit = false;
                    foreach ($classiottenute as $classe){
                        if(in_array($classe["Nome_Classe"], $flattenedScelte)) {
                            continue;
                        }
                        echo $classe["Nome_Classe"]." ";
                        $sottoclassiottenibili=$dbh->getSubclassesByClassAndLevel($classe["Nome_Classe"], $classe["Livello_Classe"]);
                        //var_dump($sottoclassiottenibili);
                        if (!is_null($sottoclassiottenibili)){
                        echo  "<select name=\"subclasschoice\">";
                        foreach ($sottoclassiottenibili as $sottoclasse){
                            echo '<option value="'.$sottoclasse["Nome_Sottoclasse"].'">' . $sottoclasse["Nome_Sottoclasse"]. '</option>';
                            $cansubmit = true;
                        }
                        echo "</select><br>";
                    }
                }
                    ?>
                    <input type="submit" <?php if (!$cansubmit){echo "disabled";}?>/>
                    <input id="idpersonaggio" name="idpersonaggio" type="hidden" value="<?php echo $idpersonaggio?>"/>
                    <input id="livellopersonaggio" name="livellopersonaggio" type="hidden" value="<?php echo $livellopersonaggio?>"/>
                    </form>

                    <legend>Scegli dove progredire</legend>
                    <form method="GET" action="levelup.php">
                    <?php
                    //var_dump($tutteclassi);
                    //var_dump($classiottenute);
                    ?>
                    <select id="classlevel" name="classlevel">
                        <?php

                        $flattenedtutte=array_map("Flatten1", $tutteclassi);
                        $flattenedottenute=array_map("Flatten2", $classiottenute);
                        $differenza=array_diff($flattenedtutte, $flattenedottenute);
                        $sumlivello=0;
                        foreach ($classiottenute as $classe){
                        $sumlivello+=$classe["Livello_Classe"];
                        }
                        $candomore = $sumlivello+1<=20||$livellopersonaggio!=20;
                        if ($candomore){
                        foreach ($classiottenute as $classe){
                        //se $sumlivello+1>20 non puoi, se il livello della classe è già 20 non puo
                            echo '<option value="' . $classe["Nome_Classe"]." ".($classe["Livello_Classe"]+1) . '">' . $classe["Nome_Classe"]." ".($classe["Livello_Classe"]+1) . '</option>';
                        }
                        foreach ($differenza as $classe){
                            echo "<option value=\"".$classe." 1\">".$classe." 1 </option>";
                        }
                        }else{
                            echo "<option>Non puoi salire ulteriormente di livello</option>";
                        }
                        
                        ?>
                    </select>
                
                    <input type="submit" name="levelpg" <?php if (!$candomore) { echo "disabled"; } ?>/>
                    <input id="idpersonaggio" name="idpersonaggio" type="hidden" value="<?php echo $idpersonaggio?>"/>
                    <input id="livellopersonaggio" name="livellopersonaggio" type="hidden" value="<?php echo $livellopersonaggio?>"/>
                    </form>
                    <br>

                    <?php
                    //trovo il livello del mio mago e bardo e l'id corrispondente
                    $idmago=$dbh->getClassLevelByIdAndName($idpersonaggio, "Mago");
                    $idbardo=$dbh->getClassLevelByIdAndName($idpersonaggio, "Bardo");

                    if (!is_null($idbardo)){
                        echo "<form method=\"POST\">";
                        echo "<legend>Impara un nuovo incantesimo (Bardo)</legend>";
                        $incantesimi_imparabiliB=$dbh->getSpellsByLevelB($idbardo["Livello_Classe"]);
                        //var_dump($incantesimi_imparabiliB);
                        $incantesimi_imparatiB=$dbh->getCountOfSpellsByLevelID_B($idpersonaggio);
                        echo "<select name=\"newspell\">";
                        foreach ($incantesimi_imparabiliB as $slot){
                            if (array_key_exists($slot["Livello_Slot"], $incantesimi_imparatiB)&&$incantesimi_imparatiB[$slot["Livello_Slot"]]>=$slot["Quantita"]){
                                continue;
                            }
                            $notlearntspells_B=$dbh->getSpellsExceptLearnt_B($idpersonaggio, $slot["Livello_Slot"]);
                            //echo $slot["Livello_Slot"]."<br>";
                            //var_dump($notlearntspells_B);
                            //echo "<br><br>";
                            foreach ($notlearntspells_B as $spell){
                                echo "<option value=\"".urlencode($spell["Nome"])."\">".htmlentities($spell["Nome"])." (".$slot["Livello_Slot"].")</option>";
                            }
                        }
                        echo "</select>";
                        echo "<input value=\"Invia\" type=\"submit\"/>";
                        echo "</form>";
                    }

                    if (!is_null($idmago)){
                        echo "<form method=\"POST\">";
                        echo "<legend>Impara un nuovo incantesimo (Mago)</legend>";
                        $incantesimi_imparabiliM=$dbh->getSpellsByLevelM($idmago["Livello_Classe"]);
                        //var_dump($incantesimi_imparabiliB);
                        $incantesimi_imparatiM=$dbh->getCountOfSpellsByLevelID_M($idpersonaggio);
                        echo "<select name=\"newspell\">";
                        foreach ($incantesimi_imparabiliM as $slot){
                            if (array_key_exists($slot["Livello_Slot"], $incantesimi_imparatiM)&&$incantesimi_imparatiM[$slot["Livello_Slot"]]>=$slot["Quantita"]){
                                continue;
                            }
                            $notlearntspells_M=$dbh->getSpellsExceptLearnt_M($idpersonaggio, $slot["Livello_Slot"]);
                            //echo $slot["Livello_Slot"]."<br>";
                            //var_dump($notlearntspells_B);
                            //echo "<br><br>";
                            foreach ($notlearntspells_M as $spell){
                                echo "<option value=\"".urlencode($spell["Nome"])."\">".htmlentities($spell["Nome"])." (".$slot["Livello_Slot"].")</option>";
                            }
                        }
                        echo "</select>";
                        echo "<input value=\"Invia\" type=\"submit\"/>";
                        echo "</form>";
                    }

                    ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>