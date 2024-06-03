<?php

$classe=$_GET["classe"];
$inventariobardo=[["Tirapugni d'Ottone", "Spadone", "Arco Corto"], ["Pacchetto da Diplomatico", "Pacchetto da Intrattenitore"],["Lira"],["Armatura di Pelle", "Pugnale"]];
$inventariobarbaro=[["Ascia", "Martello da Guerra"], ["Doppia Ascia a Mano", "Mazza"],["Pacchetto Da Esploratore"], ["Quattro Giavellotti"]];
$inventarioladro=[["Stocco", "Spada Corta"], ["Arco Corto"], ["Pacchetto da Scassinatore", "Pacchetto da Esploratore"],["Armatura di Pelle", "Pugnale"]];
$inventariomago=[["Balestra Leggera"], ["Sacchetto di Componenti", "Focus Arcano"], ["Pacchetto da Esploratore"],["Pugnale"]];
$inventario=array();

switch ($classe){
    case "Bardo":
        $inventario=$inventariobardo;
        break;

    case "Barbaro":
        $inventario=$inventariobarbaro;
        break;

    case "Ladro":
        $inventario=$inventarioladro;
        break;

    case "Mago":
        $inventario=$inventariomago;
        break;

    default:
        die("Class not valid");
}
$i=0;
foreach ($inventario as $sezione){
    echo "<select name=\"choice".$i."\"><option disabled selected value></option>";
    foreach ($sezione as $opzione){
        $encode=urlencode($opzione);
        echo "<option value=\"".$encode."\">".htmlentities($opzione)."</option>";
    }
    echo "</select><br>";
    echo "<input type=\"hidden\" name=\"choicen\" value=\"".$i."\"/>";
    $i++;
}

?>