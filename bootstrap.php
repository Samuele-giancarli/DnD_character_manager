<?php
    session_start();
    require_once("database.php");
    $dbh = new DatabaseHelper("localhost", "root", "", "dnd_character_manager", 3306);
    // collegamento al database funzionante
?>