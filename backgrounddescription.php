<?php
 require_once("bootstrap.php");
if (!isset($_SESSION["ID"])){
    die();
}

$origini=$_GET["origini"];
$descrizione=$dbh->getBackgroundInfo($origini)[0]["Descrizione"];
$privilegename=$dbh->getBackgroundInfo($origini)[0]["Nome_Privilegio"];
$privilegedescription=$dbh->getPrivilegeInfo($privilegename)[0]["Descrizione"];

echo "<tr>
<th>Descrizione</th>
<th>Privilegio</th>
<th>Descrizione Privilegio</th>
</tr>
<tr>
<td>".$descrizione."</td>
<td>".$privilegename."</td>
<td>".$privilegedescription."</td>
</tr>";