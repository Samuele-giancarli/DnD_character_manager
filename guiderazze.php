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
                    <div class="card-header">Guida alle Razze e Sottorazze</div>
                    <div class="card-body">
                    <section>
                    <table>
                    <legend>Razze</legend>
                      <tr>
                      <th>Nome</th>
                      <th>Descrizione</th>
                      <th>Età</th>
                      <th>Taglia</th>
                      <th>Velocità</th>
                      <th>Sottorazze</th>
                      <th>Caratteristica Aumentata</th>
                      </tr>
                    <?php
                    $tutterazze=$dbh->getRaces();
                   // var_dump($tuttelingue);
                    foreach ($tutterazze as $razza){
                    $sottorazze=$dbh->subracesByRace($razza["Nome"]);
                    $arraySottorazze=array();
                    foreach($sottorazze as $sottorazza){
                        array_push($arraySottorazze, $sottorazza);
                    }
                    $finalSottorazze=implode(", ", $arraySottorazze);

                    echo "<tr><td>".htmlentities($razza["Nome"])."</td>
                    <td>".htmlentities($razza["Descrizione"])."</td>
                    <td>".htmlentities($razza["Eta"])."</td>
                    <td>".htmlentities($razza["Taglia"])."</td>
                    <td>".htmlentities($razza["Velocita"])."</td>
                    <td>".htmlentities($finalSottorazze)."</td>
                    <td>".htmlentities($razza["Aum_Nome_Caratteristica"]." ".$razza["Aum_Valore_Aggiuntivo"])."</td></tr>";
                }
                    ?>
                     </table>
            </section>

            <section>
                    <table>
                    <legend>Sottorazze</legend>
                      <tr>
                      <th>Nome</th>
                      <th>Descrizione</th>
                      <th>Famiglia</th>
                      <th>Caratteristica Aumentata</th>
                      </tr>
                    <?php
                    $sottorazze=$dbh->getSubraces();
                   // var_dump($tuttelingue);
                    foreach ($sottorazze as $sottorazza){
                    echo "<tr><td>".htmlentities($sottorazza["Nome"])."</td>
                    <td>".htmlentities($sottorazza["Descrizione"])."</td>
                    <td>".htmlentities($sottorazza["Nome_Razza"])."</td>
                    <td>".htmlentities($sottorazza["Aum_Nome_Caratteristica"]." ".$sottorazza["Aum_Valore_Aggiuntivo"])."</td></tr>";
                }
                    ?>
                     </table>
            </section>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>