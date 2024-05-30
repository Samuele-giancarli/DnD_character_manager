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
                    <div class="card-header">Guida agli Incantesimi</div>
                    <div class="card-body">
                    <section>
                    <table>
                    <legend>Specifiche Incantesimi</legend>
                      <tr>
                      <th>Nome</th>
                      <th>Livello</th>
                      <th>Tempo di Lancio</th>
                      <th>Durata</th>
                      <th>Distanza</th>
                      <th>Rituale</th>
                      <th>Componenti</th>
                      <th>LVL Mago</th>
                      <th>LVL Bardo</th>
                      </tr>
                    <?php
                    $tuttincantesimi=$dbh->getSpells();
                    foreach($tuttincantesimi as $row){
                        if ($row["Rituale"]==0){
                            $row["Rituale"]="No";
                        }else{
                            $row["Rituale"]="Sì";
                        }

                    echo "<tr><td>".htmlentities($row["Nome"])."</td>
                    <td>".htmlentities($row["Livello"])."</td>
                    <td>".htmlentities($row["Tempo_di_Lancio"])."</td>
                    <td>".htmlentities($row["Durata"])."</td>
                    <td>".htmlentities($row["Distanza"])."</td>
                    <td>".htmlentities($row["Rituale"])."</td>
                    <td>".htmlentities($row["Componenti"])."</td>
                    <td>".htmlentities($row["ID_Mago"])."</td>
                    <td>".htmlentities($row["ID_Bardo"])."</td></tr>";
                }
                    ?>
                     </table>
                     </section>

                    <section>
                    <table>
                    <legend>Descrizione Incantesimi</legend>
                    <tr>
                      <th>Nome</th>
                      <th>Descrizione</th>
                      </tr>

                    <?php
                    foreach($tuttincantesimi as $row){
                    echo "<tr><td>".htmlentities($row["Nome"])."</td>
                    <td>".htmlentities($row["Descrizione"])."</td></tr>";
                    }
                    ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>