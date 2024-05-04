-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 04, 2024 alle 13:02
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dnd_character_manager`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `abilita`
--

CREATE TABLE `abilita` (
  `Nome` varchar(20) NOT NULL,
  `Caratteristica_Associata` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `abilita`
--

INSERT INTO `abilita` (`Nome`, `Caratteristica_Associata`) VALUES
('Acrobazia', 'Destrezza'),
('Addestrare Animali', 'Saggezza'),
('Arcano', 'Intelligenza'),
('Atletica', 'Forza'),
('Furtività', 'Destrezza'),
('Indagare', 'Intelligenza'),
('Inganno', 'Carisma'),
('Intimidire', 'Carisma'),
('Intrattenere', 'Carisma'),
('Intuizione', 'Saggezza'),
('Medicina', 'Saggezza'),
('Natura', 'Intelligenza'),
('Percezione', 'Saggezza'),
('Persuasione', 'Carisma'),
('Rapidità Di Mano', 'Destrezza'),
('Religione', 'Intelligenza'),
('Sopravvivenza', 'Saggezza'),
('Storia', 'Intelligenza');

-- --------------------------------------------------------

--
-- Struttura della tabella `abilita_personaggio`
--

CREATE TABLE `abilita_personaggio` (
  `ID_Personaggio` int(11) NOT NULL,
  `Nome_Abilita` varchar(20) NOT NULL,
  `Valore` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `allineamento`
--

CREATE TABLE `allineamento` (
  `Nome` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `allineamento`
--

INSERT INTO `allineamento` (`Nome`) VALUES
('Caotico Buono'),
('Caotico Malvagio'),
('Caotico Neutrale'),
('Legale Buono'),
('Legale Malvagio'),
('Legale Neutrale'),
('Neutrale'),
('Neutrale Buono'),
('Neutrale Malvagio');

-- --------------------------------------------------------

--
-- Struttura della tabella `appartiene`
--

CREATE TABLE `appartiene` (
  `ID_Personaggio` int(11) NOT NULL,
  `Nome_Razza` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `barbaro`
--

CREATE TABLE `barbaro` (
  `ID_Barbaro` int(11) NOT NULL,
  `Utilizzi_Rabbia_Giornalieri` int(11) NOT NULL,
  `Bonus_Rabbia` int(11) NOT NULL,
  `Nome_Classe` varchar(20) NOT NULL,
  `Livello_Classe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `bardo`
--

CREATE TABLE `bardo` (
  `ID_Bardo` int(11) NOT NULL,
  `Dado_Ispirazione_Bardica` varchar(20) NOT NULL,
  `Nome_Classe` varchar(20) NOT NULL,
  `Livello_Classe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `borsa`
--

CREATE TABLE `borsa` (
  `ID_Borsa` int(11) NOT NULL,
  `ID_Personaggio` int(11) NOT NULL,
  `Peso_Trasportabile` int(11) NOT NULL,
  `Monete_Rame` int(11) NOT NULL,
  `Monete_Argento` int(11) NOT NULL,
  `Monete_Electrum` int(11) NOT NULL,
  `Monete_Oro` int(11) NOT NULL,
  `Monete_Platino` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `capacita_di_classe`
--

CREATE TABLE `capacita_di_classe` (
  `Nome` varchar(30) NOT NULL,
  `Descrizione` varchar(1000) NOT NULL,
  `Aum_Nome_Caratteristica` varchar(20) DEFAULT NULL,
  `Aum_Valore_Aggiuntivo` int(11) DEFAULT NULL,
  `Caratteristica_Incantatore` varchar(10) DEFAULT NULL,
  `Utilizzo_Giornaliero` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `capacita_di_sottoclasse`
--

CREATE TABLE `capacita_di_sottoclasse` (
  `Nome` varchar(30) NOT NULL,
  `Descrizione` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `caratterizza`
--

CREATE TABLE `caratterizza` (
  `Nome_Allineamento` varchar(20) NOT NULL,
  `ID_Personaggio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `classe`
--

CREATE TABLE `classe` (
  `Nome` varchar(20) NOT NULL,
  `Bonus_Competenza` int(11) NOT NULL,
  `Dado_Vita` varchar(20) NOT NULL,
  `Livello` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `classe_migliora`
--

CREATE TABLE `classe_migliora` (
  `Nome_Abilita` varchar(20) NOT NULL,
  `Nome_Classe` varchar(20) NOT NULL,
  `Livello_Classe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `competenza`
--

CREATE TABLE `competenza` (
  `Nome_Classe` varchar(20) NOT NULL,
  `Livello_Classe` int(11) NOT NULL,
  `Nome_TiroSalvezza` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `competenza_della_classe_in_armature`
--

CREATE TABLE `competenza_della_classe_in_armature` (
  `Nome_Armatura` varchar(30) NOT NULL,
  `Livello_Classe` int(11) NOT NULL,
  `Nome_Classe` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `competenza_della_classe_in_armi`
--

CREATE TABLE `competenza_della_classe_in_armi` (
  `Nome_Arma` varchar(30) NOT NULL,
  `Livello_Classe` int(11) NOT NULL,
  `Nome_Classe` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `competenza_della_classe_in_strumenti`
--

CREATE TABLE `competenza_della_classe_in_strumenti` (
  `Nome_Strumento` varchar(30) NOT NULL,
  `Livello_Classe` int(11) NOT NULL,
  `Nome_Classe` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `competenza_dell_origine_in_strumenti`
--

CREATE TABLE `competenza_dell_origine_in_strumenti` (
  `Nome_Origine` varchar(30) NOT NULL,
  `Nome_Strumento` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `competenze_abilita`
--

CREATE TABLE `competenze_abilita` (
  `Nome_Abilita` varchar(20) NOT NULL,
  `ID_Personaggio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `concede`
--

CREATE TABLE `concede` (
  `Nome_Origine` varchar(30) NOT NULL,
  `Nome_Privilegio` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `conosce`
--

CREATE TABLE `conosce` (
  `Nome_Incantesimo` varchar(30) NOT NULL,
  `ID_Personaggio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `contiene`
--

CREATE TABLE `contiene` (
  `ID_Borsa` int(11) NOT NULL,
  `Nome_Oggetto` varchar(30) NOT NULL,
  `Quantita` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `equipaggia_arma`
--

CREATE TABLE `equipaggia_arma` (
  `Nome_Arma` varchar(30) NOT NULL,
  `ID_Personaggio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `equipaggia_armatura`
--

CREATE TABLE `equipaggia_armatura` (
  `Nome_Armatura` varchar(30) NOT NULL,
  `ID_Personaggio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `ha_origine`
--

CREATE TABLE `ha_origine` (
  `Nome_Origine` varchar(30) NOT NULL,
  `ID_Personaggio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `identifica`
--

CREATE TABLE `identifica` (
  `Nome_Razza` varchar(20) NOT NULL,
  `Nome_Sottorazza` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `impara_classe`
--

CREATE TABLE `impara_classe` (
  `Nome_Capacita` varchar(30) NOT NULL,
  `Nome_Classe` varchar(20) NOT NULL,
  `Livello_Classe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `impara_sottoclasse`
--

CREATE TABLE `impara_sottoclasse` (
  `Nome_Capacita` varchar(30) NOT NULL,
  `Nome_Sottoclasse` varchar(30) NOT NULL,
  `Livello_Sottoclasse` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `incantesimo`
--

CREATE TABLE `incantesimo` (
  `Nome` varchar(30) NOT NULL,
  `Livello` int(11) NOT NULL,
  `Scuola` varchar(30) NOT NULL,
  `Tempo_di_Lancio` varchar(20) NOT NULL,
  `Distanza` varchar(20) NOT NULL,
  `Durata` varchar(20) NOT NULL,
  `Descrizione` varchar(200) NOT NULL,
  `Componenti` varchar(20) NOT NULL,
  `Rituale` tinyint(1) NOT NULL,
  `ID_Mago` int(11) DEFAULT NULL,
  `ID_Bardo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `ladro`
--

CREATE TABLE `ladro` (
  `ID_Ladro` int(11) NOT NULL,
  `Bonus_Attacco_Furtivo` varchar(10) NOT NULL,
  `Nome_Classe` varchar(20) NOT NULL,
  `Livello_Classe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `lancia_bardo`
--

CREATE TABLE `lancia_bardo` (
  `ID_Bardo` int(11) NOT NULL,
  `Livello_Slot` int(11) NOT NULL,
  `Quantita` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `lancia_mago`
--

CREATE TABLE `lancia_mago` (
  `ID_Mago` int(11) NOT NULL,
  `Livello_Slot` int(11) NOT NULL,
  `Quantita` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `lingue`
--

CREATE TABLE `lingue` (
  `Nome` varchar(20) NOT NULL,
  `Descrizione` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `lingue`
--

INSERT INTO `lingue` (`Nome`, `Descrizione`) VALUES
('Comune', 'Anche se gli umani sono gli utilizzatori tipici di questo linguaggio, è condiviso da molte razze e creature nel gioco. La maggior parte delle creature nei Forgotten Realms infatti parlano la stessa lingua.'),
('Elfico', 'Conosciuto come Elven, è la lingua degli elfi, molte razze hanno uno conoscenza basica del linguaggio degli elfi, dato che esistono molti poemi e canzoni famose scritte da bardi elfi.'),
('Gigantico', 'È la lingua parlata dai giganti, tra cui i giganti delle colline, i giganti di pietra, giganti del gelo, giganti del fuoco e dai giganti delle nuvole.\r\n\r\nIl linguaggio consiste in una varietà di dialetti che hanno alcune parole in comune tra loro. La lingua dei giganti è stata progettata per essere facile da imparare'),
('Gnomesco', 'La lingua degli gnomi è una lingua elaborata parlata dagli gnomi, una razza di piccoli umanoidi nel mondo del gioco.\r\n\r\nÈ una lingua abbastanza semplice che non presenta aspetti particolari. Tuttavia, alcune volte può tornare utile; un personaggio che la conosce può avere un vantaggio in alcune situazioni.'),
('Nanico', 'La lingua dei nani. È una delle più diffuse, visto che segue gli gnomi nei loro viaggi alla scoperta del mondo.\r\nL’aspetto più interessante è che è l’unico linguaggio di DnD con il proprio alfabeto runico. Per la maggior parte della razze è conosciuto come Dethek, che nel loro linguaggio significa lingua dei nani.'),
('Orchesco', 'Orchesco, anche conosciuto come Daraktan, era una lingua parlata e usata nella sua forma scritta dalla maggior parte degli orchi. Questa lingua si basava sull’alfabeto Dethek e derivava dal più antico linguaggio Hulgorkyn usato da altri orchi.');

-- --------------------------------------------------------

--
-- Struttura della tabella `lingue_aggiuntive`
--

CREATE TABLE `lingue_aggiuntive` (
  `Nome_Lingua` varchar(20) NOT NULL,
  `Nome_Origine` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `lingue_conosciute`
--

CREATE TABLE `lingue_conosciute` (
  `Nome_Lingua` varchar(20) NOT NULL,
  `ID_Personaggio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `lingue_della_razza`
--

CREATE TABLE `lingue_della_razza` (
  `Nome_Lingua` varchar(20) NOT NULL,
  `Nome_Razza` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `mago`
--

CREATE TABLE `mago` (
  `ID_Mago` int(11) NOT NULL,
  `Nome_Classe` varchar(20) NOT NULL,
  `Livello_Classe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `oggetti_dell_origine`
--

CREATE TABLE `oggetti_dell_origine` (
  `Nome_Oggetto` varchar(30) NOT NULL,
  `Nome_Origine` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `oggetti_di_classe`
--

CREATE TABLE `oggetti_di_classe` (
  `Nome_Oggetto` varchar(30) NOT NULL,
  `Livello_Classe` int(11) NOT NULL,
  `Nome_Classe` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `oggetto`
--

CREATE TABLE `oggetto` (
  `Peso` int(11) NOT NULL,
  `Valore` int(11) NOT NULL,
  `Nome` varchar(30) NOT NULL,
  `Descrizione` varchar(1000) DEFAULT NULL,
  `Contenuto` varchar(1000) DEFAULT NULL,
  `Danno` varchar(30) DEFAULT NULL,
  `Tipo_Danno` varchar(30) DEFAULT NULL,
  `Classe_Armatura` varchar(30) DEFAULT NULL,
  `Forza_Necessaria` int(11) DEFAULT NULL,
  `Svantaggio_Furtivita` tinyint(1) DEFAULT NULL,
  `Tipologia` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `oggetto`
--

INSERT INTO `oggetto` (`Peso`, `Valore`, `Nome`, `Descrizione`, `Contenuto`, `Danno`, `Tipo_Danno`, `Classe_Armatura`, `Forza_Necessaria`, `Svantaggio_Furtivita`, `Tipologia`) VALUES
(0, 500, 'Acquamarina', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(0, 100, 'Ametista', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1, 25, 'Arco Corto', NULL, NULL, '1d6', 'Perforante', NULL, NULL, NULL, 'Arma Semplice A DIstanza'),
(1, 50, 'Arco Lungo', NULL, NULL, '1d8', 'Perforante', NULL, NULL, NULL, 'Armi Marziali A DIstanza'),
(5, 10, 'Armatura Di Pelle', NULL, NULL, NULL, NULL, '11 + Destrezza', 0, 0, 'Armatura Leggera'),
(6, 45, 'Armatura Di Pelle Borchiata', NULL, NULL, NULL, NULL, '12 + Destrezza', 0, 0, 'Armatura Leggera'),
(4, 5, 'Armatura Imbottita', NULL, NULL, NULL, NULL, '11 + Destrezza', 0, 1, 'Armatura Leggera'),
(1, 5, 'Ascia', NULL, NULL, '1d6', 'Tagliente', NULL, NULL, NULL, 'Arma Semplice Ravvicinata'),
(0, 10, 'Azzurrite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 25, 'Balestra Leggera', NULL, NULL, '1d8', 'Perforante', NULL, NULL, NULL, 'Arma Semplice A Distanza'),
(8, 50, 'Balestra Pesante', NULL, NULL, '1d10', 'Perforante', NULL, NULL, NULL, 'Armi Marziali A DIstanza'),
(27, 200, 'Corazza', NULL, NULL, NULL, NULL, '17', 15, 1, 'Armatura Pesante'),
(20, 50, 'Corazza A Scaglie', NULL, NULL, NULL, NULL, '14 + Destrezza', 0, 1, 'Armatura Media'),
(9, 50, 'Cotta Di Maglia', NULL, NULL, NULL, NULL, '13 + Destrezza', 0, 0, 'Armatura Media'),
(1, 1, 'Dardo Balestra (20)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(0, 5000, 'Diamante', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(0, 0, 'Disco Di Pietra Multicolore', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1, 2, 'Flauto Dolce', NULL, 'Un Flauto dolce e la sua custodia', NULL, NULL, NULL, NULL, NULL, NULL),
(1, 1, 'Freccia (20)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(0, 100, 'Granato', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1, 5, 'Kit Erboristico', NULL, 'Questo kit contiene una serie di strumenti come forbici, mortaio e pestello, sacchetti e fiale utilizzati dagli erboristi per creare rimedi e pozioni.', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1500, 'Lacrime Di Mezza Notte', 'Una creatura che ingerisce questo veleno non subisce alcun effetto fino allo scoccare della mezzanotte. Se il veleno non è stato neutralizzato prima di allora, la creatura deve superare un tiro salvezza di Costituzione con DC 17, subendo 31 (9d6) danni da veleno in caso di fallimento del tiro salvezza, o la metà in caso di successo.', NULL, NULL, NULL, NULL, NULL, NULL, 'Ingerito'),
(1, 30, 'Lira', NULL, 'Una Lira e la sua custodia', NULL, NULL, NULL, NULL, NULL, NULL),
(24, 75, 'Maglia A Catena', NULL, NULL, NULL, NULL, '16', 13, 1, 'Armatura Pesante'),
(1, 15, 'Martello Da Guerra', NULL, NULL, '1d8', 'Contundente', NULL, NULL, NULL, 'Arma Marizale Ravvicinata'),
(0, 0, 'Maschera Scheggiata', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 5, 'Mazza', NULL, NULL, '1d6 ', 'Contundente', NULL, NULL, NULL, 'Arma Semplice Ravvicinata'),
(18, 750, 'Mezza Piastra', NULL, NULL, NULL, NULL, '15 + Destrezza', 0, 1, 'Armatura Media'),
(0, 0, 'Moneta Con Due Teste', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(0, 0, 'Occhio Di Vetro', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 400, 'Olio Di Taggit', 'Una creatura soggetta a questo veleno deve riuscire a superare un tiro salvezza di Costituzione con DC 13 o rimanere avvelenata per 24 ore. La creatura avvelenata è incosciente. La creatura si sveglia se subisce danni.', NULL, NULL, NULL, NULL, NULL, NULL, 'Contatto'),
(0, 5000, 'Opale', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(0, 0, 'Orologio Rotto', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(0, 10, 'Ossidiana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 40, 'Pacchetto Da Diplomatico', NULL, '2 custodie per mappe e pergamene, un set di abiti eleganti, una bottiglia d inchiostro, una penna a inchiostro, una lampada, 2 fiaschette d olio, 5 fogli di carta, una fiala di profumo, ceralacca e sa', NULL, NULL, NULL, NULL, NULL, NULL),
(5, 10, 'Pacchetto Da Esploratore', NULL, 'Uno zaino, una branda, un kit da mensa, un acciarino, 10 torce, 10 giorni di razioni e una pelle d acqua. Lo zaino ha anche 50 piedi di corda di canapa legati ai lati.', NULL, NULL, NULL, NULL, NULL, NULL),
(5, 19, 'Pacchetto Da Sacerdote', NULL, 'Uno zaino, una coperta, 10 candele, un acciarino, una cassetta per le elemosine, 2 blocchi di incenso, un incensiere, paramenti, 2 giorni di razioni e una pelle d acqua.', NULL, NULL, NULL, NULL, NULL, NULL),
(5, 16, 'Pacchetto Da Scassinatore', NULL, 'Uno zaino, un sacchetto con 1.000 cuscinetti a sfera, 3 metri di corda, una campana, 5 candele, un piede di porco, un martello, 10 chiodi, una lanterna con cappuccio, 2 fiaschette d olio, 5 giorni di ', NULL, NULL, NULL, NULL, NULL, NULL),
(0, 0, 'Paio Di Calzini Vecchi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(0, 100, 'Perla', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(0, 500, 'Perla Nera', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 1500, 'Piastre', NULL, NULL, NULL, NULL, '18', 15, 1, 'Armatura Pesante'),
(0, 0, 'Piede Di Coniglio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(0, 50, 'Pietra Di Luna', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(0, 0, 'Pietra Sferica', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 100, 'Pozione Della Scalata', 'Quando si beve questa pozione, si ottiene una velocità di arrampicata pari alla propria velocità di cammino per 1 ora. Durante questo periodo, si ha un vantaggio nelle prove di Forza (atletica) per arrampicarsi. La pozione è separata in strati marroni, argentati e grigi che assomigliano a bande di pietra. Agitando la bottiglia non si riesce a mescolare i colori.', NULL, NULL, NULL, NULL, NULL, NULL, 'Ingerito'),
(2, 1500, 'Pozione Della Taglia Gigante', 'Quando si beve questa pozione, si diventa Enormi per 24 ore se si è di taglia Media o inferiore, altrimenti la pozione non ha alcun effetto. Per questa durata, la vostra Forza diventa 25, se non è già più alta, e i vostri punti ferita massimi sono raddoppiati (i vostri punti ferita attuali sono raddoppiati quando bevete la pozione). Inoltre, la portata dei vostri attacchi in mischia aumenta di 3 metri.\r\nQuesta pozione è un liquido bianco pallido ricavato dalla lingua di una vongola gigante, con un aroma pungente simile a quello delle alghe in decomposizione. Tuttavia, quando viene consumata ha un sapore dolce.', NULL, NULL, NULL, NULL, NULL, NULL, 'Ingerito'),
(2, 100, 'Pozione Della Vitalità', 'Bevendo questa pozione si recuperano punti ferita. Il numero di punti ferita si rigenera di 4d4. A prescindere dalla potenza, il liquido rosso della pozione luccica quando viene agitato.', NULL, NULL, NULL, NULL, NULL, NULL, 'Ingerito'),
(2, 500, 'Pozione Di Volare', 'Quando si beve questa pozione, si acquisisce una velocità di volo pari alla velocità di camminata per 1 ora e ci si può librare. Se si è in aria quando la pozione si esaurisce, si cade a meno che non si abbia un altro mezzo per rimanere in volo. Il liquido chiaro di questa pozione galleggia in cima al contenitore e presenta impurità bianche e torbide.', NULL, NULL, NULL, NULL, NULL, NULL, 'Ingerito'),
(1, 2, 'Pugnale', NULL, NULL, '1d4 ', 'Perforante', NULL, NULL, NULL, 'Arma Semplice Ravvicinata'),
(0, 50, 'Quarzo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(0, 0, 'Rosa Di Corallo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(0, 1000, 'Rubino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 150, 'Sangue Dell Assassino', 'Una creatura soggetta a questo veleno deve effettuare un tiro salvezza di Costituzione a CC 10. Se il tiro salvezza fallisce, subisce 6 (1d12) danni da veleno ed è avvelenata per 24 ore. Se il tiro salvezza riesce, la creatura subisce metà dei danni e non viene avvelenata.', NULL, NULL, NULL, NULL, NULL, NULL, 'Ingerito'),
(0, 1, 'Set Di Carte Da Gioco', NULL, 'Contiene 52 carte da gioco', NULL, NULL, NULL, NULL, NULL, NULL),
(0, 1000, 'Smeraldo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 15, 'Spada Lunga', NULL, NULL, '1d8', 'Tagliente', NULL, NULL, NULL, 'Arma Marizale Ravvicinata'),
(3, 50, 'Spadone', NULL, NULL, '2d6', 'Tagliente', NULL, NULL, NULL, 'Arma Marizale Ravvicinata'),
(0, 500, 'Topazio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(0, 0, 'Topo Pietrificato', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(0, 10, 'Turchese', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 1, 'Utensili Da Cucina', NULL, 'Cose utili per cucinare', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 20, 'Utensili Da Fabbro', NULL, 'Cose utili per riparare armi ed armature', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 200, 'Veleno Di Serpente', 'Questo veleno deve essere raccolto da un serpente gigante velenoso morto o inabilitato. Una creatura soggetta a questo veleno deve riuscire a superare un tiro salvezza di Costituzione a DC 11, subendo 10 (3d6) danni da veleno se il tiro fallisce o la metà dei danni se riesce.', NULL, NULL, NULL, NULL, NULL, NULL, 'Lesione'),
(0, 1000, 'Zaffiro', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(0, 50, 'Zircone', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `origine`
--

CREATE TABLE `origine` (
  `Nome` varchar(30) NOT NULL,
  `Descrizione` varchar(1000) NOT NULL,
  `Nome_Privilegio` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `origine`
--

INSERT INTO `origine` (`Nome`, `Descrizione`, `Nome_Privilegio`) VALUES
('Accolito', 'Avete trascorso la vostra vita al servizio di un tempio di un dio specifico o di un pantheon di dei. Agite come intermediari tra il regno del sacro e il mondo mortale, eseguendo riti sacri e offrendo sacrifici per condurre gli adoratori alla presenza del divino. Non siete necessariamente un chierico: compiere riti sacri non è la stessa cosa che incanalare il potere divino.', 'Rifugio Dei Fedeli'),
('Archeologo', 'Un archeologo impara a conoscere le culture perdute e cadute del passato studiando i loro resti: le loro ossa, le loro rovine, i loro capolavori sopravvissuti e le loro tombe. Coloro che praticano l archeologia si recano negli angoli più remoti del mondo per scavare nelle città sbriciolate e nei sotterranei perduti, alla ricerca di manufatti che possano raccontare le storie di monarchi e sommi sacerdoti, guerre e cataclismi.\r\n', 'Conoscenze Storiche'),
('Cavaliere', 'Il cavalierato è uno dei titoli nobiliari più bassi nella maggior parte delle società, ma può essere un percorso verso uno status più elevato. Se desiderate diventare cavalieri, scegliete la caratteristica “Servitori” qui sotto invece della caratteristica “Posizione di privilegio”. Uno dei vostri servitori comuni viene sostituito da un nobile che funge da scudiero, aiutandovi in cambio dell addestramento per il proprio percorso cavalleresco. I due servitori rimanenti possono essere uno stalliere che si prende cura del vostro cavallo e un servitore che lucida la vostra armatura (e vi aiuta anche a indossarla).\r\nCome emblema della cavalleria e degli ideali dell amor cortese, potreste includere nel vostro equipaggiamento uno stendardo o un altro segno di un nobile signore o signora a cui avete donato il vostro cuore, in una sorta di casta devozione. (Questa persona potrebbe essere il vostro legame).\r\n', 'Posizione Di Privilegio'),
('Criminale', 'Siete un criminale esperto con un passato di violazione della legge. Avete trascorso molto tempo tra altri criminali e avete ancora contatti all interno della malavita. Siete molto più vicini della maggior parte delle persone al mondo degli omicidi, dei furti e della violenza che pervade il ventre della civiltà, e siete sopravvissuti fino a questo punto ignorando le regole e le norme della società.\r\n', 'Contatto Criminale'),
('Marinaio', 'Avete navigato per anni su una nave marittima. In quel periodo, avete affrontato tempeste possenti, mostri degli abissi e coloro che volevano affondare la vostra imbarcazione negli abissi più profondi. Il vostro primo amore è la linea lontana dell orizzonte, ma è arrivato il momento di cimentarvi in qualcosa di nuovo.', 'Passaggio In Nave');

-- --------------------------------------------------------

--
-- Struttura della tabella `origine_migliora`
--

CREATE TABLE `origine_migliora` (
  `Nome_Abilita` varchar(20) NOT NULL,
  `Nome_Origine` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `personaggio`
--

CREATE TABLE `personaggio` (
  `ID_Personaggio` int(11) NOT NULL,
  `Car_Forza` int(11) NOT NULL,
  `Car_Destrezza` int(11) NOT NULL,
  `Car_Costituzione` int(11) NOT NULL,
  `Car_Intelligenza` int(11) NOT NULL,
  `Car_Saggezza` int(11) NOT NULL,
  `Car_Carisma` int(11) NOT NULL,
  `Punti_Ferita` int(11) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `Descrizione_Aspetto` varchar(1000) NOT NULL,
  `Classe_Armatura` int(11) NOT NULL,
  `Iniziativa` int(11) NOT NULL,
  `Punti_Esperienza` int(11) NOT NULL,
  `ID_Utente` int(11) NOT NULL,
  `Nome_Origine` varchar(30) NOT NULL,
  `Armatura_Equipaggiata` varchar(30) NOT NULL,
  `Arma_Equipaggiata` varchar(30) NOT NULL,
  `Nome_Allineamento` varchar(30) NOT NULL,
  `Nome_Razza` varchar(20) NOT NULL,
  `ID_Borsa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `possiede`
--

CREATE TABLE `possiede` (
  `ID_Utente` int(11) NOT NULL,
  `ID_Personaggio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `privilegio`
--

CREATE TABLE `privilegio` (
  `Nome` varchar(30) NOT NULL,
  `Descrizione` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `privilegio`
--

INSERT INTO `privilegio` (`Nome`, `Descrizione`) VALUES
('Conoscenze Storiche', 'Quando si entra in una rovina o in un sotterraneo, si può accertare correttamente il suo scopo originario e determinare i suoi costruttori, siano essi nani, elfi, umani, yuan-ti o altre razze conosciute. Inoltre, è possibile determinare il valore monetario degli oggetti d arte che hanno più di un secolo.\r\n'),
('Contatto Criminale', 'Avete un contatto affidabile e fidato che funge da collegamento con una rete di altri criminali. Sapete come far arrivare i messaggi al vostro contatto, anche a grandi distanze; in particolare, conoscete i messaggeri locali, i padroni di carovane corrotti e gli squallidi marinai che possono consegnare i messaggi per voi.'),
('Passaggio In Nave', 'Quando ne avete bisogno, potete assicurarvi un passaggio gratuito su una nave a vela per voi e per i vostri compagni di avventura. Potreste navigare sulla nave su cui avete prestato servizio o su un altra nave con cui avete buoni rapporti (magari capitanata da un ex compagno di equipaggio). Poiché si tratta di un favore, non si può essere certi di un programma o di una rotta che soddisfi ogni esigenza. Il vostro DM determinerà il tempo necessario per arrivare dove dovete andare. In cambio del passaggio gratuito, voi e i vostri compagni siete tenuti ad assistere l equipaggio durante il viaggio.'),
('Posizione DI Privilegio', 'Grazie alla vostra nobile nascita, le persone sono inclini a pensare il meglio di voi. Siete i benvenuti nell alta società e la gente ritiene che abbiate il diritto di stare ovunque. La gente comune si sforza di accontentarvi e di evitare il vostro disappunto, e le altre persone di alto lignaggio vi trattano come membri della stessa sfera sociale. Se necessario, potete ottenere un udienza con un nobile locale.'),
('Rifugio Dei Fedeli', 'In qualità di accolito, puoi ottenere il rispetto di coloro che condividono la tua fede e puoi celebrare le cerimonie religiose della tua divinità. Tu e i tuoi compagni di avventura potete aspettarvi di ricevere cure e assistenza gratuita presso un tempio, un santuario o un altra presenza consolidata della tua fede, anche se dovrai fornire tutti i componenti materiali necessari per gli incantesimi. Coloro che condividono la vostra religione vi sosterranno (ma solo voi) con uno stile di vita modesto.');

-- --------------------------------------------------------

--
-- Struttura della tabella `proprieta`
--

CREATE TABLE `proprieta` (
  `Nome` varchar(30) NOT NULL,
  `Descrizione` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `proprieta`
--

INSERT INTO `proprieta` (`Nome`, `Descrizione`) VALUES
('A Due Mani', 'quest arma richiede due mani per essere usata. Questa proprietà è rilevante solo quando si attacca con l arma, non quando la si tiene semplicemente in mano.'),
('Caricare', 'A causa del tempo necessario per caricare quest arma, si può sparare con una sola munizione quando si usa un azione, un azione bonus o una reazione per sparare, indipendentemente dal numero di attacchi che si possono effettuare normalmente.'),
('Lanciare', 'se un arma ha la proprietà lanciare, è possibile lanciare l arma per effettuare un attacco a distanza. Se l arma è un arma da mischia, per il tiro di attacco e il tiro per i danni si utilizza lo stesso modificatore di abilità che si utilizzerebbe per un attacco in mischia con l arma. Ad esempio, se si lancia un ascia, si usa la Forza, ma se si lancia un pugnale, si può usare la Forza o la Destrezza, poiché il pugnale ha la proprietà finezza.'),
('Leggera', 'Un arma leggera è piccola e maneggevole, ideale per essere usata quando si combatte con due armi.'),
('Munizione', 'Si può utilizzare un arma con la proprietà munizioni per effettuare un attacco a distanza solo se si dispone di munizioni da sparare con l arma. Ogni volta che si attacca con l arma, si spende un pezzo di munizioni. Estrarre le munizioni da una faretra, da un astuccio o da un altro contenitore fa parte dell attacco. Il caricamento di un arma a una mano richiede una mano libera. Alla fine del combattimento, si può recuperare metà delle munizioni consumate impiegando un minuto per cercare sul camp'),
('Pesante', 'Le creature di taglia Piccola o Minuscola hanno svantaggio sui tiri per attaccare con le armi pesanti. Le dimensioni e l ingombro di un arma pesante la rendono troppo grande per essere usata efficacemente da una creatura Piccola o Minuscola.'),
('Portata', 'Un arma che può essere usata per effettuare un attacco a distanza ha una gittata indicata tra parentesi dopo la proprietà munizioni o lancio. La gittata riporta due numeri. Il primo è la gittata normale dell arma, espressa in piedi, mentre il secondo indica la gittata massima dell arma. Quando si attacca un bersaglio oltre la portata normale, si ha svantaggio sul tiro per colpire. Non è possibile attaccare un bersaglio oltre la portata massima dell arma.'),
('Precisione', 'Quando si effettua un attacco con un arma di precisione, si utilizza un modificatore di Forza o Destrezza a scelta per i tiri di attacco e di danno. È necessario utilizzare lo stesso modificatore per entrambi i tiri.'),
('Raggiungere', 'Quando si attacca con quest arma, il raggio d azione aumenta di 2 metri. Questa proprietà determina anche la portata per gli attacchi di opportunità con un arma a portata.'),
('Versatile', 'Quest arma può essere usata con una o due mani. La proprietà contiene un valore di danno tra parentesi: il danno quando l arma viene usata con due mani per effettuare un attacco in mischia.');

-- --------------------------------------------------------

--
-- Struttura della tabella `proprieta_arma`
--

CREATE TABLE `proprieta_arma` (
  `Nome_Proprieta` varchar(30) NOT NULL,
  `Nome_Arma` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `proprieta_arma`
--

INSERT INTO `proprieta_arma` (`Nome_Proprieta`, `Nome_Arma`) VALUES
('A Due Mani', 'Arco Corto'),
('A Due Mani', 'Arco Lungo'),
('A Due Mani', 'Balestra Leggera'),
('A Due Mani', 'Balestra Pesante'),
('A Due Mani', 'Spadone'),
('Caricare', 'Balestra Leggera'),
('Caricare', 'Balestra Pesante'),
('Lanciare', 'Ascia'),
('Lanciare', 'Pugnale'),
('Leggera', 'Ascia'),
('Leggera', 'Pugnale'),
('Munizione', 'Arco Corto'),
('Munizione', 'Arco Lungo'),
('Munizione', 'Balestra Leggera'),
('Munizione', 'Balestra Pesante'),
('Pesante', 'Arco Lungo'),
('Pesante', 'Balestra Pesante'),
('Pesante', 'Spadone'),
('Portata', 'Arco Corto'),
('Portata', 'Arco Lungo'),
('Portata', 'Balestra Leggera'),
('Portata', 'Balestra Pesante'),
('Precisione', 'Pugnale'),
('Versatile', 'Martello Da Guerra'),
('Versatile', 'Spada Lunga');

-- --------------------------------------------------------

--
-- Struttura della tabella `razza`
--

CREATE TABLE `razza` (
  `Descrizione` varchar(1000) NOT NULL,
  `Nome` varchar(20) NOT NULL,
  `Aum_Nome_Caratteristica` varchar(20) NOT NULL,
  `Aum_Valore_Aggiuntivo` int(11) NOT NULL,
  `Eta` int(11) NOT NULL,
  `Taglia` varchar(20) NOT NULL,
  `Velocita` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `razza`
--

INSERT INTO `razza` (`Descrizione`, `Nome`, `Aum_Nome_Caratteristica`, `Aum_Valore_Aggiuntivo`, `Eta`, `Taglia`, `Velocita`) VALUES
('Gli elfi sono un popolo magico e di grazia ultraterrena, che vive in luoghi di bellezza eterea, in mezzo ad antiche foreste o in guglie argentee che scintillano di luce fatata, dove una musica soave si diffonde nell aria e dolci fragranze aleggiano nella brezza. Gli elfi amano la natura e la magia, l arte e la maestria, la musica e la poesia.', 'Elfo', 'Destrezza', 2, 750, 'Media', '9m'),
('Regni ricchi di antica grandezza, sale scavate nelle radici delle montagne, l eco dei picconi e dei martelli nelle miniere profonde e nelle fucine ardenti, l impegno per il clan e la tradizione e l odio bruciante per i goblin e gli orchi: questi fili comuni uniscono tutti i nani.', 'Nano', 'Costituzione', 2, 350, 'Media', '9m'),
('Secondo i calcoli della maggior parte dei mondi, gli umani sono la più giovane delle razze comuni, arrivata tardi sulla scena del mondo e di breve durata rispetto a nani, elfi e draghi. Forse è a causa della loro vita più breve che si sforzano di ottenere quanto più possibile negli anni che gli vengono concessi. O forse sentono di avere qualcosa da dimostrare alle razze più anziane, ed è per questo che costruiscono i loro potenti imperi sulle basi della conquista e del commercio. Qualunque sia il motivo che li spinge, gli umani sono gli innovatori, i realizzatori e i pionieri dei mondi.\r\n', 'Umano', 'Intelligenza', 2, 85, 'Media', '9m');

-- --------------------------------------------------------

--
-- Struttura della tabella `sblocca_bardo`
--

CREATE TABLE `sblocca_bardo` (
  `ID_Bardo` int(11) NOT NULL,
  `Nome_Incantesimo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `sblocca_mago`
--

CREATE TABLE `sblocca_mago` (
  `ID_Mago` int(11) NOT NULL,
  `Nome_Incantesimo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `scelta_barbaro`
--

CREATE TABLE `scelta_barbaro` (
  `Nome_Classe` varchar(20) NOT NULL,
  `Livello_Classe` int(11) NOT NULL,
  `ID_Barbaro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `scelta_bardo`
--

CREATE TABLE `scelta_bardo` (
  `Nome_Classe` varchar(20) NOT NULL,
  `Livello_Classe` int(11) NOT NULL,
  `ID_Bardo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `scelta_classe`
--

CREATE TABLE `scelta_classe` (
  `Nome_Classe` varchar(20) NOT NULL,
  `Livello_Classe` int(11) NOT NULL,
  `ID_Personaggio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `scelta_ladro`
--

CREATE TABLE `scelta_ladro` (
  `Nome_Classe` varchar(20) NOT NULL,
  `Livello_Classe` int(11) NOT NULL,
  `ID_Ladro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `scelta_mago`
--

CREATE TABLE `scelta_mago` (
  `Nome_Classe` varchar(20) NOT NULL,
  `Livello_Classe` int(11) NOT NULL,
  `ID_Mago` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `scelta_sottoclasse`
--

CREATE TABLE `scelta_sottoclasse` (
  `ID_Personaggio` int(11) NOT NULL,
  `Nome_Sottoclasse` varchar(30) NOT NULL,
  `Livello_Sottoclasse` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `slot_incantesimo`
--

CREATE TABLE `slot_incantesimo` (
  `Livello_Slot` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `slot_incantesimo`
--

INSERT INTO `slot_incantesimo` (`Livello_Slot`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9);

-- --------------------------------------------------------

--
-- Struttura della tabella `sottoclasse`
--

CREATE TABLE `sottoclasse` (
  `Nome` varchar(30) NOT NULL,
  `Livello` int(11) NOT NULL,
  `Nome_Classe` varchar(20) NOT NULL,
  `Livello_Classe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `sottorazza`
--

CREATE TABLE `sottorazza` (
  `Aum_Nome_Caratteristica` varchar(20) NOT NULL,
  `Aum_Valore_Aggiuntivo` int(11) NOT NULL,
  `Nome` varchar(40) NOT NULL,
  `Descrizione` varchar(1000) NOT NULL,
  `Nome_Razza` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `sottorazza`
--

INSERT INTO `sottorazza` (`Aum_Nome_Caratteristica`, `Aum_Valore_Aggiuntivo`, `Nome`, `Descrizione`, `Nome_Razza`) VALUES
('Saggezza', 1, 'Elfo Dei Boschi', 'Come Elfo Dei Boschi, hai sensi acuti e intuizione, e i tuoi piedi leggeri ti portano velocemente e furtivamente attraverso le tue foreste native. Questa categoria comprende gli elfi selvatici (grugach) di Greyhawk e i Kagonesti di Dragonlance, oltre alle razze chiamate elfi dei boschi in Greyhawk e nei Forgotten Realms. Nel Faerun, gli elfi dei boschi (chiamati anche elfi selvatici, elfi verdi o elfi delle foreste) sono solitari e diffidenti nei confronti dei non elfi.\r\nLa pelle degli Elfi Dei Boschi tende ad avere una tonalità ramata, a volte con tracce di verde. I loro capelli tendono al marrone e al nero, ma occasionalmente sono biondi o color rame. Gli occhi sono verdi, marroni o nocciola.', 'Elfo'),
('Carisma', 1, 'Elfo Scuro', 'Discendenti da una precedente sotto-razza di elfi dalla pelle scura, i drow furono banditi dal mondo di superficie per aver seguito la dea Lolth sulla via del male e della corruzione. Ora hanno costruito la loro civiltà nelle profondità dell Underdark, sul modello della Via di Lolth. Chiamati anche elfi scuri. I drow hanno una pelle nera che ricorda l ossidiana levigata e capelli bianchi o giallo pallido. In genere hanno occhi molto chiari (così chiari da essere scambiati per bianchi) nelle tonalità del lilla, dell argento, del rosa, del rosso e del blu. Sono più piccoli e più magri della maggior parte degli elfi.\r\n\r\nTradotto con DeepL.com (versione gratuita)', 'Elfo'),
('Saggezza', 1, 'Kessig', 'Per i Kessig la vita è lavoro. I Kessig sono agricoltori, mugnai, tessitori e scalpellini, vivono a stretto contatto con la terra e lavorano duramente per ogni pasto. Questo li rende autonomi, pragmatici e schietti.', 'Umano'),
('Saggezza', 1, 'Nano Delle Colline', 'Come Nani Delle Colline, avete sensi acuti, intuizioni profonde e una notevole capacità di recupero. I nani dorati di Faerun, nel loro potente regno meridionale, sono Nani Delle Colline, così come i Neidar esiliati e i Klar sviliti di Krynn nell ambientazione di Dragonlance.', 'Nano'),
('Forza', 2, 'Nano Delle Montagne', 'Come Nano Delle Montagne, sei forte e resistente, abituato a una vita difficile in un terreno accidentato. I nani scudo del nord di Faerun, così come il clan Hylar e il nobile clan Daewar di Dragonlance, sono nani di montagna.', 'Nano'),
('Forza', 2, 'Nephalia', 'Sotto un immancabile coltre di nebbia che sale dal mare, gli abitanti di Nephalia mantengono una parvenza di normalità, comprando e vendendo merci provenienti da tutta Innistrad nei loro vivaci mercati, uscendo in mare con minuscole barche da pesca o coltivando la terra fradicia in campi intrisi d acqua.', 'Umano');

-- --------------------------------------------------------

--
-- Struttura della tabella `specializzazione`
--

CREATE TABLE `specializzazione` (
  `Nome_Classe` varchar(20) NOT NULL,
  `Livello_Classe` int(11) NOT NULL,
  `Nome_Sottoclasse` varchar(30) NOT NULL,
  `Livello_Sottoclasse` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `tiene`
--

CREATE TABLE `tiene` (
  `ID_Personaggio` int(11) NOT NULL,
  `ID_Borsa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `tiri_salvezza_personaggio`
--

CREATE TABLE `tiri_salvezza_personaggio` (
  `ID_Personaggio` int(11) NOT NULL,
  `Nome_Caratteristica` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `tiro_salvezza`
--

CREATE TABLE `tiro_salvezza` (
  `Nome_Caratteristica` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `tiro_salvezza`
--

INSERT INTO `tiro_salvezza` (`Nome_Caratteristica`) VALUES
('Carisma'),
('Costituzione'),
('Destrezza'),
('Forza'),
('Intelligenza'),
('Saggezza');

-- --------------------------------------------------------

--
-- Struttura della tabella `tratti_della_razza`
--

CREATE TABLE `tratti_della_razza` (
  `Nome_Razza` varchar(20) NOT NULL,
  `Nome_Tratto` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `tratti_della_sottorazza`
--

CREATE TABLE `tratti_della_sottorazza` (
  `Nome_Sottorazza` varchar(40) NOT NULL,
  `Nome_Tratto` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `tratti_razziali`
--

CREATE TABLE `tratti_razziali` (
  `Nome` varchar(30) NOT NULL,
  `Descrizione` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `tratti_razziali`
--

INSERT INTO `tratti_razziali` (`Nome`, `Descrizione`) VALUES
('Astuzia Della Pietra', 'Ogni volta che si effettua una prova di Intelligenza (Storia) relativa all origine della pietra, si è considerati abili nell abilità Storia e si aggiunge il doppio del proprio bonus di competenza alla prova, invece del normale bonus di competenza.'),
('Attacco A Molla', 'Quando si effettua un attacco in mischia contro una creatura, non si provocano attacchi di opportunità da parte di quella creatura per il resto del proprio turno, che si colpisca o meno.'),
('Maschera Del Selvaggio', 'Si può tentare di nascondersi anche quando si è solo leggermente oscurati dal fogliame, dalla pioggia battente, dalla neve che cade, dalla nebbia e da altri fenomeni naturali.'),
('Nato Nel Ghiaccio', 'Siete naturalmente adattati ai climi freddi, resistenza alle basse temperature'),
('Passo Sicuro', 'Quando si usa l azione Dash, il terreno difficile non costa movimento extra in quel turno.'),
('Resilienza Nanica', 'Si ha vantaggio nei tiri salvezza contro il veleno e si ha resistenza ai danni da veleno.'),
('Scurovisione', 'Abituato alle foreste crepuscolari e al cielo notturno, hai una visione superiore in condizioni di buio e penombra. Riesci a vedere in condizioni di scarsa illuminazione entro 18 metri da te come se fosse una luce intensa, e nell oscurità come se fosse una luce fioca. Nell oscurità non è possibile distinguere i colori, ma solo le sfumature di grigio.'),
('Scurovisione Superiore', 'La visione oscura ha un raggio d azione di 35 metri, anziché di 18 metri.'),
('Sensibilità Alla Luce Del Sole', 'Hai svantaggio sui tiri di attacco e sulle prove di Saggezza (Percezione) che si basano sulla vista quando tu, il bersaglio dell attacco o qualsiasi cosa tu stia cercando di percepire è alla luce diretta del sole.'),
('Trance', 'Gli elfi non dormono. Meditano invece profondamente, rimanendo semicoscienti, per 4 ore al giorno. La parola comune per indicare questa meditazione è “trance”. Mentre si medita, si sogna in un certo modo; tali sogni sono in realtà esercizi mentali che sono diventati riflessivi dopo anni di pratica. Dopo aver riposato in questo modo, si ottengono gli stessi benefici che un essere umano trarrebbe da 8 ore di sonno.');

-- --------------------------------------------------------

--
-- Struttura della tabella `utente`
--

CREATE TABLE `utente` (
  `ID_Utente` int(11) NOT NULL,
  `Username` varchar(40) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `E_mail` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `utente`
--

INSERT INTO `utente` (`ID_Utente`, `Username`, `Password`, `E_mail`) VALUES
(1, 'Aisja', 'a', 'a@a.it'),
(2, 'b', 'b', 'b@b.it'),
(5, 'c', 'c', 'catia@c.com'),
(6, 'dani', 'd', 'd@d.net'),
(7, 'b', 'b', 'b@b.it');

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
  ADD UNIQUE KEY `FKTiene_IND` (`ID_Personaggio`),
  ADD UNIQUE KEY `ID_BORSA_IND` (`ID_Borsa`);

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
  ADD KEY `FKConcede_IND` (`Nome_Privilegio`);

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
  ADD KEY `FKSpecializzazione_IND` (`Nome_Classe`,`Livello_Classe`);

--
-- Indici per le tabelle `sottorazza`
--
ALTER TABLE `sottorazza`
  ADD PRIMARY KEY (`Nome`),
  ADD UNIQUE KEY `ID_SOTTORAZZA_IND` (`Nome`),
  ADD KEY `FKIdentifica_IND` (`Nome_Razza`);

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
  ADD KEY `UsernamePassword` (`Username`,`Password`) USING BTREE;

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `utente`
--
ALTER TABLE `utente`
  MODIFY `ID_Utente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  ADD CONSTRAINT `FKConcede_FK` FOREIGN KEY (`Nome_Privilegio`) REFERENCES `privilegio` (`Nome`);

--
-- Limiti per la tabella `origine_migliora`
--
ALTER TABLE `origine_migliora`
  ADD CONSTRAINT `FKOri_ABI` FOREIGN KEY (`Nome_Abilita`) REFERENCES `abilita` (`Nome`),
  ADD CONSTRAINT `FKOri_ORI_FK` FOREIGN KEY (`Nome_Origine`) REFERENCES `origine` (`Nome`);

--
-- Limiti per la tabella `proprieta_arma`
--
ALTER TABLE `proprieta_arma`
  ADD CONSTRAINT `FKPro_OGG` FOREIGN KEY (`Nome_Arma`) REFERENCES `oggetto` (`Nome`),
  ADD CONSTRAINT `FKPro_PRO_FK` FOREIGN KEY (`Nome_Proprieta`) REFERENCES `proprieta` (`Nome`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
