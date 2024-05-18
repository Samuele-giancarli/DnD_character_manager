<?php
 require_once("bootstrap.php");
if (!isset($_SESSION["ID"])){
    die();
}

$razza=$_GET["razza"];
$descrizione=$dbh->getRaceInfo($razza)[0]["Descrizione"];
$aumentocar=$dbh->getRaceInfo($razza)[0]["Aum_Nome_Caratteristica"];
$valorecar=$dbh->getRaceInfo($razza)[0]["Aum_Valore_Aggiuntivo"];
$taglia=$dbh->getRaceInfo($razza)[0]["Taglia"];
$velocita=$dbh->getRaceInfo($razza)[0]["Velocita"];
$eta=$dbh->getRaceInfo($razza)[0]["Eta"];

echo "<tr>
<th>Descrizione</th>
<th>Caratteristica Aumentata</th>
<th>Età Vita</th>
<th>Taglia</th>
<th>Velocità</th></tr>
<tr>
<td>".$descrizione."</td>
<td>".$aumentocar." ".$valorecar."</td>
<td>".$eta."</td>
<td>".$taglia."</td>
<td>".$velocita."</td>
</tr>";