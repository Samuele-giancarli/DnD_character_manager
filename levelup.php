<?php
    require_once("bootstrap.php");
    $idpersonaggio=$_GET["idpersonaggio"];
    //var_dump($idpersonaggio);
    $livellopersonaggio=$_GET["livellopersonaggio"];
    //var_dump($livellopersonaggio);
    $tutteclassi=$dbh->getClasses();
    $classiottenute=$dbh->getClassesInfo($idpersonaggio);

    if (isset($_GET["classlevel"])){
        $scelta=$_GET["classlevel"];
        $livellopersonaggio+=1;
        $arrayscelta=explode(" ", $scelta);
        $dbh->insertClassChoice($idpersonaggio, $arrayscelta[0], $arrayscelta[1]);
        if ($arrayscelta[1]>=2){
        $dbh->removeOldChoice($idpersonaggio, $arrayscelta[0]);
        }
        header("Location: characterSheet.php?ID=".$idpersonaggio);
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
                    <legend>Scegli dove progredire</legend>
                    <form method="GET" action="levelup.php">
                    <?php
                    //var_dump($tutteclassi);
                    //var_dump($classiottenute);
                    ?>
                    <select id="classlevel" name="classlevel">
                        <?php

                        function Flatten1($x){
                            return $x["Nome"];
                        }

                        function Flatten2($y){
                            return $y["Nome_Classe"];
                        }

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
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>