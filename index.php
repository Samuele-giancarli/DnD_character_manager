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

<?php
if (isset($_SESSION["ID"])){
?>
<div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">I tuoi personaggi</div>
                    <div class="card-body">
                      <?php
                      $characters=$dbh->characterList($_SESSION["ID"]);
                      foreach($characters as $character){
                        ?>
                          <a href="characterSheet.php?ID=<?php echo $character["ID_Personaggio"]; ?>"><?php echo $character["Nome"]; ?></a>
                          <br>
                        <?php
                      }
                      ?>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">Statistiche generali</div>
                    <div class="card-body">
                      <?php
                      // Supponendo che tu abbia una classe o un'istanza con il metodo getClassesPercentage definito
                      $results = $dbh->getClassesPercentage();

                      // Stampiamo i valori
                      foreach($results as $class) {
                          echo "<p>". $class['Nome_Classe']. ": ";
                          //echo $class['Conteggio'] . "\n";
                          echo number_format($class['Percentuale'], 2). "% </p>"; // Formattiamo la percentuale con 2 decimali
                      }

                      
                      ?>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <?php
// Supponiamo che $dbh sia il tuo oggetto contenente il metodo getCharactersRanking
// e che tu abbia già incluso il codice della funzione getCharactersRanking()

$charactersByLeague = $dbh->getCharactersRanking();
?>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Leghe</div>
                <div class="card-body">
                    <?php foreach ($charactersByLeague as $league => $characters): ?>
                        <h3>Lega: <?php echo htmlspecialchars($league); ?></h3>
                        <table>
                            <tr>
                                <th>Personaggio</th>
                                <th>Livello</th>
                            </tr>
                            <?php foreach ($characters as $character): ?>
                                <tr>
                                    <td><?php $info = $dbh->getCharacterInfo($character['ID_Personaggio']);
                                      echo $info['Nome'];
                                    ?></td>
                                    <td><?php echo htmlspecialchars($character['Livello']); ?></td>
                                </tr>
                            <?php endforeach; ?>
                        </table>
                    <?php endforeach; ?>
                </div>
            </div>
        </div>
    </div>
</div>

<?php
}else{
    header("Location: login.php");
}
?>
</body>
</html>