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

<header>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">DND Aider</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
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
    </nav>
</header>

<div class="container">
    <div class="row justify-content-center">
        <?php 
            if(!isset($_SESSION["ID"])){
                header("Location: login.php");
            } else {
                foreach($dbh->characterList($_SESSION["ID"]) as $character){
        ?>
            <div class="col-md-4">
                <div class="card mb-3">
                    <div class="card-header"><?php echo $character["Nome"]; ?></div>
                    <div class="card-body">
                        <p class="card-text">Altre informazioni sul personaggio qui...</p>
                        <a href="index.php?ID=<?php echo $character["ID_Personaggio"]; ?>" class="btn btn-primary">Dettagli</a>
                    </div>
                </div>
            </div>
        <?php
                }
                echo '<div class="col-md-4">';
                echo '<a href="createCharacter.php" class="btn btn-primary btn-block">Crea Personaggio</a>';
                echo '</div>';
            }
        ?>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

</body>
</html>
