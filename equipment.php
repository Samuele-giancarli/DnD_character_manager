<?php
require_once("bootstrap.php");
$arma=$_GET["weapon"];
$armatura=$_GET["armor"];
$info=$dbh->getArmorInfo($armatura);
$idborsa=$_GET["idborsa"];
$idpersonaggio=$_GET["idpersonaggio"];
$moddex=(($dbh->getCharacterInfo($idpersonaggio)["Car_Destrezza"])/2)-5;

$dbh->updateEquipment($idpersonaggio,$arma,$armatura);

if (str_contains($info, "+")){
$array=explode(" ", $info);
$valore=intval($array[0])+$moddex;
}else{
    $valore=intval($info);
}
$dbh->updateCA($idpersonaggio, $valore);
header("Location: borsa.php?ID=".$idpersonaggio);
?>