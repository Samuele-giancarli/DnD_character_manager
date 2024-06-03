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
                <?php 
                $race=$dbh->getRaceName($IDpersonaggio);
                $classes=$dbh->getClassesInfo($IDpersonaggio);
                $subrace=$dbh->getSubraceName($IDpersonaggio);
                $subclasses=$dbh->getSubclassesInfo($IDpersonaggio);
                $origini=$dbh->getOriginName($IDpersonaggio); 
                echo "<b><p>Nome:</p></b>";
                echo "<p>".$dbh->getName($IDpersonaggio)."</p>"; 
                echo "<b><p>Razza:</p></b>";
                echo "<p>".htmlentities($race)."</p>"; 
                echo "<b><p>Sottorazza:</p></b>";
                echo "<p>".htmlentities($subrace)."</p>";
                echo "<b><p>Classe/i:</p></b>";
                foreach ($classes as $class)
                echo "<p>".htmlentities($class["Nome_Classe"]).": Livello ".$class["Livello_Classe"]."</p>";
                echo "<b><p>Sottoclasse/i:</p></b>";
                if (!is_null($subclasses)){
                foreach ($subclasses as $subclass){
                echo "<p>".htmlentities($subclass["Nome_Sottoclasse"]).": Livello ".$subclass["Livello_Sottoclasse"]."</p>"; 
                }
            }?>
                
            </div>
        </section>
        <section class="half-width">
            <h2>Punti Abilità</h2>
            <?php 
                $characterSkills = $dbh->getCompetenzeAbilita($IDpersonaggio);
                $abilities = $dbh->getAbilities();
                $characterAbilities = $dbh->getCharacterAbilities($IDpersonaggio);

                echo "<table>";
                foreach ($abilities as $ability){
                    $value = "";
                    foreach ($characterAbilities as $charAbility) {
                        if ($ability["Nome"] == $charAbility["Nome_Abilita"]) {
                            $value = $charAbility["Valore"];
                            break;
                        }
                    }
                    if (in_array($ability["Nome"], array_column($characterSkills, 'Nome_Abilita'))){
                        echo "<tr><td><b>".$ability["Nome"].":</b></td><td><b>".$value."</b></td></tr>";
                    } else {
                        echo "<tr><td>".$ability["Nome"].":</td><td>".$value."</td></tr>";
                    }
                }
                echo "</table>";
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
            <?php echo "<p>".htmlentities($origini)."</p>"; ?>
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
        <section class="third-width">
            <h2><a href="borsa.php?ID=<?php echo $IDpersonaggio;?>">Borsa</a></h2>
        </section>
        <section class="full-width">
            <h2>Tiri salvezza</h2>
            <?php
            $tirisalvezza=$dbh->getSavingThrowsByID($IDpersonaggio);
            echo "<p>Primo tiro in: ".$tirisalvezza[0]["Nome_Caratteristica"]." con Valore: ".$tirisalvezza[0]["Valore"]."</p>";
            echo "<p>Secondo tiro in: ".$tirisalvezza[1]["Nome_Caratteristica"]." con Valore: ".$tirisalvezza[1]["Valore"]."</p>";?>
        </section>
        <section class="full-width">
            <h2>Bonus di competenza</h2>
            <?php 
            $bonus=$dbh->getClassBonus($IDpersonaggio);
            echo "<p>+ ".$bonus."</p>";?>
        </section>
        <section class="full-width">
            <h2>Competenze</h2>
            <?php
            foreach ($classes as $class){
            echo "<b><p>Per la Classe: ".$class["Nome_Classe"]."</p></b>";
            $armors=$dbh->getArmorProficiencies($class["Nome_Classe"]);
            $weapons=$dbh->getWeaponProficiencies($class["Nome_Classe"]);
            $tools=$dbh->getToolProficiencies($class["Nome_Classe"],$origini);
            echo "<p>Competenze in armature: ";
            foreach ($armors as $armor){
            echo htmlentities($armor["Nome_Armatura"]).", ";
        } echo "</p>";
            echo "<p>Competenze in armi: ";
            foreach ($weapons as $weapon){
                echo htmlentities($weapon["Nome_Arma"]).", ";
            }echo "</p>";
            echo "<p>Competenze in strumenti: ";
            foreach ($tools as $tool){
                echo htmlentities($tool["Nome_Strumento"]).", ";}
            echo "</p><br>";
            }
            ?>
        </section>

        <section class="full-width">
            <h2>Capacità di Classe</h2>
            <?php
            foreach ($classes as $class){
            echo "<b><p>Per la Classe: ".$class["Nome_Classe"]."</p></b>";
            $classcap=$dbh->getCapacitiesOfClassAndLevel($class["Nome_Classe"], $class["Livello_Classe"]);
            echo "<p>";
            foreach ($classcap as $cap){
                echo "<p title=\"".$cap["Descrizione"]."\">".$cap["Livello_Classe"].": ".htmlentities($cap["Nome_Capacita"])."</p><br>";
            }
            echo "</p><br>";
        }
            ?>
        </section>
        <section class="full-width">
            <h2>Capacità di Sottoclasse</h2>
            <?php
            foreach ($subclasses as $subclass){
                echo "<b><p>Per la Sottoclasse: ".$subclass["Nome_Sottoclasse"]."</p></b>";
            $subclasscap=$dbh->getCapacitiesOfSubclassAndLevel($subclass["Nome_Sottoclasse"], $subclass["Livello_Sottoclasse"]);
            echo "<p>";
            foreach ($subclasscap as $cap){
                echo "<p title=\"".$cap["Descrizione"]."\">".$cap["Livello_Sottoclasse"].": ".htmlentities($cap["Nome_Capacita"])."</p><br>";
            }
            echo "</p><br>";
        }
            ?>
        </section>
        <section class="full-width">
            <h2>Incantesimi</h2>
            <?php
            $spells=$dbh->getSpellsByID($IDpersonaggio);
            echo "<p>";
            foreach ($spells as $spell){
                echo "<p title=\"".$spell["Descrizione"]."\">".htmlentities($spell["Nome_Incantesimo"])."<br>";
            }
            echo "</p>";
            ?>
        </section>
        <section class="full-width">
            <h2>Privilegi e tratti razziali</h2>
            <?php
            $privilegi=$dbh->getPrivilegeFromBackground($origini);
            $trattirazziali=$dbh->getAllTraits($race, $subrace);
            echo "<p title=\"".$privilegi["Descrizione"]."\">Privilegio: ".htmlentities($privilegi["Nome_Privilegio"])."</p><br>";
            echo "<b>Tratti Razziali: </b>";
            foreach ($trattirazziali as $tratto){
                echo "<p title=\"".$tratto["Descrizione"]."\">".htmlentities($tratto["Nome_Tratto"])."</p>";
            }
            echo "<br>";
            ?>
        </section>
        <section class="full-width">
            <h2>Lingue</h2>
            <p>
            <?php
            $lingue=$dbh->getAllLanguages($origini, $race);
            foreach ($lingue as $lingua){
                echo htmlentities($lingua["Nome_Lingua"]).", ";
            }
            ?>
            </p>
        </section>
    </div>
</body>
</html>
