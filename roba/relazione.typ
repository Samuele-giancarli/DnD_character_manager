
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

/ Abilità:
Le abilità sono in totale 18. Ogni personaggio le possiede tutte -in misure diverse-.
Le abilità rappresentano sfumature più specifiche dei Punti caratteristica sopra citati, e l’essere competenti in un’abilità permette di ottenere un bonus competenza per la stessa. Il bonus risultante per ciascuna abilità si calcola infine come modificatore della caratteristica + eventuale bonus competenza. 

Qui di seguito le 18 abilità del gioco, in ordine alfabetico, con le caratteristiche associate:
- Acrobazia (Destrezza)
- Addestrare animali (Saggezza)
- Arcano (Intelligenza)
- Atletica (Forza)
- Furtività (Destrezza)
- Indagare (Intelligenza)
- Inganno (Carisma)
- Intimidire (Carisma)
- Intrattenere (Carisma)
- Intuizione (Saggezza)
- Medicina (Saggezza)
- Natura (Intelligenza)
- Percezione (Saggezza)
- Persuasione (Carisma)
- Rapidità di mano (Destrezza)
- Religione (Intelligenza)
- Sopravvivenza (Saggezza)
- Storia (Intelligenza)

/ Razze:
La razza rappresenta il popolo di un personaggio. La razza influenza in un personaggio: taglia, età di vita massima, velocità di movimento, lingue native, tratti razziali standard, incremento di abilità.

/ Sottorazze:
Una scelta ancora più specifica fatta a partire dalla razza selezionata, rappresenta l’etnia di un personaggio. La sottorazza concede a sua volta dei tratti razziali aggiuntivi.

/ Tratti razziali:
Una lista di capacità specifiche che vengono concesse al personaggio secondo la sua razza e sottorazza.

/ Lingue:
La razza e le origini di un personaggio permettono di conoscere e poter parlare e leggere fluentemente una o più lingue del mondo di DnD.

/ Origini:
Le origini in DnD definiscono il passato di un personaggio. Influiscono sulle lingue conosciute, e concedono dei privilegi, qualità che possono tornare utili durante l’avventura e nelle interazioni con oggetti e persone. Permettono l’utilizzo di strumenti specifici, l’acquisizione in partenza di un determinato equipaggiamento (oggetti), e danno competenza in due abilità.

/ Privilegi:
Un privilegio dipende dall’origine di un personaggio e rappresenta la possibilità di effettuare azioni o stabilire contatti fuori dalle comuni capacità di gioco. Come esempio pratico, chi ha avuto un passato come Criminale avrà acquisito contatti affidabili nella sua rete criminale e la possibilità di scambiare messaggi tramite mezzi insoliti.

/ Borsa:
Il contenuto della borsa comprende semplicemente gli oggetti che il personaggio porta con sé come inventario. In generale tutti gli oggetti hanno un peso, un valore, un nome. Gli oggetti sono divisi in categorie quali: Armi e munizioni, armature, cianfrusaglie (trinkets), strumenti (tools), pozioni e veleni, valute, gemme. C’è un limite di peso trasportabile nella borsa.

/ Armi:
Le armi sono il mezzo attraverso cui si provoca danno ai nemici. Si dividono in 2 macro tipi: ravvicinate e a distanza, alcune di queste utilizzano munizioni. Le armi ravvicinate e le armi a distanza a loro volta si dividono in armi semplici e armi avanzate. Tutte le armi hanno come attributi il danno (il dado che va tirato), il tipo di danno (per esempio una spada farà danno tagliente, mentre una mazza farà danno contundente), e altre proprietà .

/ Proprietà:
Le proprietà delle armi sono l’effetto che queste producono una volta colpito il bersaglio. E’ possibile per esempio avvelenare l’avversario, o incendiarlo.

/ Munizioni:
Le munizioni sono i proiettili necessari ad azionare un’arma.

/ Armature:
Le armature determinano la resistenza di un personaggio ai danni. Hanno come attributi:
la tipologia, che le classifica in armature leggere, armature medie, armature pesanti
la classe armatura, che per armature leggere e medie è influenzata dalla destrezza del personaggio
la forza necessaria per il loro utilizzo, che può essere nulla, cioè quanto un personaggio deve essere forte per indossare un’armatura agilmente
la caratteristica di svantaggio nella furtività, quanto un’armatura può fare rumore o rendere il personaggio visibile durante le azioni furtive


/ Strumenti e pacchetti:
I pacchetti inglobano del contenuto, che è banalmente la lista degli oggetti contenuti in essi. Gli strumenti e i pacchetti sono delle dotazioni che permettono di svolgere delle attività concrete nel mondo di gioco, per esempio di cucina o artigianato, e l’efficienza nel loro utilizzo dipende dalle origini del personaggio.

/ Cianfrusaglie:
Qualunque tipo di oggetti di valore simbolico ma senza un possibile utilizzo da parte del giocatore.

/ Pozioni e veleni:
Fluidi contenuti in fiale. La tipologia definisce come questi vengono assunti, per esempio se sono pozioni liquide da bere oppure unguenti da applicare.
Le pozioni producono un effetto generalmente benefico, come il recupero di punti salute, o il poter respirare sott’acqua. Similarmente, i veleni producono un effetto che sarà sempre di malus rispetto al proprio giocatore.

/ Valute:
Nel mondo di D&D ci sono 5 diverse valute: rame, argento, electrum, oro e platino.
Una moneta d’oro vale 100 monete di rame, 10 monete di argento, 2 monete di electrum. Una moneta di platino vale 10 monete d’oro.

/ Gemme:
Le gemme sono beni preziosi e possono essere scambiate nei negozi per monete.

/ Classe:
La classe definisce il modus operandi del personaggio, e in particolare il suo modo di combattere. E’ una parte fondamentale dell’identità dell’eroe, pertanto influisce sulle sue debolezze, resistenze e punti di forza. All'aumentare del livello, un giocatore può decidere di spendere questo livello in una classe: 
- se la classe scelta è già conosciuta allora il personaggio otterrà le Capacità di classe di quello specifico livello
- se la classe non è conosciuta il giocatore manterrà i progressi delle classi che già conosce, e otterrà le Capacità della classe e le Competenze della nuova classe scelta, a partire dal livello uno. 
- arrivato a un determinato livello, il giocatore sceglierà una Sottoclasse, che concederà nel suo percorso l’acquisizione di abilità aggiuntive. 

La classe stabilisce: il Dado della vita del personaggio, l’Equipaggiamento di partenza, le Sottoclassi disponibili, le Competenze in armi, le Competenze in armature e le Competenze nei Tiri salvezza.

/ Tiri salvezza:
I tiri salvezza sono il tentativo fatto dal personaggio per resistere a un evento o affrontare una situazione importante. La formula per calcolare i tiri salvezza è d20 + modificatore caratteristica + bonus competenza.

/ Capacità di classe:
Si distinguono in 4 tipologie:
- Miglioramento: incrementano il valore di una o più abilità.
- Passive: per esempio di tipologia difensiva, oppure percettive.
- Attive: possono essere nuove tecniche offensive, con un limite di utilizzo giornaliero
- Spellcasting: la caratteristica da utilizzare per il calcolo di danno e messa a segno degli incantesimi.


/ Sottoclasse:
A partire da un determinato livello, un eroe può specializzarsi in una Sottoclasse e acquisire capacità inedite aumentando di livello.

/ Capacità di sottoclasse:
Come le capacità di classe, danno vantaggi specifici nel combattimento e nell’esplorazione.

/ Principali classi:
- Ladro: in aggiunta alle sue capacità di classe, ha un bonus all’attacco furtivo
- Barbaro: giocare il barbaro ruota attorno a un bonus di rabbia, utilizzabile un tot di volte al giorno nel combattimento
- Bardo: ha un dado aggiuntivo di ispirazione utile al gruppo di gioco, può utilizzare incantesimi
- Mago: può utilizzare incantesimi

/ Incantesimi:
Gli incantesimi sono una capacità di classe. Sono divisi secondo il livello di incantesimo che varia da 0 a 9. Gli incantesimi di livello zero sono tendenzialmente noti come trucchetti e possono essere utilizzati senza spendere alcuno slot incantesimo. 

Tutti gli incantesimi, oltre ad avere un livello, presentano anche una scuola di appartenenza, un tempo di lancio, una distanza (dall’utilizzatore), una durata, delle componenti di evocazione e  la possibilità o no di essere lanciati come rituali (lanciare un incantesimo come rituale allunga il tempo di lancio a 10 minuti).
Le componenti di un incantesimo sono 3: Somatiche (i gesti fatti), Vocali (le parole pronunciate) e Materiali (gli oggetti che catalizzano la magia), ogni incantesimo deve avere almeno una componente vocale o somatica.

/ Slot incantesimo:
Gli slot incantesimo sono la quantità di incantesimi di un determinato livello che un personaggio può usare nell’arco di un giorno, e dipendono dalla specifica classe del personaggio.

Esempio: un mago di livello 1 ha 2 slot  incantesimo di livello 1. In totale conoscerà 3 trucchetti/incantesimi di livello 0 e n incantesimi di livello 1, dove n è Modificatore INTELLIGENZA + Livello della classe mago. 

/ Allineamento:
Determina la morale del personaggio e la sua inclinazione verso azioni considerate generalmente positive, neutrali o negative.



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