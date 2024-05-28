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
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }
        #container {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            padding: 10px;
        }
        section {
            background-color: #f5f5dc;
            padding: 10px;
            border-radius: 5px;
            box-sizing: border-box;
            text-align: center; /* Center-align text */
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        #header {
            width: 100%;
            text-align: center;
        }
        .full-width {
            width: 100%;
        }
        .half-width {
            width: 48%;
        }
        .third-width {
            width: 32%;
        }
        .quarter-width {
            width: 23%;
        }
        .character-info {
            display: flex;
            justify-content: center; /* Center-align items in the grid */
            flex-wrap: wrap;
            gap: 20px; /* Add space between items */
        }
        table {
            margin: 0 auto; /* Center-align table */
        }
        p {
            margin: 0; /* Remove default margin for paragraphs */
        }
    </style>
</head>
<body>
    <header id="header">
    </header>
    <div id="container">
        <section class="full-width">
            <h2>Informazioni del personaggio</h2>
            <div class="character-info">
                <?php echo "<p>".$dbh->getName($IDpersonaggio)."</p>"; ?>
                <?php echo "<p>".$dbh->getRaceName($IDpersonaggio)."</p>"; ?>
                <?php //echo "<p>".$dbh->getSubraceName($IDpersonaggio)."</p>"; ?>
                <?php echo "<p>".$dbh->getClassName($IDpersonaggio)."</p>"; ?>
                <?php echo "<p>".$dbh->getSubclassName($IDpersonaggio)."</p>"; ?>
            </div>
        </section>
        <section class="half-width">
            <h2>Punti Abilità</h2>
            <?php 
                $abilities = $dbh->getAbilities();
                foreach ($abilities as $ability){
                    echo "<p>".$ability["Nome"].": ";//.$dbh->getAbilityScore($IDpersonaggio, $ability["ID"])."</p>";
                }
            ?>
        </section>
        <section class="half-width">
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
        <section class="third-width">
            <h2>Descrizione ed aspetto</h2>
            <?php echo "<p>".$dbh->getDescription($IDpersonaggio)."</p>"; ?>
        </section>
        <section class="third-width">
            <h2>Classe armatura</h2>
            <?php echo "<p>".$dbh->getArmorClass($IDpersonaggio)."</p>"; ?>
        </section>
        <section class="third-width">
            <h2>Punti iniziativa</h2>
            <?php echo "<p>".$dbh->getInitiative($IDpersonaggio)."</p>"; ?>
        </section>
        <section class="third-width">
            <h2>Punti esperienza</h2>
            <?php echo "<p>".$dbh->getExperiencePoints($IDpersonaggio)."</p>"; ?>
        </section>
        <section class="third-width">
            <h2>Origini</h2>
            <?php echo "<p>".$dbh->getOriginName($IDpersonaggio)."</p>"; ?>
        </section>
        <section class="third-width">
            <h2>Armatura equipaggiata</h2>
            <?php echo "<p>".$dbh->getEquippedArmor($IDpersonaggio)."</p>"; ?>
        </section>
        <section class="third-width">
            <h2>Arma equipaggiata</h2>
            <?php echo "<p>".$dbh->getEquippedWeapon($IDpersonaggio)."</p>"; ?>
        </section>
        <section class="third-width">
            <h2>Allineamento</h2>
            <?php echo "<p>".$dbh->getAlignmentName($IDpersonaggio)."</p>"; ?>
        </section>
        <section class="full-width">
            <h2>Tiri salvezza</h2>
        </section>
        <section class="full-width">
            <h2>Bonus di competenza</h2>
        </section>
        <section class="full-width">
            <h2>Equipaggiamento</h2>
        </section>
        <section class="full-width">
            <h2>Attacchi</h2>
        </section>
        <section class="full-width">
            <h2>Incantesimi</h2>
        </section>
        <section class="full-width">
            <h2>Privilegi e tratti</h2>
        </section>
        <section class="full-width">
            <h2>Altre competenze e linguaggi</h2>
        </section>
    </div>
</body>
</html>
