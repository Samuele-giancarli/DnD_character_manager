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

        header("Location: characterSheet.php?ID=".$idpersonaggio);
    }

    if (isset($_GET["subclasschoice"])){
        $scelta=$_GET["subclasschoice"];
        $dbh->insertSubclassChoice($idpersonaggio, $scelta, 1);
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
                    <div class="card-header">Sei salito di livello!</div>
                    <div class="card-body">
                    <legend>Scegli la tua sottoclasse</legend>
                    <form action="levelup.php" method="GET">

                    <?php

                    $sottoclassiGiaScelte=$dbh->chosenSubclassesFromClasses($idpersonaggio);
                    $flattenedScelte=array_map("Flatten2", $sottoclassiGiaScelte);
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
                        }
                        echo "</select><br>";
                    }
                }
                    ?>
                    <input type="submit"/>
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

                        if ($sumlivello+1<=20||$livellopersonaggio!=20){
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
                
                    <input type="submit" name="levelpg"/>
                    <input id="idpersonaggio" name="idpersonaggio" type="hidden" value="<?php echo $idpersonaggio?>"/>
                    <input id="livellopersonaggio" name="livellopersonaggio" type="hidden" value="<?php echo $livellopersonaggio?>"/>
                    </form>
                    <br>

                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>