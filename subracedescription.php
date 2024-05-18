<?php
 require_once("bootstrap.php");
if (!isset($_SESSION["ID"])){
    die();
}

$sottorazza=$_GET["sottorazza"];
$descrizione=$dbh->getSubraceInfo($sottorazza)[0]["Descrizione"];
$aumentocar=$dbh->getSubraceInfo($sottorazza)[0]["Aum_Nome_Caratteristica"];
$valorecar=$dbh->getSubraceInfo($sottorazza)[0]["Aum_Valore_Aggiuntivo"];

echo "<tr>
<th>Descrizione</th>
<th>Caratteristica Aumentata</th>
</tr>
<tr>
<td>".$descrizione."</td>
<td>".$aumentocar." ".$valorecar."</td>
</tr>";