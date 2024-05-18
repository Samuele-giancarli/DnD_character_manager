<?php
    require_once("bootstrap.php");
    if (!isset($_SESSION["ID"])){
        header("Location: login.php");
        exit();
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DND Aider - Crea Personaggio</title>
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

<script>
function raceSelected(e){
    const razza = e.value;
    let xhr = new XMLHttpRequest();
    xhr.onreadystatechange=function(){
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("subraces").innerHTML = xhr.responseText;
        }
    };
    xhr.open("GET", `conditionalselect.php?step=sottorazza&razza=${razza}`);
    xhr.send();
}
</script>

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
        <a class="nav-link" href="#">Guide</a>
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
                        <form id="creapg" method="GET" action="createform.php">
                            <div class="form-group">
                                <ol>
                                <legend>La sua storia</legend>
                                <li><label for="name">Scegli un nome:</label>
                                <input type="text" class="form-control" name="name" id="name" placeholder="Quale sarà il suo nome?"></li>
                                <br>

                                <li>
                                <label for="race"> Scegli una razza:  </label>
                                 <select class="form-control" id="races" name="race" form="creapg" onchange="raceSelected(this);">
                                 <option disabled selected value></option> 
                                <?php
                                $races=$dbh->getRaces();
                                foreach ($races as $row){
                                    echo "<option value=".$row["Nome"].">".htmlentities($row["Nome"])."</option>";
                                }
                                ?>
                                </select>  </li>
                                <br>

                                <li><label for="subrace"> Scegli una sottorazza:  </label>
                                <select class="form-control" id="subraces" name="subrace" form="creapg">
                                </select>  </li>
                                <br>

                                <li>
                                <label for="background"> Scegli le tue origini:  </label>
                                 <select class="form-control" id="backgrounds" name="background" form="creapg">
                                 <option disabled selected value></option> 
                                <?php
                                $backgrounds=$dbh->getBackgrounds();
                                foreach ($backgrounds as $row){
                                    echo "<option value=".$row["Nome"].">".htmlentities($row["Nome"])."</option>";
                                }
                                ?>
                                </select>  </li>
                                <br>

                                <li>
                                <label for="class"> Scegli una classe:  </label>
                                 <select class="form-control" id="class" name="class" form="creapg">
                                 <option disabled selected value></option> 
                                <?php
                                $classes=$dbh->getClassByLevel(1);
                                foreach ($classes as $row){
                                    echo "<option value=".$row["Nome"].">".htmlentities($row["Nome"])."</option>";
                                }
                                ?>
                                </select>  </li><br>

                                <li>
                                <label for="alignment"> Scegli un allineamento:  </label>
                                 <select class="form-control" id="alignment" name="alignment" form="creapg">
                                 <option disabled selected value></option> 
                                 <?php
                                $alignments=$dbh->getAlignments();
                                foreach ($alignments as $row){
                                    $encodedAlignment = urlencode($row["Nome"]);
                                    echo "<option value=\"$encodedAlignment\">".htmlentities($row["Nome"])."</option>";
                                }
                                ?>
                                </select> </li><br>
                            

                            <li>
                                <label for="descrizione_aspetto">Come appare?</label>
                                <br>
                                <textarea name="descrizione_aspetto" placeholder="Descrivi il suo aspetto"></textarea>
                            </li>
                                </ol>


                                <legend>Punteggi Caratteristica</legend>
                                <p style="color:red">Assegna UNA SOLA VOLTA ciascuno di questi valori: [15, 14, 13, 12, 10, 8]</p>
                                <label for="forza">Forza: </label>
                                <input name="forza" type="number"><br>
                                <label for="destrezza">Destrezza: </label>
                                <input name="destrezza" type="number"><br>
                                <label for="costituzione">Costituzione: </label>
                                <input name="costituzione" type="number"><br>
                                <label for="intelligenza">Intelligenza: </label>
                                <input name="intelligenza" type="number"><br>
                                <label for="saggezza">Saggezza: </label>
                                <input name="saggezza" type="number"><br>
                                <label for="carisma">Carisma: </label>
                                <input name="carisma" type="number"> 
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