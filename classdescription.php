<?php
 require_once("bootstrap.php");
if (!isset($_SESSION["ID"])){
    die();
}

$classe=$_GET["classe"];
$bonuscompetenza=$dbh->getClassInfo($classe)[0]["Bonus_Competenza"];
$dadovita=$dbh->getClassInfo($classe)[0]["Dado_Vita"];


echo "<tr>
<th>Bonus Competenza</th>
<th>Dado Vita</th>
</tr>
<tr>
<td>".$bonuscompetenza."</td>
<td>".$dadovita."</td>
</tr>";