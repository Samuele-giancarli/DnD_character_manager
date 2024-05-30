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
                    <div class="card-header">Guida agli Oggetti</div>
                    <div class="card-body">
                    <section>
                    <table>
                    <legend>Armi</legend>
                      <tr>
                      <th>Nome</th>
                      <th>Peso</th>
                      <th>Valore</th>
                      <th>Danno</th>
                      <th>Tipo di Danno</th>
                      <th>Tipologia</th>
                      <th>Proprietà</th>
                      </tr>
                    <?php
                    $tuttearmi=$dbh->getWeapons();
                    $arrayMagico=array();
                    foreach ($tuttearmi as $arma){
                    $key=[$arma["Nome"], $arma["Peso"], $arma["Valore"], $arma["Danno"],$arma["Tipo_Danno"], $arma["Tipologia"]];
                    $key=implode("$", $key);
                    if (!array_key_exists($key, $arrayMagico)){
                      $arrayMagico[$key]=array();
                      }
                      if (!is_null($arma["Nome_Proprieta"])){
                      array_push($arrayMagico[$key], $arma["Nome_Proprieta"]);
                      }
                    }

                    foreach ($arrayMagico as $key=>$value){
                      $key=explode("$", $key);
                      echo "<tr><td>".htmlentities($key[0])."</td>
                      <td>".htmlentities($key[1])."</td>
                      <td>".htmlentities($key[2])."</td>
                      <td>".htmlentities($key[3])."</td>
                      <td>".htmlentities($key[4])."</td>
                      <td>".htmlentities($key[5])."</td>
                      <td>".htmlentities(implode(", ",$value))."</td></tr>";
                  }
                    ?>
                     </table>
                     </section>

                    <section>
                    <table>
                    <legend>Armature</legend>
                      <tr>
                      <th>Nome</th>
                      <th>Peso</th>
                      <th>Valore</th>
                      <th>Classe Armatura</th>
                      <th>Forza Necessaria</th>
                      <th>Svantaggio Furtività</th>
                      <th>Tipologia</th>
                      </tr>
                    <?php
                    $tuttearmature=$dbh->getArmors();

                    foreach ($tuttearmature as $key){
                      echo "<tr><td>".htmlentities($key["Nome"])."</td>
                      <td>".htmlentities($key["Peso"])."</td>
                      <td>".htmlentities($key["Valore"])."</td>
                      <td>".htmlentities($key["Classe_Armatura"])."</td>
                      <td>".htmlentities($key["Forza_Necessaria"])."</td>
                      <td>".htmlentities($key["Svantaggio_Furtivita"])."</td>
                      <td>".htmlentities($key["Tipologia"])."</td></tr>";
                  }
                    ?>
                     </table>
                     </section>


                    <section>
                    <table>
                    <legend>Gemme</legend>
                      <tr>
                      <th>Nome</th>
                      <th>Valore</th>
                      </tr>
                    <?php
                    $tuttegemme=$dbh->getGems();
                    foreach ($tuttegemme as $key){
                      echo "<tr><td>".htmlentities($key["Nome"])."</td>
                      <td>".htmlentities($key["Valore"])."</td></tr>";
                    }
                    ?>
                     </table>
                     </section>

                     <section>
                    <table>
                    <legend>Munizioni</legend>
                      <tr>
                      <th>Nome</th>
                      <th>Peso</th>
                      <th>Valore</th>
                      </tr>
                    <?php
                    $tutteammo=$dbh->getAmmo();
                    foreach ($tutteammo as $key){
                      echo "<tr><td>".htmlentities($key["Nome"])."</td>
                      <td>".htmlentities($key["Peso"])."</td>
                      <td>".htmlentities($key["Valore"])."</td></tr>";
                    }
                    ?>
                     </table>
                     </section>


                     <section>
                    <table>
                    <legend>Strumenti e Pacchetti</legend>
                      <tr>
                      <th>Nome</th>
                      <th>Peso</th>
                      <th>Valore</th>
                      <th>Contenuto</th>
                      </tr>
                    <?php
                    $tuttitools=$dbh->getTools();
                    foreach ($tuttitools as $key){
                      echo "<tr><td>".htmlentities($key["Nome"])."</td>
                      <td>".htmlentities($key["Peso"])."</td>
                      <td>".htmlentities($key["Valore"])."</td>
                      <td>".htmlentities($key["Contenuto"])."</td></tr>";
                    }
                    ?>
                     </table>
                     </section>

                    <section>
                    <table>
                    <legend>Cianfrusaglie</legend>
                      <tr>
                      <th>Nome</th>
                      </tr>
                    <?php
                    $cianfrusaglie=$dbh->getTrinkets();
                    foreach ($cianfrusaglie as $key){
                      echo "<tr><td>".htmlentities($key["Nome"])."</td></tr>";
                    }
                    ?>
                     </table>
                     </section>

                     <section>
                    <table>
                    <legend>Pozioni e Veleni</legend>
                      <tr>
                      <th>Nome</th>
                      <th>Peso</th>
                      <th>Valore</th>
                      <th>Tipologia</th>
                      <th>Descrizione</th>
                      </tr>
                    <?php
                    $pozioni=$dbh->getPotions();
                    foreach ($pozioni as $key){
                      echo "<tr><td>".htmlentities($key["Nome"])."</td>
                      <td>".htmlentities($key["Peso"])."</td>
                      <td>".htmlentities($key["Valore"])."</td>
                      <td>".htmlentities($key["Tipologia"])."</td>
                      <td>".htmlentities($key["Descrizione"])."</td></tr>";
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