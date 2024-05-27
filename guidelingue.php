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
                    <div class="card-header">Guida alle Lingue</div>
                    <div class="card-body">
                    <section>
                    <table>
                      <tr>
                      <th>Nome</th>
                      <th>Descrizione</th>
                      <th>Parlata Da (Razze) </th>
                      <th>Parlata Da (Origini)</th>
                      </tr>
                    <?php
                    $tuttelingue=$dbh->getLanguages();
                   // var_dump($tuttelingue);
                    foreach ($tuttelingue as $lingua){
                    $razze=$dbh->spokenByRace($lingua["Nome"]);
                    $parlataDaRazze=array();
                    foreach($razze as $razza){
                        array_push($parlataDaRazze, $razza);
                    }
                    $finalRazze=implode(", ", $parlataDaRazze);

                    $origini=$dbh->spokenByBackground($lingua["Nome"]);
                    $parlataDaOrigini=array();
                    foreach($origini as $origine){
                        array_push($parlataDaOrigini, $origine);
                    }
                    $finalOrigini=implode(", ", $parlataDaOrigini);

                    echo "<tr><td>".htmlentities($lingua["Nome"])."</td>
                    <td>".htmlentities($lingua["Descrizione"])."</td>
                    <td>".htmlentities($finalRazze)."</td>
                    <td>".htmlentities($finalOrigini)."</td></tr>";
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