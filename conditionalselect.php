<?php
 require_once("bootstrap.php");
if (!isset($_SESSION["ID"])){
    die();
}

$step=$_GET["step"];
if ($step=="sottorazza"){
    $razza=$_GET["razza"];
    $sottorazze=$dbh->getSubracesForRace($razza);
    echo "<option disabled selected value></option>";
    foreach ($sottorazze as $row){
        $encodedAlignment = urlencode($row["Nome"]);
        echo "<option value=\"$encodedAlignment\">".htmlentities($row["Nome"])."</option>";
    }
} else {
    die("Invalid step");
}
?>