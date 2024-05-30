<?php
    require_once("bootstrap.php");
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
                    <div class="card-header">Guida alle Sottoclassi</div>
                    <div class="card-body">
                    <section>
                    <table>
                    <legend>Sottoclassi</legend>
                      <tr>
                      <th>Classe</th>
                      <th>Livello</th>
                      <th>Sottoclassi</th>
                      <th>Livello</th>
                      </tr>
                    <?php

                    $arrayMagico=array();
                    $sottoclassi=$dbh->getSubclasses();

                    foreach ($sottoclassi as $sottoclasse){
                        $key=[$sottoclasse["Nome_Classe"], $sottoclasse["Livello_Classe"], $sottoclasse["Livello_Sottoclasse"]];
                        $key=implode("$", $key);
                        if (!array_key_exists($key, $arrayMagico)){
                            $arrayMagico[$key]=array();
                        }
                        array_push($arrayMagico[$key], $sottoclasse["Nome_Sottoclasse"]);
                    }

                    foreach ($arrayMagico as $key=>$value){
                        $key=explode("$", $key);
                        echo "<tr><td>".htmlentities($key[0])."</td>
                        <td>".htmlentities($key[1])."</td>
                        <td>".htmlentities(implode(", ", $value))."</td>
                        <td>".htmlentities($key[2])."</td></tr>";
                    }
                    ?>
                     </table>
            </section>
                <section>
            <table>
            <legend>Capacità di Sottoclasse</legend>
            <th>Sottoclasse</th>
            <th>Livello</th>
            <th>Capacità</th>
            <th>Descrizione</th>
            <?php

$arrayMagico=array();
$capacities=$dbh->getCapacitiesOfSubclass();

foreach ($capacities as $capacita){
    echo "<tr><td>".htmlentities($capacita["Sottoclasse"])."</td>
    <td>".htmlentities($capacita["Livello"])."</td>
    <td>".htmlentities($capacita["Capacita"])."</td>
    <td>".htmlentities($capacita["Descrizione"])."</td></tr>";
}
            ?>
            </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>