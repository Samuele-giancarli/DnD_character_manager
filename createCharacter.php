<?php
    session_start();
    require_once("bootstrap.php");

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $character_name = $_POST["character_name"];
        $character_strength = $_POST["character_strength"];
        $character_dexterity = $_POST["character_dexterity"];
        $character_constitution = $_POST["character_constitution"];
        $character_intelligence = $_POST["character_intelligence"];
        $character_wisdom = $_POST["character_wisdom"];
        $character_charisma = $_POST["character_charisma"];
        $character_hitpoints = $_POST["character_hitpoints"];
        $character_description = $_POST["character_description"];
        $character_armorclass = $_POST["character_armorclass"];
        $character_initiative = $_POST["character_initiative"];
        $character_experience = $_POST["character_experience"];
        $character_origin = $_POST["character_origin"];
        $character_equipped_armor = $_POST["character_equipped_armor"];
        $character_equipped_weapon = $_POST["character_equipped_weapon"];
        $character_alignment = $_POST["character_alignment"];
        $charater_race = $_POST["character_race"];
        $character_bag_id = $_POST["character_bag_id"];
        $character_user_id = $_SESSION["ID_Utente"];
        $dbh->addCharacter($character_strength, $character_dexterity, $character_constitution, $character_intelligence, $character_wisdom, $character_charisma, $character_hitpoints, $character_name, $character_description, $character_armorclass, $character_initiative,
        $character_experience, $character_origin, $character_equipped_armor, $character_equipped_weapon, $character_alignment, $charater_race, $character_bag_id, $character_user_id);
    } else {
        echo "Errore";
        var_dump($_SERVER["REQUEST_METHOD"]);
    }
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crea Personaggio - Dungeons and Dragons</title>
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
        .form-control {
            background-color: #f5deb3;
            border: 1px solid #8b4513;
        }
        .btn-primary {
            background-color: #8b4513;
            border: 1px solid #8b4513;
        }
    </style>
</head>
<body>

<header><nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Aiuto DND</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.php">Home <span class="sr-only">(corrente)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="login.php">Accesso</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Crea</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Guide</a>
      </li>
    </ul>
  </div>
</nav></header>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Crea Personaggio Dungeons and Dragons</div>
                <div class="card-body">
                    <form method="post">
                        <div class="form-group">
                            <label for="character_name">Nome</label>
                            <input type="text" class="form-control" id="character_name" name="character_name" placeholder="Inserisci il nome del personaggio">
                        </div>
                        <div class="form-group">
                            <label for="character_strength">Forza</label>
                            <input type="number" class="form-control" id="character_strength" name="character_strength" placeholder="Inserisci la forza del personaggio">
                        </div>
                        <div class="form-group">
                            <label for="character_dexterity">Destrezza</label>
                            <input type="number" class="form-control" id="character_dexterity" name="character_dexterity" placeholder="Inserisci la destrezza del personaggio">
                        </div>
                        <div class="form-group">
                            <label for="character_constitution">Costituzione</label>
                            <input type="number" class="form-control" id="character_constitution" name="character_constitution" placeholder="Inserisci la costituzione del personaggio">
                        </div>
                        <div class="form-group">
                            <label for="character_intelligence">Intelligenza</label>
                            <input type="number" class="form-control" id="character_intelligence" name="character_intelligence" placeholder="Inserisci l'intelligenza del personaggio">
                        </div>
                        <div class="form-group">
                            <label for="character_wisdom">Saggezza</label>
                            <input type="number" class="form-control" id="character_wisdom" name="character_wisdom" placeholder="Inserisci la saggezza del personaggio">
                        </div>
                        <div class="form-group">
                            <label for="character_charisma">Carisma</label>
                            <input type="number" class="form-control" id="character_charisma" name="character_charisma" placeholder="Inserisci il carisma del personaggio">
                        </div>
                        <div class="form-group">
                            <label for="character_hitpoints">Punti Ferita</label>
                            <input type="number" class="form-control" id="character_hitpoints" name="character_hitpoints" placeholder="Inserisci i punti ferita del personaggio">
                        </div>
                        <div class="form-group">
                            <label for="character_description">Descrizione</label>
                            <textarea class="form-control" id="character_description" name="character_description" rows="3" placeholder="Inserisci la descrizione del personaggio"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="character_armorclass">Classe Armatura</label>
                            <input type="number" class="form-control" id="character_armorclass" name="character_armorclass" placeholder="Inserisci la classe armatura del personaggio">
                        </div>
                        <div class="form-group">
                            <label for="character_initiative">Iniziativa</label>
                            <input type="number" class="form-control" id="character_initiative" name="character_initiative" placeholder="Inserisci l'iniziativa del personaggio">
                        </div>
                        <div class="form-group">
                            <label for="character_experience">Punti Esperienza</label>
                            <input type="number" class="form-control" id="character_experience" name="character_experience" placeholder="Inserisci i punti esperienza del personaggio">
                        </div>
                        <div class="form-group">
                            <label for="character_origin">Nome Origine</label>
                            <input type="text" class="form-control" id="character_origin" name="character_origin" placeholder="Inserisci il nome dell'origine del personaggio">
                        </div>
                        <div class="form-group">
                            <label for="character_equipped_armor">Armatura Equipaggiata</label>
                            <input type="text" class="form-control" id="character_equipped_armor" name="character_equipped_armor" placeholder="Inserisci l'armatura equipaggiata">
                        </div>
                        <div class="form-group">
                            <label for="character_equipped_weapon">Arma Equipaggiata</label>
                            <input type="text" class="form-control" id="character_equipped_weapon" name="character_equipped_weapon" placeholder="Inserisci l'arma equipaggiata">
                        </div>
                        <div class="form-group">
                            <label for="character_alignment">Allineamento</label>
                            <input type="text" class="form-control" id="character_alignment" name="character_alignment" placeholder="Inserisci l'allineamento del personaggio">
                        </div>
                        <div class="form-group">
                            <label for="character_race">Razza</label>
                            <input type="text" class="form-control" id="character_race" name="character_race" placeholder="Inserisci la razza del personaggio">
                        </div>
                        <div class="form-group">
                            <label for="character_bag_id">ID Borsa</label>
                            <input type="number" class="form-control" id="character_bag_id" name="character_bag_id" placeholder="Inserisci l'ID della borsa del personaggio">
                        </div>
                        <button type="submit" class="btn btn-primary">Invia</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- Aggiungi qui il tuo script jQuery per calcolare i modificatori delle abilità -->
<script>
    $('#character_strength, #character_dexterity, #character_constitution, #character_intelligence, #character_wisdom, #character_charisma').on('input', function() {
        var ability = $(this).attr('id').replace('character_', '');
        var score = parseInt($(this).val());
        var modifier = score > 0 ? Math.floor((score - 10) / 2) : 0;
        $('#' + ability + '_mod').val(modifier);
    });
</script>
</body>
</html>