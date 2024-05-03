<?php
    session_start();
    require_once("bootstrap.php");
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
        <a class="nav-link" href="create.php">Create</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Guides</a>
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
                    <div class="card-header">Your Characters</div>
                    <div class="card-body">
                        
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