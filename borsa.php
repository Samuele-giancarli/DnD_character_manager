
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
$borsa=$dbh->getBagInfo($IDborsa);
$platino=$borsa[0]["Monete_Platino"];
$oro=$borsa[0]["Monete_Oro"];
$electrum=$borsa[0]["Monete_Electrum"];
$argento=$borsa[0]["Monete_Argento"];
$rame=$borsa[0]["Monete_Rame"];
$pesotrasportato=$dbh->getCurrentWeight($IDborsa);
$nomepersonaggio=$dbh->getName($IDpersonaggio);
$items = $dbh->getCharacterItems($IDborsa);

$allItems = $dbh->getAllItems();
$allWeapons=$dbh->getWeaponsFromInventory($IDborsa);
$allArmors=$dbh->getArmorsFromInventory($IDborsa);

if (isset($_POST["add_item"])) {
  $itemID = $_POST["item"];
  $quantity = $_POST["quantity"];
  $pesoborsa=$dbh->getBagInfo($IDborsa)["Peso_Trasportabile"];
  $pesooggetto=$dbh->getObjectInfo($itemID)["Peso"];
  if ($pesooggetto*$quantity+$pesotrasportato>$pesoborsa){ 
  header("Location: borsa.php?ID=" . $IDpersonaggio); //se non va prova $IDborsa
  exit();
} else{
  $dbh->addItemToBag($IDborsa, $itemID, $quantity);
  header("Location: borsa.php?ID=" . $IDpersonaggio); //se non va prova $IDborsa
  exit();
}
}

if (isset($_POST["add_money"])) {
  $platinum = intval($_POST["platinum"]);
  if ($platinum==null){
    $platinum=0;
  }
  $gold = intval($_POST["gold"]);
  if ($gold==null){
    $gold=0;
  }
  $electrum_e = intval($_POST["electrum"]);
  if ($electrum_e==null){
    $electrum_e=0;
  }
  $silver = intval($_POST["silver"]);
  if ($silver==null){
    $silver=0;
  }
  $copper = intval($_POST["copper"]);
  if ($copper==null){
    $copper=0;
  }

  $dbh->updateMoney($IDborsa, $copper, $silver, $electrum_e, $gold, $platinum);
  header("Location: borsa.php?ID=" . $IDpersonaggio); //se non va prova $IDborsa
  exit();
}

if (isset($_POST["remove_money"])) {
  $platinum = -intval($_POST["platinum"]);
  if (($platinum==null)||($platino==0)){
    $platinum=0;
  }else if ($platinum+$platino<=0){
    $dbh->updateMoney($IDborsa,0,0,0,0,-$platino);
    $platinum=0;
  }
  
  $gold = -intval($_POST["gold"]);
  if (($gold==null)||($oro==0)){
    $gold=0;
  }else if ($gold+$oro<=0){
    $dbh->updateMoney($IDborsa,0,0,0,-$oro,0);
    $gold=0;
  }

  $electrum_e = -intval($_POST["electrum"]);
  if (($electrum_e==null)||($electrum==0)){
    $electrum_e=0;
  }else if ($electrum_e+$electrum<=0){
    $dbh->updateMoney($IDborsa,0,0,-$electrum,0,0);
    $electrum_e=0;
  }

  $silver = -intval($_POST["silver"]);
  if (($silver==null)||($argento==0)){
    $silver=0;
  }else if ($silver+$argento<=0){
    $dbh->updateMoney($IDborsa,0,-$argento,0,0,0);
    $silver=0;
  }
  $copper = -intval($_POST["copper"]);
  if(($copper==null)||($rame==0)){
    $copper=0;
  }else if ($copper+$rame<=0){
    $dbh->updateMoney($IDborsa,-$rame,0,0,0,0);
    $copper=0;
  }

  $dbh->updateMoney($IDborsa, $copper, $silver, $electrum_e, $gold, $platinum);
  header("Location: borsa.php?ID=" . $IDpersonaggio); //se non va prova $IDborsa
  exit();
}





// Gestione rimozione quantità di oggetto
if (isset($_POST["remove_item"])) {
  $itemID = $_POST["item"];
  $quantity = $_POST["quantity"];
  $weaponname=$_GET["weapon"];
  $armorname=$_GET["armor"];
  $dbh->removeItemQuantityFromBag($IDborsa, $itemID, $quantity);
  if ($dbh->isWeaponEquipped($IDpersonaggio,$weaponname)){
    $dbh->removeEquippedWeapon($IDpersonaggio);
  }
  if ($dbh->isArmorEquipped($IDpersonaggio,$armorname)){
    $dbh->removeEquippedArmor($IDpersonaggio);
  }
  header("Location: borsa.php?ID=" . $IDpersonaggio);
  exit();
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Borsa di <?php echo $nomepersonaggio;?></title>
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
                <div class="card-header"><a href="characterSheet.php?ID=<?php echo $IDpersonaggio;?>">Borsa di <?php echo $nomepersonaggio;?></a></div>
                <div class="card-body">
                    <ul>
                      <?php
                  
                        $pesotrasportabile=$borsa[0]["Peso_Trasportabile"]-$pesotrasportato;
                        echo "<li>Peso Trasportabile: ".$pesotrasportabile."/".$borsa[0]["Peso_Trasportabile"]."</li>"; 
                        echo "<br>";
                      // Visualizza gli oggetti del personaggio
                      foreach($items as $item){
                          echo "<li>" .htmlentities($item["Nome_Oggetto"]). ":" .htmlentities($item["Quantita"]). "</li>";
                      }
                      ?>
                    </ul>

                    <!-- Form per aggiungere oggetti -->
                    <form method="POST">
                      <div class="form-group">
                        <label for="item">Aggiungi oggetto:</label>
                        <select id="item" name="item" class="form-control">
                          <?php
                            foreach ($allItems as $obj) {
                              echo '<option value="' . htmlentities($obj["Nome"]) . '">' . htmlentities($obj["Nome"]) . '</option>';
                            }
                          ?>
                        </select>
                      </div>
                      <div class="form-group">
                        <label for="quantity">Quantità:</label>
                        <input type="number" id="quantity" name="quantity" class="form-control" min="1" value="1">
                      </div>
                      <button type="submit" name="add_item" class="btn btn-primary">Aggiungi</button>
                      <button type="submit" name="remove_item" class="btn btn-danger">Rimuovi</button>
                    </form>
                    <br>

                    <form method="POST">
                      <ul>Monete attuali:
                      <?php
                      echo "<li>Platino: ".$platino."</li>";
                      echo "<li>Oro: ".$oro."</li>";
                      echo "<li>Electrum: ".$electrum."</li>";
                      echo "<li>Argento: ".$argento."</li>";
                      echo "<li>Rame: ".$rame."</li>";
                      ?>
                      </ul>
                      <label for="platinum">Monete di platino:</label><br>
                      <input type="number" id="platinum" name="platinum" class="form-control" min="1">
                      <label for="gold">Monete d'oro:</label><br>
                      <input type="number" id="gold" name="gold" class="form-control" min="1">
                      <label for="electrum">Monete di electrum:</label><br>
                      <input type="number" id="electrum" name="electrum" class="form-control" min="1">
                      <label for="silver">Monete d'argento:</label><br>
                      <input type="number" id="silver" name="silver" class="form-control" min="1">
                      <label for="copper">Monete di rame:</label><br>
                      <input type="number" id="copper" name="copper" class="form-control" min="1">
                      <button type="submit" name="add_money" class="btn btn-primary">Aggiungi</button>
                      <button type="submit" name="remove_money" class="btn btn-danger">Rimuovi</button>
                    </form>
                    <br>


                    <form method="GET" action="equipment.php">
                    <input id="idborsa" name="idborsa" type="hidden" value="<?php echo $IDborsa?>"/>
                    <input id="idpersonaggio" name="idpersonaggio" type="hidden" value="<?php echo $IDpersonaggio?>"/>
                    <div class="form-group">
                    <label for="weapon">Equipaggia arma:</label>
                    <select id="weapon" name="weapon" class="form-control">
                          <?php
                            foreach ($allWeapons as $obj) {
                              echo '<option value="' . htmlentities($obj["Nome_Oggetto"]) . '">' . htmlentities($obj["Nome_Oggetto"]) . '</option>';
                            }
                          ?>
                        </select>
                    <br>


                    <label for="armor">Equipaggia armatura:</label>
                    <select id="armor" name="armor" class="form-control">
                          <?php
                            foreach ($allArmors as $obj) {
                              echo '<option value="' . htmlentities($obj["Nome_Oggetto"]) . '">' . htmlentities($obj["Nome_Oggetto"]) . '</option>';
                            }
                          ?>
                        </select>
                          </div>
                      <button type="submit" name="equip_all" class="btn btn-primary">Equipaggia</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
