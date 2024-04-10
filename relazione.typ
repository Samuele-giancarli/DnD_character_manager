
#align(center, text(17pt)[
  *Elaborato per il corso di Basi di Dati*

  *A.A 2023/2024*

])

#align(center, text(15pt)[
  Progetto di una base di dati per la creazione e gestione di un personaggio in Dungeons & Dragons 5e])

#align(right)[
    Andrenacci Michele \
    0001001934 \
    #link("michele.andrenacci@studio.unibo.it.")
 
    Baglioni Aisja \
    0001087960 \
    #link("aisja.baglioni@studio.unibo.it.")

    Giancarli Samuele \
    0001028327 \
    #link("samuele.giancarli@studio.unibo.it.")
  ]

#pagebreak();

#set page(numbering: "1")
#set heading(numbering: "1.")
#outline(title: "Struttura dell'elaborato", indent:auto)
#pagebreak();
= Introduzione
Si vuole realizzare un database a supporto della creazione della scheda di un personaggio, basata sul gioco di ruolo fantasy Dungeons & Dragons 5e, attraverso un applicativo di programma web. Il focus è centrato nello specifico sulla fase di creazione del personaggio, aiutando gli utenti a gestire le statistiche principali e tutti i tecnicismi di Dungeons & Dragons quali classe, razza, origini, tratti ed equipaggiamento. Si vuole offrire inoltre la possibilità all’utente di simulare e registrare l’aggiornamento delle statistiche e del bagaglio esperienziale, comprensivo di livello, inventario, competenze, abilità e capacità che si aggiungono man mano che il giocatore prosegue nella narrazione. Pertanto, la base di dati dovrà immagazzinare utenti e corrispettivi personaggi creati, e contenere le informazioni relative ai personaggi stessi, nell’universo di gioco. Ricapitolando, il sistema nel suo complesso è volto a visualizzare ed editare le caratteristiche del personaggio di un utente attraverso una scheda personalizzabile ad esso associata. 


#pagebreak();
= Analisi dei requisiti
== Requisiti in linguaggio naturale
La sottostante  descrizione rappresenta i requisiti in linguaggio naturale del sistema informativo:

_La WizardingGames© chiede di produrre un sistema informatico nella forma di un sito web. Il sito vuole rappresentare un tool di supporto ai giocatori del gioco “Dungeons & Dragons 5e”, per creare uno o più personaggi e tenere traccia della loro esperienza acquisita. Dungeons & Dragons è un gioco di ruolo fantasy basato sulla narrazione, in cui ciascun giocatore impersona un personaggio in un universo di gioco regolato da un master. Si richiede dunque che vengano tenuti in memoria i dati relativi ai personaggi creati dagli utenti registrati al sito. Si richiede inoltre di poter utilizzare il sito come raccolta consultabile di informazioni riguardanti il gioco e le sue specifiche, raggruppate secondo la loro funzione. Il sistema memorizzerà in primo luogo la lista degli utenti iscritti, a ogni account saranno associati univocamente un indirizzo mail e una password. Ogni utente potrà accedere ai suoi personaggi o crearne di nuovi. La creazione di un personaggio comincia dalla scelta della Razza e della Sottorazza, proseguendo con le Origini, la Classe e l’assegnamento di valori quali Punti caratteristica (Forza, Destrezza…ecc), Tratti razziali, Linguaggi, Capacità della classe, Tiri salvezza e Competenze varie. La fase di creazione si conclude con la scelta dei Dati personali del personaggio, per esempio il nome e una breve descrizione della sua storia._

== Fondamentali del sistema

/ Utente: 
Un utente utilizzerà come chiavi di accesso univoche un’e-mail e una password, che andranno specificate in fase di registrazione.

/ Personaggio: 
Ogni personaggio sarà caratterizzato da un nome e una descrizione del suo aspetto. Avrà un determinato numero di punti esperienza che serviranno a calcolarne il livello, possiederà poi un valore per Iniziativa, Classe Armatura, e per le 6 caratteristiche principali. 

Seguendo l’ordine proposto dal sito web, vediamo ora uno a uno tutti i componenti della Scheda Personaggio.

/ Caratteristiche:
Le caratteristiche sono 6 e sono: 
- FORZA
- DESTREZZA
- COSTITUZIONE
- INTELLIGENZA
- SAGGEZZA 
- CARISMA
Il loro valore può variare da 0 a 20. In base al valore ognuna di queste genera un “modificatore” intero che varia da -5 a +5. I modificatori influenzeranno le azioni del personaggio e le sue abilità.


#pagebreak();
== Tabella dei concetti chiave
#pagebreak();
== Funzionalità richieste dall'applicazione
#pagebreak();
== Schema scheletro prima delle correzioni
#pagebreak();
== Rilevamento delle ambiguità e correzioni proposte
#pagebreak();
== Schema scheletro dopo le correzioni
#pagebreak();
== Schema finale
#pagebreak();
= Progettazione logica
#pagebreak();
== Stima del volume dei dati
#pagebreak();
== Descrizione delle operazioni principali e stima della loro frequenza
#pagebreak();
== Schemi di navigazione e tabelle degli accessi
#pagebreak();
=== Registrazione di un nuovo utente
#pagebreak();
=== Login di un utente esistente
#pagebreak();
=== Visualizzazione della lista dei personaggi di un utente
#pagebreak();
=== Visualizzazione di un singolo personaggio
#pagebreak();
=== Creazione di un nuovo personaggio
#pagebreak();
=== Aggiornamento di un personaggio esistente
#pagebreak();
=== Consultazione degli elementi di gioco
#pagebreak();
== Raffinamento dello schema
#pagebreak();
=== Scelta delle chiavi primarie
#pagebreak();
=== Eliminazione delle gerarchie di generalizzazione
#pagebreak();
= Progetto logico per il modello relazionale
#pagebreak();
== Traduzione delle entità
#pagebreak();
== Traduzione delle associazioni
#pagebreak();
== Traduzione delle operazioni in Query SQL
#pagebreak();