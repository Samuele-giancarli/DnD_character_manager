<?php
    require_once("bootstrap.php");

    if (!isset($_SESSION["ID"])){
        echo "devi essere loggato per visualizzare questa pagina";
        die();
    } else { $IDutente = $_SESSION["ID"];}
    
    
if (!isset($_GET["ID"])){
        echo "devi aver selezionato un personaggio per visualizzare questa pagina";
        die();
    } else { $IDpersonaggio = $_GET["ID"];}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Character Sheet</title>
    <style>
        #container {
            display: flex;
            flex-wrap: wrap;
        }
        section {
            background-color: #f5f5dc;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            width: 100%;
            box-sizing: border-box;
        }
        @media (min-width: 600px) {
            section {
                width: 50%;
            }
        }
        @media (min-width: 900px) {
            section {
                width: 33.333%;
            }
        }
    </style>
</head>
<body>
    <header>
        <h1>Character Sheet</h1>
    </header>
    <div id="container">
        <section>
            <h2>Informazioni del personaggio</h2>
            <?php echo "<p>".$dbh->getName($IDpersonaggio)."</p>"; ?>
            <?php echo "<p>".$dbh->getRaceName($IDpersonaggio)."</p>"; ?>
            <?php //echo "<p>".$dbh->getSubraceName($IDpersonaggio)."</p>"; ?>
            <?php echo "<p>".$dbh->getClassName($IDpersonaggio)."</p>"; ?>
            <?php echo "<p>".$dbh->getSubclassName($IDpersonaggio)."</p>"; ?>
        </section>
        <section id="stat-block">
         <h2>Punti caratteristica</h2>
    <table>
        <tr>
            <th>Forza:</th>
            <?php echo "<td>".$dbh->getStrength($IDpersonaggio)."</td>"; ?>
        </tr>
        <tr>
            <th>Destrezza:</th>
            <?php echo "<td>".$dbh->getDexterity($IDpersonaggio)."</td>"; ?>
        </tr>
        <tr>
            <th>Costituzione:</th>
            <?php echo "<td>".$dbh->getConstitution($IDpersonaggio)."</td>"; ?>
        </tr>
        <tr>
            <th>Intelligenza:</th>
            <?php echo "<td>".$dbh->getIntelligence($IDpersonaggio)."</td>"; ?>
        </tr>
        <tr>
            <th>Saggezza:</th>
            <?php echo "<td>".$dbh->getWisdom($IDpersonaggio)."</td>"; ?>
        </tr>
        <tr>
            <th>Carisma:</th>
            <?php echo "<td>".$dbh->getCharisma($IDpersonaggio)."</td>"; ?>
        </tr>
    </table>
    </section>
    <section>
        <h2>Descrizione ed aspetto</h2>
        <?php echo "<p>".$dbh->getDescription($IDpersonaggio)."</p>"; ?>
    </section>
    <section>
        <h2>Classe armatura</h2>
        <?php echo "<p>".$dbh->getArmorClass($IDpersonaggio)."</p>"; ?>
    </section>
    <section>
        <h2>Punti iniziativa</h2>
        <?php echo "<p>".$dbh->getInitiative($IDpersonaggio)."</p>"; ?>
    </section>
    <section>
        <h2>Punti esperienza</h2>
        <?php echo "<p>".$dbh->getExperiencePoints($IDpersonaggio)."</p>"; ?>
    </section>
    <section>
        <h2>Origini</h2>
        <?php echo "<p>".$dbh->getOriginName($IDpersonaggio)."</p>"; ?>
    </section>
    <section>
        <h2>Armatura equipaggiata</h2>
        <?php echo "<p>".$dbh->getEquippedArmor($IDpersonaggio)."</p>"; ?>
    </section>
    <section>
        <h2>Arma equipaggiata</h2>
        <?php echo "<p>".$dbh->getEquippedWeapon($IDpersonaggio)."</p>"; ?>
    </section>
    <section>
        <h2>Allineamento</h2>
        <?php echo "<p>".$dbh->getAlignmentName($IDpersonaggio)."</p>"; ?>
    </section>
    <section>
        <h2>Tiri salvezza</h2>
    </section>
    <section>
        <h2>Bonus di competenza</h2>
    </section>
    <section>
        <h2>Equipaggiamento</h2>
    </section>
    <section>
        <h2>Attacchi ed incantesimi</h2>
    </section>
    <section>
        <h2>Privilegi e tratti</h2>
    </section>
    <section>
        <h2>Altre competenze e linguaggi</h2>
    </section>
    <section>
        <h2>Saggezza (percezione) passiva</h2>
    </section>
    <section>
        <h2>Punti ferita attuali</h2>
        <table>
            <tr>
                <th>Punti ferita attuali:</th>
                <td>15</td>
            </tr>
        </table>
    </section>
    <section>
        <h2>Punti ferita temporanei</h2>
    </section>
</body>
</html>