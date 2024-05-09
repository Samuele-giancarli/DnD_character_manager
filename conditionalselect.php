<?php
 require_once("bootstrap.php");
if (!isset($_SESSION["ID"])){
    die();
}

$step=$_GET["step"];
if ($step=="sottorazza"){
    $razza=$_GET["razza"];
    $sottorazze=$dbh->getSubracesForRace($razza);
    foreach ($sottorazze as $row){
        echo "<option value=".$row["Nome"].">".htmlentities($row["Nome"])."</option>";
    }
} else {
    die("Invalid step");
}
?>