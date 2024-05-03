<?php
    session_start();
    require_once("bootstrap.php");
    $mess=null;
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
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
<?php
if (isset($_SESSION["ID"])){
    ?>
        <a class="nav-link" href="index.php">Home <span class="sr-only">(current)</span></a>
      </li>
      <?php
}
?>
      <li class="nav-item">
        <a class="nav-link" href="login.php">Login</a>
      </li>
      <?php
if (isset($_SESSION["ID"])){
    ?>
      <li class="nav-item">
        <a class="nav-link" href="create.php">Create</a>
      </li>
      <?php
}
?>
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
                    <div class="card-header">User Login</div>
                    <div class="card-body">

                        <form method="post" action="login.php">
                        <div class="form-group">
                                <label for="username">Username</label>
                                <input type="username" class="form-control" id="username" name="username" placeholder="Enter username">
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" class="form-control" id="password" name="password" placeholder="Enter password">
                            </div>
                            <button type="submit" class="btn btn-primary">Login</button>
                        </form>

                        <?php 
                        if(isset($_SESSION["ID"])) {
                            ?>
                            <a style="color:black" href="logout.php">Un utente è già loggato. Wanna logout?</a>
                            <?php
                            ?>
                            <?php
                        }else if (isset($_POST["username"])&&isset($_POST["password"])){
                            $username=$_POST["username"];
                            $password=$_POST["password"];
                            $idutente=$dbh->loginUtente($username, $password);
                            if (!is_null($idutente)){
                            $mess="Login success";
                            header("Location: index.php");
                            $_SESSION["ID"]=$idutente;
                        }else{
                            $mess="Login failed";
                        }
                    }
                        echo $mess;
                        ?>

                    </div>
                </div>
                <?php
                if (!isset($_SESSION["ID"])){?>
                <p class="mt-3 text-center">Non sei ancora registrato? <a title="registrati" class="link-primary" href="register.php">Registrati</a></p>
            <?php }?>
                </div>
        </div>
    </div>
</body>
</html>

