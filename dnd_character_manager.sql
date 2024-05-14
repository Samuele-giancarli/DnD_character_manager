-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 14, 2024 alle 08:27
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
  `Livello_Classe` int(11) NOT NULL,
  `Nome_Classe` varchar(20) NOT NULL,
  `Utilizzi_Rabbia_Giornalieri` int(11) NOT NULL,
  `Bonus_Rabbia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `barbaro`
--

INSERT INTO `barbaro` (`ID_Barbaro`, `Livello_Classe`, `Nome_Classe`, `Utilizzi_Rabbia_Giornalieri`, `Bonus_Rabbia`) VALUES
(1, 1, 'Barbaro', 2, 2),
(2, 2, 'Barbaro', 2, 2),
(3, 3, 'Barbaro', 3, 2),
(4, 4, 'Barbaro', 3, 2),
(5, 5, 'Barbaro', 3, 2),
(6, 6, 'Barbaro', 4, 2),
(7, 7, 'Barbaro', 4, 2),
(8, 8, 'Barbaro', 4, 2),
(9, 9, 'Barbaro', 4, 3),
(10, 10, 'Barbaro', 4, 3),
(11, 11, 'Barbaro', 4, 3),
(12, 12, 'Barbaro', 5, 3),
(13, 13, 'Barbaro', 5, 3),
(14, 14, 'Barbaro', 5, 3),
(15, 15, 'Barbaro', 5, 3),
(16, 16, 'Barbaro', 5, 4),
(17, 17, 'Barbaro', 5, 4),
(18, 18, 'Barbaro', 5, 4),
(19, 19, 'Barbaro', 5, 4),
(20, 20, 'Barbaro', -1, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `bardo`
--

CREATE TABLE `bardo` (
  `ID_Bardo` int(11) NOT NULL,
  `Livello_Classe` int(11) NOT NULL,
  `Nome_Classe` varchar(20) NOT NULL,
  `Dado_Ispirazione_Bardica` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `bardo`
--

INSERT INTO `bardo` (`ID_Bardo`, `Livello_Classe`, `Nome_Classe`, `Dado_Ispirazione_Bardica`) VALUES
(1, 1, 'Bardo', '1d6'),
(2, 2, 'Bardo', '1d6'),
(3, 3, 'Bardo', '1d6'),
(4, 4, 'Bardo', '1d6'),
(5, 5, 'Bardo', '1d8'),
(6, 6, 'Bardo', '1d8'),
(7, 7, 'Bardo', '1d8'),
(8, 8, 'Bardo', '1d8'),
(9, 9, 'Bardo', '1d8'),
(10, 10, 'Bardo', '1d10'),
(11, 11, 'Bardo', '1d10'),
(12, 12, 'Bardo', '1d10'),
(13, 13, 'Bardo', '1d10'),
(14, 14, 'Bardo', '1d10'),
(15, 15, 'Bardo', '1d12'),
(16, 16, 'Bardo', '1d12'),
(17, 17, 'Bardo', '1d12'),
(18, 18, 'Bardo', '1d12'),
(19, 19, 'Bardo', '1d12'),
(20, 20, 'Bardo', '1d12');

-- --------------------------------------------------------

--
-- Struttura della tabella `borsa`
--

CREATE TABLE `borsa` (
  `ID_Borsa` int(11) NOT NULL,
  `Peso_Trasportabile` int(11) NOT NULL,
  `Monete_Rame` int(11) NOT NULL,
  `Monete_Argento` int(11) NOT NULL,
  `Monete_Electrum` int(11) NOT NULL,
  `Monete_Oro` int(11) NOT NULL,
  `Monete_Platino` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `borsa`
--

INSERT INTO `borsa` (`ID_Borsa`, `Peso_Trasportabile`, `Monete_Rame`, `Monete_Argento`, `Monete_Electrum`, `Monete_Oro`, `Monete_Platino`) VALUES
(1, 225, 0, 0, 0, 70, 0),
(2, 225, 0, 0, 0, 60, 0),
(3, 225, 0, 0, 0, 70, 0),
(4, 225, 0, 0, 0, 70, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `capacita_di_classe`
--

CREATE TABLE `capacita_di_classe` (
  `Nome` varchar(30) NOT NULL,
  `Descrizione` varchar(5000) NOT NULL,
  `Aum_Nome_Caratteristica` varchar(20) DEFAULT NULL,
  `Aum_Valore_Aggiuntivo` int(11) DEFAULT NULL,
  `Caratteristica_Incantatore` varchar(15) DEFAULT NULL,
  `Utilizzo_Giornaliero` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `capacita_di_classe`
--

INSERT INTO `capacita_di_classe` (`Nome`, `Descrizione`, `Aum_Nome_Caratteristica`, `Aum_Valore_Aggiuntivo`, `Caratteristica_Incantatore`, `Utilizzo_Giornaliero`) VALUES
('Archetipo Ladro', 'Al 3° livello, scegli un archetipo che emuli nell\'esercizio delle tue capacità da ladro. La tua scelta dell\'archetipo ti garantisce privilegi al 3° livello e poi di nuovo al 9°, 13° e 17° livello.', NULL, NULL, NULL, NULL),
('Attacco Extra', 'A partire dal 5° livello, puoi attaccare due volte, anziché una, ogni volta che esegui l\'azione Attacco nel tuo turno.', NULL, NULL, NULL, NULL),
('Attacco Furtivo', 'A partire dal 1° livello, sai come colpire astutamente e sfruttare la distrazione del nemico. Una volta per turno, puoi infliggere 1d6 danni extra a una creatura colpita con un attacco se hai vantaggio sul tiro per colpire. L\'attacco deve utilizzare un\'arma fine o a distanza.\r\n\r\nNon hai bisogno di vantaggio al tiro per colpire se un altro nemico del bersaglio si trova entro 1,5 piedi da esso, quel nemico non è incapacitato e non hai svantaggio al tiro per colpire.\r\n\r\nL\'ammontare del danno extra aumenta man mano che guadagni livelli in questa classe, come mostrato nella colonna Attacco Furtivo della tabella Ladro.', NULL, NULL, NULL, NULL),
('Attacco Spericolato', 'A partire dal 2° livello, puoi mettere da parte ogni preoccupazione per la difesa per attaccare con feroce disperazione. Quando effettui il tuo primo attacco nel tuo turno, puoi decidere di attaccare in modo avventato. Ciò ti dà vantaggio sui tiri per colpire con armi da mischia usando la Forza durante questo turno, ma i tiri per colpire contro di te hanno vantaggio fino al tuo turno successivo.', NULL, NULL, NULL, NULL),
('Aumento Barbaro', '', 'Forza', 2, NULL, NULL),
('Aumento Bardo', '', 'Carisma', 2, NULL, NULL),
('Aumento Ladro', '', 'Destrezza', 2, NULL, NULL),
('Aumento Mago', '', 'Intelligenza', 2, NULL, NULL),
('Azione Astuta', 'A partire dal 2° livello, la tua rapidità di pensiero e la tua agilità ti permettono di muoverti e agire rapidamente. Puoi effettuare un\'azione bonus in ciascuno dei tuoi turni di combattimento. Questa azione può essere utilizzata solo per eseguire l\'azione Scattare, Disingaggiarsi o Nascondersi.', NULL, NULL, NULL, NULL),
('Campione Primordiale', 'Al 20° livello, incarni il potere delle terre selvagge. I tuoi punteggi di Forza e Costituzione aumentano di 4. Il tuo massimo per questi punteggi è ora 24.', NULL, NULL, NULL, NULL),
('Canto di riposo', 'A partire dal 2° livello, puoi usare musica rilassante o orazioni per aiutare a rivitalizzare i tuoi alleati feriti durante un breve riposo. Se tu o qualsiasi creatura amica che può sentire la tua esibizione recuperate punti ferita alla fine del riposo breve spendendo uno o più Dadi Vita, ciascuna di quelle creature recupera 1d6 punti ferita extra.\r\n\r\nI Punti Ferita extra aumentano quando si raggiungono determinati livelli in questa classe: a 1d8 al 9° livello, a 1d10 al 13° livello e a 1d12 al 17° livello.', NULL, NULL, NULL, 1),
('Collegio Bardo', 'Al 3° livello, approfondisci le tecniche avanzate di un college bardico di tua scelta. La tua scelta ti garantisce privilegi al 3° livello e di nuovo al 6° e 14° livello.', NULL, NULL, NULL, NULL),
('Colpo di fortuna', 'Al 20° livello, possiedi una straordinaria abilità nel riuscire quando necessario. Se il tuo attacco manca un bersaglio nel raggio d\'azione, puoi trasformare il mancato attacco in un colpo a segno. In alternativa, se fallisci una prova di abilità, puoi considerare il tiro del d20 come un 20.\r\n\r\nUna volta utilizzata questa capacità, non è possibile utilizzarla nuovamente finché non si termina un riposo breve o lungo.', NULL, NULL, NULL, NULL),
('Competenza1 Bardo', 'Al 3° livello, scegli due delle tue competenze in Abilità. Il tuo bonus di competenza viene raddoppiato per qualsiasi prova di caratteristica effettuata che utilizzi una delle competenze scelte.', NULL, NULL, NULL, NULL),
('Competenza1 Ladro', 'Al 1° livello, scegli due delle tue competenze in Abilità, oppure una delle tue competenze in Abilità e la tua competenza con gli strumenti da ladro. Il tuo bonus di competenza viene raddoppiato per qualsiasi prova di caratteristica effettuata che utilizzi una delle competenze scelte.', NULL, NULL, NULL, NULL),
('Competenza2 Bardo', 'Al 10° livello, puoi scegliere altre due competenze in Abilità per ottenere questo beneficio', NULL, NULL, NULL, NULL),
('Competenza2 Ladro', 'Al 6° livello, puoi scegliere altre due delle tue competenze (nelle abilità o con gli strumenti da ladro) per ottenere questo beneficio.', NULL, NULL, NULL, NULL),
('Controfascino', 'Al 6° livello, ottieni la capacità di usare note musicali o parole di potere per interrompere gli effetti di influenza mentale. Con un\'azione, puoi iniziare un\'esibizione che dura fino alla fine del tuo turno successivo. Durante questo periodo, tu e qualsiasi creatura amica entro 9 metri da te avete vantaggio ai tiri salvezza contro l\'essere spaventati o affascinati. Una creatura deve essere in grado di sentirti per ottenere questo beneficio. La performance termina anticipatamente se sei incapace o messo a tacere o se la interrompi volontariamente (non è richiesta alcuna azione).', NULL, NULL, NULL, NULL),
('Critico brutale', 'A partire dal 9° livello, puoi lanciare un dado aggiuntivo per i danni dell\'arma quando determini il danno extra per un colpo critico con un attacco in mischia.\r\n\r\nCiò aumenta a due dadi aggiuntivi al 13° livello e tre dadi aggiuntivi al 17° livello.', NULL, NULL, NULL, NULL),
('Difesa senza armatura', 'Mentre non indossi alcuna armatura, la tua classe armatura è pari a 10 + il tuo modificatore di Destrezza + il tuo modificatore di Costituzione. Puoi usare uno scudo e ottenere comunque questo beneficio.', NULL, NULL, NULL, NULL),
('Evasione', 'A partire dal 7° livello, puoi schivare agilmente alcuni effetti ad area, come il soffio infuocato di un drago rosso o un incantesimo Tempesta di ghiaccio . Quando sei soggetto a un effetto che ti consente di effettuare un tiro salvezza su Destrezza per subire solo la metà dei danni, non subisci invece alcun danno se riesci nel tiro salvezza e solo la metà dei danni se fallisci.', NULL, NULL, NULL, NULL),
('Fonte di ispirazione', 'A partire da quando raggiungi il 5° livello, recuperi tutti gli usi spesi di Ispirazione Bardica quando termini un riposo breve o lungo.', NULL, NULL, NULL, NULL),
('Gergo Ladresco', 'Durante il tuo addestramento da ladro hai imparato il gergo dei ladri, un mix segreto di dialetto, gergo e codice che ti consente di nascondere messaggi in conversazioni apparentemente normali. Solo un\'altra creatura che conosce l\'idiozia dei ladri non può comprendere tali messaggi. Ci vuole quattro volte più tempo per trasmettere un messaggio del genere che per esprimere chiaramente la stessa idea.\r\n\r\nInoltre, comprendi una serie di segni e simboli segreti utilizzati per trasmettere messaggi brevi e semplici, ad esempio se un\'area è pericolosa o il territorio di una gilda di ladri, se il bottino è nelle vicinanze o se le persone in un\'area sono facili segna o fornirà un rifugio ai ladri in fuga.', NULL, NULL, NULL, NULL),
('Inafferrabile', 'A partire dal 18° livello, sei così evasivo che gli attaccanti raramente prendono il sopravvento contro di te. Nessun tiro per colpire ha vantaggio contro di te finché non sei incapace.', NULL, NULL, NULL, NULL),
('Incantesimi Bardo', 'Hai imparato a districare e rimodellare il tessuto della realtà in armonia con i tuoi desideri e la tua musica. I tuoi incantesimi fanno parte del tuo vasto repertorio, magie che puoi adattare a diverse situazioni.', NULL, NULL, 'Carisma', NULL),
('Incantesimi caratteristici', 'Quando raggiungi il 20° livello, acquisisci la padronanza di due potenti incantesimi e puoi lanciarli con poco sforzo. Scegli due incantesimi da mago di 3° livello nel tuo libro degli incantesimi come incantesimi distintivi. Hai sempre questi incantesimi preparati, non contano nel numero di incantesimi che hai preparato e puoi lanciarli ciascuno una volta al 3° livello senza spendere uno slot incantesimo. Quando lo fai, non puoi farlo di nuovo finché non finisci un riposo breve o lungo.\r\n\r\nSe vuoi lanciare uno degli incantesimi a un livello più alto, devi spendere uno slot incantesimo normalmente.', NULL, NULL, NULL, NULL),
('Incantesimi Mago', 'Come studente di magia arcana, hai un libro degli incantesimi contenente incantesimi che mostrano i primi barlumi del tuo vero potere.', NULL, NULL, 'Intelligenza', NULL),
('Ispirazione bardica', 'Puoi ispirare gli altri attraverso parole o musica emozionanti. Per fare ciò, usi un\'azione bonus nel tuo turno per scegliere una creatura diversa da te entro 60 piedi da te che possa sentirti. Quella creatura ottiene un dado di Ispirazione Bardica, un d6.\r\n\r\nUna volta entro i successivi 10 minuti, la creatura può lanciare il dado e aggiungere il numero ottenuto a una prova di caratteristica, tiro per colpire o tiro salvezza effettuato. La creatura può aspettare fino a dopo aver tirato il d20 prima di decidere di usare il dado di Ispirazione Bardica, ma deve decidere prima che il DM dica se il tiro ha successo o fallisce. Una volta lanciato il dado Ispirazione Bardica, questo viene perso. Una creatura può avere un solo dado di Ispirazione Bardica alla volta.\r\n\r\nPuoi utilizzare questa capacità un numero di volte pari al tuo modificatore di Carisma (minimo una volta). Recuperi tutti gli usi spesi quando termini un riposo lungo.\r\n\r\nIl tuo dado di Ispirazione Bardica cambia quando raggiungi determinati livelli in questa classe. Il dado diventa un d8 al 5° livello, un d10 al 10° livello e un d12 al 15° livello.', NULL, NULL, NULL, NULL),
('Ispirazione superiore', 'Al 20° livello, quando tiri l\'iniziativa e non hai più usi di Ispirazione Bardica, ne recuperi un uso.', NULL, NULL, NULL, NULL),
('Istinto Ferale', 'Al 7° livello, il tuo istinto è così affinato che hai vantaggio sui tiri di iniziativa.\r\n\r\nInoltre, se sei sorpreso all\'inizio del combattimento e non sei inabile, puoi agire normalmente nel tuo primo turno, ma solo se entri in ira prima di fare qualsiasi altra cosa in quel turno.', NULL, NULL, NULL, NULL),
('Movimento veloce', 'A partire dal 5° livello, la tua velocità aumenta di 3 metri mentre non indossi un\'armatura pesante.\r\n\r\n', NULL, NULL, NULL, NULL),
('Padronanza degli incantesimi', 'Al 18° livello, hai raggiunto una tale padronanza su alcuni incantesimi che puoi lanciarli a piacimento. Scegli un incantesimo da mago di 1° livello e un incantesimo da mago di 2° livello presenti nel tuo libro degli incantesimi. Puoi lanciare quegli incantesimi al loro livello più basso senza spendere uno slot incantesimo quando li hai preparati. Se vuoi lanciare uno degli incantesimi a un livello più alto, devi spendere uno slot incantesimo normalmente.', NULL, NULL, NULL, NULL),
('Potenza indomabile', 'A partire dal 18° livello, se il totale di una prova di Forza è inferiore al tuo punteggio di Forza, puoi usare quel punteggio al posto del totale.', NULL, NULL, NULL, NULL),
('Rabbia', 'In battaglia combatti con ferocia primordiale. Durante il tuo turno, puoi entrare in ira come azione bonus.\n\nMentre sei in ira, ottieni i seguenti benefici se non indossi un\'armatura pesante:\n\nHai vantaggio alle prove di Forza e ai tiri salvezza su Forza.\nQuando effettui un attacco con un\'arma da mischia usando la Forza, ottieni un bonus al tiro per i danni che aumenta man mano che guadagni livelli come barbaro, come mostrato nella colonna Danni di Furia della tabella Barbaro.\nHai resistenza ai danni contundenti, perforanti e taglienti.\nSe sei in grado di lanciare incantesimi, non puoi lanciarli o concentrarti su di essi mentre sei in ira.\n\nLa tua rabbia dura 1 minuto. Termina presto se perdi i sensi o se il tuo turno termina e non hai attaccato una creatura ostile dal tuo ultimo turno o non hai subito danni da allora. Puoi anche porre fine alla tua ira durante il tuo turno come azione bonus.\n\nUna volta che sei andato in ira per il numero di volte indicato per il tuo livello da barbaro nella colonna Ira della tabella Barbaro, devi terminare un riposo lungo prima di poter entrare di nuovo in ira.', NULL, NULL, NULL, NULL),
('Rabbia Implacabile', 'A partire dall\'11° livello, la tua rabbia può farti continuare a combattere nonostante le ferite gravi. Se scendi a 0 punti ferita mentre sei in ira e non muori sul colpo, puoi effettuare un tiro salvezza su Costituzione con CD 10. Se ci riesci, scendi invece a 1 punto ferita.\r\n\r\nOgni volta che usi questo privilegio dopo il primo, la CD aumenta di 5. Quando termini un riposo breve o lungo, la CD viene ripristinata a 10.', NULL, NULL, NULL, NULL),
('Rabbia Persistente', 'A partire dal 15° livello, la tua rabbia è così feroce che termina presto solo se perdi i sensi o se scegli di porvi fine.', NULL, NULL, NULL, NULL),
('Recupero Arcano', 'Hai imparato a riacquistare parte della tua energia magica studiando il tuo libro degli incantesimi. Una volta al giorno, quando termini un riposo breve, puoi scegliere gli slot incantesimo spesi da recuperare. Gli slot incantesimo possono avere un livello combinato pari o inferiore alla metà del tuo livello da mago (arrotondato per eccesso) e nessuno degli slot può essere di 6° livello o superiore.\r\n\r\nAd esempio, se sei un mago di 4° livello, puoi recuperare slot incantesimo per un valore massimo di due livelli. Puoi recuperare uno slot incantesimo di 2° livello o due slot incantesimo di 1° livello.', NULL, NULL, NULL, NULL),
('Schiavata Inquietante', 'A partire dal 5° livello, quando un attaccante che puoi vedere ti colpisce con un attacco, puoi usare la tua reazione per dimezzare il danno dell\'attacco contro di te.', NULL, NULL, NULL, NULL),
('Senso cieco', 'A partire dal 14° livello, se sei in grado di udire, sei consapevole della posizione di qualsiasi creatura nascosta o invisibile entro 3 metri da te.', NULL, NULL, NULL, NULL),
('Senso del Pericolo', 'Al 2° livello, acquisisci la straordinaria sensazione di quando le cose nelle vicinanze non sono come dovrebbero essere, dandoti un vantaggio quando schivi il pericolo. Hai vantaggio sui tiri salvezza di Destrezza contro gli effetti che puoi vedere, come trappole e incantesimi. Per ottenere questo beneficio non è possibile essere accecati, assordati o incapacitati.', NULL, NULL, NULL, NULL),
('Sentiero Primordiale', 'Al 3° livello, scegli un percorso che modella la natura della tua ira. La tua scelta ti garantisce privilegi al 3° livello e di nuovo al 6°, 10° e 14° livello.', NULL, NULL, NULL, NULL),
('Talento affidabile', 'All\'11° livello, hai affinato le abilità scelte finché non si avvicinano alla perfezione. Ogni volta che effettui una prova di caratteristica che ti consente di aggiungere il tuo bonus di competenza, puoi considerare un tiro del d20 pari a 9 o inferiore come un 10.', NULL, NULL, NULL, NULL),
('Tradizione Arcana', 'Quando raggiungi il 2° livello, scegli una tradizione arcana, modellando la tua pratica della magia attraverso una delle seguenti scuole. La tua scelta ti garantisce privilegi al 2° livello e di nuovo al 6°, 10° e 14° livello.', NULL, NULL, NULL, NULL),
('Tuttofare', 'A partire dal 2° livello, puoi aggiungere metà del tuo bonus di competenza, arrotondato per difetto, a qualsiasi prova di caratteristica effettuata che non includa già il tuo bonus di competenza.', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `capacita_di_sottoclasse`
--

CREATE TABLE `capacita_di_sottoclasse` (
  `Nome` varchar(30) NOT NULL,
  `Descrizione` varchar(5000) NOT NULL
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

--
-- Dump dei dati per la tabella `classe`
--

INSERT INTO `classe` (`Nome`, `Bonus_Competenza`, `Dado_Vita`, `Livello`) VALUES
('Barbaro', 2, '1d12', 1),
('Barbaro', 2, '1d12', 2),
('Barbaro', 2, '1d12', 3),
('Barbaro', 2, '1d12', 4),
('Barbaro', 3, '1d12', 5),
('Barbaro', 3, '1d12', 6),
('Barbaro', 3, '1d12', 7),
('Barbaro', 3, '1d12', 8),
('Barbaro', 4, '1d12', 9),
('Barbaro', 4, '1d12', 10),
('Barbaro', 4, '1d12', 11),
('Barbaro', 4, '1d12', 12),
('Barbaro', 5, '1d12', 13),
('Barbaro', 5, '1d12', 14),
('Barbaro', 5, '1d12', 15),
('Barbaro', 5, '1d12', 16),
('Barbaro', 6, '1d12', 17),
('Barbaro', 6, '1d12', 18),
('Barbaro', 6, '1d12', 19),
('Barbaro', 6, '1d12', 20),
('Bardo', 2, '1d8', 1),
('Bardo', 2, '1d8', 2),
('Bardo', 2, '1d8', 3),
('Bardo', 2, '1d8', 4),
('Bardo', 3, '1d8', 5),
('Bardo', 3, '1d8', 6),
('Bardo', 3, '1d8', 7),
('Bardo', 3, '1d8', 8),
('Bardo', 4, '1d8', 9),
('Bardo', 4, '1d8', 10),
('Bardo', 4, '1d8', 11),
('Bardo', 4, '1d8', 12),
('Bardo', 5, '1d8', 13),
('Bardo', 5, '1d8', 14),
('Bardo', 5, '1d8', 15),
('Bardo', 5, '1d8', 16),
('Bardo', 6, '1d8', 17),
('Bardo', 6, '1d8', 18),
('Bardo', 6, '1d8', 19),
('Bardo', 6, '1d8', 20),
('Ladro', 2, '1d8', 1),
('Ladro', 2, '1d8', 2),
('Ladro', 2, '1d8', 3),
('Ladro', 2, '1d8', 4),
('Ladro', 3, '1d8', 5),
('Ladro', 3, '1d8', 6),
('Ladro', 3, '1d8', 7),
('Ladro', 3, '1d8', 8),
('Ladro', 4, '1d8', 9),
('Ladro', 4, '1d8', 10),
('Ladro', 4, '1d8', 11),
('Ladro', 4, '1d8', 12),
('Ladro', 5, '1d8', 13),
('Ladro', 5, '1d8', 14),
('Ladro', 5, '1d8', 15),
('Ladro', 5, '1d8', 16),
('Ladro', 6, '1d8', 17),
('Ladro', 6, '1d8', 18),
('Ladro', 6, '1d8', 19),
('Ladro', 6, '1d8', 20),
('Mago', 2, '1d6', 1),
('Mago', 2, '1d6', 2),
('Mago', 2, '1d6', 3),
('Mago', 2, '1d6', 4),
('Mago', 3, '1d6', 5),
('Mago', 3, '1d6', 6),
('Mago', 3, '1d6', 7),
('Mago', 3, '1d6', 8),
('Mago', 4, '1d6', 9),
('Mago', 4, '1d6', 10),
('Mago', 4, '1d6', 11),
('Mago', 4, '1d6', 12),
('Mago', 5, '1d6', 13),
('Mago', 5, '1d6', 14),
('Mago', 5, '1d6', 15),
('Mago', 5, '1d6', 16),
('Mago', 6, '1d6', 17),
('Mago', 6, '1d6', 18),
('Mago', 6, '1d6', 19),
('Mago', 6, '1d6', 20);

-- --------------------------------------------------------

--
-- Struttura della tabella `classe_migliora`
--

CREATE TABLE `classe_migliora` (
  `Nome_Abilita` varchar(20) NOT NULL,
  `Nome_Classe` varchar(20) NOT NULL,
  `Livello_Classe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `classe_migliora`
--

INSERT INTO `classe_migliora` (`Nome_Abilita`, `Nome_Classe`, `Livello_Classe`) VALUES
('Acrobazia', 'Ladro', 1),
('Arcano', 'Mago', 1),
('Atletica', 'Barbaro', 1),
('Furtività', 'Ladro', 1),
('Inganno', 'Bardo', 1),
('Inganno', 'Ladro', 1),
('Intimidire', 'Barbaro', 1),
('Intrattenere', 'Bardo', 1),
('Intuizione', 'Mago', 1),
('Persuasione', 'Bardo', 1),
('Rapidità Di Mano', 'Ladro', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `competenza`
--

CREATE TABLE `competenza` (
  `Nome_Classe` varchar(20) NOT NULL,
  `Livello_Classe` int(11) NOT NULL,
  `Nome_TiroSalvezza` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `competenza`
--

INSERT INTO `competenza` (`Nome_Classe`, `Livello_Classe`, `Nome_TiroSalvezza`) VALUES
('Bardo', 1, 'Carisma'),
('Barbaro', 1, 'Costituzione'),
('Bardo', 1, 'Destrezza'),
('Ladro', 1, 'Destrezza'),
('Barbaro', 1, 'Forza'),
('Ladro', 1, 'Intelligenza'),
('Mago', 1, 'Intelligenza'),
('Mago', 1, 'Saggezza');

-- --------------------------------------------------------

--
-- Struttura della tabella `competenza_della_classe_in_armature`
--

CREATE TABLE `competenza_della_classe_in_armature` (
  `Nome_Armatura` varchar(30) NOT NULL,
  `Livello_Classe` int(11) NOT NULL,
  `Nome_Classe` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `competenza_della_classe_in_armature`
--

INSERT INTO `competenza_della_classe_in_armature` (`Nome_Armatura`, `Livello_Classe`, `Nome_Classe`) VALUES
('Armatura Di Pelle', 1, 'Barbaro'),
('Armatura Di Pelle', 1, 'Bardo'),
('Armatura Di Pelle', 1, 'Ladro'),
('Armatura Di Pelle Borchiata', 1, 'Barbaro'),
('Armatura Di Pelle Borchiata', 1, 'Bardo'),
('Armatura Di Pelle Borchiata', 1, 'Ladro'),
('Armatura Imbottita', 1, 'Barbaro'),
('Armatura Imbottita', 1, 'Bardo'),
('Armatura Imbottita', 1, 'Ladro'),
('Corazza A Scaglie', 1, 'Barbaro'),
('Cotta Di Maglia', 1, 'Barbaro'),
('Mezza Piastra', 1, 'Barbaro');

-- --------------------------------------------------------

--
-- Struttura della tabella `competenza_della_classe_in_armi`
--

CREATE TABLE `competenza_della_classe_in_armi` (
  `Nome_Arma` varchar(30) NOT NULL,
  `Livello_Classe` int(11) NOT NULL,
  `Nome_Classe` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `competenza_della_classe_in_armi`
--

INSERT INTO `competenza_della_classe_in_armi` (`Nome_Arma`, `Livello_Classe`, `Nome_Classe`) VALUES
('Arco Corto', 1, 'Barbaro'),
('Arco Corto', 1, 'Bardo'),
('Arco Corto', 1, 'Ladro'),
('Arco Lungo', 1, 'Barbaro'),
('Ascia', 1, 'Barbaro'),
('Ascia', 1, 'Bardo'),
('Ascia', 1, 'Ladro'),
('Balestra Leggera', 1, 'Barbaro'),
('Balestra Leggera', 1, 'Bardo'),
('Balestra Leggera', 1, 'Ladro'),
('Balestra Leggera', 1, 'Mago'),
('Balestra Pesante', 1, 'Barbaro'),
('Martello Da Guerra', 1, 'Barbaro'),
('Mazza', 1, 'Barbaro'),
('Mazza', 1, 'Bardo'),
('Mazza', 1, 'Ladro'),
('Pugnale', 1, 'Barbaro'),
('Pugnale', 1, 'Bardo'),
('Pugnale', 1, 'Ladro'),
('Pugnale', 1, 'Mago'),
('Spada Lunga', 1, 'Barbaro'),
('Spada Lunga', 1, 'Bardo'),
('Spadone', 1, 'Barbaro');

-- --------------------------------------------------------

--
-- Struttura della tabella `competenza_della_classe_in_strumenti`
--

CREATE TABLE `competenza_della_classe_in_strumenti` (
  `Nome_Strumento` varchar(30) NOT NULL,
  `Livello_Classe` int(11) NOT NULL,
  `Nome_Classe` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `competenza_della_classe_in_strumenti`
--

INSERT INTO `competenza_della_classe_in_strumenti` (`Nome_Strumento`, `Livello_Classe`, `Nome_Classe`) VALUES
('Flauto Dolce', 1, 'Bardo'),
('Lira', 1, 'Bardo'),
('Pacchetto Da Scassinatore', 1, 'Ladro');

-- --------------------------------------------------------

--
-- Struttura della tabella `competenza_dell_origine_in_strumenti`
--

CREATE TABLE `competenza_dell_origine_in_strumenti` (
  `Nome_Origine` varchar(30) NOT NULL,
  `Nome_Strumento` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `competenza_dell_origine_in_strumenti`
--

INSERT INTO `competenza_dell_origine_in_strumenti` (`Nome_Origine`, `Nome_Strumento`) VALUES
('Accolito', 'Pacchetto Da Sacerdote'),
('Archeologo', 'Pacchetto Da Esploratore'),
('Cavaliere', 'Pacchetto Da Diplomatico'),
('Cavaliere', 'Utensili Da Fabbro'),
('Criminale', 'Pacchetto Da Esploratore'),
('Criminale', 'Set Di Carte Da Gioco'),
('Marinaio', 'Set Di Carte Da Gioco'),
('Marinaio', 'Utensili Da Cucina');

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

--
-- Dump dei dati per la tabella `impara_classe`
--

INSERT INTO `impara_classe` (`Nome_Capacita`, `Nome_Classe`, `Livello_Classe`) VALUES
('Difesa senza armatura', 'Barbaro', 1),
('Rabbia', 'Barbaro', 1),
('Attacco Spericolato', 'Barbaro', 2),
('Senso del Pericolo', 'Barbaro', 2),
('Sentiero Primordiale', 'Barbaro', 3),
('Aumento Barbaro', 'Barbaro', 4),
('Attacco Extra', 'Barbaro', 5),
('Movimento veloce', 'Barbaro', 5),
('Sentiero Primordiale', 'Barbaro', 6),
('Istinto Ferale', 'Barbaro', 7),
('Aumento Barbaro', 'Barbaro', 8),
('Critico brutale', 'Barbaro', 9),
('Sentiero Primordiale', 'Barbaro', 10),
('Rabbia Implacabile', 'Barbaro', 11),
('Aumento Barbaro', 'Barbaro', 12),
('Difesa senza armatura', 'Barbaro', 13),
('Sentiero Primordiale', 'Barbaro', 14),
('Rabbia Persistente', 'Barbaro', 15),
('Aumento Barbaro', 'Barbaro', 16),
('Critico brutale', 'Barbaro', 17),
('Potenza indomabile', 'Barbaro', 18),
('Aumento Barbaro', 'Barbaro', 19),
('Campione Primordiale', 'Barbaro', 20),
('Incantesimi Bardo', 'Bardo', 1),
('Ispirazione bardica', 'Bardo', 1),
('Canto di riposo', 'Bardo', 2),
('Tuttofare', 'Bardo', 2),
('Collegio Bardo', 'Bardo', 3),
('Competenza1 Bardo', 'Bardo', 3),
('Aumento Bardo', 'Bardo', 4),
('Fonte di ispirazione', 'Bardo', 5),
('Collegio Bardo', 'Bardo', 6),
('Controfascino', 'Bardo', 6),
('Aumento Bardo', 'Bardo', 8),
('Canto di riposo', 'Bardo', 9),
('Competenza2 Bardo', 'Bardo', 10),
('Aumento Bardo', 'Bardo', 12),
('Canto di riposo', 'Bardo', 13),
('Collegio Bardo', 'Bardo', 14),
('Aumento Bardo', 'Bardo', 16),
('Canto di riposo', 'Bardo', 17),
('Aumento Bardo', 'Bardo', 19),
('Ispirazione superiore', 'Bardo', 20),
('Attacco Furtivo', 'Ladro', 1),
('Competenza1 Ladro', 'Ladro', 1),
('Gergo Ladresco', 'Ladro', 1),
('Azione Astuta', 'Ladro', 2),
('Archetipo Ladro', 'Ladro', 3),
('Aumento Ladro', 'Ladro', 4),
('Schiavata Inquietante', 'Ladro', 5),
('Competenza2 Ladro', 'Ladro', 6),
('Evasione', 'Ladro', 7),
('Aumento Ladro', 'Ladro', 8),
('Archetipo Ladro', 'Ladro', 9),
('Aumento Ladro', 'Ladro', 10),
('Talento affidabile', 'Ladro', 11),
('Aumento Ladro', 'Ladro', 12),
('Archetipo Ladro', 'Ladro', 13),
('Senso cieco', 'Ladro', 14),
('Aumento Ladro', 'Ladro', 16),
('Archetipo Ladro', 'Ladro', 17),
('Inafferrabile', 'Ladro', 18),
('Aumento Ladro', 'Ladro', 19),
('Colpo di fortuna', 'Ladro', 20),
('Incantesimi Mago', 'Mago', 1),
('Recupero Arcano', 'Mago', 1),
('Tradizione Arcana', 'Mago', 2),
('Aumento Mago', 'Mago', 4),
('Tradizione Arcana', 'Mago', 6),
('Aumento Mago', 'Mago', 8),
('Tradizione Arcana', 'Mago', 10),
('Aumento Mago', 'Mago', 12),
('Tradizione Arcana', 'Mago', 14),
('Aumento Mago', 'Mago', 16),
('Padronanza degli incantesimi', 'Mago', 18),
('Aumento Mago', 'Mago', 19),
('Incantesimi caratteristici', 'Mago', 20);

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
  `Tempo_di_Lancio` varchar(50) NOT NULL,
  `Distanza` varchar(20) NOT NULL,
  `Durata` varchar(50) NOT NULL,
  `Descrizione` varchar(2000) NOT NULL,
  `Componenti` varchar(50) NOT NULL,
  `Rituale` tinyint(1) NOT NULL,
  `ID_Mago` int(11) DEFAULT NULL,
  `ID_Bardo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `incantesimo`
--

INSERT INTO `incantesimo` (`Nome`, `Livello`, `Scuola`, `Tempo_di_Lancio`, `Distanza`, `Durata`, `Descrizione`, `Componenti`, `Rituale`, `ID_Mago`, `ID_Bardo`) VALUES
('Affascinare Mostri', 4, 'Incantamento', '1 Azione', '9 Metri', '1 Ore', 'Tenti di affascinare una creatura che puoi vedere e che si trova a gittata. Deve effettuare un tiro salvezza su Saggezza, e lo fa con vantaggio se tu o i tuoi compagni state combattendo contro di lui. Se fallisce il tiro salvezza, resta affascinato da te finché l\'incantesimo non termina o finché tu o i tuoi compagni non gli fate qualcosa di dannoso. La creatura incantata è amichevole con te. Quando l\'incantesimo termina, la creatura sa di essere stata affascinata da te.\r\n\r\nA livelli più alti. Quando lanci questo incantesimo utilizzando uno slot incantesimo di 5° livello o superiore, puoi prendere come bersaglio una creatura aggiuntiva per ogni livello di slot superiore al 4°. Le creature devono trovarsi entro 9 metri l\'una dall\'altra quando le prendi di mira.', 'Vocali, Somatiche', 0, 7, 7),
('Affascinare Persone', 1, 'Incantamento', '1 Azione', '9 Metri', '1 Ora', 'Tenti di affascinare un umanoide che puoi vedere e che si trova a gittata. Deve effettuare un tiro salvezza su Saggezza, e lo fa con vantaggio se tu o i tuoi compagni state combattendo contro di lui. Se fallisce il tiro salvezza, resta affascinato da te finché l\'incantesimo non termina o finché tu o i tuoi compagni non gli fate qualcosa di dannoso. La creatura incantata ti considera un amico amichevole. Quando l\'incantesimo termina, la creatura sa di essere stata affascinata da te.\r\n\r\nA livelli più alti. Quando lanci questo incantesimo utilizzando uno slot incantesimo di 2° livello o superiore, puoi prendere come bersaglio una creatura aggiuntiva per ogni livello di slot superiore al 1°. Le creature devono trovarsi entro 9 metri l\'una dall\'altra quando le prendi di mira.', 'Vocali, Somatiche', 0, NULL, 1),
('Allarme', 1, 'Abiurazione', '1 Minuto', '9 Metri', '8 Ore', 'mposta un allarme contro le intrusioni indesiderate. Scegli una porta, una finestra o un\'area entro la gittata che non sia più grande di un cubo con spigolo di 20 piedi. Fino al termine dell\'incantesimo, un allarme ti avvisa ogni volta che una creatura piccola o più grande tocca o entra nell\'area protetta. Quando lanci l\'incantesimo, puoi designare le creature che non faranno scattare l\'allarme. Scegli anche se l\'allarme è mentale o acustico.\r\n\r\nUn allarme mentale ti avvisa con un ping nella tua mente se ti trovi entro 1 miglio dall\'area protetta. Questo ping ti sveglia se stai dormendo. Un allarme acustico produce il suono di un campanello per 10 secondi entro 60 piedi.', 'Vocali, Somatiche, Materiali', 1, 1, NULL),
('Alterare Se Stessi', 2, 'Trasmutazione', '1 Azione', 'Se Stesso', 'Concentrazione, 1 Ora', 'Assumi una forma diversa. Quando lanci l\'incantesimo, scegli una delle seguenti opzioni, i cui effetti durano per tutta la durata dell\'incantesimo. Finché l\'incantesimo dura, puoi terminare un\'opzione come azione per ottenere i benefici di un\'altra opzione.\r\n\r\nAdattamento acquatico. Adatti il ​​tuo corpo all\'ambiente acquatico, facendo spuntare le branchie e facendo crescere le ragnatele tra le dita. Puoi respirare sott\'acqua e acquisire una velocità di nuoto pari alla tua velocità di camminata.\r\n\r\nCambia aspetto. Trasformi il tuo aspetto. Sei tu a decidere che aspetto hai, inclusa altezza, peso, lineamenti del viso, suono della tua voce, lunghezza dei capelli, colorazione e caratteristiche distintive, se presenti. Puoi farti apparire come membro di un\'altra razza, anche se nessuna delle tue statistiche cambia. Inoltre, non appari come una creatura di taglia diversa dalla tua, e la tua forma base rimane la stessa; se sei bipede, non puoi usare questo incantesimo per diventare quadrupede, per esempio. In qualsiasi momento per la durata dell\'incantesimo, puoi usare la tua azione per cambiare nuovamente il tuo aspetto in questo modo.\r\n\r\nArmi naturali. Fai crescere artigli, zanne, spine, corna o un\'arma naturale diversa a tua scelta. I tuoi colpi senz\'armi infliggono 1d6 danni contundenti, perforanti o taglienti, a seconda dell\'arma naturale scelta, e sei competente nei tuoi colpi senz\'armi. Infine, l\'arma naturale è magica e hai un bonus di +1 ai tiri per colpire e per i danni che effettui utilizzandola.', 'Vocali, Somatiche', 0, 3, NULL),
('Amicizia', 0, 'Incantamento', '1 Azione', 'Se Stesso', 'Concentrazione, 1 Minuto', 'Per tutta la durata, si ha vantaggio su tutte le prove di Carisma dirette a una creatura a scelta che non sia ostile nei propri confronti. Quando l\'incantesimo termina, la creatura si rende conto che avete usato la magia per influenzare il suo umore e diventa ostile nei vostri confronti. Una creatura incline alla violenza potrebbe attaccarvi. Un\'altra creatura potrebbe cercare di vendicarsi in altri modi (a discrezione del DM), a seconda della natura della vostra interazione con essa.', 'Somatiche, Materiali', 0, 1, 1),
('Animare Oggetti', 5, 'Trasmutazione', '1 Azione', '36 Metri', 'Concentrazione, 1 Minuto', 'Gli oggetti prendono vita al tuo comando. Scegli fino a dieci oggetti non magici entro il raggio d\'azione che non vengono indossati o trasportati. I bersagli medi contano come due oggetti, i bersagli grandi contano come quattro oggetti, i bersagli enormi contano come otto oggetti. Non puoi animare nessun oggetto più grande di Enorme. Ogni bersaglio si anima e diventa una creatura sotto il tuo controllo finché l\'incantesimo non termina o finché non viene ridotto a 0 punti ferita.\r\n\r\nCome azione bonus, puoi comandare mentalmente qualsiasi creatura che hai creato con questo incantesimo se la creatura si trova entro 500 piedi da te (se controlli più creature, puoi comandarne alcune o tutte allo stesso tempo, impartendo lo stesso comando a ognuno). Sei tu a decidere quale azione intraprenderà la creatura e dove si sposterà durante il turno successivo, oppure puoi impartire un comando generale, ad esempio sorvegliare una particolare camera o corridoio. Se non impartisci comandi, la creatura si difende solo dalle creature ostili. Una volta dato un ordine, la creatura continua a seguirlo fino al completamento del suo compito.\r\nSe ordini a un oggetto di attaccare, può effettuare un singolo attacco in mischia contro una creatura entro 1,5 metri da esso. Effettua un attacco di schianto con un bonus di attacco e un danno contundente determinati dalla sua taglia. Il DM potrebbe decidere che un oggetto specifico infligga danni taglienti o perforanti in base alla sua forma.', 'Vocali, Somatiche', 0, 9, 9),
('Antipatia/Simpatia', 8, 'Incantamento', '1 Ora', '18 Metri', '10 Giorni', 'Questo incantesimo attrae o respinge le creature di tua scelta. Prendi di mira qualcosa entro la gittata, un oggetto o una creatura Enorme o più piccola o un\'area che non sia più grande di un cubo di 200 piedi. Quindi specifica un tipo di creatura intelligente, come draghi rossi, goblin o vampiri. Investi il ​​bersaglio con un\'aura che attrae o respinge le creature specificate per la durata. Scegli antipatia o simpatia come effetto dell\'aura.\n\nAntipatia. L\'incantesimo fa sì che le creature del tipo da te designato sentano un intenso bisogno di lasciare l\'area ed evitare il bersaglio. Quando una tale creatura può vedere il bersaglio o si avvicina entro 18 metri da esso, deve superare un tiro salvezza su Saggezza o diventa spaventata. La creatura rimane Spaventata finché può vedere il bersaglio o si trova entro 18 metri da esso. Mentre è spaventata dal bersaglio, la creatura deve usare il suo movimento per spostarsi fino al punto sicuro più vicino dal quale non può vedere il bersaglio. Se la creatura si sposta a più di 18 metri dal bersaglio e non può vederlo, non è più spaventata, ma diventa nuovamente spaventata se riacquista la vista del bersaglio o si muove entro 18 metri da esso.\nSimpatia. L\'incantesimo fa sì che le creature specificate sentano un intenso bisogno di avvicinarsi al bersaglio mentre si trovano entro 18 metri da esso o sono in grado di vederlo. Quando una tale creatura può vedere il bersaglio o si trova entro 18 metri da esso, deve riuscire un tiro salvezza su Saggezza o usare il suo movimento in ciascuno dei suoi turni per entrare nell\'area o muoversi entro la portata del bersaglio. Quando la creatura lo ha fatto, non può allontanarsi volontariamente dal bersaglio. Se il bersaglio danneggia o ferisce in altro modo una creatura influenzata, la creatura influenzata può effettuare un tiro salvezza su Saggezza per porre fine all\'effetto, come descritto di seguito.', 'Vocali, Somatiche, Materiali', 0, 15, 15),
('Armatura Magica', 1, 'Abiurazione', '1 Azione', 'Tocco', '8 Ore', 'Tocchi una creatura consenziente che non indossa un\'armatura e una forza magica protettiva la circonda finché l\'incantesimo non termina. La CA base del bersaglio diventa 13 + il suo modificatore di Destrezza. L\'incantesimo termina se il bersaglio indossa un\'armatura o se si interrompe l\'incantesimo con un\'azione.', 'Vocali, Somatiche, Materiali', 0, 1, NULL),
('Barbe Argentate', 1, 'Incantamento', '1 Reazione', '18 Metri', 'Istantanea', 'Distrai magicamente la creatura che ha attivato l\'incantesimo e trasformi la sua momentanea incertezza in incoraggiamento per un\'altra creatura. La creatura che attiva l\'azione deve ritirare il d20 e utilizzare il tiro più basso.\r\n\r\nPuoi quindi scegliere una creatura diversa che puoi vedere nel raggio d\'azione (puoi scegliere tu stesso). La creatura scelta dispone di vantaggio al successivo tiro per colpire, prova di caratteristica o tiro salvezza effettuato entro 1 minuto. Una creatura può essere potenziata da un solo utilizzo di questo incantesimo alla volta.', 'Vocali', 0, NULL, 1),
('Beffa Crudele', 0, 'Incantamento', '1 Azione', '18 Metri', 'Istantaneo', 'Scatenate una serie di insulti conditi con sottili incantesimi contro una creatura che potete vedere nel raggio d\'azione. Se il bersaglio può sentirvi (ma non è necessario che vi capisca), deve superare un tiro salvezza di Saggezza o subire 1d4 danni psichici e avere svantaggio al prossimo tiro di attacco che effettuerà prima della fine del suo turno successivo.\n\nAi livelli superiori. I danni di questo incantesimo aumentano di 1d4 al 5° livello (2d4), all\'11° livello (3d4) e al 17° livello (4d4).', 'Vocali', 0, NULL, 1),
('Calmare Emozioni', 2, 'Incantamento', '1 Azione', '18 Metri', 'Concentrazione, 1 Minuto', 'Tenti di sopprimere forti emozioni in un gruppo di persone. Ogni umanoide in una sfera di 6 metri di raggio centrata su un punto scelto dall\'utente entro la gittata deve effettuare un tiro salvezza su Carisma; una creatura può scegliere di fallire questo tiro salvezza se lo desidera. Se una creatura fallisce il suo tiro salvezza, scegli uno dei due effetti seguenti. È possibile sopprimere qualsiasi effetto che faccia affascinare o spaventare un bersaglio. Quando questo incantesimo termina, qualsiasi effetto soppresso riprende, a condizione che nel frattempo la sua durata non sia terminata.\r\n\r\nIn alternativa, puoi rendere un bersaglio indifferente alle creature di tua scelta verso le quali è ostile. Questa indifferenza termina se il bersaglio viene attaccato o ferito da un incantesimo o se vede qualcuno dei suoi amici venire ferito. Quando l\'incantesimo termina, la creatura diventa nuovamente ostile, a meno che il DM non disponga diversamente.', 'Vocali, Somatiche', 0, NULL, 3),
('Catapulta', 1, 'Trasmutazione', '1 Azione', '18 Metri', 'Istantaneo', 'Scegli un oggetto di peso compreso tra 1 e 5 libbre entro il raggio d\'azione che non venga indossato o trasportato. L\'oggetto vola in linea retta fino a 90 piedi nella direzione scelta prima di cadere al suolo, fermandosi anticipatamente se colpisce una superficie solida. Se l\'oggetto dovesse colpire una creatura, quella creatura dovrà effettuare un tiro salvezza su Destrezza. Se fallisce il Tiro Salvezza, l\'oggetto colpisce il bersaglio e smette di muoversi. Quando l\'oggetto colpisce qualcosa, l\'oggetto e ciò che colpisce subiscono 3d8 danni contundenti ciascuno.\r\n\r\nA livelli più alti. Quando esegui questo incantesimo utilizzando uno slot incantesimo di 2° livello o superiore, il peso massimo degli oggetti che puoi prendere di mira con questo incantesimo aumenta di 5 libbre e il danno aumenta di 1d8, per ogni livello dello slot superiore al 1°.', 'Somatiche', 0, 1, NULL),
('Cerchio della Morte', 6, 'Necromanzia', '1 Azione', '45 Metri', 'Istantanea', 'Una sfera di energia negativa si propaga in un raggio di 18 metri da un punto entro gittata. Ogni creatura in quell\'area deve effettuare un tiro salvezza su Costituzione. Un bersaglio subisce 8d6 danni necrotici se fallisce il tiro salvezza, o la metà di questi danni se lo supera.', 'Vocali, Somatiche, Materiali', 0, 11, NULL),
('Clone', 8, 'Necromanzia', '1 Ora', 'Tocco', 'Istantanea', 'Questo incantesimo fa crescere un duplicato inerte di una creatura vivente come protezione contro la morte. Questo clone si forma all\'interno del vaso utilizzato per lanciare l\'incantesimo e raggiunge le dimensioni complete e la maturità dopo 120 giorni; puoi anche scegliere che il clone sia una versione più giovane della stessa creatura. Rimane inerte e dura indefinitamente, finché il suo vaso rimane indisturbato.\r\n\r\nIn qualsiasi momento dopo la maturazione del clone, se la creatura originale muore, la sua anima si trasferisce al clone, a condizione che l\'anima sia libera e disposta a ritornare. Il clone è fisicamente identico all\'originale e ha la stessa personalità, ricordi e abilità, ma nessuno dell\'equipaggiamento dell\'originale. I resti fisici della creatura originale, se esistono ancora, diventano inerti e non possono essere riportati in vita, poiché l\'anima della creatura è altrove.', 'Vocali, Somatiche, Materiali', 0, 15, NULL),
('Comando', 1, 'Incantamento', '1 Azione', '18 Metri', '1 Turno', 'Pronuncia un comando di una sola parola a una creatura che puoi vedere a gittata. Il bersaglio deve riuscire in un tiro salvezza su Saggezza o seguire il comando nel suo turno successivo. L\'incantesimo non ha effetto se il bersaglio è non morto, se non capisce la tua lingua o se il tuo comando gli è direttamente dannoso. Seguono alcuni comandi tipici e i loro effetti. Potresti impartire un comando diverso da quello descritto qui. Se lo fai, il DM determina come si comporta il bersaglio. Se il bersaglio non può eseguire il tuo comando, l\'incantesimo termina.\r\n\r\nApproccio. Il bersaglio si muove verso di te seguendo il percorso più breve e diretto, terminando il suo turno se si muove entro 1,5 metri da te.\r\n\r\nGocciolare. Il bersaglio lascia cadere tutto ciò che ha in mano e poi termina il suo turno.\r\n\r\nFuggire. Il bersaglio trascorre il suo turno allontanandosi da te con il mezzo più veloce a disposizione.\r\n\r\nGrovel. Il bersaglio cade prono e poi termina il suo turno.\r\n\r\nFermati. Il bersaglio non si muove e non esegue alcuna azione. Una creatura volante resta in volo, purché sia ​​in grado di farlo. Se deve muoversi per restare in volo, vola per la distanza minima necessaria per rimanere in aria.', 'Vocali', 0, NULL, 1),
('Confusione', 4, 'Incantamento', '1 Azione', '27 Metri', 'Concentrazione, 1 Minuto', 'Questo incantesimo assale e distorce le menti delle creature, generando illusioni e provocando azioni incontrollate. Ogni creatura in una sfera di 3 metri di raggio centrata su un punto scelto dall\'incantatore entro la gittata deve riuscire un tiro salvezza su Saggezza quando si lancia questo incantesimo o ne viene influenzata.\r\n\r\nUn bersaglio influenzato non può effettuare reazioni e deve tirare un d10 all\'inizio di ciascuno dei suoi turni per determinare il suo comportamento per quel turno.\r\n\r\nd10 Comportamento\r\n1 La creatura usa tutto il suo movimento per muoversi in una direzione casuale. Per determinare la direzione, tira un d8 e assegna una direzione a ciascuna faccia del dado. La creatura non effettua alcuna azione in questo turno.\r\n2-6 La creatura non si muove né compie azioni in questo turno.\r\n7-8 La creatura usa la sua azione per effettuare un attacco in mischia contro una creatura determinata casualmente alla sua portata. Se non c\'è nessuna creatura alla sua portata, la creatura non fa nulla in questo turno.\r\n9-10 La creatura può agire e muoversi normalmente.\r\nAlla fine dei suoi turni, un bersaglio influenzato può effettuare un tiro salvezza su Saggezza. Se ha successo, questo effetto termina per quel bersaglio.\r\n\r\nA livelli più alti. Quando esegui questo incantesimo utilizzando uno slot incantesimo di 5° livello o superiore, il raggio della sfera aumenta di 1,5 metri per ogni livello dello slot superiore al 4°.', 'Vocali, Somatiche, Materiali', 0, 7, 7),
('Controincantesimo', 3, 'Abiurazione', '1 Reazione', '18 Metri', 'Istantaneo', 'Tenti di interrompere una creatura nel processo di lancio di un incantesimo. Se la creatura sta lanciando un incantesimo di 3° livello o inferiore, il suo incantesimo fallisce e non ha alcun effetto. Se sta lanciando un incantesimo di 4° livello o superiore, effettua una prova di caratteristica usando la tua capacità da incantatore. La CD è pari a 10 + il livello dell\'incantesimo. In caso di successo, l\'incantesimo della creatura fallisce e non ha alcun effetto.\r\n\r\nA livelli più alti. Quando esegui questo incantesimo utilizzando uno slot incantesimo di 4° livello o superiore, l\'incantesimo interrotto non ha effetto se il suo livello è inferiore o uguale al livello dello slot incantesimo utilizzato.', 'Somatiche', 0, 5, NULL),
('Controllare Acqua', 4, 'Trasmutazione', '1 Azione', '90 Metri', 'Concentrazione, 10 Minuti', 'Fino al termine dell\'incantesimo, controlli qualsiasi acqua libera all\'interno di un\'area a tua scelta che sia un cubo fino a 100 piedi di lato.\r\nQuando una creatura entra nel vortice per la prima volta in un turno o inizia il suo turno lì, deve effettuare un tiro salvezza su Forza. Se fallisce il Tiro Salvezza, la creatura subisce 2d8 danni contundenti e rimane intrappolata nel vortice finché l\'incantesimo non termina. Se il Tiro Salvezza riesce, la creatura subisce la metà dei danni e non viene intrappolata nel vortice. Una creatura intrappolata nel vortice può usare la sua azione per provare a nuotare lontano dal vortice come descritto sopra, ma ha svantaggio alla prova di Forza (Atletica) per farlo.\r\n\r\nLa prima volta in ogni turno in cui un oggetto entra nel vortice, l\'oggetto subisce 2d8 danni contundenti, questi danni si verificano ogni round in cui rimane nel vortice.', 'Vocali, Somatiche, Materiali', 0, 7, NULL),
('Controllo Delle Fiamme', 0, 'Trasmutazione', '1 Azione', '18 Metri', 'Istantaneo o 1 Ora', 'Si sceglie una fiamma non magica che si può vedere nel raggio d\'azione e che rientra in un cubo di 2 metri. La si può influenzare in uno dei seguenti modi:\r\n\r\nSi espande istantaneamente la fiamma di un metro e mezzo in una direzione, a condizione che nella nuova posizione sia presente legna o altro combustibile.\r\nSi spengono istantaneamente le fiamme all\'interno del cubo.\r\nSi raddoppia o si dimezza l\'area di luce intensa e fioca proiettata dalla fiamma, si cambia il suo colore o entrambi. Il cambiamento dura per 1 ora.\r\nSi possono far apparire all\'interno delle fiamme forme semplici, come la forma vaga di una creatura, di un oggetto inanimato o di un luogo, che si animano a piacimento. Le forme durano 1 ora.\r\nSe si lancia questo incantesimo più volte, si possono avere fino a tre dei suoi effetti non istantanei attivi alla volta, e si può annullare un effetto come azione.', 'Somatiche', 0, 1, NULL),
('Corona di Stelle', 7, 'Evocazione ', '1 Azione', 'Se Stesso', '1 Ora', 'Appaiono sette granelli di luce simili a stelle e orbitano attorno alla tua testa fino al termine dell\'incantesimo. Puoi usare un\'azione bonus per inviare uno dei granelli verso una creatura o un oggetto entro 36 metri da te. Quando lo fai, effettua un attacco con incantesimo a distanza. Se colpisce, il bersaglio subisce 4d12 danni radiosi. Che tu colpisca o manchi, il granello viene esaurito. L\'incantesimo termina prima se si spende l\'ultima particella. Se ti restano quattro o più granelli, emettono luce intensa in un raggio di 9 metri e luce fioca per altri 9 metri. Se ti restano da uno a tre granelli, emettono una luce fioca in un raggio di 9 metri.', 'Vocali, Somatiche', 0, 13, NULL),
('Crea Magen', 7, 'Trasmutazione', '1 Ora', 'Tocco', 'Istantanea', 'Mentre lanci l\'incantesimo, metti una fiala di mercurio nel petto di una bambola umana a grandezza naturale piena di cenere o polvere. Quindi ricuci la bambola e fai gocciolare il tuo sangue su di essa. Alla fine del casting, si tocca la bambola con una bacchetta di cristallo, trasformandola in un magen vestito con quello che indossava la bambola. Il tipo di magen viene scelto da te durante il lancio dell\'incantesimo.\r\n\r\nQuando appare il magen, i tuoi punti ferita massimi diminuiscono di un importo pari al grado di sfida del magen (riduzione minima di 1). Solo un incantesimo Desiderio può annullare questa riduzione dei tuoi punti ferita massimi.', 'Vocali, Somatiche, Materiali', 0, 13, NULL),
('Curare Ferite di Massa', 5, 'Evocazione ', '1 Azione', '18 Metri', 'Istantaneo', 'Un\'ondata di energia curativa si propaga da un punto a gittata di tua scelta. Scegli fino a sei creature in una sfera del raggio di 9 metri centrata su quel punto. Ogni bersaglio recupera punti ferita pari a 3d8 + il tuo modificatore di abilità da incantatore. Questo incantesimo non ha effetto sui non morti o sui costrutti.\r\n\r\nA livelli più alti. Quando esegui questo incantesimo utilizzando uno slot incantesimo di 6° livello o superiore, la guarigione aumenta di 1d8 per ogni livello di slot superiore al 5°.', 'Vocali, Somatiche', 0, NULL, 9),
('Danza Irresistibile', 6, 'Incantamento', '1 Azione', '9 Metri', 'Concentrazione, 1 Minuto', 'Scegli una creatura che puoi vedere nel raggio d\'azione. Il bersaglio inizia una danza comica sul posto: strascica i piedi, batte i piedi e saltella per tutta la durata. Le creature che non possono essere affascinate sono immuni a questo incantesimo.\r\n\r\nUna creatura danzante deve usare tutto il suo movimento per danzare senza lasciare il suo spazio e ha svantaggio ai tiri salvezza su Destrezza e ai tiri per colpire. Mentre il bersaglio è influenzato da questo incantesimo, le altre creature hanno vantaggio ai tiri per colpire contro di esso. Come azione, una creatura danzante effettua un tiro salvezza su Saggezza per riprendere il controllo di se stessa. Se il tiro salvezza riesce, l\'incantesimo termina.', 'Vocali', 0, 11, 11),
('Dardo Di Fuoco', 0, 'Invocazione', '1 Azione', '36 Metri', 'Istantaneo', 'Si scaglia una goccia di fuoco contro una creatura o un oggetto nel raggio d\'azione. Effettuare un attacco con incantesimo a distanza contro il bersaglio. Se viene colpito, il bersaglio subisce 1d10 danni da fuoco. Un oggetto infiammabile colpito da questo incantesimo prende fuoco se non è indossato o trasportato.\r\n\r\nAi livelli superiori. I danni di questo incantesimo aumentano di 1d10 al 5° livello (2d10), all\'11° livello (3d10) e al 17° livello (4d10).', 'Vocali, Somatiche', 0, 1, NULL),
('Debolezza Mentale', 8, 'Incantamento', '1 Azione', '45 Metri', 'Istantanea', 'Si fa esplodere la mente di una creatura che si può vedere a gittata, tentando di frantumarne l\'intelletto e la personalità. Il bersaglio subisce 4d6 danni psichici e deve effettuare un tiro salvezza su Intelligenza.\r\n\r\nSe fallisce il Tiro Salvezza, i punteggi di Intelligenza e Carisma della creatura diventano 1. La creatura non può lanciare incantesimi, attivare oggetti magici, comprendere il linguaggio o comunicare in alcun modo comprensibile. La creatura può, tuttavia, identificare i suoi amici, seguirli e persino proteggerli.\r\n\r\nAl termine di ogni 30 giorni, la creatura può ripetere il suo tiro salvezza contro questo incantesimo. Se supera il tiro salvezza, l\'incantesimo termina. L\'incantesimo può anche essere terminato con Ripristino Superiore , Guarigione o Desiderio .', 'Vocali, Somatiche, Materiali', 0, 15, 15),
('Desiderio', 9, 'Evocazione', '1 Azione', 'Se Stesso', 'Istantanea', 'Desiderio è l\'incantesimo più potente che una creatura mortale possa lanciare. Semplicemente parlando ad alta voce, puoi alterare le basi stesse della realtà in accordo con i tuoi desideri.\r\n\r\nL\'uso base di questo incantesimo è duplicare qualsiasi altro incantesimo di 8° livello o inferiore. Non è necessario soddisfare alcun requisito di quell\'incantesimo, comprese le componenti costose. L\'incantesimo ha semplicemente effetto.\r\n\r\nLo stress di lanciare questo incantesimo per produrre qualsiasi effetto diverso dalla duplicazione di un altro incantesimo ti indebolisce. Dopo aver sopportato quello stress, ogni volta che lanci un incantesimo fino al termine di un riposo lungo, subisci 1d10 danni necrotici per livello di quell\'incantesimo. Questo danno non può essere ridotto o prevenuto in alcun modo. Inoltre, la tua Forza scende a 3, se non è già 3 o inferiore, per 2d4 giorni. Per ciascuno di quei giorni trascorsi riposando e facendo nient\'altro che attività leggere, il tempo di recupero rimanente diminuisce di 2 giorni. Infine, c\'è una probabilità del 33% che non sarai mai più in grado di esprimere un desiderio se soffri di questo stress.', 'Vocali', 0, 17, NULL),
('Discorso Motivazionale', 3, 'Incantamento', '1 Minuto', ' 18 Metri', '1 Ora', 'Scegli fino a cinque creature nel raggio d\'azione che possano sentirti. Per tutta la durata, ogni creatura influenzata ottiene 5 punti ferita temporanei e dispone di vantaggio ai tiri salvezza su Saggezza. Se una creatura influenzata viene colpita da un attacco, ha vantaggio al successivo tiro per colpire che effettua. Una volta che una creatura influenzata perde i punti ferita temporanei concessi da questo incantesimo, l\'incantesimo termina per quella creatura.\r\n\r\nA livelli più alti: Quando esegui questo incantesimo utilizzando uno slot incantesimo di 4° livello o superiore, i punti ferita temporanei aumentano di 5 per ogni livello di slot superiore al 3°.', 'Vocali', 0, NULL, 5),
('Disperdi Magia', 3, 'Abiurazione', '1 Azione', '36 Metri', 'Istantanea', 'Scegli qualsiasi creatura, oggetto o effetto magico nel raggio d\'azione. Qualsiasi incantesimo di 3° livello o inferiore sul bersaglio termina. Per ogni incantesimo di 4° livello o superiore sul bersaglio, effettua una prova di caratteristica usando la tua capacità da incantatore. La CD è pari a 10 + il livello dell\'incantesimo. Con una prova riuscita, l\'incantesimo termina.\r\n\r\nA livelli più alti. Quando lanci questo incantesimo utilizzando uno slot incantesimo di 4° livello o superiore, interrompi automaticamente gli effetti di un incantesimo sul bersaglio se il livello dell\'incantesimo è pari o inferiore al livello dello slot incantesimo utilizzato.', 'Vocali, Somatiche', 0, 5, 5),
('Divinazione', 4, 'Divinazione', '1 Azione', 'Se Stesso', 'Istantanea', 'La tua magia e un\'offerta ti mettono in contatto con un dio o con i servitori di un dio. Fai una singola domanda riguardante un obiettivo, un evento o un\'attività specifica da verificarsi entro 7 giorni. Il DM offre una risposta veritiera. La risposta potrebbe essere una breve frase, una rima criptica o un presagio.\r\n\r\nL\'incantesimo non tiene conto di eventuali circostanze che potrebbero modificare il risultato, come il lancio di incantesimi aggiuntivi o la perdita o il guadagno di un compagno.\r\n\r\nSe lanci questo incantesimo due o più volte prima di terminare il tuo successivo riposo lungo, c\'è una probabilità cumulativa del 25% per ogni lancio successivo al primo di ottenere una lettura casuale. Il DM effettua questo tiro in segreto.', '', 1, 7, NULL),
('Dominare Mostri', 8, 'Incantamento', '1 Azione', '18 Metri', 'Concentrazione, 1 Ora', 'Tenti di ingannare una creatura che puoi vedere a gittata. Deve riuscire un tiro salvezza su Saggezza o restare affascinato da te per la durata. Se tu o le creature a te amiche state combattendo contro di lui, ha vantaggio al tiro salvezza.\r\n\r\nMentre la creatura è affascinata, hai un legame telepatico con essa fintanto che voi due siete sullo stesso piano di esistenza. Puoi usare questo collegamento telepatico per impartire comandi alla creatura mentre sei cosciente (non è richiesta alcuna azione), cosa a cui lei fa del suo meglio per obbedire. Puoi specificare un\'azione semplice e generale, ad esempio \"Attacca quella creatura\", \"Corri laggiù\" o \"Prendi quell\'oggetto\". Se la creatura completa l\'ordine e non riceve ulteriori indicazioni da parte tua, si difende e si preserva al meglio delle sue capacità.\r\n\r\nPuoi usare la tua azione per assumere il controllo totale e preciso del bersaglio. Fino alla fine del tuo turno successivo, la creatura esegue solo le azioni che scegli e non fa nulla che non le permetti di fare. Durante questo periodo, puoi anche far sì che la creatura usi una reazione, ma ciò richiede che tu usi anche la tua stessa reazione.\r\n\r\nOgni volta che il bersaglio subisce danni, effettua un nuovo tiro salvezza su Saggezza contro l\'incantesimo. Se il tiro salvezza riesce, l\'incantesimo termina.', 'Vocali, Somatiche', 0, 15, 15),
('Drago Illusorio', 8, 'Illusione', '1 Azione', '36 Metri', 'Concentrazione, 1 Minuto', 'Raccogliendo fili di materiale d\'ombra dalla Coltre Oscura, crei un enorme drago d\'ombra in uno spazio non occupato che puoi vedere entro la gittata. L\'illusione dura per tutta la durata dell\'incantesimo e ne occupa lo spazio, come se fosse una creatura.\r\n\r\nQuando appare l\'illusione, tutti i tuoi nemici che possono vederla devono riuscire un tiro salvezza su Saggezza o ne rimangono spaventati per 1 minuto. Se una creatura spaventata termina il suo turno in un luogo in cui non ha linea di vista verso l\'illusione, può ripetere il tiro salvezza, ponendo fine all\'effetto su se stessa in caso di successo.\r\n\r\nCome azione bonus nel tuo turno, puoi spostare l\'illusione fino a 18 metri. In qualsiasi momento durante il suo movimento, puoi fargli esalare un\'esplosione di energia in un cono di 18 metri originata dal suo spazio.\r\n\r\nQuando crei il drago, scegli un tipo di danno: acido, freddo, fuoco, fulmine, necrotico o veleno. Ogni creatura nel cono deve effettuare un tiro salvezza su Intelligenza, subendo 7d6 danni del tipo di danno scelto se fallisce il tiro salvezza, o la metà di quei danni se lo riesce.\r\n\r\nL\'illusione è tangibile a causa delle ombre utilizzate per crearla, ma gli attacchi la mancano automaticamente. riesce a superare tutti i tiri salvezza ed è immune a tutti i danni e alle condizioni. Una creatura che utilizza un\'azione per esaminare il drago può determinare che si tratta di un\'illusione superando una prova di Intelligenza (Indagare) contro la CD del tiro salvezza dell\'incantesimo. Se una creatura riconosce l\'illusione per quello che è, può vedere attraverso di essa e dispone di vantaggio ai tiri salvezza contro il suo soffio.', 'Somatiche', 0, 15, NULL),
('Etereità', 7, 'Trasmutazione', '1 Azione', 'Se Stesso', '8 Ore', 'Entri nelle regioni di confine del Piano Etereo, nell\'area in cui si sovrappone al tuo piano attuale. Rimani nel Confine Etereo per la durata o finché non usi la tua azione per interrompere l\'incantesimo. Durante questo periodo, puoi muoverti in qualsiasi direzione. Se ti muovi verso l\'alto o verso il basso, ogni metro di movimento costa un piede in più. Puoi vedere e sentire l\'aereo da cui provieni, ma tutto lì sembra grigio e non puoi vedere nulla a più di 60 piedi di distanza.\n\nMentre ti trovi sul Piano Etereo, puoi influenzare ed essere influenzato solo da altre creature su quel piano. Le creature che non si trovano sul Piano Etereo non possono percepirti e non possono interagire con te, a meno che un\'abilità speciale o una magia non dia loro la capacità di farlo.\n\nIgnori tutti gli oggetti e gli effetti che non si trovano sul Piano Etereo, permettendoti di muoverti attraverso gli oggetti che percepisci sul piano da cui provieni. Quando l\'incantesimo termina, ritorni immediatamente al piano da cui provieni, nel punto che occupi attualmente. Se occupi lo stesso posto di un oggetto solido o di una creatura quando ciò accade, vieni immediatamente deviato nello spazio non occupato più vicino che puoi occupare e subisci danni da forza pari al doppio del numero di piedi di cui ti sei spostato.\nQuesto incantesimo non ha effetto se lo lanci mentre ti trovi sul Piano Etereo o su un piano che non confina con esso, come uno dei Piani Esterni.', 'Vocali, Somatiche', 0, 13, 13),
('Evoca Famiglio', 1, 'Evocazione ', '1 Ora', '3 Metri', 'Istantaneo', 'Ottieni il servizio di un famiglio, uno spirito che assume una forma animale a tua scelta: pipistrello, gatto, granchio, rana (rospo), falco, lucertola, polipo, gufo, serpente velenoso, pesce (quipper), ratto, corvo, mare cavallo, ragno o donnola. Apparendo in uno spazio non occupato entro la gittata, il famiglio ha le statistiche della forma scelta, sebbene sia un celestiale, un folletto o un immondo (a tua scelta) invece che una bestia.\n\nIl tuo famiglio agisce indipendentemente da te, ma obbedisce sempre ai tuoi comandi. In combattimento, tira di propria iniziativa e agisce nel proprio turno. Un famiglio non può attaccare, ma può eseguire altre azioni normalmente.\n\nQuando il famiglio scende a 0 punti ferita, scompare, senza lasciare alcuna forma fisica. Riappare dopo aver lanciato nuovamente questo incantesimo. Con un\'azione, puoi congedare temporaneamente il tuo famiglio in una dimensione tascabile. In alternativa, puoi ignorarlo per sempre. Con un\'azione mentre è temporaneamente congedato, puoi farlo ricomparire in qualsiasi spazio non occupato entro 9 metri da te. Ogni volta che il famiglio scende a 0 punti ferita o scompare nella dimensione tascabile, lascia nel suo spazio tutto ciò che indossava o trasportava.\n\nMentre il tuo famiglio si trova entro 30 metri da te, puoi comunicare con lui telepaticamente. Inoltre, come azione, puoi vedere attraverso gli occhi del tuo famiglio e sentire ciò che sente fino all\'inizio del tuo turno successivo, ottenendo i benefici di tutti i sensi speciali posseduti dal famiglio. Durante questo periodo sei sordo e cieco rispetto ai tuoi sensi.\n\nNon puoi avere più di un famiglio alla volta. Se esegui questo incantesimo mentre hai già un famiglio, gli fai invece adottare una nuova forma. Scegli uno dei moduli dall\'elenco sopra. Il tuo famiglio si trasforma nella creatura prescelta.', 'Vocali, Somatiche, Materiali', 1, 1, NULL),
('Gabbia di Forza', 7, 'Evocazione', '1 Azione', '36 Metri', '1 Ora', 'Una prigione immobile, invisibile, a forma di cubo, composta di forza magica, prende vita attorno a un\'area a gittata scelta dall\'incantatore. La prigione può essere una gabbia o una scatola solida, a tua scelta.\r\n\r\nUna prigione a forma di gabbia può avere un lato fino a 20 piedi ed è costituita da sbarre del diametro di 1/2 pollice distanziate di 1/2 pollice l\'una dall\'altra.\r\n\r\nUna prigione a forma di scatola può avere un lato massimo di 3 metri, creando una solida barriera che impedisce a qualsiasi materia di attraversarla e bloccando qualsiasi incantesimo lanciato dentro o fuori dall\'area.\r\n\r\nQuando lanci l\'incantesimo, qualsiasi creatura che si trova completamente all\'interno dell\'area della gabbia viene intrappolata. Le creature solo parzialmente all\'interno dell\'area, o quelle troppo grandi per entrare nell\'area, vengono spinte lontano dal centro dell\'area finché non sono completamente fuori dall\'area.\r\n\r\nUna creatura all\'interno della gabbia non può lasciarla con mezzi non magici. Se la creatura tenta di utilizzare il teletrasporto o il viaggio interplanare per lasciare la gabbia, deve prima effettuare un tiro salvezza su Carisma. In caso di successo, la creatura può usare quella magia per uscire dalla gabbia. In caso di fallimento, la creatura non può uscire dalla gabbia e spreca l\'uso dell\'incantesimo o dell\'effetto. La gabbia si estende anche nel Piano Etereo, bloccando i viaggi eterei.', 'Vocali, Somatiche, Materiali', 0, 13, 13),
('Geas', 5, 'Incantamento', '1 Minuto', '18 Metri', '30 Giorni', 'Immetti un comando magico su una creatura che puoi vedere a gittata, costringendola a svolgere qualche servizio o ad astenersi da qualche azione o corso di attività come decidi tu.\r\n\r\nSe la creatura può capirti, deve riuscire un tiro salvezza su Saggezza o rimanere affascinata da te per la durata. Mentre la creatura è affascinata da te, subisce 5d10 danni psichici ogni volta che agisce in modo direttamente contrario alle tue istruzioni, ma non più di una volta al giorno. Una creatura che non può capirti non è influenzata dall\'incantesimo.\r\n\r\nPuoi impartire qualsiasi comando tu scelga, tranne un\'attività che comporterebbe morte certa. Se impartisci un comando suicida, l\'incantesimo termina. Puoi terminare l\'incantesimo in anticipo utilizzando un\'azione per interromperlo. Anche un incantesimo Rimuovi Maledizione , Restaurazione Superiore o Desiderio lo pone fine.\r\n\r\nA livelli più alti. Quando esegui questo incantesimo utilizzando uno slot incantesimo di 7° o 8° livello, la durata è di 1 anno. Quando esegui questo incantesimo utilizzando uno slot incantesimo di 9° livello, l\'incantesimo dura finché non viene terminato da uno degli incantesimi menzionati sopra.', 'Vocali', 0, 9, 9),
('Globo di Invulnerabilità', 6, 'Abiurazione', '1 Azione', 'Se Stesso', 'Concentrazione, 1 Minuto', 'Una barriera immobile e debolmente luccicante appare in un raggio di 3 metri intorno a te e rimane per la durata.\r\n\r\nQualsiasi incantesimo di 5° livello o inferiore lanciato dall\'esterno della barriera non può influenzare le creature o gli oggetti al suo interno, anche se l\'incantesimo viene lanciato utilizzando uno slot incantesimo di livello superiore. Un incantesimo di questo tipo può prendere di mira creature e oggetti all\'interno della barriera, ma l\'incantesimo non ha alcun effetto su di essi. Allo stesso modo, l\'area all\'interno della barriera è esclusa dalle aree influenzate da tali incantesimi.', 'Vocali, Somatiche, Materiali', 0, 11, NULL),
('Identificare', 1, 'Divinazione', '1 Minuto', 'Tocco', 'Istantaneo', 'Scegli un oggetto che devi toccare durante il lancio dell\'incantesimo. Se è un oggetto magico o qualche altro oggetto intriso di magia, ne apprendi le proprietà e come usarle, se richiede sintonia per essere utilizzato e quante cariche ha, se presenti. Scopri se ci sono incantesimi che influenzano l\'oggetto e cosa sono. Se l\'oggetto è stato creato da un incantesimo, apprendi quale incantesimo lo ha creato.\r\n\r\nSe invece tocchi una creatura durante il lancio, apprendi quali incantesimi, se presenti, la stanno attualmente influenzando.', 'Vocali, Somatiche, Materiali', 1, 1, 1),
('Illusione Minore', 0, 'Illusone', '1 Azione', '9 Metri', '1 Minuto', 'Si crea un suono o un\'immagine di un oggetto nel raggio d\'azione che dura per tutta la durata. L\'illusione termina anche se la si respinge come azione o se si lancia nuovamente questo incantesimo.\n\nSe si crea un suono, il suo volume può variare da un sussurro a un urlo. Può essere la vostra voce, la voce di qualcun altro, il ruggito di un leone, il battito di un tamburo o qualsiasi altro suono a vostra scelta. Il suono continua ininterrottamente per tutta la durata, oppure si possono emettere suoni discreti in momenti diversi prima che l\'incantesimo finisca.\n\nSe si crea l\'immagine di un oggetto, come una sedia, un\'impronta di fango o un piccolo scrigno, questa non deve essere più grande di un cubo di 2 metri. L\'immagine non può creare suoni, luci, odori o altri effetti sensoriali. L\'interazione fisica con l\'immagine rivela che si tratta di un\'illusione, perché le cose possono attraversarla.\n\nSe una creatura usa la sua azione per esaminare il suono o l\'immagine, può determinare che si tratta di un\'illusione con una prova di Intelligenza (Investigazione) riuscita contro la DC di salvataggio dell\'incantesimo. Se una creatura riconosce l\'illusione per quello che è, l\'illusione diventa debole per la creatura.\n', 'Somatiche, Materiali', 0, 1, 1),
('Illusione Programmata', 6, 'Illusone', '1 Azione', '36 Metri', 'Sempre', 'Crei l\'illusione di un oggetto, una creatura o qualche altro fenomeno visibile entro il raggio d\'azione che si attiva quando si verifica una condizione specifica. Fino ad allora l\'illusione è impercettibile. Non deve essere più grande di un cubo di 9 metri e tu decidi quando lanci l\'incantesimo come si comporta l\'illusione e quali suoni emette. Questa performance con script può durare fino a 5 minuti.\r\n\r\nQuando si verifica la condizione da te specificata, l\'illusione prende vita e si comporta nel modo da te descritto. Una volta che l\'illusione termina di funzionare, scompare e rimane dormiente per 10 minuti. Trascorso questo tempo, l\'illusione può essere nuovamente attivata.\r\n\r\nLa condizione di attivazione può essere generale o dettagliata a piacere, anche se deve basarsi su condizioni visive o uditive che si verificano entro 9 metri dall\'area. Ad esempio, potresti creare l\'illusione di apparire e mettere in guardia gli altri che tentano di aprire una porta trappola, oppure potresti impostare l\'illusione affinché si attivi solo quando una creatura dice la parola o la frase corretta.\r\n\r\nL\'interazione fisica con l\'immagine rivela che è un\'illusione, perché le cose possono attraversarla. Una creatura che usa la sua azione per esaminare l\'immagine può determinare che si tratta di un\'illusione superando una prova di Intelligenza (Indagare) contro la CD del tiro salvezza dell\'incantesimo. Se una creatura discerne l\'illusione per quello che è, può vedere attraverso l\'immagine e qualsiasi rumore emesso le sembrerà vuoto.', 'Vocali, Somatiche, Materiali', 0, 11, 11),
('Immagine Riflessa', 2, 'Illusione', '1 Azione', 'Se Stesso', '1 Minuto', 'Tre duplicati illusori di te stesso appaiono nel tuo spazio. Fino al termine dell\'incantesimo, i duplicati si muovono con te e imitano le tue azioni, cambiando posizione in modo che sia impossibile individuare quale immagine sia reale. Puoi usare la tua azione per eliminare i duplicati illusori.\r\n\r\nOgni volta che una creatura ti prende di mira con un attacco durante la durata dell\'incantesimo, tira un d20 per determinare se l\'attacco prende invece di mira uno dei tuoi duplicati.\r\n\r\nSe hai tre duplicati, devi ottenere un 6 o più per cambiare il bersaglio dell\'attacco in un duplicato. Con due duplicati, devi ottenere un 8 o più. Con un duplicato, devi ottenere un 11 o più.\r\n\r\nLa CA di un duplicato è pari a 10 + il tuo modificatore di Destrezza. Se un attacco colpisce un duplicato, il duplicato viene distrutto. Un duplicato può essere distrutto solo da un attacco che lo colpisca. Ignora tutti gli altri danni ed effetti. L\'incantesimo termina quando tutti e tre i duplicati vengono distrutti.\r\n\r\nUna creatura non viene influenzata da questo incantesimo se non può vedere, se fa affidamento su sensi diversi dalla vista, come la vista cieca, o se può percepire le illusioni come false, come con la vera vista.', 'Vocali, Somatiche', 0, 3, 3),
('Invisibilità', 2, 'Illusone', '1 Azione', 'Tocco', 'Concentrazione, 1 Ora', 'Una creatura che tocchi diventa invisibile finché l\'incantesimo non termina. Tutto ciò che il bersaglio indossa o trasporta è invisibile fintanto che è sulla sua persona. L\'incantesimo termina per un bersaglio che attacca o lancia un incantesimo.\r\n\r\nA livelli più alti. Quando lanci questo incantesimo utilizzando uno slot incantesimo di 3° livello o superiore, puoi prendere come bersaglio una creatura aggiuntiva per ogni livello di slot superiore al 2°.', 'Vocali, Somatiche, Materiali', 0, 3, 3),
('Invisibilità Maggiore', 4, 'Illusione', '1 Azione', 'Tocco', 'Concentrazione, 1 Minuto', 'Tu o una creatura che tocchi diventate invisibili finché l\'incantesimo non termina. Tutto ciò che il bersaglio indossa o trasporta è invisibile fintanto che è sulla sua persona.', 'Vocali, Somatiche', 0, 7, 7),
('Labirinto', 8, 'Evocazione ', '1 Azione', '18 Metri', 'Concentrazione, 10 Minuti', 'Bandisci una creatura a gittata che puoi vedere in un semipiano labirintico. Il bersaglio rimane lì per tutta la durata o finché non esce dal labirinto.\r\n\r\nIl bersaglio può usare la sua azione per tentare di scappare. Quando lo fa, effettua una prova di Intelligenza con CD 20. Se ha successo, fugge e l\'incantesimo termina (un minotauro o un demone goristro riesce automaticamente).\r\n\r\nQuando l\'incantesimo termina, il bersaglio riappare nello spazio che ha lasciato o, se quello spazio è occupato, nello spazio non occupato più vicino.', 'Vocali, Somatiche', 0, 15, NULL),
('Levitare', 2, 'Trasmutazione', '1 Azione', '18 Metri', 'Concentrazione, 10 Minuti', 'Una creatura o un oggetto sciolto a gittata, a tua scelta e che puoi vedere, si alza verticalmente, fino a 6 metri, e rimane lì sospeso per tutta la durata. L\'incantesimo può far levitare un bersaglio che pesa fino a 500 libbre. Una creatura non consenziente che supera un tiro salvezza su Costituzione non viene influenzata.\r\n\r\nIl bersaglio può muoversi solo spingendo o tirando contro un oggetto fisso o una superficie a portata di mano (come un muro o un soffitto), che gli consente di muoversi come se si stesse arrampicando. Puoi modificare l\'altitudine del bersaglio fino a un massimo di 20 piedi in entrambe le direzioni durante il tuo turno. Se sei tu il bersaglio, puoi muoverti su o giù come parte del tuo movimento. Altrimenti puoi usare la tua azione per spostare il bersaglio, che deve rimanere all\'interno del raggio d\'azione dell\'incantesimo.\r\n\r\nQuando l\'incantesimo termina, il bersaglio fluttua dolcemente a terra se è ancora in volo.', 'Vocali, Somatiche, Materiali', 0, 3, NULL),
('Lingue', 3, 'Divinazione', '1 Azione', 'Tocco', '1 Ora', 'Questo incantesimo conferisce alla creatura che tocchi la capacità di comprendere qualsiasi linguaggio parlato senta. Inoltre, quando il bersaglio parla, qualsiasi creatura che conosca almeno una lingua e possa sentire il bersaglio capisce cosa dice', 'Vocali, Materiali', 0, 5, 5),
('Lungimiranza', 9, 'Divinazione', '1 Minuto', 'Tocco', '8 Ore', 'Tocchi una creatura consenziente e conferisci una capacità limitata di vedere nell\'immediato futuro. Per tutta la durata, il bersaglio non può essere sorpreso e dispone di vantaggio ai tiri per colpire, alle prove di caratteristica e ai tiri salvezza. Inoltre, le altre creature hanno svantaggio ai tiri per colpire contro il bersaglio per tutta la durata. Questo incantesimo termina immediatamente se lo lanci nuovamente prima che termini la sua durata', 'Vocali, Somatiche, Materiali', 0, 17, 17),
('Mano Magica', 0, 'Evocazione ', '1 Azione', '9 Metri', '1 Minuto', 'Una mano spettrale e fluttuante appare in un punto a scelta nel raggio d\'azione. La mano dura per tutta la durata dell\'incantesimo o finché non la si respinge con un\'azione. La mano scompare se si trova a più di 9 metri di distanza da voi o se lanciate di nuovo questo incantesimo.\n\nSi può usare un\'azione per controllare la mano. Si può usare la mano per manipolare un oggetto, aprire una porta o un contenitore aperto, riporre o recuperare un oggetto da un contenitore aperto o versare il contenuto di una fiala. Si può muovere la mano fino a 9 metri ogni volta che la si usa.\n\nLa mano non può attaccare, attivare oggetti magici o trasportare più di 4 kg', 'Vocali, Somatiche', 0, 1, 1),
('Mente Vuota', 8, 'Abiurazione', '1 Azione', 'Tocco', '24 Ore', 'Fino al termine dell\'incantesimo, una creatura consenziente toccata dall\'incantatore è immune ai danni psichici, a qualsiasi effetto che ne percepirebbe le emozioni o ne leggesse i pensieri, agli incantesimi di divinazione e alla condizione affascinato. L\'incantesimo sventa anche gli incantesimi Desiderio e gli incantesimi o effetti di potere simile utilizzati per influenzare la mente del bersaglio o per ottenere informazioni sul bersaglio.', 'Vocali, Somatiche', 0, 15, 15),
('Miraggio Arcano', 7, 'Illusone', '10 Minuto', '36 Metri', '10 Giorni', 'Fai in modo che il terreno in un\'area fino a 1 miglio quadrato assomigli, suoni, odori e sembri addirittura un altro tipo di terreno. La forma generale del terreno rimane tuttavia la stessa. I campi aperti o una strada potrebbero essere fatti per assomigliare a una palude, una collina, un crepaccio o qualche altro terreno difficile o impraticabile. Uno stagno può essere fatto sembrare un prato erboso, un precipizio come un dolce pendio, o un burrone cosparso di rocce come una strada ampia e liscia.\r\n\r\nAllo stesso modo, puoi modificare l\'aspetto delle strutture o aggiungerle dove non sono presenti. L\'incantesimo non camuffa, nasconde o aggiunge creature.\r\n\r\nL\'illusione include elementi uditivi, visivi, tattili e olfattivi, quindi può trasformare il terreno sgombrato in terreno difficile (o viceversa) o impedire in altro modo il movimento attraverso l\'area. Qualsiasi pezzo di terreno illusorio (come una roccia o un bastone) che viene rimosso dall\'area dell\'incantesimo scompare immediatamente.\r\n\r\nLe creature dotate di vera vista possono vedere attraverso l\'illusione la vera forma del terreno; tuttavia, tutti gli altri elementi dell\'illusione rimangono, quindi mentre la creatura è consapevole della presenza dell\'illusione, può ancora interagire fisicamente con l\'illusione.', 'Vocali, Somatiche', 0, 13, NULL);
INSERT INTO `incantesimo` (`Nome`, `Livello`, `Scuola`, `Tempo_di_Lancio`, `Distanza`, `Durata`, `Descrizione`, `Componenti`, `Rituale`, `ID_Mago`, `ID_Bardo`) VALUES
('Missile Magico', 1, 'Invocazione', '1 Azione', '36 Metri', 'Istantaneo', 'Crei tre dardi luminosi di forza magica. Ogni dardo colpisce una creatura a gittata, a tua scelta, che puoi vedere. Un dardo infligge 1d4 + 1 danno da forza al suo bersaglio. I dardi colpiscono tutti simultaneamente e puoi dirigerli per colpire una o più creature.\r\n\r\nA livelli più alti. Quando esegui questo incantesimo utilizzando uno slot incantesimo di 2° livello o superiore, l\'incantesimo crea un dardo in più per ogni livello dello slot superiore al 1°.', 'Vocali, Somatiche', 0, 1, NULL),
('Modifica Memoria', 5, 'Incantamento', '1 Azione', '9 Metri', 'Concentrazione, 1 Minuto', 'Tenti di rimodellare i ricordi di un\'altra creatura. Una creatura che puoi vedere deve effettuare un tiro salvezza su Saggezza. Se stai combattendo contro la creatura, essa ha vantaggio al tiro salvezza. Se fallisce il Tiro Salvezza, il bersaglio resta affascinato da te per la durata. Il bersaglio affascinato è incapace e inconsapevole di ciò che lo circonda, sebbene possa ancora sentirti. Se subisce danni o viene preso di mira da un altro incantesimo, l\'incantesimo termina e nessuno dei ricordi del bersaglio viene modificato.\n\nPer tutta la durata dell\'incantesimo, è possibile influenzare la memoria del bersaglio di un evento vissuto nelle ultime 24 ore e durato non più di 10 minuti. Puoi eliminare permanentemente tutta la memoria dell\'evento, consentire al bersaglio di ricordare l\'evento con perfetta chiarezza e precisione nei dettagli, modificare la sua memoria dei dettagli dell\'evento o creare un ricordo di qualche altro evento.\n\nDevi parlare al bersaglio per descrivere come vengono influenzati i suoi ricordi e deve essere in grado di comprendere la tua lingua affinché i ricordi modificati possano mettere radici. La sua mente riempie eventuali lacune nei dettagli della tua descrizione. Se l\'incantesimo termina prima che tu abbia finito di descrivere i ricordi modificati, la memoria della creatura non viene alterata. Altrimenti, i ricordi modificati si imporranno al termine dell\'incantesimo.\n\nUna memoria modificata non influenza necessariamente il comportamento di una creatura, in particolare se la memoria contraddice le inclinazioni naturali, l\'allineamento o le convinzioni della creatura. Una memoria modificata illogica, come impiantare un ricordo di quanto la creatura si è divertita a bagnarsi nell\'acido, viene liquidata, forse come un brutto sogno. Il DM potrebbe ritenere che un ricordo modificato sia troppo privo di senso per influenzare una creatura in modo significativo.', 'Vocali, Somatiche', 0, 9, 9),
('Muro di Forza', 5, 'Evocazione ', '1 Azione', '36 Metri', 'Concentrazione, 10 Minuti', 'Un invisibile muro di forza emerge in un punto a gittata scelto dall\'incantatore.\nIl muro appare nell\'orientamento scelto, come barriera orizzontale o verticale oppure ad angolo. Può galleggiare liberamente o appoggiarsi su una superficie solida. Puoi modellarlo in una cupola emisferica o in una sfera con un raggio massimo di 3 metri, oppure puoi modellare una superficie piana composta da dieci pannelli di 3 metri per 3 metri. Ogni pannello deve essere contiguo ad un altro pannello. In qualsiasi forma, il muro ha uno spessore di 1/4 di pollice. Dura per tutta la durata. Se il muro attraversa lo spazio di una creatura quando appare, la creatura viene spinta su un lato del muro (a te la scelta su quale lato).\n\nNiente può fisicamente passare attraverso il muro. È immune a tutti i danni e non può essere dissolto tramite dissolvi magie . Tuttavia, un incantesimo di disintegrazione distrugge il muro all\'istante. Il muro si estende anche nel Piano Etereo, bloccando il viaggio etereo attraverso il muro.', 'Vocali, Somatiche, Materiali', 0, 9, NULL),
('Muro di Ghiaccio', 6, 'Evocazione ', '1 Azione', '36 Metri', 'Concentrazione, 10 Minuti', 'Crei un muro di ghiaccio su una superficie solida entro la gittata. Puoi modellarlo in una cupola emisferica o in una sfera con raggio fino a 3 metri, oppure puoi modellare una superficie piana composta da dieci pannelli quadrati di 3 metri. Ogni pannello deve essere contiguo ad un altro pannello. In qualsiasi forma, il muro è spesso 30 cm e dura per la durata.\r\n\r\nSe il muro attraversa lo spazio di una creatura quando appare, la creatura all\'interno della sua area viene spinta da un lato del muro e deve effettuare un tiro salvezza su Destrezza. Se il Tiro Salvezza fallisce, la creatura subisce 10d6 danni da freddo, o la metà di questi danni se il Tiro Salvezza riesce.\r\n\r\nIl muro è un oggetto che può essere danneggiato e quindi sfondato. Ha CA 12 e 30 punti ferita per sezione di 3 metri ed è vulnerabile ai danni da fuoco. Ridurre una sezione di muro di 3 metri a 0 punti ferita la distrugge e lascia dietro di sé una cortina di aria gelida nello spazio occupato dal muro. Una creatura che si muove attraverso la cortina di aria gelida per la prima volta in un turno deve effettuare un tiro salvezza su Costituzione. La creatura subisce 5d6 danni da freddo se fallisce il tiro salvezza, o la metà di questi danni se lo supera.', 'Vocali, Somatiche, Materiali', 0, 11, NULL),
('Occhiata', 6, 'Necromanzia', '1 Azione', 'Se Stesso', 'Concentrazione, 1 Minuto', 'Per la durata dell\'incantesimo, i tuoi occhi diventano un vuoto d\'inchiostro intriso di potere terrificante. Una creatura a tua scelta entro 18 metri da te e che puoi vedere deve riuscire un tiro salvezza su Saggezza o essere influenzata da uno dei seguenti effetti a tua scelta per la durata. In ciascuno dei tuoi turni fino al termine dell\'incantesimo, puoi usare la tua azione per prendere di mira un\'altra creatura, ma non puoi prendere di nuovo a bersaglio una creatura se ha superato un tiro salvezza contro questo lancio di morso oculare.\r\n\r\nAddormentato. Il bersaglio perde i sensi. Si sveglia se subisce danni o se un\'altra creatura usa la sua azione per scuotere il dormiente.\r\nIn preda al panico. Il bersaglio ha paura di te. In ciascuno dei suoi turni, la creatura spaventata deve eseguire l\'azione Scattare e allontanarsi da te seguendo il percorso più sicuro e breve disponibile, a meno che non ci sia nessun posto dove muoversi. Se il bersaglio si sposta in un luogo ad almeno 18 metri di distanza da te dove non può più vederti, questo effetto termina.\r\nMalato. Il bersaglio ha svantaggio ai tiri per colpire e alle prove di caratteristica. Alla fine di ogni suo turno, può effettuare un altro tiro salvezza su Saggezza. Se ha successo, l\'effetto termina.', 'Vocali, Somatiche', 0, 11, 11),
('Oscurità', 2, 'Invocazione', '1 Azione', '18 Metri', 'Concentrazione, 10 Minuti', 'L\'oscurità magica si diffonde da un punto a gittata scelto dall\'utente per riempire una sfera del raggio di 4,5 metri per la durata. L\'oscurità si diffonde dietro gli angoli. Una creatura dotata di scurovisione non può vedere attraverso questa oscurità e la luce non magica non può illuminarla.\r\n\r\nSe il punto scelto è su un oggetto che stai tenendo o su uno che non viene indossato o trasportato, l\'oscurità emana dall\'oggetto e si muove con esso. Coprire completamente la fonte dell\'oscurità con un oggetto opaco, come una ciotola o un elmo, blocca l\'oscurità.\r\n\r\nSe una qualsiasi area di questo incantesimo si sovrappone a un\'area di luce creata da un incantesimo di 2° livello o inferiore, l\'incantesimo che ha creato la luce viene dissolto.', 'Vocali, Materiali', 0, 3, NULL),
('Palla di Fuoco', 3, 'Evocazione', '1 Azione', '45 Metri', 'Istantanea', 'Una striscia luminosa lampeggia dal tuo dito puntato verso un punto da te scelto entro il raggio d\'azione, quindi sboccia con un basso ruggito in un\'esplosione di fiamme. Ogni creatura in un raggio di 6 metri deve effettuare un tiro salvezza su Destrezza. Un bersaglio subisce 8d6 danni da fuoco se fallisce il tiro salvezza, o la metà di questi danni se lo supera. Il fuoco si diffonde dietro gli angoli. Accende gli oggetti infiammabili presenti nell\'area che non vengono indossati o trasportati.\r\n\r\nA livelli più alti. Quando esegui questo incantesimo utilizzando uno slot incantesimo di 4° livello o superiore, il danno aumenta di 1d6 per ogni livello dello slot superiore al 3°.', 'Vocali, Somatiche, Materiali', 0, 5, NULL),
('Parlare con i Morti', 3, 'Necromanzia', '1 Azione', '3 Metri', '10 Minuti', 'Concedi una parvenza di vita e intelligenza a un cadavere di tua scelta che si trova a gittata, permettendogli di rispondere alle domande che poni. Il cadavere deve avere ancora la bocca e non può essere un non morto. L\'incantesimo fallisce se il cadavere è stato il bersaglio di questo incantesimo negli ultimi 10 giorni.\r\n\r\nFino alla fine dell\'incantesimo, puoi porre al cadavere fino a cinque domande. Il cadavere sa solo quello che sapeva in vita, comprese le lingue che conosceva. Le risposte sono solitamente brevi, criptiche o ripetitive e il cadavere non ha alcun obbligo di offrire una risposta veritiera se gli sei ostile o se ti riconosce come un nemico. Questo incantesimo non riporta l\'anima della creatura nel suo corpo, ma solo il suo spirito animatore. Pertanto, il cadavere non può apprendere nuove informazioni, non comprende nulla di ciò che è accaduto da quando è morto e non può fare speculazioni sugli eventi futuri.', 'Vocali, Somatiche, Materiali', 0, NULL, 5),
('Parola Curativa', 1, 'Invocazione', '1 Azione Bonus', '18 Metri', 'Istantaneo', 'Una creatura a gittata, a tua scelta e che puoi vedere, recupera punti ferita pari a 1d4 + il tuo modificatore di abilità da incantatore. Questo incantesimo non ha effetto sui non morti o sui costrutti.\r\n\r\nA livelli più alti. Quando esegui questo incantesimo utilizzando uno slot incantesimo di 2° livello o superiore, la guarigione aumenta di 1d4 per ogni livello dello slot superiore al 1°.', 'Vocali', 0, NULL, 1),
('Passo Lontano', 5, 'Evocazione', '1 Azione Bonus', 'Se Stesso', 'Concentrazione, 1 Minuto', 'Ti teletrasporti fino a 18 metri in uno spazio non occupato che puoi vedere. In ciascuno dei tuoi turni prima della fine dell\'incantesimo, puoi utilizzare un\'azione bonus per teletrasportarti nuovamente in questo modo.', 'Vocali', 0, 9, NULL),
('Pattern Ipnotico', 3, 'Illusione', '1 Azione', '36 Metri', 'Concentrazione, 1 Minuto', 'Crei una trama contorta di colori che si intreccia nell\'aria all\'interno di un cubo di 9 metri entro gittata. Lo schema appare per un attimo e poi svanisce. Ogni creatura nell\'area che vede la trama deve effettuare un tiro salvezza su Saggezza. Se il Tiro Salvezza fallisce, la creatura diventa affascinata per la durata. Mentre è affascinata da questo incantesimo, la creatura è incapace e ha una velocità pari a 0.\r\n\r\nL\'incantesimo termina per una creatura influenzata se subisce danni o se qualcun altro usa un\'azione per scuotere la creatura dal suo torpore.', 'Somatiche, Materiali', 0, 5, 5),
('Paura', 3, 'Illusone', '1 Azione', '9 Metri', 'Concentrazione, 1 Minuto', 'Proietti un\'immagine fantasmatica delle peggiori paure di una creatura. Ogni creatura in un cono di 9 metri deve riuscire un tiro salvezza su Saggezza o lasciar cadere ciò che tiene in mano e diventare spaventata per la durata.\r\n\r\nMentre è spaventata da questo incantesimo, una creatura deve eseguire l\'azione Scattare e allontanarsi da te seguendo il percorso più sicuro disponibile in ciascuno dei suoi turni, a meno che non ci sia nessun posto dove muoversi. Se la creatura termina il suo turno in un luogo in cui non ha linea di vista verso di te, può effettuare un tiro salvezza su Saggezza. Se il tiro salvezza riesce, l\'incantesimo termina per quella creatura.', 'Vocali, Somatiche, Materiali', 0, 5, 5),
('Polimorfo', 4, 'Trasmutazione', '1 Azione', '18 Metri', 'Concentrazione, 1 Ora', 'Questo incantesimo trasforma una creatura che puoi vedere nel raggio d\'azione in una nuova forma. Una creatura non consenziente deve effettuare un tiro salvezza su Saggezza per evitare l\'effetto. Un mutaforma supera automaticamente questo tiro salvezza.\r\n\r\nLa trasformazione dura per la durata o finché il bersaglio non scende a 0 punti ferita o muore. La nuova forma può essere qualsiasi bestia il cui grado di sfida sia uguale o inferiore a quello del bersaglio (o al livello del bersaglio, se non ha un grado di sfida). Le statistiche di gioco del bersaglio, inclusi i punteggi di abilità mentale, vengono sostituite dalle statistiche della bestia scelta. Mantiene il suo allineamento e la sua personalità.\r\n\r\nIl bersaglio assume i punti ferita della sua nuova forma. Quando ritorna alla sua forma normale, la creatura ritorna al numero di punti ferita che aveva prima della trasformazione. Se ritorna come risultato della caduta a 0 punti ferita, qualsiasi danno in eccesso viene riportato alla sua forma normale. Finché il danno in eccesso non riduce la forma normale della creatura a 0 punti ferita, questa non perde i sensi.\r\n\r\nLa creatura è limitata nelle azioni che può compiere a causa della natura della sua nuova forma e non può parlare, lanciare incantesimi o intraprendere qualsiasi altra azione che richieda le mani o la parola.\r\n\r\nL\'equipaggiamento del bersaglio si fonde nella nuova forma. La creatura non può attivare, utilizzare, impugnare o beneficiare in altro modo del suo equipaggiamento. Questo incantesimo non può influenzare un bersaglio che ha 0 punti ferita.', 'Vocali, Somatiche, Materiali', 0, 7, 7),
('Porta Dimensionale', 4, 'Evocazione', '1 Azione', '150 Metri', 'Istantanea', 'Ti teletrasporti dalla tua posizione attuale a qualsiasi altro punto nel raggio d\'azione. Arrivi esattamente nel punto desiderato. Può essere un luogo che puoi vedere, che puoi visualizzare o che puoi descrivere indicando la distanza e la direzione, come \"200 piedi verso il basso\" o \"verso l\'alto verso nord-ovest con un angolo di 45 gradi, 300 piedi\".\r\n\r\nPuoi portare con te oggetti purché il loro peso non superi quello che puoi trasportare. Puoi anche portare con te una creatura consenziente della tua taglia o più piccola che stia trasportando equipaggiamento fino alla sua capacità di carico. La creatura deve trovarsi entro 1,5 metri da te quando lanci questo incantesimo.\r\n\r\nSe arrivi in ​​un luogo già occupato da un oggetto o da una creatura, tu e qualsiasi creatura che viaggia con te subite 4d6 danni da forza ciascuno e l\'incantesimo non riesce a teletrasportarvi.', 'Vocali', 0, 7, 7),
('Portale', 9, 'Evocazione ', '1 Azione', '18 Metri', 'Concentrazione, 1 Minuto', 'Evochi un portale che collega uno spazio non occupato che puoi vedere a gittata con una posizione precisa su un diverso piano di esistenza. Il portale è un\'apertura circolare, che puoi realizzare con un diametro compreso tra 1,5 e 20 piedi. Puoi orientare il portale in qualsiasi direzione tu scelga. Il portale dura per tutta la durata.\r\n\r\nIl portale ha una parte anteriore e una parte posteriore su ciascun piano in cui appare. Il viaggio attraverso il portale è possibile solo muovendosi attraverso la sua parte anteriore. Qualunque cosa lo faccia viene immediatamente trasportato sull\'altro piano, apparendo nello spazio non occupato più vicino al portale.\r\n\r\nLe divinità e altri governanti planari possono impedire che i portali creati da questo incantesimo si aprano in loro presenza o ovunque all\'interno dei loro domini.\r\n\r\nQuando lanci questo incantesimo, puoi pronunciare il nome di una creatura specifica (uno pseudonimo, titolo o soprannome non funziona). Se quella creatura si trova su un piano diverso da quello su cui ti trovi, il portale si apre nelle immediate vicinanze della creatura nominata e attira la creatura attraverso di esso fino allo spazio non occupato più vicino dal tuo lato del portale. Non ottieni alcun potere speciale sulla creatura ed è libera di agire come il DM ritiene appropriato. Potrebbe andarsene, attaccarti o aiutarti.', 'Vocali, Somatiche, Materiali', 0, 17, NULL),
('Ragnatela', 2, 'Evocazione ', '1 Azione', '18 Metri', 'Concentrazione, 1 Ora', 'Evochi una massa di ragnatela spessa e appiccicosa in un punto a gittata di tua scelta. Da quel punto le ragnatele riempiono un cubo di 6 metri per la durata. Le ragnatele sono terreni difficili e oscurano leggermente la loro area.\r\n\r\nSe le ragnatele non sono ancorate tra due masse solide (come muri o alberi) o stratificate su un pavimento, muro o soffitto, la ragnatela evocata collassa su se stessa e l\'incantesimo termina all\'inizio del turno successivo dell\'incantatore. Le tele stratificate su una superficie piana hanno una profondità di 5 piedi.\r\n\r\nOgni creatura che inizia il suo turno nelle ragnatele o che vi entra durante il suo turno deve effettuare un tiro salvezza su Destrezza. Se fallisce il Tiro Salvezza, la creatura è trattenuta finché rimane nelle ragnatele o finché non si libera.\r\n\r\nUna creatura trattenuta dalle ragnatele può usare la sua azione per effettuare una prova di Forza contro la CD del tiro salvezza dell\'incantesimo. Se ha successo, non è più trattenuto.\r\n\r\nLe tele sono infiammabili. Qualsiasi cubo di ragnatela di 1,5 metri esposto al fuoco brucia in 1 round, infliggendo 2d4 danni da fuoco a qualsiasi creatura che inizi il suo turno nel fuoco.', 'Vocali, Somatiche, Materiali', 0, 3, NULL),
('Rallentamento', 3, 'Trasmutazione', '1 Azione', '36 Metri', 'Concentrazione, 1 Minuto', 'Alteri il tempo attorno a un massimo di sei creature di tua scelta in un cubo di 40 piedi entro gittata. Ogni bersaglio deve riuscire un tiro salvezza su Saggezza o essere influenzato da questo incantesimo per la durata.\r\n\r\nLa velocità di un bersaglio influenzato è dimezzata, subisce una penalità di -2 alla CA e ai tiri salvezza su Destrezza e non può usare reazioni. Nel suo turno può utilizzare un\'azione o un\'azione bonus, non entrambe. Indipendentemente dalle capacità o dagli oggetti magici della creatura, essa non può effettuare più di un attacco in mischia o a distanza durante il suo turno.\r\n\r\nSe la creatura tenta di lanciare un incantesimo con un tempo di lancio pari a 1 azione, tira un d20. Con 11 o più, l\'incantesimo non ha effetto fino al turno successivo della creatura, e la creatura deve usare la sua azione in quel turno per completare l\'incantesimo. Se non può, l\'incantesimo è sprecato.\r\n\r\nUna creatura influenzata da questo incantesimo effettua un altro tiro salvezza su Saggezza alla fine di ciascuno dei suoi turni. Se il Tiro Salvezza riesce, l\'effetto termina.', 'Vocali, Somatiche, Materiali', 0, 5, NULL),
('Resuscitare Morti', 5, 'Necromanzia', '1 Ora', 'Tocco', 'Istantaneo', 'Riporti in vita una creatura morta che tocchi, a condizione che sia morta da non più di 10 giorni. Se l\'anima della creatura è disposta e libera di ricongiungersi al corpo, la creatura ritorna in vita con 1 punto ferita.\r\n\r\nQuesto incantesimo neutralizza anche qualsiasi veleno e cura le malattie non magiche che colpivano la creatura al momento della sua morte. Questo incantesimo, tuttavia, non rimuove malattie magiche, maledizioni o effetti simili; se questi non vengono rimossi prima di lanciare l\'incantesimo, hanno effetto quando la creatura ritorna in vita. L\'incantesimo non può riportare in vita una creatura non morta.\r\n\r\nQuesto incantesimo chiude tutte le ferite mortali, ma non ripristina le parti del corpo mancanti. Se alla creatura mancano parti del corpo o organi necessari alla sua sopravvivenza – la testa, per esempio – l\'incantesimo fallisce automaticamente.\r\n\r\nRitornare dalla morte è una dura prova. Il bersaglio subisce una penalità di -4 a tutti i tiri per colpire, tiri salvezza e prove di caratteristica. Ogni volta che il bersaglio termina un riposo lungo, la penalità viene ridotta di 1 finché non scompare.', 'Vocali, Somatiche, Materiali', 0, NULL, 9),
('Rintocco Dei Morti', 0, 'Necromanzia', '1 Azione', '18 Metri', 'Istantaneo', 'Si punta una creatura visibile nel raggio d\'azione e il suono di una campana dolorosa riempie l\'aria intorno ad essa per un momento. Il bersaglio deve riuscire in un tiro salvezza di Saggezza o subire 1d8 danni necrotici. Se il bersaglio non ha punti ferita, subisce 1d12 danni necrotici.\n\nAi livelli superiori. I danni dell\'incantesimo aumentano di un dado al 5° livello (2d8 o 2d12), all\'11° livello (3d8 o 3d12) e al 17° livello (4d8 o 4d12).', 'Vocali, Somatiche', 0, 1, NULL),
('Riparazione', 0, 'Trasmutazione', '1 Minuto', 'Tocco', 'Istantaneo', 'Questo incantesimo ripara una singola rottura o strappo in un oggetto che si tocca, come un anello di catena rotto, due metà di una chiave rotta, un mantello strappato o un otre che perde. Finché la rottura o lo strappo non è più grande di un metro in qualsiasi dimensione, viene riparato senza lasciare traccia del danno precedente.\r\n\r\nQuesto incantesimo può riparare fisicamente un oggetto o un costrutto magico, ma non può ripristinare la magia su tale oggetto.', 'Vocali, Somatiche, Materiali', 0, 1, 1),
('Risata Incontenibile', 1, 'Incantamento', '1 Azione', '9 Metri', 'Concentrazione, 1 Minuto', 'Una creatura di tua scelta che puoi vedere a gittata percepisce tutto come esilarante e divertente e scoppia a ridere se questo incantesimo la influenza. Il bersaglio deve superare un tiro salvezza su Saggezza o cadere prono, diventando incapace e incapace di alzarsi per tutta la durata. Una creatura con un punteggio di Intelligenza pari o inferiore a 4 non viene influenzata.\r\n\r\nAlla fine di ciascuno dei suoi turni, e ogni volta che subisce danni, il bersaglio può effettuare un altro tiro salvezza su Saggezza. Il bersaglio dispone di vantaggio al tiro salvezza se questo è attivato da danni. In caso di successo, l\'incantesimo termina.', 'Vocali, Somatiche, Materiali', 0, 1, 1),
('Rivela Magia', 1, 'Divinazione', '1 Azione', 'Se Stesso', 'Concentrazione, 10 Minuti', 'Per tutta la durata, percepisci la presenza della magia entro 9 metri da te. Se percepisci la magia in questo modo, puoi usare la tua azione per vedere una debole aura attorno a qualsiasi creatura o oggetto visibile nell\'area che porta la magia, e apprendi la sua scuola di magia, se presente.\r\n\r\nL\'incantesimo può penetrare la maggior parte delle barriere, ma viene bloccato da 30 cm di pietra, 2,5 cm di metallo comune, un sottile foglio di piombo o 90 cm di legno o terra.', 'Vocali, Somatiche', 1, 1, 1),
('Scrutare', 5, 'Divinazione', '10 Minuti', 'Se Stesso', 'Concentrazione, 10 Minuti', 'Puoi vedere e sentire una particolare creatura di tua scelta che si trova sul tuo stesso piano di esistenza. Il bersaglio deve effettuare un tiro salvezza su Saggezza, che viene modificato in base a quanto bene conosci il bersaglio e al tipo di connessione fisica che hai con esso. Se un bersaglio sa che stai lanciando questo incantesimo, può fallire volontariamente il tiro salvezza se vuole essere osservato.\r\nConoscenza Salva modificatore\r\nDi seconda mano (hai sentito parlare dell\'obiettivo)	+5\r\nIn prima persona (hai raggiunto l\'obiettivo) +0\r\nFamiliare (conosci bene l\'obiettivo) -5\r\nConnessione Salva modificatore\r\nSomiglianza o immagine -2\r\nPossesso o indumento -4\r\nParte del corpo, ciocca di capelli, pezzetto di unghia o simili  -10\r\nSe il Tiro Salvezza riesce, il bersaglio non viene influenzato e non puoi usare nuovamente questo incantesimo contro di lui per 24 ore.\r\n\r\nSe il tiro salvezza fallisce, l\'incantesimo crea un sensore invisibile entro 3 metri dal bersaglio. Puoi vedere e sentire attraverso il sensore come se fossi lì. Il sensore si muove con il bersaglio, rimanendo entro 3 metri da esso per la durata. Una creatura in grado di vedere oggetti invisibili vede il sensore come una sfera luminosa delle dimensioni di un pugno.\r\n\r\nInvece di prendere di mira una creatura, puoi scegliere un luogo che hai già visto come bersaglio di questo incantesimo. Quando lo fai, il sensore appare in quella posizione e non si muove.', 'Vocali, Somatiche, Materiali', 0, 9, 9),
('Scudo', 1, 'Abiurazione', '1 Reazione', 'Se Stesso', '1 Turno', 'Una barriera invisibile di forza magica appare e ti protegge. Fino all\'inizio del tuo turno successivo, hai un bonus di +5 alla CA, incluso contro l\'attacco attivante, e non subisci danni dal dardo incantato .', 'Vocali, Somatiche', 0, 1, NULL),
('Serratura Arcana', 2, 'Abiurazione', '1 Azione', 'Tocco', 'Sempre', 'Tocchi una porta chiusa, una finestra, un cancello, un forziere o un altro ingresso e questo diventa bloccato per la durata.\r\n\r\nTu e le creature da te designate quando lanci questo incantesimo potete aprire l\'oggetto normalmente. Puoi anche impostare una password che, se pronunciata entro 1,5 metri dall\'oggetto, sopprime questo incantesimo per 1 minuto. Altrimenti, è invalicabile finché non viene rotto o l\'incantesimo viene dissolto o soppresso. Lanciare Bussare sull\'oggetto sopprime Blocco Arcano per 10 minuti.\r\n\r\nMentre è affetto da questo incantesimo, l\'oggetto è più difficile da rompere o da aprire con la forza; la CD per romperlo o scassinare qualsiasi serratura aumenta di 10.', 'Vocali, Somatiche, Materiali', 0, 3, NULL),
('Silenzio', 2, 'Illusone', '1 Azione', '36 Metri', 'Concentrazione, 10 Minuti', 'Per la sua durata, nessun suono può essere creato all\'interno o passare attraverso una sfera del raggio di 6 metri centrata su un punto a gittata scelto dall\'utente. Qualsiasi creatura o oggetto interamente all\'interno della sfera è immune ai danni da tuono e le creature sono assordate mentre sono interamente all\'interno della sfera. Qui è impossibile lanciare un incantesimo che includa una componente verbale.', 'Vocali, Somatiche', 1, NULL, 3),
('Simbolo', 7, 'Abiurazione', '1 Minuto', 'Tocco', 'Sempre', 'Quando esegui questo incantesimo, inscrivi un glifo dannoso su una superficie (come una sezione di pavimento, un muro o un tavolo) o all\'interno di un oggetto che può essere chiuso per nascondere il glifo (come un libro, una pergamena o uno scrigno del tesoro). Se scegli una superficie, il glifo può coprire un\'area della superficie non più grande di 3 metri di diametro. Se scegli un oggetto, quell\'oggetto deve rimanere al suo posto; se l\'oggetto viene spostato a più di 3 metri da dove hai lanciato l\'incantesimo, il glifo viene rotto e l\'incantesimo termina senza essere attivato.\n\nIl glifo è quasi invisibile e richiede una prova di Intelligenza (Indagare) contro la CD del tiro salvezza dell\'incantesimo per trovarlo.\n\nSei tu a decidere cosa attiva il glifo quando lanci l\'incantesimo. Per i glifi incisi su una superficie, i trigger più tipici includono toccare o calpestare il glifo, rimuovere un altro oggetto che lo copre, avvicinarsi entro una certa distanza o manipolare l\'oggetto che lo trattiene. Per i glifi iscritti all\'interno di un oggetto, i trigger più comuni sono l\'apertura dell\'oggetto, l\'avvicinamento entro una certa distanza da esso o la vista o la lettura del glifo. Quando iscrivi il glifo, scegli una delle opzioni seguenti per il suo effetto.\nMorte. Ogni bersaglio deve effettuare un tiro salvezza su Costituzione, subendo 10d10 danni necrotici se fallisce il tiro salvezza, o la metà di questi danni se riesce.\nDiscordia. Ogni bersaglio deve effettuare un tiro salvezza su Costituzione. Se il Tiro Salvezza fallisce, il bersaglio litiga e litiga con le altre creature per 1 minuto. Durante questo periodo, è incapace di comunicare in modo significativo e ha svantaggio ai tiri per colpire e alle prove di caratteristica.\nPaura. Ogni bersaglio deve effettuare un tiro salvezza su Saggezza e, se fallisce, diventa spaventato per 1 minuto.', 'Vocali, Somatiche, Materiali', 0, 13, 13),
('Spruzzo Prismatico', 7, 'Evocazione ', '1 Azione', 'Se Stesso', 'Istantaneo', 'Ogni creatura in un cono di 18 metri deve effettuare un tiro salvezza su Destrezza. Per ciascun bersaglio, tira un d8 per determinare quale raggio colorato lo influenza.\r\n1 Rosso	Il bersaglio subisce 10d6 danni da fuoco se fallisce il tiro salvezza, o la metà di questi danni se lo supera.\r\n2 Arancia Il bersaglio subisce 10d6 danni da acido se fallisce il tiro salvezza, o la metà di questi danni se lo supera.\r\n3 Giallo Il bersaglio subisce 10d6 danni da fulmine se fallisce il tiro salvezza, o la metà di questi danni se lo supera.\r\n4 Verde	Il bersaglio subisce 10d6 danni da veleno se fallisce il tiro salvezza, o la metà di questi danni se lo supera.\r\n5 Blu Il bersaglio subisce 10d6 danni da freddo se fallisce il Tiro Salvezza, o la metà di questi danni se lo supera.\r\n6 Indaco Se il Tiro Salvezza fallisce, il bersaglio è trattenuto. Deve poi effettuare un tiro salvezza su Costituzione alla fine di ciascuno dei suoi turni. Se riesce a salvare tre volte, l\'incantesimo termina. Se fallisce il tiro salvezza tre volte, si trasforma permanentemente in pietra e diventa pietrificato. Non è necessario che i successi e i fallimenti siano consecutivi; tieni traccia di entrambi finché il bersaglio non raccoglie tris.\r\n7 Viola Se fallisce il Tiro Salvezza, il bersaglio viene accecato. Deve quindi effettuare un tiro salvezza su Saggezza all\'inizio del tuo turno successivo. Un Tiro Salvezza riuscito pone fine alla cecità. Se fallisce il tiro salvezza, la creatura viene trasportata su un altro piano di esistenza scelto dal DM e non è più accecata. (Di solito, una creatura che si trova su un piano che non è il suo piano natale viene bandita a casa, mentre le altre creature vengono solitamente gettate nei piani Astrale o Etereo.)\r\n8 Speciale Il bersaglio viene colpito da due raggi. Lancia altre due volte, ritirando un 8 qualsiasi.', 'Vocali, Somatiche', 0, 13, 13),
('Suggestione di Massa', 6, 'Incantamento', '1 Azione', '18 Metri', '24 Ore', 'Suggerisci un corso di attività (limitato a una frase o due) e influenzi magicamente fino a dodici creature di tua scelta che puoi vedere nel raggio d\'azione e che possono ascoltarti e capirti. Le creature che non possono essere affascinate sono immuni a questo effetto. Il suggerimento deve essere formulato in modo tale da far sembrare ragionevole la linea di condotta. Chiedere alla creatura di pugnalarsi, lanciarsi su una lancia, immolarsi o compiere qualche altro atto ovviamente dannoso nega automaticamente l\'effetto dell\'incantesimo.\r\n\r\nOgni bersaglio deve effettuare un tiro salvezza su Saggezza. Se fallisce il Tiro Salvezza, prosegue la linea di condotta descritta al meglio delle sue capacità. La linea di condotta suggerita può continuare per l\'intera durata. Se l\'attività suggerita può essere completata in un tempo più breve, l\'incantesimo termina quando il soggetto termina ciò che gli è stato chiesto di fare.\r\n\r\nPuoi anche specificare le condizioni che attiveranno un\'attività speciale durante la durata. Ad esempio, potresti suggerire a un gruppo di soldati di donare tutti i loro soldi al primo mendicante che incontrano. Se la condizione non viene soddisfatta prima del termine dell\'incantesimo, l\'attività non viene eseguita.\r\n\r\nSe tu o uno qualsiasi dei tuoi compagni danneggiate una creatura influenzata da questo incantesimo, l\'incantesimo termina per quella creatura.', 'Somatiche, Materiali', 0, 11, 11),
('Telepatia', 8, 'Evocazione', '1 Azione', 'Se Stesso', '24 Ora', 'Crei un collegamento telepatico tra te e una creatura consenziente con cui hai familiarità. La creatura può trovarsi ovunque sul tuo stesso piano di esistenza. L\'incantesimo termina se tu o il bersaglio non siete più sullo stesso piano.\r\n\r\nFino al termine dell\'incantesimo, tu e il bersaglio potete condividere istantaneamente parole, immagini, suoni e altri messaggi sensoriali tra loro attraverso il collegamento, e il bersaglio vi riconosce come la creatura con cui sta comunicando. L\'incantesimo consente a una creatura con un punteggio di Intelligenza pari almeno a 1 di comprendere il significato delle tue parole e di comprendere la portata di qualsiasi messaggio sensoriale che le invii.', 'Vocali, Somatiche, Materiali', 0, 15, 15),
('Teletrasporto', 7, 'Evocazione', '1 Azione', '3 Metri', 'Istantanea', 'Questo incantesimo trasporta istantaneamente te e fino a otto creature consenzienti di tua scelta che puoi vedere nel raggio d\'azione, o un singolo oggetto che puoi vedere nel raggio d\'azione, verso una destinazione da te selezionata. Se si prende di mira un oggetto, questo deve poter entrare interamente in un cubo di 3 metri e non può essere trattenuto o trasportato da una creatura non consenziente.\r\n\r\nLa destinazione che scegli deve esserti nota e deve trovarsi sul tuo stesso piano di esistenza. La tua familiarità con la destinazione determina se ci arriverai con successo.', 'Vocali', 0, 13, 13),
('Tempesta di Ghiaccio', 4, 'Evocazione ', '1 Azione', '90 Metri', 'Istantaneo', 'Una grandinata di ghiaccio duro come la roccia si abbatte al suolo in un cilindro del raggio di 6 metri e alto 12 metri centrato su un punto entro gittata. Ogni creatura nel cilindro deve effettuare un tiro salvezza su Destrezza. Una creatura subisce 2d8 danni contundenti e 4d6 danni da freddo se fallisce il Tiro Salvezza, o la metà di questi danni se lo riesce.\r\n\r\nI chicchi di grandine trasformano l\'area d\'effetto della tempesta in terreno difficile fino alla fine del tuo turno successivo.\r\n\r\nA livelli più alti. Quando esegui questo incantesimo utilizzando uno slot incantesimo di 5° livello o superiore, il danno contundente aumenta di 1d8 per ogni livello dello slot superiore al 4°.', 'Vocali, Somatiche, Materiali', 0, 7, NULL),
('Trova Percorso', 6, 'Divinazione', '1 Minuto', 'Se Stesso', 'Concentrazione, 1 Giorno', 'Questo incantesimo ti consente di trovare il percorso fisico più breve e diretto verso una specifica posizione fissa con cui hai familiarità sullo stesso piano di esistenza. Se nomini una destinazione su un altro piano di esistenza, una destinazione che si muove (come una fortezza mobile) o una destinazione che non è specifica (come \"la tana di un drago verde\"), l\'incantesimo fallisce.\r\n\r\nPer tutta la durata, finché sei sullo stesso piano di esistenza della destinazione, sai quanto è lontana e in quale direzione si trova. Mentre viaggi lì, ogni volta che ti viene presentata una scelta di percorsi lungo il percorso, determini automaticamente quale percorso è il percorso più breve e diretto (ma non necessariamente il percorso più sicuro) verso la destinazione.', 'Vocali, Somatiche, Materiali', 0, NULL, 11),
('Urlo Psichico', 9, 'Incantamento', '1 Azione', '18 Metri', 'Istantanea', 'Scateni il potere della tua mente per distruggere l\'intelletto di un massimo di dieci creature a tua scelta che puoi vedere nel raggio d\'azione. Le creature che hanno un punteggio di Intelligenza pari o inferiore a 2 non vengono influenzate.\r\nOgni bersaglio deve effettuare un tiro salvezza su Intelligenza. Se fallisce il tiro salvezza, il bersaglio subisce 14d6 danni psichici ed è stordito. Se il tiro salvezza riesce, il bersaglio subisce la metà dei danni e non rimane stordito. Se un bersaglio viene ucciso da questo danno, la sua testa esplode, supponendo che ne abbia una.\r\n\r\nUn bersaglio stordito può effettuare un tiro salvezza su Intelligenza alla fine di ciascuno dei suoi turni. Se il Tiro Salvezza riesce, l\'effetto sbalorditivo termina.', 'Somatiche', 0, 17, 17),
('Volare', 3, 'Trasmutazione', '1 Azione', 'Tocco', 'Concentrazione, 10 Minuti', 'Tocchi una creatura consenziente. Il bersaglio ottiene una velocità di volo di 18 metri per la durata. Quando l\'incantesimo termina, il bersaglio cade se è ancora in alto, a meno che non riesca a fermare la caduta.\r\n\r\nA livelli più alti. Quando lanci questo incantesimo utilizzando uno slot incantesimo di 4° livello o superiore, puoi prendere come bersaglio una creatura aggiuntiva per ogni livello di slot superiore al 3°.', 'Vocali, Somatiche, Materiali', 0, 5, NULL),
('Zona Di Verità', 2, 'Incantamento', '1 Azione', '18 Metri', '10 Minuti', 'Crei una zona magica che protegge dagli inganni in una sfera del raggio di 4,5 metri centrata su un punto a gittata di tua scelta. Fino al termine dell\'incantesimo, una creatura che entra nell\'area dell\'incantesimo per la prima volta in un turno o inizia lì il suo turno deve effettuare un tiro salvezza su Carisma. Se fallisce il Tiro Salvezza, una creatura non può mentire deliberatamente mentre si trova nel raggio. Sai se ogni creatura riesce o fallisce il suo tiro salvezza.\r\n\r\nUna creatura influenzata è consapevole dell\'incantesimo e può quindi evitare di rispondere a domande alle quali normalmente risponderebbe con una bugia. Tali creature possono essere evasive nelle risposte purché rimangano entro i confini della verità.', 'Vocali, Somatiche', 0, NULL, 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `ladro`
--

CREATE TABLE `ladro` (
  `ID_Ladro` int(11) NOT NULL,
  `Livello_Classe` int(11) NOT NULL,
  `Nome_Classe` varchar(20) NOT NULL,
  `Bonus_Attacco_Furtivo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `ladro`
--

INSERT INTO `ladro` (`ID_Ladro`, `Livello_Classe`, `Nome_Classe`, `Bonus_Attacco_Furtivo`) VALUES
(1, 1, 'Ladro', '1d6'),
(2, 2, 'Ladro', '1d6'),
(3, 3, 'Ladro', '2d6'),
(4, 4, 'Ladro', '2d6'),
(5, 5, 'Ladro', '3d6'),
(6, 6, 'Ladro', '3d6'),
(7, 7, 'Ladro', '4d6'),
(8, 8, 'Ladro', '4d6'),
(9, 9, 'Ladro', '5d6'),
(10, 10, 'Ladro', '5d6'),
(11, 11, 'Ladro', '6d6'),
(12, 12, 'Ladro', '6d6'),
(13, 13, 'Ladro', '7d6'),
(14, 14, 'Ladro', '7d6'),
(15, 15, 'Ladro', '8d6'),
(16, 16, 'Ladro', '8d6'),
(17, 17, 'Ladro', '9d6'),
(18, 18, 'Ladro', '9d6'),
(19, 19, 'Ladro', '10d6'),
(20, 20, 'Ladro', '10d6');

-- --------------------------------------------------------

--
-- Struttura della tabella `lancia_bardo`
--

CREATE TABLE `lancia_bardo` (
  `ID_Bardo` int(11) NOT NULL,
  `Livello_Slot` int(11) NOT NULL,
  `Quantita` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `lancia_bardo`
--

INSERT INTO `lancia_bardo` (`ID_Bardo`, `Livello_Slot`, `Quantita`) VALUES
(1, 1, 2),
(2, 1, 3),
(3, 1, 4),
(3, 2, 2),
(4, 1, 4),
(4, 2, 3),
(5, 1, 4),
(5, 2, 3),
(5, 3, 2),
(6, 1, 4),
(6, 2, 3),
(6, 3, 3),
(7, 1, 4),
(7, 2, 3),
(7, 3, 3),
(7, 4, 1),
(8, 1, 4),
(8, 2, 3),
(8, 3, 3),
(8, 4, 2),
(9, 1, 4),
(9, 2, 3),
(9, 3, 3),
(9, 4, 3),
(9, 5, 1),
(10, 1, 4),
(10, 2, 3),
(10, 3, 3),
(10, 4, 3),
(10, 5, 2),
(11, 1, 4),
(11, 2, 3),
(11, 3, 3),
(11, 4, 3),
(11, 5, 2),
(11, 6, 1),
(12, 1, 4),
(12, 2, 3),
(12, 3, 3),
(12, 4, 3),
(12, 5, 2),
(12, 6, 1),
(13, 1, 4),
(13, 2, 3),
(13, 3, 3),
(13, 4, 3),
(13, 5, 2),
(13, 6, 1),
(13, 7, 1),
(14, 1, 4),
(14, 2, 3),
(14, 3, 3),
(14, 4, 3),
(14, 5, 2),
(14, 6, 1),
(14, 7, 1),
(15, 1, 4),
(15, 2, 3),
(15, 3, 3),
(15, 4, 3),
(15, 5, 2),
(15, 6, 1),
(15, 7, 1),
(15, 8, 1),
(16, 1, 4),
(16, 2, 3),
(16, 3, 3),
(16, 4, 3),
(16, 5, 2),
(16, 6, 1),
(16, 7, 1),
(16, 8, 1),
(17, 1, 4),
(17, 2, 3),
(17, 3, 3),
(17, 4, 3),
(17, 5, 2),
(17, 6, 1),
(17, 7, 1),
(17, 8, 1),
(17, 9, 1),
(18, 1, 4),
(18, 2, 3),
(18, 3, 3),
(18, 4, 3),
(18, 5, 3),
(18, 6, 1),
(18, 7, 1),
(18, 8, 1),
(18, 9, 1),
(19, 1, 4),
(19, 2, 3),
(19, 3, 3),
(19, 4, 3),
(19, 5, 3),
(19, 6, 2),
(19, 7, 1),
(19, 8, 1),
(19, 9, 1),
(20, 1, 4),
(20, 2, 3),
(20, 3, 3),
(20, 4, 3),
(20, 5, 3),
(20, 6, 2),
(20, 7, 2),
(20, 8, 1),
(20, 9, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `lancia_mago`
--

CREATE TABLE `lancia_mago` (
  `ID_Mago` int(11) NOT NULL,
  `Livello_Slot` int(11) NOT NULL,
  `Quantita` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `lancia_mago`
--

INSERT INTO `lancia_mago` (`ID_Mago`, `Livello_Slot`, `Quantita`) VALUES
(1, 1, 2),
(2, 1, 3),
(3, 1, 4),
(3, 2, 2),
(4, 1, 4),
(4, 2, 3),
(5, 1, 4),
(5, 2, 3),
(5, 3, 2),
(6, 1, 4),
(6, 2, 3),
(6, 3, 3),
(7, 1, 4),
(7, 2, 3),
(7, 3, 3),
(7, 4, 1),
(8, 1, 4),
(8, 2, 3),
(8, 3, 3),
(8, 4, 2),
(9, 1, 4),
(9, 2, 3),
(9, 3, 3),
(9, 4, 2),
(9, 5, 1),
(10, 1, 4),
(10, 2, 3),
(10, 3, 3),
(10, 4, 3),
(10, 5, 2),
(11, 1, 4),
(11, 2, 3),
(11, 3, 3),
(11, 4, 3),
(11, 5, 2),
(11, 6, 1),
(12, 1, 4),
(12, 2, 3),
(12, 3, 3),
(12, 4, 3),
(12, 5, 2),
(12, 6, 1),
(13, 1, 4),
(13, 2, 3),
(13, 3, 3),
(13, 4, 3),
(13, 5, 2),
(13, 6, 1),
(13, 7, 1),
(14, 1, 4),
(14, 2, 3),
(14, 3, 3),
(14, 4, 3),
(14, 5, 2),
(14, 6, 1),
(14, 7, 1),
(15, 1, 4),
(15, 2, 3),
(15, 3, 3),
(15, 4, 3),
(15, 5, 2),
(15, 6, 1),
(15, 7, 1),
(15, 8, 1),
(16, 1, 4),
(16, 2, 3),
(16, 3, 3),
(16, 4, 3),
(16, 5, 2),
(16, 6, 1),
(16, 7, 1),
(16, 8, 1),
(17, 1, 4),
(17, 2, 3),
(17, 3, 3),
(17, 4, 3),
(17, 5, 2),
(17, 6, 1),
(17, 7, 1),
(17, 8, 1),
(17, 9, 1),
(18, 1, 4),
(18, 2, 3),
(18, 3, 3),
(18, 4, 3),
(18, 5, 3),
(18, 6, 1),
(18, 7, 1),
(18, 8, 1),
(18, 9, 1),
(19, 1, 4),
(19, 2, 3),
(19, 3, 3),
(19, 4, 3),
(19, 5, 3),
(19, 6, 2),
(19, 7, 1),
(19, 8, 1),
(19, 9, 1),
(20, 1, 4),
(20, 2, 3),
(20, 3, 3),
(20, 4, 3),
(20, 5, 3),
(20, 6, 2),
(20, 7, 2),
(20, 8, 1),
(20, 9, 1);

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

--
-- Dump dei dati per la tabella `lingue_aggiuntive`
--

INSERT INTO `lingue_aggiuntive` (`Nome_Lingua`, `Nome_Origine`) VALUES
('Elfico', 'Accolito'),
('Elfico', 'Cavaliere'),
('Gigantico', 'Archeologo'),
('Nanico', 'Archeologo'),
('Orchesco', 'Criminale'),
('Orchesco', 'Marinaio');

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

--
-- Dump dei dati per la tabella `lingue_della_razza`
--

INSERT INTO `lingue_della_razza` (`Nome_Lingua`, `Nome_Razza`) VALUES
('Comune', 'Elfo'),
('Comune', 'Nano'),
('Comune', 'Umano'),
('Elfico', 'Elfo'),
('Nanico', 'Nano'),
('Orchesco', 'Umano');

-- --------------------------------------------------------

--
-- Struttura della tabella `mago`
--

CREATE TABLE `mago` (
  `ID_Mago` int(11) NOT NULL,
  `Nome_Classe` varchar(20) NOT NULL,
  `Livello_Classe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `mago`
--

INSERT INTO `mago` (`ID_Mago`, `Nome_Classe`, `Livello_Classe`) VALUES
(1, 'Mago', 1),
(2, 'Mago', 2),
(3, 'Mago', 3),
(4, 'Mago', 4),
(5, 'Mago', 5),
(6, 'Mago', 6),
(7, 'Mago', 7),
(8, 'Mago', 8),
(9, 'Mago', 9),
(10, 'Mago', 10),
(11, 'Mago', 11),
(12, 'Mago', 12),
(13, 'Mago', 13),
(14, 'Mago', 14),
(15, 'Mago', 15),
(16, 'Mago', 16),
(17, 'Mago', 17),
(18, 'Mago', 18),
(19, 'Mago', 19),
(20, 'Mago', 20);

-- --------------------------------------------------------

--
-- Struttura della tabella `oggetti_dell_origine`
--

CREATE TABLE `oggetti_dell_origine` (
  `Nome_Oggetto` varchar(30) NOT NULL,
  `Nome_Origine` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `oggetti_dell_origine`
--

INSERT INTO `oggetti_dell_origine` (`Nome_Oggetto`, `Nome_Origine`) VALUES
('Acquamarina', 'Marinaio'),
('Ametista', 'Accolito'),
('Ametista', 'Cavaliere'),
('Ametista', 'Criminale'),
('Orologio Rotto', 'Archeologo'),
('Pacchetto Da Diplomatico', 'Cavaliere'),
('Pacchetto Da Esploratore', 'Archeologo'),
('Pacchetto Da Esploratore', 'Cavaliere'),
('Pacchetto Da Esploratore', 'Marinaio'),
('Pacchetto Da Sacerdote', 'Accolito'),
('Pugnale', 'Criminale'),
('Sangue Dell Assassino', 'Criminale'),
('Set Di Carte Da Gioco', 'Archeologo'),
('Set Di Carte Da Gioco', 'Criminale'),
('Set Di Carte Da Gioco', 'Marinaio'),
('Spada Lunga', 'Cavaliere'),
('Topazio', 'Archeologo');

-- --------------------------------------------------------

--
-- Struttura della tabella `oggetti_di_classe`
--

CREATE TABLE `oggetti_di_classe` (
  `Nome_Oggetto` varchar(30) NOT NULL,
  `Livello_Classe` int(11) NOT NULL,
  `Nome_Classe` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `oggetti_di_classe`
--

INSERT INTO `oggetti_di_classe` (`Nome_Oggetto`, `Livello_Classe`, `Nome_Classe`) VALUES
('Armatura Di Pelle', 1, 'Bardo'),
('Armatura Di Pelle', 1, 'Ladro'),
('Balestra Leggera', 1, 'Ladro'),
('Dardo Balestra (20)', 1, 'Ladro'),
('Flauto Dolce', 1, 'Bardo'),
('Martello Da Guerra', 1, 'Barbaro'),
('Pacchetto Da Diplomatico', 1, 'Mago'),
('Pacchetto Da Esploratore', 1, 'Barbaro'),
('Pacchetto Da Esploratore', 1, 'Bardo'),
('Pacchetto Da Esploratore', 1, 'Ladro'),
('Pacchetto Da Esploratore', 1, 'Mago'),
('Pacchetto Da Scassinatore', 1, 'Ladro'),
('Pugnale', 1, 'Bardo'),
('Pugnale', 1, 'Ladro'),
('Pugnale', 1, 'Mago'),
('Spada Lunga', 1, 'Bardo'),
('Spada Lunga', 1, 'Ladro'),
('Spadone', 1, 'Barbaro');

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
(1, 50, 'Arco Lungo', NULL, NULL, '1d8', 'Perforante', NULL, NULL, NULL, 'Arma Marziale A DIstanza'),
(5, 10, 'Armatura Di Pelle', NULL, NULL, NULL, NULL, '11 + Destrezza', 0, 0, 'Armatura Leggera'),
(6, 45, 'Armatura Di Pelle Borchiata', NULL, NULL, NULL, NULL, '12 + Destrezza', 0, 0, 'Armatura Leggera'),
(4, 5, 'Armatura Imbottita', NULL, NULL, NULL, NULL, '11 + Destrezza', 0, 1, 'Armatura Leggera'),
(1, 5, 'Ascia', NULL, NULL, '1d6', 'Tagliente', NULL, NULL, NULL, 'Arma Semplice Ravvicinata'),
(0, 10, 'Azzurrite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 25, 'Balestra Leggera', NULL, NULL, '1d8', 'Perforante', NULL, NULL, NULL, 'Arma Semplice A Distanza'),
(8, 50, 'Balestra Pesante', NULL, NULL, '1d10', 'Perforante', NULL, NULL, NULL, 'Arma Marziale A DIstanza'),
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

--
-- Dump dei dati per la tabella `origine_migliora`
--

INSERT INTO `origine_migliora` (`Nome_Abilita`, `Nome_Origine`) VALUES
('Atletica', 'Marinaio'),
('Furtività', 'Criminale'),
('Intimidire', 'Criminale'),
('Intuizione', 'Accolito'),
('Percezione', 'Marinaio'),
('Persuasione', 'Criminale'),
('Religione', 'Accolito'),
('Sopravvivenza', 'Archeologo'),
('Storia', 'Archeologo'),
('Storia', 'Cavaliere');

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
  `Armatura_Equipaggiata` varchar(30) DEFAULT NULL,
  `Arma_Equipaggiata` varchar(30) DEFAULT NULL,
  `Nome_Allineamento` varchar(30) NOT NULL,
  `Nome_Razza` varchar(20) NOT NULL,
  `ID_Borsa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `personaggio`
--

INSERT INTO `personaggio` (`ID_Personaggio`, `Car_Forza`, `Car_Destrezza`, `Car_Costituzione`, `Car_Intelligenza`, `Car_Saggezza`, `Car_Carisma`, `Punti_Ferita`, `Nome`, `Descrizione_Aspetto`, `Classe_Armatura`, `Iniziativa`, `Punti_Esperienza`, `ID_Utente`, `Nome_Origine`, `Armatura_Equipaggiata`, `Arma_Equipaggiata`, `Nome_Allineamento`, `Nome_Razza`, `ID_Borsa`) VALUES
(1, 15, 14, 13, 12, 10, 8, 7, 'bob', 'bello', 12, 14, 0, 1, 'Criminale', NULL, NULL, 'Caotico', 'Elfo', 2);

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
-- AUTO_INCREMENT per la tabella `barbaro`
--
ALTER TABLE `barbaro`
  MODIFY `ID_Barbaro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT per la tabella `bardo`
--
ALTER TABLE `bardo`
  MODIFY `ID_Bardo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT per la tabella `borsa`
--
ALTER TABLE `borsa`
  MODIFY `ID_Borsa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `ladro`
--
ALTER TABLE `ladro`
  MODIFY `ID_Ladro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT per la tabella `mago`
--
ALTER TABLE `mago`
  MODIFY `ID_Mago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT per la tabella `personaggio`
--
ALTER TABLE `personaggio`
  MODIFY `ID_Personaggio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
