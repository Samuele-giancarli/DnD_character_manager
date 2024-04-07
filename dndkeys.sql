-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Apr 07, 2024 alle 21:56
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dnd`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `abilita`
--

CREATE TABLE `abilita` (
  `Nome` varchar(10) NOT NULL,
  `Caratteristica_Associata` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `abilita_personaggio`
--

CREATE TABLE `abilita_personaggio` (
  `ID_Personaggio` decimal(10,0) NOT NULL,
  `Nome_Abilita` varchar(10) NOT NULL,
  `Valore` decimal(2,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `allineamento`
--

CREATE TABLE `allineamento` (
  `Nome` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `appartiene`
--

CREATE TABLE `appartiene` (
  `ID_Personaggio` decimal(10,0) NOT NULL,
  `Nome_Razza` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `barbaro`
--

CREATE TABLE `barbaro` (
  `ID_Barbaro` char(1) NOT NULL,
  `Utilizzi_Rabbia_Giornalieri` varchar(10) NOT NULL,
  `Bonus_Rabbia` decimal(1,0) NOT NULL,
  `Nome_Classe` varchar(10) NOT NULL,
  `Livello_Classe` decimal(2,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `bardo`
--

CREATE TABLE `bardo` (
  `ID_Bardo` char(1) NOT NULL,
  `Dado_Ispirazione_Bardica` varchar(10) NOT NULL,
  `Nome_Classe` varchar(10) NOT NULL,
  `Livello_Classe` decimal(2,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `borsa`
--

CREATE TABLE `borsa` (
  `ID_Borsa` varchar(100) NOT NULL,
  `ID_Personaggio` decimal(10,0) NOT NULL,
  `Peso_Trasportabile` decimal(10,0) NOT NULL,
  `Monete_Rame` decimal(10,0) NOT NULL,
  `Monete_Argento` decimal(10,0) NOT NULL,
  `Monete_Electrum` decimal(10,0) NOT NULL,
  `Monete_Oro` decimal(10,0) NOT NULL,
  `Monete_Platino` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `capacita_di_classe`
--

CREATE TABLE `capacita_di_classe` (
  `Nome` varchar(10) NOT NULL,
  `Descrizione` varchar(1000) NOT NULL,
  `Aum_Nome_Caratteristica` char(1) DEFAULT NULL,
  `Aum_Valore_Aggiuntivo` char(1) DEFAULT NULL,
  `Caratteristica_Incantatore` char(1) DEFAULT NULL,
  `Utilizzo_Giornaliero` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `capacita_di_sottoclasse`
--

CREATE TABLE `capacita_di_sottoclasse` (
  `Nome` varchar(10) NOT NULL,
  `Descrizione` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `caratterizza`
--

CREATE TABLE `caratterizza` (
  `Nome_Allineamento` varchar(10) NOT NULL,
  `ID_Personaggio` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `classe`
--

CREATE TABLE `classe` (
  `Nome` varchar(10) NOT NULL,
  `Bonus_Competenza` decimal(10,0) NOT NULL,
  `Dado_Vita` varchar(10) NOT NULL,
  `Livello` decimal(5,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `classe_migliora`
--

CREATE TABLE `classe_migliora` (
  `Nome_Abilita` varchar(10) NOT NULL,
  `Nome_Classe` varchar(10) NOT NULL,
  `Livello_Classe` decimal(2,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `competenza`
--

CREATE TABLE `competenza` (
  `Nome_Classe` varchar(10) NOT NULL,
  `Livello_Classe` decimal(2,0) NOT NULL,
  `Nome_TiroSalvezza` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `competenza_della_classe_in_armature`
--

CREATE TABLE `competenza_della_classe_in_armature` (
  `Nome_Armatura` varchar(10) NOT NULL,
  `Livello_Classe` decimal(2,0) NOT NULL,
  `Nome_Classe` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `competenza_della_classe_in_armi`
--

CREATE TABLE `competenza_della_classe_in_armi` (
  `Nome_Arma` varchar(10) NOT NULL,
  `Livello_Classe` decimal(2,0) NOT NULL,
  `Nome_Classe` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `competenza_della_classe_in_strumenti`
--

CREATE TABLE `competenza_della_classe_in_strumenti` (
  `Nome_Strumento` varchar(10) NOT NULL,
  `Livello_Classe` decimal(2,0) NOT NULL,
  `Nome_Classe` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `competenza_dell_origine_in_strumenti`
--

CREATE TABLE `competenza_dell_origine_in_strumenti` (
  `Nome_Origine` varchar(10) NOT NULL,
  `Nome_Strumento` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `competenze_abilita`
--

CREATE TABLE `competenze_abilita` (
  `Nome_Abilita` varchar(10) NOT NULL,
  `ID_Personaggio` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `concede`
--

CREATE TABLE `concede` (
  `Nome_Origine` varchar(10) NOT NULL,
  `Nome_Privilegio` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `conosce`
--

CREATE TABLE `conosce` (
  `Nome_Incantesimo` varchar(10) NOT NULL,
  `ID_Personaggio` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `contiene`
--

CREATE TABLE `contiene` (
  `ID_Borsa` varchar(100) NOT NULL,
  `Nome_Oggetto` varchar(10) NOT NULL,
  `Quantita` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `equipaggia_arma`
--

CREATE TABLE `equipaggia_arma` (
  `Nome_Arma` varchar(10) NOT NULL,
  `ID_Personaggio` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `equipaggia_armatura`
--

CREATE TABLE `equipaggia_armatura` (
  `Nome_Armatura` varchar(10) NOT NULL,
  `ID_Personaggio` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `ha_origine`
--

CREATE TABLE `ha_origine` (
  `Nome_Origine` varchar(10) NOT NULL,
  `ID_Personaggio` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `identifica`
--

CREATE TABLE `identifica` (
  `Nome_Razza` varchar(10) NOT NULL,
  `Nome_Sottorazza` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `impara_classe`
--

CREATE TABLE `impara_classe` (
  `Nome_Capacita` varchar(10) NOT NULL,
  `Nome_Classe` varchar(10) NOT NULL,
  `Livello_Classe` decimal(2,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `impara_sottoclasse`
--

CREATE TABLE `impara_sottoclasse` (
  `Nome_Capacita` varchar(10) NOT NULL,
  `Nome_Sottoclasse` varchar(10) NOT NULL,
  `Livello_Sottoclasse` decimal(2,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `incantesimo`
--

CREATE TABLE `incantesimo` (
  `Nome` varchar(10) NOT NULL,
  `Livello` decimal(2,0) NOT NULL,
  `Scuola` varchar(10) NOT NULL,
  `Tempo_di_Lancio` varchar(10) NOT NULL,
  `Distanza` varchar(10) NOT NULL,
  `Durata` varchar(10) NOT NULL,
  `Componenti` varchar(10) NOT NULL,
  `Rituale` char(1) NOT NULL,
  `ID_Mago` char(1) DEFAULT NULL,
  `ID_Bardo` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `ladro`
--

CREATE TABLE `ladro` (
  `ID_Ladro` char(1) NOT NULL,
  `Bonus_Attacco_Furtivo` varchar(10) NOT NULL,
  `Nome_Classe` varchar(10) NOT NULL,
  `Livello_Classe` decimal(2,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `lancia_bardo`
--

CREATE TABLE `lancia_bardo` (
  `ID_Bardo` char(1) NOT NULL,
  `Livello_Slot` decimal(2,0) NOT NULL,
  `Quantita` decimal(2,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `lancia_mago`
--

CREATE TABLE `lancia_mago` (
  `ID_Mago` char(1) NOT NULL,
  `Livello_Slot` decimal(2,0) NOT NULL,
  `Quantita` decimal(2,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `lingue`
--

CREATE TABLE `lingue` (
  `Nome` varchar(10) NOT NULL,
  `Descrizione` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `lingue_aggiuntive`
--

CREATE TABLE `lingue_aggiuntive` (
  `Nome_Lingua` varchar(10) NOT NULL,
  `Nome_Origine` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `lingue_conosciute`
--

CREATE TABLE `lingue_conosciute` (
  `Nome_Lingua` varchar(10) NOT NULL,
  `ID_Personaggio` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `lingue_della_razza`
--

CREATE TABLE `lingue_della_razza` (
  `Nome_Lingua` varchar(10) NOT NULL,
  `Nome_Razza` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `mago`
--

CREATE TABLE `mago` (
  `ID_Mago` char(1) NOT NULL,
  `Nome_Classe` varchar(10) NOT NULL,
  `Livello_Classe` decimal(2,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `oggetti_dell_origine`
--

CREATE TABLE `oggetti_dell_origine` (
  `Nome_Oggetto` varchar(10) NOT NULL,
  `Nome_Origine` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `oggetti_di_classe`
--

CREATE TABLE `oggetti_di_classe` (
  `Nome_Oggetto` varchar(10) NOT NULL,
  `Livello_Classe` decimal(2,0) NOT NULL,
  `Nome_Classe` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `oggetto`
--

CREATE TABLE `oggetto` (
  `Peso` decimal(5,0) NOT NULL,
  `Valore` decimal(10,0) NOT NULL,
  `Nome` varchar(10) NOT NULL,
  `Descrizione` char(1) DEFAULT NULL,
  `Contenuto` char(1) DEFAULT NULL,
  `Danno` char(1) DEFAULT NULL,
  `Tipo_Danno` char(1) DEFAULT NULL,
  `Classe_Armatura` char(1) DEFAULT NULL,
  `Forza_Necessaria` char(1) DEFAULT NULL,
  `Svantaggio_Furtivita` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `origine`
--

CREATE TABLE `origine` (
  `Nome` varchar(10) NOT NULL,
  `Descrizione` char(1) NOT NULL,
  `Con_Nome` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `origine_migliora`
--

CREATE TABLE `origine_migliora` (
  `Nome_Abilita` varchar(10) NOT NULL,
  `Nome_Origine` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `personaggio`
--

CREATE TABLE `personaggio` (
  `ID_Personaggio` decimal(10,0) NOT NULL,
  `Car_Forza` char(1) NOT NULL,
  `Car_Destrezza` char(1) NOT NULL,
  `Car_Costituzione` char(1) NOT NULL,
  `Car_Intelligenza` char(1) NOT NULL,
  `Car_Saggezza` char(1) NOT NULL,
  `Car_Carisma` char(1) NOT NULL,
  `Punti_Ferita` decimal(10,0) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Descrizione_Aspetto` varchar(1000) NOT NULL,
  `Classe_Armatura` decimal(2,0) NOT NULL,
  `Iniziativa` decimal(1,0) NOT NULL,
  `Punti_Esperienza` decimal(10,0) NOT NULL,
  `ID_Utente` decimal(10,0) NOT NULL,
  `Nome_Origine` varchar(10) NOT NULL,
  `Armatura_Equipaggiata` varchar(10) NOT NULL,
  `Arma_Equipaggiata` varchar(10) NOT NULL,
  `Nome_Allineamento` varchar(20) NOT NULL,
  `Nome_Razza` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `possiede`
--

CREATE TABLE `possiede` (
  `ID_Utente` decimal(10,0) NOT NULL,
  `ID_Personaggio` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `privilegio`
--

CREATE TABLE `privilegio` (
  `Nome` varchar(10) NOT NULL,
  `Descrizione` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `proprieta`
--

CREATE TABLE `proprieta` (
  `Nome` varchar(10) NOT NULL,
  `Descrizione` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `proprieta_arma`
--

CREATE TABLE `proprieta_arma` (
  `Nome_Proprieta` varchar(10) NOT NULL,
  `Nome_Arma` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `razza`
--

CREATE TABLE `razza` (
  `Descrizione` varchar(1000) NOT NULL,
  `Nome` varchar(20) NOT NULL,
  `Aum_Nome_Caratteristica` varchar(10) NOT NULL,
  `Aum_Valore_Aggiuntivo` decimal(1,0) NOT NULL,
  `Eta` decimal(3,0) NOT NULL,
  `Taglia` varchar(10) NOT NULL,
  `Velocita` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `sblocca_bardo`
--

CREATE TABLE `sblocca_bardo` (
  `ID_Bardo` decimal(10,0) NOT NULL,
  `Nome_Incantesimo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `sblocca_mago`
--

CREATE TABLE `sblocca_mago` (
  `ID_Mago` decimal(10,0) NOT NULL,
  `Nome_Incantesimo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `scelta_barbaro`
--

CREATE TABLE `scelta_barbaro` (
  `Nome_Classe` varchar(10) NOT NULL,
  `Livello_Classe` decimal(2,0) NOT NULL,
  `ID_Barbaro` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `scelta_bardo`
--

CREATE TABLE `scelta_bardo` (
  `Nome_Classe` varchar(10) NOT NULL,
  `Livello_Classe` decimal(2,0) NOT NULL,
  `ID_Bardo` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `scelta_classe`
--

CREATE TABLE `scelta_classe` (
  `Nome_Classe` varchar(10) NOT NULL,
  `Livello_Classe` decimal(2,0) NOT NULL,
  `ID_Personaggio` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `scelta_ladro`
--

CREATE TABLE `scelta_ladro` (
  `Nome_Classe` varchar(10) NOT NULL,
  `Livello_Classe` decimal(2,0) NOT NULL,
  `ID_Ladro` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `scelta_mago`
--

CREATE TABLE `scelta_mago` (
  `Nome_Classe` varchar(10) NOT NULL,
  `Livello_Classe` decimal(2,0) NOT NULL,
  `ID_Mago` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `scelta_sottoclasse`
--

CREATE TABLE `scelta_sottoclasse` (
  `ID_Personaggio` decimal(10,0) NOT NULL,
  `Nome_Sottoclasse` varchar(10) NOT NULL,
  `Livello_Sottoclasse` decimal(2,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `slot_incantesimo`
--

CREATE TABLE `slot_incantesimo` (
  `Livello_Slot` decimal(2,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `sottoclasse`
--

CREATE TABLE `sottoclasse` (
  `Nome` varchar(10) NOT NULL,
  `Livello` decimal(2,0) NOT NULL,
  `Spe_Nome` varchar(10) NOT NULL,
  `Spe_Livello` decimal(2,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `sottorazza`
--

CREATE TABLE `sottorazza` (
  `Aum_Nome_Caratteristica` varchar(10) NOT NULL,
  `Aum_Valore_Aggiuntivo` decimal(1,0) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Descrizione` varchar(1000) NOT NULL,
  `Ind_Nome` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `specializzazione`
--

CREATE TABLE `specializzazione` (
  `Nome_Classe` varchar(10) NOT NULL,
  `Livello_Classe` decimal(2,0) NOT NULL,
  `Nome_Sottoclasse` varchar(10) NOT NULL,
  `Livello_Sottoclasse` decimal(2,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `tiene`
--

CREATE TABLE `tiene` (
  `ID_Personaggio` decimal(10,0) NOT NULL,
  `ID_Borsa` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `tiri_salvezza_personaggio`
--

CREATE TABLE `tiri_salvezza_personaggio` (
  `ID_Personaggio` decimal(10,0) NOT NULL,
  `Nome_Caratteristica` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `tiro_salvezza`
--

CREATE TABLE `tiro_salvezza` (
  `Nome_Caratteristica` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `tratti_della_razza`
--

CREATE TABLE `tratti_della_razza` (
  `Nome_Razza` varchar(20) NOT NULL,
  `Nome_Tratto` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `tratti_della_sottorazza`
--

CREATE TABLE `tratti_della_sottorazza` (
  `Nome_Sottorazza` varchar(100) NOT NULL,
  `Nome_Tratto` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `tratti_razziali`
--

CREATE TABLE `tratti_razziali` (
  `Nome` varchar(10) NOT NULL,
  `Descrizione` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `utente`
--

CREATE TABLE `utente` (
  `ID_Utente` decimal(10,0) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `E_mail` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `abilita`
--
ALTER TABLE `abilita`
  ADD PRIMARY KEY (`Nome`),
  ADD UNIQUE KEY `ID_ABILITA_IND` (`Nome`);

--
-- Indici per le tabelle `abilita_personaggio`
--
ALTER TABLE `abilita_personaggio`
  ADD PRIMARY KEY (`ID_Personaggio`,`Nome_Abilita`),
  ADD UNIQUE KEY `ID_Abilita_personaggio_IND` (`ID_Personaggio`,`Nome_Abilita`),
  ADD KEY `FKAbi_ABI_IND` (`Nome_Abilita`);

--
-- Indici per le tabelle `allineamento`
--
ALTER TABLE `allineamento`
  ADD PRIMARY KEY (`Nome`),
  ADD UNIQUE KEY `ID_ALLINEAMENTO_IND` (`Nome`);

--
-- Indici per le tabelle `appartiene`
--
ALTER TABLE `appartiene`
  ADD PRIMARY KEY (`ID_Personaggio`,`Nome_Razza`),
  ADD KEY `ID_Personaggio` (`ID_Personaggio`,`Nome_Razza`);

--
-- Indici per le tabelle `barbaro`
--
ALTER TABLE `barbaro`
  ADD PRIMARY KEY (`ID_Barbaro`),
  ADD UNIQUE KEY `ID_BARBARO_IND` (`ID_Barbaro`),
  ADD KEY `FKScelta_Barbaro_IND` (`Nome_Classe`,`Livello_Classe`);

--
-- Indici per le tabelle `bardo`
--
ALTER TABLE `bardo`
  ADD PRIMARY KEY (`ID_Bardo`),
  ADD UNIQUE KEY `ID_BARDO_IND` (`ID_Bardo`),
  ADD KEY `FKScelta_Bardo_IND` (`Nome_Classe`,`Livello_Classe`);

--
-- Indici per le tabelle `borsa`
--
ALTER TABLE `borsa`
  ADD PRIMARY KEY (`ID_Borsa`),
  ADD UNIQUE KEY `FKTiene_ID` (`ID_Personaggio`),
  ADD UNIQUE KEY `ID_BORSA_IND` (`ID_Borsa`),
  ADD UNIQUE KEY `FKTiene_IND` (`ID_Personaggio`);

--
-- Indici per le tabelle `capacita_di_classe`
--
ALTER TABLE `capacita_di_classe`
  ADD PRIMARY KEY (`Nome`),
  ADD UNIQUE KEY `ID_CAPACITA_DI_CLASSE_IND` (`Nome`);

--
-- Indici per le tabelle `capacita_di_sottoclasse`
--
ALTER TABLE `capacita_di_sottoclasse`
  ADD PRIMARY KEY (`Nome`),
  ADD UNIQUE KEY `ID_CAPACITA_DI_SOTTOCLASSE_IND` (`Nome`);

--
-- Indici per le tabelle `caratterizza`
--
ALTER TABLE `caratterizza`
  ADD PRIMARY KEY (`Nome_Allineamento`,`ID_Personaggio`),
  ADD KEY `Nome_Allineamento` (`Nome_Allineamento`,`ID_Personaggio`);

--
-- Indici per le tabelle `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`Nome`,`Livello`),
  ADD UNIQUE KEY `ID_CLASSE_IND` (`Nome`,`Livello`);

--
-- Indici per le tabelle `classe_migliora`
--
ALTER TABLE `classe_migliora`
  ADD PRIMARY KEY (`Nome_Abilita`,`Nome_Classe`,`Livello_Classe`),
  ADD UNIQUE KEY `ID_Classe_Migliora_IND` (`Nome_Abilita`,`Nome_Classe`,`Livello_Classe`),
  ADD KEY `FKCla_CLA_IND` (`Nome_Classe`,`Livello_Classe`);

--
-- Indici per le tabelle `competenza`
--
ALTER TABLE `competenza`
  ADD PRIMARY KEY (`Nome_TiroSalvezza`,`Nome_Classe`,`Livello_Classe`),
  ADD UNIQUE KEY `ID_Competenza_IND` (`Nome_TiroSalvezza`,`Nome_Classe`,`Livello_Classe`),
  ADD KEY `FKCom_CLA_3_IND` (`Nome_Classe`,`Livello_Classe`);

--
-- Indici per le tabelle `competenza_della_classe_in_armature`
--
ALTER TABLE `competenza_della_classe_in_armature`
  ADD PRIMARY KEY (`Nome_Armatura`,`Nome_Classe`,`Livello_Classe`),
  ADD UNIQUE KEY `ID_Competenza_della_Classe_in_Armature_IND` (`Nome_Armatura`,`Nome_Classe`,`Livello_Classe`),
  ADD KEY `FKCom_CLA_2_IND` (`Nome_Classe`,`Livello_Classe`);

--
-- Indici per le tabelle `competenza_della_classe_in_armi`
--
ALTER TABLE `competenza_della_classe_in_armi`
  ADD PRIMARY KEY (`Nome_Arma`,`Nome_Classe`,`Livello_Classe`),
  ADD UNIQUE KEY `ID_Competenza_della_Classe_in_Armi_IND` (`Nome_Arma`,`Nome_Classe`,`Livello_Classe`),
  ADD KEY `FKCom_CLA_1_IND` (`Nome_Classe`,`Livello_Classe`);

--
-- Indici per le tabelle `competenza_della_classe_in_strumenti`
--
ALTER TABLE `competenza_della_classe_in_strumenti`
  ADD PRIMARY KEY (`Nome_Strumento`,`Nome_Classe`,`Livello_Classe`),
  ADD UNIQUE KEY `ID_Competenza_della_Classe_in_Strumenti_IND` (`Nome_Strumento`,`Nome_Classe`,`Livello_Classe`),
  ADD KEY `FKCom_CLA_IND` (`Nome_Classe`,`Livello_Classe`);

--
-- Indici per le tabelle `competenza_dell_origine_in_strumenti`
--
ALTER TABLE `competenza_dell_origine_in_strumenti`
  ADD PRIMARY KEY (`Nome_Origine`,`Nome_Strumento`),
  ADD UNIQUE KEY `ID_Competenza_dell_Origine_in_Strumenti_IND` (`Nome_Strumento`,`Nome_Origine`),
  ADD KEY `FKCom_ORI_IND` (`Nome_Origine`);

--
-- Indici per le tabelle `competenze_abilita`
--
ALTER TABLE `competenze_abilita`
  ADD PRIMARY KEY (`Nome_Abilita`,`ID_Personaggio`),
  ADD UNIQUE KEY `ID_Competenze_Abilita_IND` (`Nome_Abilita`,`ID_Personaggio`),
  ADD KEY `FKCom_PER_IND` (`ID_Personaggio`);

--
-- Indici per le tabelle `concede`
--
ALTER TABLE `concede`
  ADD PRIMARY KEY (`Nome_Origine`,`Nome_Privilegio`),
  ADD KEY `Nome_Origine` (`Nome_Origine`,`Nome_Privilegio`);

--
-- Indici per le tabelle `conosce`
--
ALTER TABLE `conosce`
  ADD PRIMARY KEY (`Nome_Incantesimo`,`ID_Personaggio`),
  ADD UNIQUE KEY `ID_Conosce_IND` (`Nome_Incantesimo`,`ID_Personaggio`),
  ADD KEY `FKCon_PER_IND` (`ID_Personaggio`);

--
-- Indici per le tabelle `contiene`
--
ALTER TABLE `contiene`
  ADD PRIMARY KEY (`Nome_Oggetto`,`ID_Borsa`),
  ADD UNIQUE KEY `ID_Contiene_IND` (`Nome_Oggetto`,`ID_Borsa`),
  ADD KEY `FKCon_BOR_IND` (`ID_Borsa`);

--
-- Indici per le tabelle `equipaggia_arma`
--
ALTER TABLE `equipaggia_arma`
  ADD PRIMARY KEY (`Nome_Arma`,`ID_Personaggio`),
  ADD KEY `Nome_Arma` (`Nome_Arma`,`ID_Personaggio`);

--
-- Indici per le tabelle `equipaggia_armatura`
--
ALTER TABLE `equipaggia_armatura`
  ADD PRIMARY KEY (`Nome_Armatura`,`ID_Personaggio`),
  ADD KEY `Nome_Armatura` (`Nome_Armatura`,`ID_Personaggio`);

--
-- Indici per le tabelle `ha_origine`
--
ALTER TABLE `ha_origine`
  ADD PRIMARY KEY (`Nome_Origine`,`ID_Personaggio`),
  ADD KEY `Nome_Origine` (`Nome_Origine`,`ID_Personaggio`);

--
-- Indici per le tabelle `identifica`
--
ALTER TABLE `identifica`
  ADD PRIMARY KEY (`Nome_Razza`,`Nome_Sottorazza`),
  ADD KEY `Nome_Razza` (`Nome_Razza`,`Nome_Sottorazza`);

--
-- Indici per le tabelle `impara_classe`
--
ALTER TABLE `impara_classe`
  ADD PRIMARY KEY (`Nome_Classe`,`Livello_Classe`,`Nome_Capacita`),
  ADD UNIQUE KEY `ID_Impara_Classe_IND` (`Nome_Classe`,`Livello_Classe`,`Nome_Capacita`),
  ADD KEY `FKImp_CAP_1_IND` (`Nome_Capacita`);

--
-- Indici per le tabelle `impara_sottoclasse`
--
ALTER TABLE `impara_sottoclasse`
  ADD PRIMARY KEY (`Nome_Sottoclasse`,`Livello_Sottoclasse`,`Nome_Capacita`),
  ADD UNIQUE KEY `ID_Impara_Sottoclasse_IND` (`Nome_Sottoclasse`,`Livello_Sottoclasse`,`Nome_Capacita`),
  ADD KEY `FKImp_CAP_IND` (`Nome_Capacita`);

--
-- Indici per le tabelle `incantesimo`
--
ALTER TABLE `incantesimo`
  ADD PRIMARY KEY (`Nome`),
  ADD UNIQUE KEY `ID_INCANTESIMO_IND` (`Nome`),
  ADD KEY `FKSblocca_Mago_IND` (`ID_Mago`),
  ADD KEY `FKSblocca_Bardo_IND` (`ID_Bardo`);

--
-- Indici per le tabelle `ladro`
--
ALTER TABLE `ladro`
  ADD PRIMARY KEY (`ID_Ladro`),
  ADD UNIQUE KEY `ID_LADRO_IND` (`ID_Ladro`),
  ADD KEY `FKScelta_Ladro_IND` (`Nome_Classe`,`Livello_Classe`);

--
-- Indici per le tabelle `lancia_bardo`
--
ALTER TABLE `lancia_bardo`
  ADD PRIMARY KEY (`ID_Bardo`,`Livello_Slot`),
  ADD UNIQUE KEY `ID_Lancia_Bardo_IND` (`ID_Bardo`,`Livello_Slot`),
  ADD KEY `FKLan_SLO_1_IND` (`Livello_Slot`);

--
-- Indici per le tabelle `lancia_mago`
--
ALTER TABLE `lancia_mago`
  ADD PRIMARY KEY (`ID_Mago`,`Livello_Slot`),
  ADD UNIQUE KEY `ID_Lancia_Mago_IND` (`ID_Mago`,`Livello_Slot`),
  ADD KEY `FKLan_SLO_IND` (`Livello_Slot`);

--
-- Indici per le tabelle `lingue`
--
ALTER TABLE `lingue`
  ADD PRIMARY KEY (`Nome`),
  ADD UNIQUE KEY `ID_LINGUE_IND` (`Nome`);

--
-- Indici per le tabelle `lingue_aggiuntive`
--
ALTER TABLE `lingue_aggiuntive`
  ADD PRIMARY KEY (`Nome_Lingua`,`Nome_Origine`),
  ADD UNIQUE KEY `ID_Lingue_Aggiuntive_IND` (`Nome_Lingua`,`Nome_Origine`),
  ADD KEY `FKLin_ORI_IND` (`Nome_Origine`);

--
-- Indici per le tabelle `lingue_conosciute`
--
ALTER TABLE `lingue_conosciute`
  ADD PRIMARY KEY (`Nome_Lingua`,`ID_Personaggio`),
  ADD UNIQUE KEY `ID_Lingue_Conosciute_IND` (`Nome_Lingua`,`ID_Personaggio`),
  ADD KEY `FKLin_PER_IND` (`ID_Personaggio`);

--
-- Indici per le tabelle `lingue_della_razza`
--
ALTER TABLE `lingue_della_razza`
  ADD PRIMARY KEY (`Nome_Lingua`,`Nome_Razza`),
  ADD UNIQUE KEY `ID_Lingue_della_Razza_IND` (`Nome_Lingua`,`Nome_Razza`),
  ADD KEY `FKLin_RAZ_IND` (`Nome_Razza`);

--
-- Indici per le tabelle `mago`
--
ALTER TABLE `mago`
  ADD PRIMARY KEY (`ID_Mago`),
  ADD UNIQUE KEY `ID_MAGO_IND` (`ID_Mago`),
  ADD KEY `FKScelta_Mago_IND` (`Nome_Classe`,`Livello_Classe`);

--
-- Indici per le tabelle `oggetti_dell_origine`
--
ALTER TABLE `oggetti_dell_origine`
  ADD PRIMARY KEY (`Nome_Oggetto`,`Nome_Origine`),
  ADD UNIQUE KEY `ID_Oggetti_dell_Origine_IND` (`Nome_Oggetto`,`Nome_Origine`),
  ADD KEY `FKOgg_ORI_IND` (`Nome_Oggetto`),
  ADD KEY `FKOgg_ORI_FK` (`Nome_Origine`);

--
-- Indici per le tabelle `oggetti_di_classe`
--
ALTER TABLE `oggetti_di_classe`
  ADD PRIMARY KEY (`Nome_Oggetto`,`Nome_Classe`,`Livello_Classe`),
  ADD UNIQUE KEY `ID_Oggetti_di_Classe_IND` (`Nome_Oggetto`,`Nome_Classe`,`Livello_Classe`),
  ADD KEY `FKOgg_CLA_IND` (`Nome_Classe`,`Livello_Classe`);

--
-- Indici per le tabelle `oggetto`
--
ALTER TABLE `oggetto`
  ADD PRIMARY KEY (`Nome`),
  ADD UNIQUE KEY `ID_OGGETTO_IND` (`Nome`);

--
-- Indici per le tabelle `origine`
--
ALTER TABLE `origine`
  ADD PRIMARY KEY (`Nome`),
  ADD UNIQUE KEY `ID_ORIGINE_IND` (`Nome`),
  ADD KEY `FKConcede_IND` (`Con_Nome`);

--
-- Indici per le tabelle `origine_migliora`
--
ALTER TABLE `origine_migliora`
  ADD PRIMARY KEY (`Nome_Abilita`,`Nome_Origine`),
  ADD UNIQUE KEY `ID_Origine_Migliora_IND` (`Nome_Abilita`,`Nome_Origine`),
  ADD KEY `FKOri_ORI_IND` (`Nome_Origine`);

--
-- Indici per le tabelle `personaggio`
--
ALTER TABLE `personaggio`
  ADD PRIMARY KEY (`ID_Personaggio`),
  ADD UNIQUE KEY `ID_PERSONAGGIO_IND` (`ID_Personaggio`),
  ADD KEY `FKPossiede_IND` (`ID_Utente`),
  ADD KEY `FKHa_Origine_IND` (`Nome_Origine`),
  ADD KEY `FKEquipaggia_armatura_IND` (`Armatura_Equipaggiata`),
  ADD KEY `FKEquipaggia_arma_IND` (`Arma_Equipaggiata`),
  ADD KEY `FKCaratterizza_IND` (`Nome_Allineamento`),
  ADD KEY `FKAppartiene_IND` (`Nome_Razza`),
  ADD KEY `FKTiene_IND` (`ID_Borsa`);

--
-- Indici per le tabelle `possiede`
--
ALTER TABLE `possiede`
  ADD PRIMARY KEY (`ID_Utente`,`ID_Personaggio`),
  ADD KEY `ID_Utente` (`ID_Utente`,`ID_Personaggio`);

--
-- Indici per le tabelle `privilegio`
--
ALTER TABLE `privilegio`
  ADD PRIMARY KEY (`Nome`),
  ADD UNIQUE KEY `ID_PRIVILEGIO_IND` (`Nome`);

--
-- Indici per le tabelle `proprieta`
--
ALTER TABLE `proprieta`
  ADD PRIMARY KEY (`Nome`),
  ADD UNIQUE KEY `ID_PROPRIETA_IND` (`Nome`);

--
-- Indici per le tabelle `proprieta_arma`
--
ALTER TABLE `proprieta_arma`
  ADD PRIMARY KEY (`Nome_Proprieta`,`Nome_Arma`),
  ADD UNIQUE KEY `ID_Proprieta_Arma_IND` (`Nome_Proprieta`,`Nome_Arma`),
  ADD KEY `FKPro_PRO_IND` (`Nome_Proprieta`),
  ADD KEY `FKPro_OGG` (`Nome_Arma`);

--
-- Indici per le tabelle `razza`
--
ALTER TABLE `razza`
  ADD PRIMARY KEY (`Nome`),
  ADD UNIQUE KEY `ID_RAZZA_IND` (`Nome`);

--
-- Indici per le tabelle `sblocca_bardo`
--
ALTER TABLE `sblocca_bardo`
  ADD PRIMARY KEY (`Nome_Incantesimo`,`ID_Bardo`),
  ADD KEY `ID_Bardo` (`ID_Bardo`,`Nome_Incantesimo`);

--
-- Indici per le tabelle `sblocca_mago`
--
ALTER TABLE `sblocca_mago`
  ADD PRIMARY KEY (`Nome_Incantesimo`,`ID_Mago`),
  ADD KEY `ID_Mago` (`ID_Mago`,`Nome_Incantesimo`);

--
-- Indici per le tabelle `scelta_barbaro`
--
ALTER TABLE `scelta_barbaro`
  ADD PRIMARY KEY (`Nome_Classe`,`Livello_Classe`,`ID_Barbaro`),
  ADD KEY `Nome_Classe` (`Nome_Classe`,`Livello_Classe`,`ID_Barbaro`);

--
-- Indici per le tabelle `scelta_bardo`
--
ALTER TABLE `scelta_bardo`
  ADD PRIMARY KEY (`Nome_Classe`,`Livello_Classe`,`ID_Bardo`),
  ADD KEY `Nome_Classe` (`Nome_Classe`,`Livello_Classe`,`ID_Bardo`);

--
-- Indici per le tabelle `scelta_classe`
--
ALTER TABLE `scelta_classe`
  ADD PRIMARY KEY (`Nome_Classe`,`Livello_Classe`,`ID_Personaggio`),
  ADD UNIQUE KEY `ID_Scelta_Classe_IND` (`Nome_Classe`,`Livello_Classe`,`ID_Personaggio`),
  ADD KEY `FKSce_PER_1_IND` (`ID_Personaggio`);

--
-- Indici per le tabelle `scelta_ladro`
--
ALTER TABLE `scelta_ladro`
  ADD PRIMARY KEY (`Nome_Classe`,`Livello_Classe`,`ID_Ladro`),
  ADD KEY `Nome_Classe` (`Nome_Classe`,`Livello_Classe`,`ID_Ladro`);

--
-- Indici per le tabelle `scelta_mago`
--
ALTER TABLE `scelta_mago`
  ADD PRIMARY KEY (`Nome_Classe`,`Livello_Classe`,`ID_Mago`),
  ADD KEY `Nome_Classe` (`Nome_Classe`,`Livello_Classe`,`ID_Mago`);

--
-- Indici per le tabelle `scelta_sottoclasse`
--
ALTER TABLE `scelta_sottoclasse`
  ADD PRIMARY KEY (`Nome_Sottoclasse`,`Livello_Sottoclasse`,`ID_Personaggio`),
  ADD UNIQUE KEY `ID_Scelta_Sottoclasse_IND` (`Nome_Sottoclasse`,`Livello_Sottoclasse`,`ID_Personaggio`),
  ADD KEY `FKSce_PER_IND` (`ID_Personaggio`);

--
-- Indici per le tabelle `slot_incantesimo`
--
ALTER TABLE `slot_incantesimo`
  ADD PRIMARY KEY (`Livello_Slot`),
  ADD UNIQUE KEY `ID_SLOT_INCANTESIMO_IND` (`Livello_Slot`);

--
-- Indici per le tabelle `sottoclasse`
--
ALTER TABLE `sottoclasse`
  ADD PRIMARY KEY (`Nome`,`Livello`),
  ADD UNIQUE KEY `ID_SOTTOCLASSE_IND` (`Nome`,`Livello`),
  ADD KEY `FKSpecializzazione_IND` (`Spe_Nome`,`Spe_Livello`);

--
-- Indici per le tabelle `sottorazza`
--
ALTER TABLE `sottorazza`
  ADD PRIMARY KEY (`Nome`),
  ADD UNIQUE KEY `ID_SOTTORAZZA_IND` (`Nome`),
  ADD KEY `FKIdentifica_IND` (`Ind_Nome`);

--
-- Indici per le tabelle `specializzazione`
--
ALTER TABLE `specializzazione`
  ADD PRIMARY KEY (`Nome_Classe`,`Livello_Classe`,`Nome_Sottoclasse`,`Livello_Sottoclasse`),
  ADD KEY `Nome_Classe` (`Nome_Classe`,`Livello_Classe`,`Nome_Sottoclasse`,`Livello_Sottoclasse`);

--
-- Indici per le tabelle `tiene`
--
ALTER TABLE `tiene`
  ADD PRIMARY KEY (`ID_Personaggio`,`ID_Borsa`),
  ADD KEY `ID_Personaggio` (`ID_Personaggio`,`ID_Borsa`);

--
-- Indici per le tabelle `tiri_salvezza_personaggio`
--
ALTER TABLE `tiri_salvezza_personaggio`
  ADD PRIMARY KEY (`Nome_Caratteristica`,`ID_Personaggio`),
  ADD UNIQUE KEY `ID_Tiri_Salvezza_Personaggio_IND` (`Nome_Caratteristica`,`ID_Personaggio`),
  ADD KEY `FKTir_PER_IND` (`ID_Personaggio`);

--
-- Indici per le tabelle `tiro_salvezza`
--
ALTER TABLE `tiro_salvezza`
  ADD PRIMARY KEY (`Nome_Caratteristica`),
  ADD UNIQUE KEY `ID_TIRO_SALVEZZA_IND` (`Nome_Caratteristica`);

--
-- Indici per le tabelle `tratti_della_razza`
--
ALTER TABLE `tratti_della_razza`
  ADD PRIMARY KEY (`Nome_Razza`,`Nome_Tratto`),
  ADD UNIQUE KEY `ID_Tratti_della_Razza_IND` (`Nome_Razza`,`Nome_Tratto`),
  ADD KEY `FKTra_RAZ_IND` (`Nome_Tratto`);

--
-- Indici per le tabelle `tratti_della_sottorazza`
--
ALTER TABLE `tratti_della_sottorazza`
  ADD PRIMARY KEY (`Nome_Sottorazza`,`Nome_Tratto`),
  ADD UNIQUE KEY `ID_Tratti_della_Sottorazza_IND` (`Nome_Sottorazza`,`Nome_Tratto`),
  ADD KEY `FKTra_TRA_IND` (`Nome_Tratto`);

--
-- Indici per le tabelle `tratti_razziali`
--
ALTER TABLE `tratti_razziali`
  ADD PRIMARY KEY (`Nome`),
  ADD UNIQUE KEY `ID_TRATTI_RAZZIALI_IND` (`Nome`);

--
-- Indici per le tabelle `utente`
--
ALTER TABLE `utente`
  ADD PRIMARY KEY (`ID_Utente`),
  ADD UNIQUE KEY `ID_UTENTE_IND` (`ID_Utente`),
  ADD KEY `Password` (`Password`,`E_mail`);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `abilita_personaggio`
--
ALTER TABLE `abilita_personaggio`
  ADD CONSTRAINT `FKAbi_ABI_FK` FOREIGN KEY (`Nome_Abilita`) REFERENCES `abilita` (`Nome`),
  ADD CONSTRAINT `FKAbi_PER` FOREIGN KEY (`ID_Personaggio`) REFERENCES `personaggio` (`ID_Personaggio`);

--
-- Limiti per la tabella `barbaro`
--
ALTER TABLE `barbaro`
  ADD CONSTRAINT `FKScelta_Barbaro_FK` FOREIGN KEY (`Nome_Classe`,`Livello_Classe`) REFERENCES `classe` (`Nome`, `Livello`);

--
-- Limiti per la tabella `bardo`
--
ALTER TABLE `bardo`
  ADD CONSTRAINT `FKScelta_Bardo_FK` FOREIGN KEY (`Nome_Classe`,`Livello_Classe`) REFERENCES `classe` (`Nome`, `Livello`);

--
-- Limiti per la tabella `borsa`
--
ALTER TABLE `borsa`
  ADD CONSTRAINT `FKTiene_FK` FOREIGN KEY (`ID_Personaggio`) REFERENCES `personaggio` (`ID_Personaggio`);

--
-- Limiti per la tabella `classe_migliora`
--
ALTER TABLE `classe_migliora`
  ADD CONSTRAINT `FKCla_ABI` FOREIGN KEY (`Nome_Abilita`) REFERENCES `abilita` (`Nome`),
  ADD CONSTRAINT `FKCla_CLA_FK` FOREIGN KEY (`Nome_Classe`,`Livello_Classe`) REFERENCES `classe` (`Nome`, `Livello`);

--
-- Limiti per la tabella `competenza`
--
ALTER TABLE `competenza`
  ADD CONSTRAINT `FKCom_CLA_3_FK` FOREIGN KEY (`Nome_Classe`,`Livello_Classe`) REFERENCES `classe` (`Nome`, `Livello`),
  ADD CONSTRAINT `FKCom_TIR` FOREIGN KEY (`Nome_TiroSalvezza`) REFERENCES `tiro_salvezza` (`Nome_Caratteristica`);

--
-- Limiti per la tabella `competenza_della_classe_in_armature`
--
ALTER TABLE `competenza_della_classe_in_armature`
  ADD CONSTRAINT `FKCom_CLA_2_FK` FOREIGN KEY (`Nome_Classe`,`Livello_Classe`) REFERENCES `classe` (`Nome`, `Livello`),
  ADD CONSTRAINT `FKCom_OGG_2` FOREIGN KEY (`Nome_Armatura`) REFERENCES `oggetto` (`Nome`);

--
-- Limiti per la tabella `competenza_della_classe_in_armi`
--
ALTER TABLE `competenza_della_classe_in_armi`
  ADD CONSTRAINT `FKCom_CLA_1_FK` FOREIGN KEY (`Nome_Classe`,`Livello_Classe`) REFERENCES `classe` (`Nome`, `Livello`),
  ADD CONSTRAINT `FKCom_OGG_1` FOREIGN KEY (`Nome_Arma`) REFERENCES `oggetto` (`Nome`);

--
-- Limiti per la tabella `competenza_della_classe_in_strumenti`
--
ALTER TABLE `competenza_della_classe_in_strumenti`
  ADD CONSTRAINT `FKCom_CLA_FK` FOREIGN KEY (`Nome_Classe`,`Livello_Classe`) REFERENCES `classe` (`Nome`, `Livello`),
  ADD CONSTRAINT `FKCom_OGG` FOREIGN KEY (`Nome_Strumento`) REFERENCES `oggetto` (`Nome`);

--
-- Limiti per la tabella `competenza_dell_origine_in_strumenti`
--
ALTER TABLE `competenza_dell_origine_in_strumenti`
  ADD CONSTRAINT `FKCom_OGG_3` FOREIGN KEY (`Nome_Strumento`) REFERENCES `oggetto` (`Nome`),
  ADD CONSTRAINT `FKCom_ORI_FK` FOREIGN KEY (`Nome_Origine`) REFERENCES `origine` (`Nome`);

--
-- Limiti per la tabella `competenze_abilita`
--
ALTER TABLE `competenze_abilita`
  ADD CONSTRAINT `FKCom_ABI` FOREIGN KEY (`Nome_Abilita`) REFERENCES `abilita` (`Nome`),
  ADD CONSTRAINT `FKCom_PER_FK` FOREIGN KEY (`ID_Personaggio`) REFERENCES `personaggio` (`ID_Personaggio`);

--
-- Limiti per la tabella `conosce`
--
ALTER TABLE `conosce`
  ADD CONSTRAINT `FKCon_INC` FOREIGN KEY (`Nome_Incantesimo`) REFERENCES `incantesimo` (`Nome`),
  ADD CONSTRAINT `FKCon_PER_FK` FOREIGN KEY (`ID_Personaggio`) REFERENCES `personaggio` (`ID_Personaggio`);

--
-- Limiti per la tabella `contiene`
--
ALTER TABLE `contiene`
  ADD CONSTRAINT `FKCon_BOR_FK` FOREIGN KEY (`ID_Borsa`) REFERENCES `borsa` (`ID_Borsa`),
  ADD CONSTRAINT `FKCon_OGG` FOREIGN KEY (`Nome_Oggetto`) REFERENCES `oggetto` (`Nome`);

--
-- Limiti per la tabella `impara_classe`
--
ALTER TABLE `impara_classe`
  ADD CONSTRAINT `FKImp_CAP_1_FK` FOREIGN KEY (`Nome_Capacita`) REFERENCES `capacita_di_classe` (`Nome`),
  ADD CONSTRAINT `FKImp_CLA` FOREIGN KEY (`Nome_Classe`,`Livello_Classe`) REFERENCES `classe` (`Nome`, `Livello`);

--
-- Limiti per la tabella `impara_sottoclasse`
--
ALTER TABLE `impara_sottoclasse`
  ADD CONSTRAINT `FKImp_CAP_FK` FOREIGN KEY (`Nome_Capacita`) REFERENCES `capacita_di_sottoclasse` (`Nome`),
  ADD CONSTRAINT `FKImp_SOT` FOREIGN KEY (`Nome_Sottoclasse`,`Livello_Sottoclasse`) REFERENCES `sottoclasse` (`Nome`, `Livello`);

--
-- Limiti per la tabella `incantesimo`
--
ALTER TABLE `incantesimo`
  ADD CONSTRAINT `FKSblocca_Bardo_FK` FOREIGN KEY (`ID_Bardo`) REFERENCES `bardo` (`ID_Bardo`),
  ADD CONSTRAINT `FKSblocca_Mago_FK` FOREIGN KEY (`ID_Mago`) REFERENCES `mago` (`ID_Mago`);

--
-- Limiti per la tabella `ladro`
--
ALTER TABLE `ladro`
  ADD CONSTRAINT `FKScelta_Ladro_FK` FOREIGN KEY (`Nome_Classe`,`Livello_Classe`) REFERENCES `classe` (`Nome`, `Livello`);

--
-- Limiti per la tabella `lancia_bardo`
--
ALTER TABLE `lancia_bardo`
  ADD CONSTRAINT `FKLan_BAR` FOREIGN KEY (`ID_Bardo`) REFERENCES `bardo` (`ID_Bardo`),
  ADD CONSTRAINT `FKLan_SLO_1_FK` FOREIGN KEY (`Livello_Slot`) REFERENCES `slot_incantesimo` (`Livello_Slot`);

--
-- Limiti per la tabella `lancia_mago`
--
ALTER TABLE `lancia_mago`
  ADD CONSTRAINT `FKLan_MAG` FOREIGN KEY (`ID_Mago`) REFERENCES `mago` (`ID_Mago`),
  ADD CONSTRAINT `FKLan_SLO_FK` FOREIGN KEY (`Livello_Slot`) REFERENCES `slot_incantesimo` (`Livello_Slot`);

--
-- Limiti per la tabella `lingue_aggiuntive`
--
ALTER TABLE `lingue_aggiuntive`
  ADD CONSTRAINT `FKLin_LIN_2` FOREIGN KEY (`Nome_Lingua`) REFERENCES `lingue` (`Nome`),
  ADD CONSTRAINT `FKLin_ORI_FK` FOREIGN KEY (`Nome_Origine`) REFERENCES `origine` (`Nome`);

--
-- Limiti per la tabella `lingue_conosciute`
--
ALTER TABLE `lingue_conosciute`
  ADD CONSTRAINT `FKLin_LIN_1` FOREIGN KEY (`Nome_Lingua`) REFERENCES `lingue` (`Nome`),
  ADD CONSTRAINT `FKLin_PER_FK` FOREIGN KEY (`ID_Personaggio`) REFERENCES `personaggio` (`ID_Personaggio`);

--
-- Limiti per la tabella `lingue_della_razza`
--
ALTER TABLE `lingue_della_razza`
  ADD CONSTRAINT `FKLin_LIN` FOREIGN KEY (`Nome_Lingua`) REFERENCES `lingue` (`Nome`),
  ADD CONSTRAINT `FKLin_RAZ_FK` FOREIGN KEY (`Nome_Razza`) REFERENCES `razza` (`Nome`);

--
-- Limiti per la tabella `mago`
--
ALTER TABLE `mago`
  ADD CONSTRAINT `FKScelta_Mago_FK` FOREIGN KEY (`Nome_Classe`,`Livello_Classe`) REFERENCES `classe` (`Nome`, `Livello`);

--
-- Limiti per la tabella `oggetti_dell_origine`
--
ALTER TABLE `oggetti_dell_origine`
  ADD CONSTRAINT `FKOgg_OGG_1` FOREIGN KEY (`Nome_Oggetto`) REFERENCES `oggetto` (`Nome`),
  ADD CONSTRAINT `FKOgg_ORI_FK` FOREIGN KEY (`Nome_Origine`) REFERENCES `origine` (`Nome`);

--
-- Limiti per la tabella `oggetti_di_classe`
--
ALTER TABLE `oggetti_di_classe`
  ADD CONSTRAINT `FKOgg_CLA_FK` FOREIGN KEY (`Nome_Classe`,`Livello_Classe`) REFERENCES `classe` (`Nome`, `Livello`),
  ADD CONSTRAINT `FKOgg_OGG` FOREIGN KEY (`Nome_Oggetto`) REFERENCES `oggetto` (`Nome`);

--
-- Limiti per la tabella `origine`
--
ALTER TABLE `origine`
  ADD CONSTRAINT `FKConcede_FK` FOREIGN KEY (`Con_Nome`) REFERENCES `privilegio` (`Nome`);

--
-- Limiti per la tabella `origine_migliora`
--
ALTER TABLE `origine_migliora`
  ADD CONSTRAINT `FKOri_ABI` FOREIGN KEY (`Nome_Abilita`) REFERENCES `abilita` (`Nome`),
  ADD CONSTRAINT `FKOri_ORI_FK` FOREIGN KEY (`Nome_Origine`) REFERENCES `origine` (`Nome`);

--
-- Limiti per la tabella `personaggio`
--
ALTER TABLE `personaggio`
  ADD CONSTRAINT `FKAppartiene_FK` FOREIGN KEY (`Nome_Razza`) REFERENCES `razza` (`Nome`),
  ADD CONSTRAINT `FKCaratterizza_FK` FOREIGN KEY (`Nome_Allineamento`) REFERENCES `allineamento` (`Nome`),
  ADD CONSTRAINT `FKEquipaggia_arma_FK` FOREIGN KEY (`Arma_Equipaggiata`) REFERENCES `oggetto` (`Nome`),
  ADD CONSTRAINT `FKEquipaggia_armatura_FK` FOREIGN KEY (`Armatura_Equipaggiata`) REFERENCES `oggetto` (`Nome`),
  ADD CONSTRAINT `FKHa_Origine_FK` FOREIGN KEY (`Nome_Origine`) REFERENCES `origine` (`Nome`),
  ADD CONSTRAINT `FKPossiede_FK` FOREIGN KEY (`ID_Utente`) REFERENCES `utente` (`ID_Utente`),
  ADD CONSTRAINT `FKTiene_FK`FOREIGN KEY (`ID_Borsa`) REFERENCES `borsa` (`ID_Borsa`);

--
-- Limiti per la tabella `proprieta_arma`
--
ALTER TABLE `proprieta_arma`
  ADD CONSTRAINT `FKPro_OGG` FOREIGN KEY (`Nome_Arma`) REFERENCES `oggetto` (`Nome`),
  ADD CONSTRAINT `FKPro_PRO_FK` FOREIGN KEY (`Nome_Proprieta`) REFERENCES `proprieta` (`Nome`);

--
-- Limiti per la tabella `scelta_classe`
--
ALTER TABLE `scelta_classe`
  ADD CONSTRAINT `FKSce_CLA` FOREIGN KEY (`Nome_Classe`,`Livello_Classe`) REFERENCES `classe` (`Nome`, `Livello`),
  ADD CONSTRAINT `FKSce_PER_1_FK` FOREIGN KEY (`ID_Personaggio`) REFERENCES `personaggio` (`ID_Personaggio`);

--
-- Limiti per la tabella `scelta_sottoclasse`
--
ALTER TABLE `scelta_sottoclasse`
  ADD CONSTRAINT `FKSce_PER_FK` FOREIGN KEY (`ID_Personaggio`) REFERENCES `personaggio` (`ID_Personaggio`),
  ADD CONSTRAINT `FKSce_SOT` FOREIGN KEY (`Nome_Sottoclasse`,`Livello_Sottoclasse`) REFERENCES `sottoclasse` (`Nome`, `Livello`);

--
-- Limiti per la tabella `sottoclasse`
--
ALTER TABLE `sottoclasse`
  ADD CONSTRAINT `FKSpecializzazione_FK` FOREIGN KEY (`Spe_Nome`,`Spe_Livello`) REFERENCES `classe` (`Nome`, `Livello`);

--
-- Limiti per la tabella `sottorazza`
--
ALTER TABLE `sottorazza`
  ADD CONSTRAINT `FKIdentifica_FK` FOREIGN KEY (`Ind_Nome`) REFERENCES `razza` (`Nome`);

--
-- Limiti per la tabella `tiri_salvezza_personaggio`
--
ALTER TABLE `tiri_salvezza_personaggio`
  ADD CONSTRAINT `FKTir_PER_FK` FOREIGN KEY (`ID_Personaggio`) REFERENCES `personaggio` (`ID_Personaggio`),
  ADD CONSTRAINT `FKTir_TIR` FOREIGN KEY (`Nome_Caratteristica`) REFERENCES `tiro_salvezza` (`Nome_Caratteristica`);

--
-- Limiti per la tabella `tratti_della_razza`
--
ALTER TABLE `tratti_della_razza`
  ADD CONSTRAINT `FKTra_RAZ_FK` FOREIGN KEY (`Nome_Razza`) REFERENCES `razza` (`Nome`),
  ADD CONSTRAINT `FKTra_TRA_1` FOREIGN KEY (`Nome_Tratto`) REFERENCES `tratti_razziali` (`Nome`);

--
-- Limiti per la tabella `tratti_della_sottorazza`
--
ALTER TABLE `tratti_della_sottorazza`
  ADD CONSTRAINT `FKTra_SOT` FOREIGN KEY (`Nome_Sottorazza`) REFERENCES `sottorazza` (`Nome`),
  ADD CONSTRAINT `FKTra_TRA_FK` FOREIGN KEY (`Nome_Tratto`) REFERENCES `tratti_razziali` (`Nome`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
