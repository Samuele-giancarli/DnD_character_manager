<?php
    require_once("bootstrap.php");

    foreach($dbh->characterList($_SESSION["ID"]) as $character){
        echo "<li class='nav-item'>";
        echo "<a class='nav-link' href='character.php?ID=".$character["ID_Personaggio"]."'>".$character["Nome"]."</a>";
        echo "</li>";
    }
?>