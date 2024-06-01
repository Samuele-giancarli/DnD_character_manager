<?php
require_once("bootstrap.php");
$arma=$_GET["weapon"];
$armatura=$_GET["armor"];
$idborsa=$_GET["idborsa"];
$idpersonaggio=$_GET["idpersonaggio"];
$dbh->updateEquipment($idpersonaggio,$arma,$armatura);
header("Location: borsa.php?ID=".$idborsa);

?>