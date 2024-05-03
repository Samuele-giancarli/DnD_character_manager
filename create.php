<?php
    require_once("bootstrap.php");
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
const race=document.getElementById("race").value;
let subrace=document.getElementById("subrace");

function updateSubrace(){
subrace.innerText=
<?php
$nome_razza=
$stmt = $dbh->db->prepare("SELECT Nome FROM sottorazza WHERE Nome_Razza=?");
$stmt->bind_param("s", $nome_razza);
$stmt->execute();
$result = $stmt->get_result();
while ($row = $result->fetch_assoc()){
echo "<option value=".$row["Nome"].">".htmlentities($row["Nome"])."</option>";
}
?>;
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
      <li class="nav-item">
        <a class="nav-link" href="login.php">Login</a>
      </li>
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
                        <form id="creapg">
                            <div class="form-group">
                                <ol>
                                <li><label for="name">Scegli un nome:</label>
                                <input type="text" class="form-control" id="name" placeholder="Quale sarà il suo nome?"></li>
                                <br>
                                <li>
                                <label for="race"> Scegli una razza:  </label>
                                 <select class="form-control" id="races" name="race" form="creapg" onchange="updateSubrace()">

                                <?php
                                $stmt = $dbh->db->prepare("SELECT Nome FROM razza");
                                $stmt->execute();
                                $result = $stmt->get_result();
                                while ($row = $result->fetch_assoc()){
                                    echo "<option value=".$row["Nome"].">".htmlentities($row["Nome"])."</option>";
                                }
                                ?>
                                </select>  </li>
                                <br>

                                <li><label for="subrace"> Scegli una sottorazza:  </label>
                                <select class="form-control" id="subraces" name="subrace" form="creapg">
                                <?php
                                $stmt = $dbh->db->prepare("SELECT Nome FROM sottorazza");
                                $stmt->execute();
                                $result = $stmt->get_result();
                                while ($row = $result->fetch_assoc()){
                                    echo "<option value=".$row["Nome"].">".htmlentities($row["Nome"])."</option>";
                                }
                                ?>
                                </select>  </li>
                            </li>

                                </ol>
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