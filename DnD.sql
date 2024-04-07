-- *********************************************
-- * Standard SQL generation                   
-- *--------------------------------------------
-- * DB-MAIN version: 11.0.2              
-- * Generator date: Sep 14 2021              
-- * Generation date: Sat Apr  6 16:58:46 2024 
-- * LUN file: C:\Users\aisja\Desktop\schema7.lun 
-- * Schema: SCHEMA/SQL1 
-- ********************************************* 


-- Database Section
-- ________________ 

-- DBSpace Section
-- _______________


-- Tables Section
-- _____________

create table ABILITA (
     Nome char(20) not null,
     Caratteristica_Associata char(30) not null,
     constraint ID_ABILITA_ID primary key (Nome));

create table Abilita_personaggio (
     Nome_Abilità char not null,
     ID_Personaggio int not null,
     Valore int not null,
     constraint ID_Abilita_personaggio_ID primary key (ID_Personaggio, Nome_Abilità));

create table Appartiene (
     Nome_Razza char not null,
     ID_Personaggio int not null,
     constraint ID_Appartiene_ID primary key (ID_Personaggio, Nome_Razza));

create table ALLINEAMENTO (
     Nome char(30) not null,
     constraint ID_ALLINEAMENTO_ID primary key (Nome));

create table BARBARO (
     ID_Classe int(30) not null,
     Utilizzi_Rabbia_Giornalieri int not null,
     Bonus_Rabbia int not null,
     Nome_Classe char(30) not null,
     Livello_Classe int not null,
     constraint ID_BARBARO_ID primary key (ID_Classe));
     constraint IDfor_BARBARO_ID foreign key (ID_Classe)

create table BARDO (
     ID_Classe int(30) not null,
     Dado_Ispirazione_Bardica char(30) not null,
     Nome_Classe char(30) not null,
     Livello_Classe int not null,
     constraint ID_BARDO_ID primary key (ID_Classe));
     constraint IDfor_BARDO_ID foreign key (ID_Classe)

create table BORSA (
     ID_Borsa int(30) not null,
     ID_Personaggio int(30) not null,
     Peso_Trasportabile int not null,
     Monete_Rame int not null,
     Monete_Argento int not null,
     Monete_Electrum int not null,
     Monete_Oro int not null,
     Monete_Platino int not null,
     constraint ID_BORSA_ID primary key (ID_Borsa),
     constraint FKTiene_ID unique (ID_Personaggio));

create table CAPACITA_DI_CLASSE (
     Nome char(30) not null,
     Descrizione text not null,
     Aum_Nome_Caratteristica char(30),
     Aum_Valore_Aggiuntivo int,
     Caratteristica_Incantatore char(30),
     Utilizzo_Giornaliero int,
     constraint ID_CAPACITA_DI_CLASSE_ID primary key (Nome));

create table CAPACITA_DI_SOTTOCLASSE (
     Nome char(30) not null,
     Descrizione text not null,
     constraint ID_CAPACITA_DI_SOTTOCLASSE_ID primary key (Nome));

create table CLASSE (
     ID_Classe int(30) not null,
     Nome char(20) not null,
     Bonus_Competenza int not null,
     Dado_Vita char(30) not null,
     Livello int(3) not null,
     constraint ID_CLASSE_ID primary key (ID_Classe));

create table Classe_Migliora (
     Nome_Abilita char(30) not null,
     Nome_Classe char(30) not null,
     Livello_Classe int not null,
     constraint ID_Classe_Migliora_ID primary key (Nome_Abilita, Nome_Classe, Livello_Classe));

create table Competenza (
     Nome_Classe char(30) not null,
     Livello_Classe int not null,
     Nome_Caratteristica_TiroSalvezza char(30) not null,
     constraint ID_Competenza_ID primary key (Nome_Caratteristica_TiroSalvezza, Nome_Classe, Livello_Classe));

create table Competenza_dell_Origine_in_Strumenti (
     Nome_Oggetto char(30) not null,
     Nome_Origine char(30) not null,
     constraint ID_Competenza_dell_Origine_in_Strumenti_ID primary key (Nome_Origine, Nome_Oggetto));

create table Competenza_della_Classe_in_Armature (
     Nome_Classe char(30) not null,
     Livello_Classe int not null,
     Nome_Oggetto char(30) not null,
     constraint ID_Competenza_della_Classe_in_Armature_ID primary key (Nome_Classe,Livello_Classe,Nome_Oggetto));

create table Competenza_della_Classe_in_Armi (
     Nome_Classe char(30) not null,
     Livello_Classe int not null,
     Nome_Oggetto char(30) not null,
     constraint ID_Competenza_della_Classe_in_Armi_ID primary key (Nome_Classe,Livello_Classe,Nome_Oggetto));

create table Competenza_della_Classe_in_Strumenti (
     Nome_Classe char(30) not null,
     Livello_Classe int not null,
     Nome_Oggetto char(30) not null,
     constraint ID_Competenza_della_Classe_in_Strumenti_ID primary key (Nome_Classe,Livello_Classe,Nome_Oggetto));

create table Competenze_Abilita (
     Nome_Abilita char(30) not null,
     ID_Personaggio int not null,
     constraint ID_Competenze_Abilita_ID primary key (Nome_Abilita, ID_Personaggio));

create table Concede (
     Nome_Origine char(30) not null,
     Nome_Privilegio char(30) not null,
     constraint ID_Concede_ID primary key (Nome_Origine, Nome_Privilegio));

create table Conosce (
     Nome_Incantesimo char(30) not null,
     ID_Personaggio int not null,
     constraint ID_Conosce_ID primary key (Nome_Incantesimo, ID_Personaggio));

create table Contiene (
     ID_Borsa int not null,
     Nome_Oggetto char(30) not null,
     Quantita int not null,
     constraint ID_Contiene_ID primary key (Nome_Oggetto, ID_Borsa));

create table Equipaggia_Arma (
     Nome_Oggetto char(30) not null,
     ID_Personaggio int not null,
     constraint ID_Equipaggia_Arma_ID primary key (Nome_Oggetto, ID_Personaggio));

create table Equipaggia_Armatura (
     Nome_Oggetto char(30) not null,
     ID_Personaggio int not null,
     constraint ID_Equipaggia_Armatura_ID primary key (Nome_Oggetto, ID_Personaggio));

create table INCANTESIMO (
     Nome char(30) not null,
     Livello int not null,
     Scuola char(30) not null,
     Tempo_di_Lancio char(30) not null,
     Distanza char(30) not null,
     Durata char(30) not null,
     Componenti text not null,
     Rituale boolean not null,
     ID_Mago int,
     ID_Bardo int,
     constraint ID_INCANTESIMO_ID primary key (Nome));

create table LADRO (
     ID_Classe int(30) not null,
     Bonus_Attacco_Furtivo int not null,
     Nome_Classe char(30) not null,
     Livello_Classe int not null,
     constraint ID_LADRO_ID primary key (ID_Classe));
     constraint IDfor_LADRO_ID foreign key (ID_Classe)

create table LINGUE (
     Nome char(30) not null,
     Descrizione text not null,
     constraint ID_LINGUE_ID primary key (Nome));

create table MAGO (
     ID_Classe int(30) not null,
     Nome_Classe char(30) not null,
     Livello_Classe int not null,
     constraint ID_MAGO_ID primary key (ID_Classe));
     constraint IDfor_MAGO_ID foreign key (ID_Classe)

create table Ha_Origine (
     Nome_Origine char(30) not null,
     ID_Personaggio int not null,
     constraint ID_Ha_Origine_ID primary key (ID_Personaggio, Nome_Origine));

create table Identifica (
     Nome_Razza char(30) not null,
     Nome_Sottorazza char(30) not null,
     constraint ID_Identifica_ID primary key (Nome_Razza, Nome_Sottorazza));

create table Impara_Classe (
     Nome_Capacita char(30) not null,
     Nome_Classe char(30) not null,
     Livello_Classe int not null,
     constraint ID_Impara_Classe_ID primary key (Nome_Capacita, Nome_Classe, Livello_Classe));

create table Impara_Sottoclasse (
     Nome_Capacita char(30) not null,
     Nome_Sottoclasse char(30) not null,
     Livello_Sottoclasse int not null,
     constraint ID_Impara_Sottoclasse_ID primary key (Nome_Capacita, Nome_Sottoclasse, Livello_Sottoclasse));

create table Lancia_Bardo (
     ID_Bardo int not null,
     Livello_Slot int not null,
     Quantita int not null,
     constraint ID_Lancia_Bardo_ID primary key (ID_Bardo, Livello_Slot));

create table Lancia_Mago (
     ID_Mago int not null,
     Livello_Slot int not null,
     Quantita int not null,
     constraint ID_Lancia_Mago_ID primary key (ID_Mago, Livello_Slot));

create table Lingue_Aggiuntive (
     Nome_Lingua char(30) not null,
     Nome_Origine char(30) not null,
     constraint ID_Lingue_Aggiuntive_ID primary key (Nome_Lingua, Nome_Origine));

create table Lingue_Conosciute (
     Nome_Lingua char(30) not null,
     ID_Personaggio int not null,
     constraint ID_Lingue_Conosciute_ID primary key (Nome_Lingua, ID_Personaggio));

create table Lingue_della_Razza (
     Nome_Lingua char(30) not null,
     Nome_Razza char(30) not null,
     constraint ID_Lingue_della_Razza_ID primary key (Nome_Lingua, Nome_Razza));

create table Oggetti_dell_Origine (
     Nome_Origine char(30) not null,
     Nome_Oggetto char(30) not null,
     constraint ID_Oggetti_dell_Origine_ID primary key (Nome_Origine, Nome_Oggetto));

create table Oggetti_di_Classe (
     Nome_Classe char(30) not null,
     Livello_Classe int not null,
     Nome_Oggetto char(30) not null,
     constraint ID_Oggetti_di_Classe_ID primary key (Nome_Classe, Livello_Classe, Nome_Oggetto));

create table OGGETTO (
     Peso int(10) not null,
     Valore int(30) not null,
     Nome char(30) not null,
     Descrizione text,
     Contenuto text,
     Danno char(30),
     Tipo_Danno char(30),
     Classe_Armatura int,
     Forza_Necessaria int,
     Svantaggio_Furtivita boolean,
     constraint ID_OGGETTO_ID primary key (Nome));

create table ORIGINE (
     Nome char(30) not null,
     Descrizione text not null,
     constraint ID_ORIGINE_ID primary key (Nome));

create table Origine_Migliora (
     Nome_Origine char(30) not null,
     Nome_Abilita char(30) not null,
     constraint ID_Origine_Migliora_ID primary key (Nome_Origine, Nome_Abilita));

create table PERSONAGGIO (
     ID_Personaggio int(40) not null,
     Car_Forza int not null,
     Car_Destrezza int not null,
     Car_Costituzione int not null,
     Car_Intelligenza int not null,
     Car_Saggezza int not null,
     Car_Carisma int not null,
     Punti_Ferita int not null,
     Nome char(30) not null,
     Descrizione_Aspetto text not null,
     Classe_Armatura int not null,
     Iniziativa int not null,
     Punti_Esperienza int not null,
     constraint ID_PERSONAGGIO_ID primary key (ID_Personaggio));

create table Possiede (
     ID_Utente int not null,
     ID_Personaggio int not null,
     constraint ID_Possiede_ID primary key (ID_Utente, ID_Personaggio));

create table PRIVILEGIO (
     Nome char(30) not null,
     Descrizione text not null,
     constraint ID_PRIVILEGIO_ID primary key (Nome));

create table PROPRIETA (
     Nome char(30) not null,
     Descrizione text not null,
     constraint ID_PROPRIETA_ID primary key (Nome));

create table Proprieta_arma (
     Nome_Oggetto char(30) not null,
     Nome_Proprieta char(30) not null,
     constraint ID_Proprieta_arma_ID primary key (Nome_Oggetto, Nome_Proprieta));

create table RAZZA (
     Descrizione text not null,
     Nome char(30) not null,
     Aum_Nome_Caratteristica char(30) not null,
     Aum_Valore_Aggiuntivo int not null,
     Eta int not null,
     Taglia char(30) not null,
     Velocita char(30) not null,
     constraint ID_RAZZA_ID primary key (Nome));

create table Sblocca_Bardo (
     ID_Bardo int not null,
     Nome_Incantesimo char(30) not null,
     constraint ID_Sblocca_Bardo_ID primary key (ID_Bardo, Nome_Incantesimo));

create table Sblocca_Mago (
     ID_Mago int not null,
     Nome_Incantesimo char(30) not null,
     constraint ID_Sblocca_Mago_ID primary key (ID_Mago, Nome_Incantesimo));

create table Scelta_Barbaro (
     Livello_Classe int not null,
     Nome_Classe char(30) not null,
     ID_Barbaro int not null,
     constraint ID_Scelta_Barbaro_ID primary key (ID_Barbaro, Nome_Classe, Livello_Classe));

create table Scelta_Bardo (
     Livello_Classe int not null,
     Nome_Classe char(30) not null,
     ID_Bardo int not null,
     constraint ID_Scelta_Bardo_ID primary key (ID_Bardo, Nome_Classe, Livello_Classe));

create table Scelta_Classe (
     Nome_Classe char(30) not null,
     Livello_Classe int not null,
     ID_Personaggio int not null,
     constraint ID_Scelta_Classe_ID primary key (Nome_Classe, Livello_Classe, ID_Personaggio));

create table Scelta_Ladro (
     Livello_Classe int not null,
     Nome_Classe char(30) not null,
     ID_Ladro int not null,
     constraint ID_Scelta_Ladro_ID primary key (ID_Ladro, Nome_Classe, Livello_Classe));

create table Scelta_Mago (
     Livello_Classe int not null,
     Nome_Classe char(30) not null,
     ID_Mago int not null,
     constraint ID_Scelta_Mago_ID primary key (ID_Mago, Nome_Classe, Livello_Classe));

create table Scelta_Sottoclasse (
     ID_Personaggio int not null,
     Nome_Sottoclasse char(30) not null,
     Livello_Sottoclasse int not null,
     constraint ID_Scelta_Sottoclasse_ID primary key (Nome_Sottoclasse, Livello_Sottoclasse, ID_Personaggio));

create table SLOT_INCANTESIMO (
     Livello_Slot int(3) not null,
     constraint ID_SLOT_INCANTESIMO_ID primary key (Livello_Slot));

create table SOTTOCLASSE (
     ID_Sottoclasse int(30) not null,
     Nome char(30) not null,
     Livello int(3) not null,
     constraint ID_SOTTOCLASSE_ID primary key (ID_Sottoclasse));

create table SOTTORAZZA (
     Aum_Nome_Caratteristica char(30) not null,
     Aum_Valore_Aggiuntivo int(10) not null,
     Nome char(30) not null,
     Descrizione text not null,
     constraint ID_SOTTORAZZA_ID primary key (Nome));

create table Specializzazione (
     Livello_Classe int not null,
     Nome_Classe char(30) not null,
     Livello_Sottoclasse int not null,
     Nome_Sottoclasse char(30) not null,
     constraint ID_Specializzazione_ID primary key (Livello_Classe, Nome_Classe, Livello_Sottoclasse, Nome_Sottoclasse));

create table Tiene (
     ID_Borsa int not null,
     ID_Personaggio int not null,
     constraint ID_Tiene_ID primary key (ID_Personaggio, ID_Borsa));

create table Tiri_Salvezza_Personaggio (
     ID_Personaggio int not null,
     Nome_Caratteristica char(30) not null,
     constraint ID_Tiri_Salvezza_Personaggio_ID primary key (Nome_Caratteristica, ID_Personaggio));

create table TIRO_SALVEZZA (
     Nome_Caratteristica char(30) not null,
     constraint ID_TIRO_SALVEZZA_ID primary key (Nome_Caratteristica));

create table Tratti_della_Razza (
     Nome_Tratto char(30) not null,
     Nome_Razza char(30) not null,
     constraint ID_Tratti_della_Razza_ID primary key (Nome_Tratto, Nome_Razza));

create table Tratti_della_Sottorazza (
     Nome_Tratto char(30) not null,
     Nome_Sottorazza char(30) not null,
     constraint ID_Tratti_della_Sottorazza_ID primary key (Nome_Tratto, Nome_Sottorazza));

create table TRATTI_RAZZIALI (
     Nome char(30) not null,
     Descrizione text not null,
     constraint ID_TRATTI_RAZZIALI_ID primary key (Nome));

create table USER (
     ID_Utente int(40) not null,
     Username char(70) not null,
     Password char(70) not null,
     E_mail char(70) not null,
     constraint ID_USER_ID primary key (ID_Utente));


