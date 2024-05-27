
<?php
require_once("bootstrap.php");

  if (!isset($_SESSION["ID"])){
       echo "devi essere loggato per visualizzare questa pagina";
      die();
  } else { $IDutente = $_SESSION["ID"];}
    
    
if (!isset($_GET["ID"])){
      echo "devi aver selezionato un personaggio per visualizzare questa pagina";
      die();
  } else { $IDpersonaggio = $_GET["ID"];}


$IDborsa = $dbh->getBagID($IDpersonaggio);

$items = $dbh->getCharacterItems($IDborsa);
var_dump($items)
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Borsa di <?php echo $dbh->getName($IDpersonaggio) ; ?></title>
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
    </style>
</head>
<body>

<header><nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">DND Aider</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.php">Home <span class="sr-only">(current)</span></a>
      </li>
      <?php
      if (isset($_SESSION["ID"])){
      ?>
       <li class="nav-item">
        <a class="nav-link" href="logout.php">Logout</a>
      </li>
      <?php
      }else{
      ?>
      <li class="nav-item">
        <a class="nav-link" href="login.php">Login</a>
      </li>
      <?php
    }
    ?>
      <li class="nav-item">
        <a class="nav-link" href="create.php">Crea</a>
      </li>
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
                <div class="card-header">Borsa di <?php echo $dbh->getName($IDpersonaggio); ?></div>
                <div class="card-body">
                    <ul>
                      <?php
                      // Visualizza gli oggetti del personaggio
                      foreach($items as $item){
                          echo "<li>" .htmlentities($item["Nome_Oggetto"]). ":" .htmlentities($item["Quantita"]). "</li>";
                      }
                      ?>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
