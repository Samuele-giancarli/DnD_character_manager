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
                    <div class="card-header">Guida alle Classi</div>
                    <div class="card-body">
                      <?php
                      $barbaro=$dbh->getAllClassInfo("Barbaro");
                      $capacitabarbaro=$dbh->getCapacitiesByClass("Barbaro");
                      $nuovobarbaro=array();
                      foreach($barbaro as $riga){
                        $nuovariga=array_filter($riga);
                        array_push($nuovobarbaro,$nuovariga);
                      };

                      $bardo=$dbh->getAllClassInfo("Bardo"); 
                      $capacitabardo=$dbh->getCapacitiesByClass("Bardo");
                      $nuovobardo=array();
                      foreach($bardo as $riga){
                        $nuovariga=array_filter($riga);
                        array_push($nuovobardo,$nuovariga);
                      };

                      $ladro=$dbh->getAllClassInfo("Ladro");
                      $capacitaladro=$dbh->getCapacitiesByClass("Ladro");
                      $nuovoladro=array();
                      foreach($ladro as $riga){
                        $nuovariga=array_filter($riga);
                        array_push($nuovoladro,$nuovariga);
                      };

                      $mago=$dbh->getAllClassInfo("Mago");
                      $capacitamago=$dbh->getCapacitiesByClass("Mago");
                      $nuovomago=array();
                      foreach($mago as $riga){
                        $nuovariga=array_filter($riga);
                        array_push($nuovomago,$nuovariga);
                      };

                      ?>
                      <section>
                      <table>
                      <legend>Barbaro</legend>
                      <tr>
                      <th>Livello</th>
                      <th>Bonus Competenza</th>
                      <th>Dado Vita </th>
                      <th>Bonus Rabbia </th>
                      <th>Utilizzi Rabbia Giornalieri </th>
                      </tr>
                      <?php
                    foreach ($nuovobarbaro as $row){
                    echo "<tr><td>".htmlentities($row["Livello"])."</td>
                    <td>".htmlentities($row["Bonus_Competenza"])."</td>
                    <td>".htmlentities($row["Dado_Vita"])."</td>
                    <td>".htmlentities($row["Bonus_Rabbia"])."</td>
                    <td>".htmlentities($row["Utilizzi_Rabbia_Giornalieri"])."</td></tr>";
                      };
                      ?>
                      </table>
                      <table>
                        <legend>Capacità del Barbaro</legend>
                        <th>Livello</th>
                      <th>Capacità</th>
                      <?php
                      foreach ($capacitabarbaro as $row){
                    echo "<tr><td>".htmlentities($row["Livello"])."</td>
                    <td>".htmlentities($row["Nome_Capacita"])."</td></tr>";
                      };
                      ?>
                    </table>
                    </section>
                    <br>

                    <section>
                      <table>
                      <legend>Bardo</legend>
                      <tr>
                      <th>Livello</th>
                      <th>Bonus Competenza</th>
                      <th>Dado Vita </th>
                      <th>Dado Ispirazione Bardica </th>
                    
                      </tr>
                      <?php
                    foreach ($nuovobardo as $row){
                    echo "<tr><td>".htmlentities($row["Livello"])."</td>
                    <td>".htmlentities($row["Bonus_Competenza"])."</td>
                    <td>".htmlentities($row["Dado_Vita"])."</td>
                    <td>".htmlentities($row["Dado_Ispirazione_Bardica"])."</td>";
                      };
                      ?>
                      </table>
                      <table>
                        <legend>Capacità del Bardo</legend>
                        <th>Livello</th>
                      <th>Capacità</th>
                      <?php
                      foreach ($capacitabardo as $row){
                    echo "<tr><td>".htmlentities($row["Livello"])."</td>
                    <td>".htmlentities($row["Nome_Capacita"])."</td></tr>";
                      };
                      ?>
                    </table>
                    </section>

                    <section>
                      <table>
                      <legend>Ladro</legend>
                      <tr>
                      <th>Livello</th>
                      <th>Bonus Competenza</th>
                      <th>Dado Vita </th>
                      <th>Bonus Attacco Furtivo </th>
                      </tr>
                      <?php
                    foreach ($nuovoladro as $row){
                    echo "<tr><td>".htmlentities($row["Livello"])."</td>
                    <td>".htmlentities($row["Bonus_Competenza"])."</td>
                    <td>".htmlentities($row["Dado_Vita"])."</td>
                    <td>".htmlentities($row["Bonus_Attacco_Furtivo"])."</td></tr>";
                      };
                      ?>
                      </table>
                      <table>
                        <legend>Capacità del Ladro</legend>
                        <th>Livello</th>
                      <th>Capacità</th>
                      <?php
                      foreach ($capacitaladro as $row){
                    echo "<tr><td>".htmlentities($row["Livello"])."</td>
                    <td>".htmlentities($row["Nome_Capacita"])."</td></tr>";
                      };
                      ?>
                    </table>
                    </section>
                    <br>

                    <section>
                      <table>
                      <legend>Mago</legend>
                      <tr>
                      <th>Livello</th>
                      <th>Bonus Competenza</th>
                      <th>Dado Vita </th>
                      </tr>
                      <?php
                    foreach ($nuovomago as $row){
                    echo "<tr><td>".htmlentities($row["Livello"])."</td>
                    <td>".htmlentities($row["Bonus_Competenza"])."</td>
                    <td>".htmlentities($row["Dado_Vita"])."</td></tr>";
                      };
                      ?>
                      </table>
                      <table>
                        <legend>Capacità del Mago</legend>
                        <th>Livello</th>
                      <th>Capacità</th>
                      <?php
                      foreach ($capacitamago as $row){
                    echo "<tr><td>".htmlentities($row["Livello"])."</td>
                    <td>".htmlentities($row["Nome_Capacita"])."</td></tr>";
                      };
                      ?>
                    </table>
                    </section>
                    
                    <br>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>