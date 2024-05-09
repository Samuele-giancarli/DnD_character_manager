<?php
    require_once("bootstrap.php");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create a Character</title>
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
                                <label for="name">Name</label>
                                <input type="text" class="form-control" id="name" placeholder="Enter character name">
                            </div>
                            <div class="form-group">
                                <label for="race">Race</label>
                                <input type="text" class="form-control" id="race" placeholder="Enter character race">
                            </div>
                            <div class="form-group">
                                <label for="class">Class</label>
                                <input type="text" class="form-control" id="class" placeholder="Enter character class">
                            </div>
                            <div class="form-group">
                                <label for="level">Level</label>
                                <input type="number" class="form-control" id="level" placeholder="Enter character level">
                            </div>
                            <div class="form-group">
                                <label for="background">Background</label>
                                <input type="text" class="form-control" id="background" placeholder="Enter character background">
                            </div>
                            <div class="form-group">
                                <label for="alignment">Alignment</label>
                                <input type="text" class="form-control" id="alignment" placeholder="Enter character alignment">
                            </div>
                            <div class="form-group">
                                <label for="xp">Experience Points</label>
                                <input type="number" class="form-control" id="xp" placeholder="Enter character experience points">
                            </div>
                            <div class="form-group">
                                <label for="ac">Armor Class</label>
                                <input type="number" class="form-control" id="ac" placeholder="Enter character armor class">
                            </div>
                            <div class="form-group">
                                <label for="initiative">Initiative</label>
                                <input type="number" class="form-control" id="initiative" placeholder="Enter character initiative">
                            </div>
<div class="form-group">
                                <label for="speed">Speed</label>
                                <input type="number" class="form-control" id="speed" placeholder="Enter character speed">
                            </div>
                            <div class="form-group">
                                <label for="hitpoints">Hit Points</label>
                                <input type="number" class="form-control" id="hitpoints" placeholder="Enter character hit points">
                            </div>
                            <div class="form-group">
                                <label for="htemporary">Temporary Hit Points</label>
                                <input type="number" class="form-control" id="htemporary" placeholder="Enter character temporary hit points">
                            </div>
                            <div class="form-group">
                                <label for="dsaves">Death Saves</label>
                                <input type="number" class="form-control" id="dsaves" placeholder="Enter character death saves">
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