<?php
    require_once("bootstrap.php");

    if(isset($_GET['ID'])) {
        $character_id = $_GET['ID'];
        $raceName = $dbh->getRaceName($character_id);
        $originName = $dbh->getOriginName($character_id);
        $dextrexity = $dbh->getDexterity($character_id);
        $strength = $dbh->getStrength($character_id);
        $constitution = $dbh->getConstitution($character_id);
        $intelligence = $dbh->getIntelligence($character_id);
        $wisdom = $dbh->getWisdom($character_id);
        $charisma = $dbh->getCharisma($character_id);
        $hitpoints = $dbh->getHitpoints($character_id);
        $name = $dbh->getName($character_id);
        $description = $dbh->getDescription($character_id);
        $armorclass = $dbh->getArmorClass($character_id);
        $initiative = $dbh->getInitiative($character_id);
        $experiencepoints = $dbh->getExperiencePoints($character_id);
        $equippedArmor = $dbh->getEquippedArmor($character_id);
        $equippedWeapon = $dbh->getEquippedWeapon($character_id);
        $alignmentName = $dbh->getAlignmentName($character_id);
        $bagID = $dbh->getBagID($character_id);
        //$level = $dbh->getLevel($character_id); 
        //$class = $dbh->getClass($character_id);    
    } else {
       var_dump("trovato nulla");
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dungeons and Dragons Character Sheet</title>
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
  <a class="navbar-brand" href="#">DND Aider</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
<!-- nella home vedo la lista dei miei personaggi e il pulsante "crea"-->
        <a class="nav-link" href="index.php">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="login.php">Login</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Create</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Guides</a>
      </li>
    </ul>
  </div>
</nav></header>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">Dungeons and Dragons Character Sheet</div>
                    <div class="card-body">
                        <form>
                            <div class="form-group">
                                <label for="name">Name: <?php echo htmlspecialchars($name); ?></label>
                            </div>
                            <div class="form-group">
                                <label for="race">Race: <?php echo htmlspecialchars($raceName)?> </label>
                            </div>
                            <div class="form-group">
                                <label for="class">Class: <?php echo htmlspecialchars($className)?> </label>
                            </div>
                            <div class="form-group">
                                <label for="level">Level: <?php echo htmlspecialchars($level)?> </label>
                            </div>
                            <div class="form-group">
                                <label for="background">Background: <?php echo htmlspecialchars($originName)?> </label>
                            </div>
                            <div class="form-group">
                                <label for="alignment">Alignment: <?php echo htmlspecialchars($alignmentName)?> </label>
                            </div>
                            <div class="form-group">
                                <label for="xp">Experience Points: <?php echo htmlspecialchars($experiencepoints)?> </label>
                            </div>
                            <div class="form-group">
                                <label for="ac">Armor Class: <?php echo htmlspecialchars($armorclass)?> </label>
                            </div>
                            <div class="form-group">
                                <label for="initiative">Initiative: <?php echo htmlspecialchars($initiative)?> </label>
                            </div>
                            <div class="form-group">
                                <label for="hitpoints">Hit Points: <?php echo htmlspecialchars($hitpoints)?></label>
                            </div>
                            <div class="form-group">
                                <label for="personality">Personality Traits</label>
                                <textarea class="form-control" id="personality" rows="3"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="ideals">Ideals</label>
                                <textarea class="form-control" id="ideals" rows="3"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="attacks">Attacks</label>
                                <textarea class="form-control" id="attacks" rows="3"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="spellcasting">Spellcasting</label>
                                <textarea class="form-control" id="spellcasting" rows="3"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="inventory">Inventory</label>
                                <textarea class="form-control" id="inventory" rows="3"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="features">Features</label>
                                <textarea class="form-control" id="features" rows="3"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="skills">Skills</label>
                                <textarea class="form-control" id="skills" rows="3"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="abilities">Abilities</label>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Ability</th>
                                            <th>Score</th>
                                            <th>Modifier</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Strength</td>
                                            <td><input type="number" class="form-control" id="strscore"></td>
                                            <td><input type="number" class="form-control" id="strmod" readonly></td>
                                        </tr>
                                        <tr>
                                            <td>Dexterity</td>
                                            <td><input type="number" class="form-control" id="dexscore"></td>
                                            <td><input type="number" class="form-control" id="dexmod" readonly></td>
                                        </tr>
                                        <tr>
                                            <td>Constitution</td>
                                            <td><input type="number" class="form-control" id="conscore"></td>
                                            <td><input type="number" class="form-control" id="conmod" readonly></td>
                                        </tr>
                                        <tr>
                                            <td>Intelligence</td>
                                            <td><inputtype="number" class="form-control" id="intscore"></td>
                                            <td><input type="number" class="form-control" id="intmod" readonly></td>
                                        </tr>
                                        <tr>
                                            <td>Wisdom</td>
                                            <td><input type="number" class="form-control" id="wisscore"></td>
                                            <td><input type="number" class="form-control" id="wismod" readonly></td>
                                        </tr>
                                        <tr>
                                            <td>Charisma</td>
                                            <td><input type="number" class="form-control" id="charscore"></td>
                                            <td><input type="number" class="form-control" id="charmod" readonly></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script>
        $('#strscore, #dexscore, #conscore, #intscore, #wisscore, #charscore').on('input', function() {
            var ability = $(this).attr('id').replace('score', '');
            var score = parseInt($(this).val());
            var modifier = score > 0 ? Math.floor((score - 10) / 2) : 0;
            $('#' + ability + 'mod').val(modifier);
        });
    </script>
</body>
</html>