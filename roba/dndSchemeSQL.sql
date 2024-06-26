-- *********************************************
-- * Standard SQL generation                   
-- *--------------------------------------------
-- * DB-MAIN version: 11.0.2              
-- * Generator date: Sep 14 2021              
-- * Generation date: Sun Apr  7 10:04:17 2024 
-- * LUN file: D:\Download\schema7 (3).lun 
-- * Schema: SCHEMA/SQL 
-- ********************************************* 



-- DBSpace Section
-- _______________

-- Tables Section
-- _____________ 

create table ABILITA (
     Nome varchar(10) not null,
     Caratteristica_Associata varchar(10) not null,
     constraint ID_ABILITA_ID primary key (Nome));

create table Abilita_personaggio (
     ID_Personaggio numeric(10) not null,
     Nome_Abilita varchar(10) not null,
     Valore numeric(2) not null,
     constraint ID_Abilita_personaggio_ID primary key (ID_Personaggio, Nome_Abilita));

create table Appartiene(
      ID_Personaggio numeric(10) not null,
      Nome_Razza varchar(10) not null,
     constraint ID_Appartiene_ID primary key (ID_Personaggio, Nome_Razza));

create table ALLINEAMENTO (
     Nome varchar(20) not null,
     constraint ID_ALLINEAMENTO_ID primary key (Nome));

create table BARBARO (
     ID_Barbaro char(1) not null,
     Utilizzi_Rabbia_Giornalieri varchar(10) not null,
     Bonus_Rabbia numeric(1) not null,
     Nome_Classe varchar(10) not null,
     Livello_Classe numeric(2) not null,
     constraint ID_BARBARO_ID primary key (ID_Barbaro));

create table BARDO (
     ID_Bardo char(1) not null,
     Dado_Ispirazione_Bardica varchar(10) not null,
     Nome_Classe varchar(10) not null,
     Livello_Classe numeric(2) not null,
     constraint ID_BARDO_ID primary key (ID_Bardo));

create table BORSA (
     ID_Borsa varchar(100) not null,
     ID_Personaggio numeric(10) not null,
     Peso_Trasportabile numeric(10) not null,
     Monete_Rame numeric(10) not null,
     Monete_Argento numeric(10) not null,
     Monete_Electrum numeric(10) not null,
     Monete_Oro numeric(10) not null,
     Monete_Platino numeric(10) not null,
     constraint ID_BORSA_ID primary key (ID_Borsa),
     constraint FKTiene_ID unique (ID_Personaggio));

create table CAPACITA_DI_CLASSE (
     Nome varchar(10) not null,
     Descrizione varchar(1000) not null,
     Aum_Nome_Caratteristica char(1),
     Aum_Valore_Aggiuntivo char(1),
     Caratteristica_Incantatore char(1),
     Utilizzo_Giornaliero char(1),
     constraint ID_CAPACITA_DI_CLASSE_ID primary key (Nome));

create table CAPACITA_DI_SOTTOCLASSE (
     Nome varchar(10) not null,
     Descrizione varchar(1000) not null,
     constraint ID_CAPACITA_DI_SOTTOCLASSE_ID primary key (Nome));

create table Caratterizza(
     Nome_Allineamento varchar(10) not null,
     ID_Personaggio numeric(10) not null,
     constraint ID_Caratterizza_ID primary key (Nome_Allineamento, ID_Personaggio));

create table CLASSE (
     Nome varchar(10) not null,
     Bonus_Competenza numeric(10) not null,
     Dado_Vita varchar(10) not null,
     Livello numeric(5) not null,
     constraint ID_CLASSE_ID primary key (Nome, Livello));

create table Classe_Migliora (
     Nome_Abilita varchar(10) not null,
     Nome_Classe varchar(10) not null,
     Livello_Classe numeric(2) not null,
     constraint ID_Classe_Migliora_ID primary key (Nome_Abilita, Nome_Classe, Livello_Classe));

create table Competenza (
     Nome_Classe varchar(10) not null,
     Livello_Classe numeric(2) not null,
     Nome_TiroSalvezza varchar(10) not null,
     constraint ID_Competenza_ID primary key (Nome_TiroSalvezza, Nome_Classe, Livello_Classe));

create table Competenza_dell_Origine_in_Strumenti (
     Nome_Origine varchar(10) not null,
     Nome_Strumento varchar(10) not null,
     constraint ID_Competenza_dell_Origine_in_Strumenti_ID primary key (Nome_Origine, Nome_Strumento));

create table Competenza_della_Classe_in_Armature (
     Nome_Armatura varchar(10) not null,
     Livello_Classe numeric(2) not null,
     Nome_Classe varchar(10) not null,
     constraint ID_Competenza_della_Classe_in_Armature_ID primary key (Nome_Armatura, Nome_Classe, Livello_Classe));

create table Competenza_della_Classe_in_Armi (
     Nome_Arma varchar(10) not null,
     Livello_Classe numeric(2) not null,
     Nome_Classe varchar(10) not null,
     constraint ID_Competenza_della_Classe_in_Armi_ID primary key (Nome_Arma, Nome_Classe, Livello_Classe));

create table Competenza_della_Classe_in_Strumenti (
     Nome_Strumento varchar(10) not null,
     Livello_Classe numeric(2) not null,
     Nome_Classe varchar(10) not null,
     constraint ID_Competenza_della_Classe_in_Strumenti_ID primary key (Nome_Strumento, Nome_Classe, Livello_Classe));

create table Competenze_Abilita (
     Nome_Abilita varchar(10) not null,
     ID_Personaggio numeric(10) not null,
     constraint ID_Competenze_Abilita_ID primary key (Nome_Abilita, ID_Personaggio));

create table Concede (
     Nome_Origine varchar(10) not null,
     Nome_Privilegio varchar(10) not null,
     constraint ID_Concede_ID primary key (Nome_Origine, Nome_Privilegio));

create table Conosce (
     Nome_Incantesimo varchar(10) not null,
     ID_Personaggio numeric(10) not null,
     constraint ID_Conosce_ID primary key (Nome_Incantesimo, ID_Personaggio));

create table Contiene (
     ID_Borsa varchar(100) not null,
     Nome_Oggetto varchar(10) not null,
     Quantita numeric(10) not null,
     constraint ID_Contiene_ID primary key (Nome_Oggetto, ID_Borsa));

create table Equipaggia_Arma (
     Nome_Arma varchar(10) not null,
     ID_Personaggio numeric(10) not null,
     constraint ID_Equipaggia_Arma_ID primary key (Nome_Arma, ID_Personaggio));

create table Equipaggia_Armatura (
     Nome_Armatura varchar(10) not null,
     ID_Personaggio numeric(10) not null,
     constraint ID_Equipaggia_Armatura_ID primary key (Nome_Armatura, ID_Personaggio));

create table Ha_Origine (
     Nome_Origine varchar(10) not null,
     ID_Personaggio numeric(10) not null,
     constraint ID_Ha_Origine_ID primary key (Nome_Origine, ID_Personaggio));

 create table Identifica (
     Nome_Razza varchar(10) not null,
     Nome_Sottorazza varchar(10) not null,
     constraint ID_Identifica_ID primary key (Nome_Razza,Nome_Sottorazza));

create table Impara_Classe (
     Nome_Capacita varchar(10) not null,
     Nome_Classe varchar(10) not null,
     Livello_Classe numeric(2) not null,
     constraint ID_Impara_Classe_ID primary key (Nome_Classe, Livello_Classe, Nome_Capacita));

create table Impara_Sottoclasse (
     Nome_Capacita varchar(10) not null,
     Nome_Sottoclasse varchar(10) not null,
     Livello_Sottoclasse numeric(2) not null,
     constraint ID_Impara_Sottoclasse_ID primary key (Nome_Sottoclasse, Livello_Sottoclasse, Nome_Capacita));

create table INCANTESIMO (
     Nome varchar(10) not null,
     Livello numeric(2) not null,
     Scuola varchar(10) not null,
     Tempo_di_Lancio varchar(10) not null,
     Distanza varchar(10) not null,
     Durata varchar(10) not null,
     Componenti varchar(10) not null,
     Rituale char not null,
     ID_Mago char(1),
     ID_Bardo char(1),
     constraint ID_INCANTESIMO_ID primary key (Nome));

create table LADRO (
     ID_Ladro char(1) not null,
     Bonus_Attacco_Furtivo varchar(10) not null,
     Nome_Classe varchar(10) not null,
     Livello_Classe numeric(2) not null,
     constraint ID_LADRO_ID primary key (ID_Ladro));

create table Lancia_Bardo (
     ID_Bardo char(1) not null,
     Livello_Slot numeric(2) not null,
     Quantita numeric(2) not null,
     constraint ID_Lancia_Bardo_ID primary key (ID_Bardo, Livello_Slot));

create table Lancia_Mago (
     ID_Mago char(1) not null,
     Livello_Slot numeric(2) not null,
     Quantita numeric(2) not null,
     constraint ID_Lancia_Mago_ID primary key (ID_Mago, Livello_Slot));

create table LINGUE (
     Nome varchar(10) not null,
     Descrizione varchar(100) not null,
     constraint ID_LINGUE_ID primary key (Nome));

create table Lingue_Aggiuntive (
     Nome_Lingua varchar(10) not null,
     Nome_Origine varchar(10) not null,
     constraint ID_Lingue_Aggiuntive_ID primary key (Nome_Lingua, Nome_Origine));

create table Lingue_Conosciute (
     Nome_Lingua varchar(10) not null,
     ID_Personaggio numeric(10) not null,
     constraint ID_Lingue_Conosciute_ID primary key (Nome_Lingua, ID_Personaggio));

create table Lingue_della_Razza (
     Nome_Lingua varchar(10) not null,
     Nome_Razza varchar(20) not null,
     constraint ID_Lingue_della_Razza_ID primary key (Nome_Lingua, Nome_Razza));

create table MAGO (
     ID_Mago char(1) not null,
     Nome_Classe varchar(10) not null,
     Livello_Classe numeric(2) not null,
     constraint ID_MAGO_ID primary key (ID_Mago));

create table Oggetti_dell_Origine (
     Nome_Oggetto varchar(10) not null,
     Nome_Origine varchar(10) not null,
     constraint ID_Oggetti_dell_Origine_ID primary key (Nome_Oggetto, Nome_Origine));

create table Oggetti_di_Classe (
     Nome_Oggetto varchar(10) not null,
     Livello_Classe numeric(2) not null,
     Nome_Classe varchar(10) not null,
     constraint ID_Oggetti_di_Classe_ID primary key (Nome_Oggetto, Nome_Classe, Livello_Classe));

create table OGGETTO (
     Peso numeric(5) not null,
     Valore numeric(10) not null,
     Nome varchar(10) not null,
     Descrizione char(1),
     Contenuto char(1),
     Danno char(1),
     Tipo_Danno char(1),
     Classe_Armatura char(1),
     Forza_Necessaria char(1),
     Svantaggio_Furtivita char(1),
     constraint ID_OGGETTO_ID primary key (Nome));

create table ORIGINE (
     Nome varchar(10) not null,
     Descrizione char(1) not null,
     Con_Nome varchar(10) not null,
     constraint ID_ORIGINE_ID primary key (Nome));

create table Origine_Migliora (
     Nome_Abilita varchar(10) not null,
     Nome_Origine varchar(10) not null,
     constraint ID_Origine_Migliora_ID primary key (Nome_Abilita, Nome_Origine));

create table PERSONAGGIO (
     ID_Personaggio numeric(10) not null,
     Car_Forza char(1) not null,
     Car_Destrezza char(1) not null,
     Car_Costituzione char(1) not null,
     Car_Intelligenza char(1) not null,
     Car_Saggezza char(1) not null,
     Car_Carisma char(1) not null,
     Punti_Ferita numeric(10) not null,
     Nome varchar(100) not null,
     Descrizione_Aspetto varchar(1000) not null,
     Classe_Armatura numeric(2) not null,
     Iniziativa numeric(1) not null,
     Punti_Esperienza numeric(10) not null,
     ID_Utente numeric(10) not null,
     Ha__Nome varchar(10) not null,
     Equ_Nome varchar(10) not null,
     Equ_Nome_1 varchar(10) not null,
     Car_Nome varchar(20) not null,
     App_Nome varchar(20) not null,
     constraint ID_PERSONAGGIO_ID primary key (ID_Personaggio));

create table Possiede (
     ID_Utente numeric(10) not null,
     ID_Personaggio numeric(10) not null,
     constraint ID_Possiede_ID primary key (ID_Utente, ID_Personaggio));

create table PRIVILEGIO (
     Nome varchar(10) not null,
     Descrizione varchar(1000) not null,
     constraint ID_PRIVILEGIO_ID primary key (Nome));

create table PROPRIETA (
     Nome varchar(10) not null,
     Descrizione varchar(1000) not null,
     constraint ID_PROPRIETA_ID primary key (Nome));

create table Proprieta_Arma (
     Nome_Proprieta varchar(10) not null,
     Nome_Arma varchar(10) not null,
     constraint ID_Proprieta_Arma_ID primary key (Nome_Proprieta, Nome_Arma));

create table RAZZA (
     Descrizione varchar(1000) not null,
     Nome varchar(20) not null,
     Aum_Nome_Caratteristica varchar(10) not null,
     Aum_Valore_Aggiuntivo numeric(1) not null,
     Eta numeric(3) not null,
     Taglia varchar(10) not null,
     Velocita varchar(10) not null,
     constraint ID_RAZZA_ID primary key (Nome));


create table Sblocca_Bardo (
     ID_Bardo numeric(10) not null,
     Nome_Incantesimo varchar(10) not null,
     constraint ID_Sblocca_Bardo_ID primary key (Nome_Incantesimo, ID_Bardo));

create table Sblocca_Mago (
     ID_Mago numeric(10) not null,
     Nome_Incantesimo varchar(10) not null,
     constraint ID_Sblocca_Mago_ID primary key (Nome_Incantesimo, ID_Mago));

create table Scelta_Barbaro (
     Nome_Classe varchar(10) not null,
     Livello_Classe numeric(2) not null,
     ID_Barbaro numeric(10) not null,
     constraint ID_Scelta_Barbaro_ID primary key (Nome_Classe, Livello_Classe, ID_Barbaro));

create table Scelta_Bardo (
     Nome_Classe varchar(10) not null,
     Livello_Classe numeric(2) not null,
     ID_Bardo numeric(10) not null,
     constraint ID_Scelta_Bardo_ID primary key (Nome_Classe, Livello_Classe, ID_Bardo));

create table Scelta_Classe (
     Nome_Classe varchar(10) not null,
     Livello_Classe numeric(2) not null,
     ID_Personaggio numeric(10) not null,
     constraint ID_Scelta_Classe_ID primary key (Nome_Classe, Livello_Classe, ID_Personaggio));

create table Scelta_Ladro (
     Nome_Classe varchar(10) not null,
     Livello_Classe numeric(2) not null,
     ID_Ladro numeric(10) not null,
     constraint ID_Scelta_Ladro_ID primary key (Nome_Classe, Livello_Classe, ID_Ladro));

create table Scelta_Mago (
     Nome_Classe varchar(10) not null,
     Livello_Classe numeric(2) not null,
     ID_Mago numeric(10) not null,
     constraint ID_Scelta_Mago_ID primary key (Nome_Classe, Livello_Classe, ID_Mago));

create table Scelta_Sottoclasse (
     ID_Personaggio numeric(10) not null,
     Nome_Sottoclasse varchar(10) not null,
     Livello_Sottoclasse numeric(2) not null,
     constraint ID_Scelta_Sottoclasse_ID primary key (Nome_Sottoclasse, Livello_Sottoclasse, ID_Personaggio));

create table SLOT_INCANTESIMO (
     Livello_Slot numeric(2) not null,
     constraint ID_SLOT_INCANTESIMO_ID primary key (Livello_Slot));

create table Specializzazione (
     Nome_Classe varchar(10) not null,
     Livello_Classe numeric(2) not null,
     Nome_Sottoclasse varchar(10) not null,
     Livello_Sottoclasse numeric(2) not null,
     constraint ID_Specializzazione_ID primary key (Nome_Classe, Livello_Classe, Nome_Sottoclasse, Livello_Sottoclasse));

create table SOTTOCLASSE (
     Nome varchar(10) not null,
     Livello numeric(2) not null,
     Spe_Nome varchar(10) not null,
     Spe_Livello numeric(2) not null,
     constraint ID_SOTTOCLASSE_ID primary key (Nome, Livello));

create table SOTTORAZZA (
     Aum_Nome_Caratteristica varchar(10) not null,
     Aum_Valore_Aggiuntivo numeric(1) not null,
     Nome varchar(100) not null,
     Descrizione varchar(1000) not null,
     Ind_Nome varchar(20) not null,
     constraint ID_SOTTORAZZA_ID primary key (Nome));

create table Tiene (
     ID_Personaggio numeric(10) not null,
     ID_Borsa numeric(10) not null,
     constraint ID_Tiene_ID primary key (ID_Personaggio, ID_Borsa));

create table Tiri_Salvezza_Personaggio (
     ID_Personaggio numeric(10) not null,
     Nome_Caratteristica varchar(10) not null,
     constraint ID_Tiri_Salvezza_Personaggio_ID primary key (Nome_Caratteristica, ID_Personaggio));

create table TIRO_SALVEZZA (
     Nome_Caratteristica varchar(10) not null,
     constraint ID_TIRO_SALVEZZA_ID primary key (Nome_Caratteristica));

create table Tratti_della_Razza (
     Nome_Razza varchar(20) not null,
     Nome_Tratto varchar(10) not null,
     constraint ID_Tratti_della_Razza_ID primary key (Nome_Razza, Nome_Tratto));

create table Tratti_della_Sottorazza (
     Nome_Sottorazza varchar(100) not null,
     Nome_Tratto varchar(10) not null,
     constraint ID_Tratti_della_Sottorazza_ID primary key (Nome_Sottorazza, Nome_Tratto));

create table TRATTI_RAZZIALI (
     Nome varchar(10) not null,
     Descrizione varchar(1000) not null,
     constraint ID_TRATTI_RAZZIALI_ID primary key (Nome));

create table UTENTE (
     ID_Utente numeric(10) not null,
     Password varchar(100) not null,
     E_mail varchar(100) not null,
     constraint ID_UTENTE_ID primary key (ID_Utente));

-- Index Section
-- _____________ 

create unique index ID_ABILITA_IND
     on ABILITA (Nome);

create unique index ID_Abilita_personaggio_IND
     on Abilita_personaggio (ID_Personaggio, Nome_Abilita);

create index FKAbi_ABI_IND
     on Abilita_personaggio (Nome_Abilita);

create unique index ID_ALLINEAMENTO_IND
     on ALLINEAMENTO (Nome);

create unique index ID_BARBARO_IND
     on BARBARO (ID_Barbaro);

create index FKScelta_Barbaro_IND
     on BARBARO (Nome_Classe, Livello_Classe);

create unique index ID_BARDO_IND
     on BARDO (ID_Bardo);

create index FKScelta_Bardo_IND
     on BARDO (Nome_Classe, Livello_Classe);

create unique index ID_BORSA_IND
     on BORSA (ID_Borsa);

create unique index FKTiene_IND
     on BORSA (ID_Personaggio);

create unique index ID_CAPACITA_DI_CLASSE_IND
     on CAPACITA_DI_CLASSE (Nome);

create unique index ID_CAPACITA_DI_SOTTOCLASSE_IND
     on CAPACITA_DI_SOTTOCLASSE (Nome);

create unique index ID_CLASSE_IND
     on CLASSE (Nome, Livello);

create unique index ID_Classe_Migliora_IND
     on Classe_Migliora (Nome_Abilita, Nome_Classe, Livello_Classe);

create index FKCla_CLA_IND
     on Classe_Migliora (Nome_Classe, Livello_Classe);

create unique index ID_Competenza_IND
     on Competenza (Nome_TiroSalvezza, Nome_Classe, Livello_Classe);

create index FKCom_CLA_3_IND
     on Competenza (Nome_Classe, Livello_Classe);

create unique index ID_Competenza_dell_Origine_in_Strumenti_IND
     on Competenza_dell_Origine_in_Strumenti (Nome_Strumento, Nome_Origine);

create index FKCom_ORI_IND
     on Competenza_dell_Origine_in_Strumenti (Nome_Origine);

create unique index ID_Competenza_della_Classe_in_Armature_IND
     on Competenza_della_Classe_in_Armature (Nome_Armatura, Nome_Classe, Livello_Classe);

create index FKCom_CLA_2_IND
     on Competenza_della_Classe_in_Armature (Nome_Classe, Livello_Classe);

create unique index ID_Competenza_della_Classe_in_Armi_IND
     on Competenza_della_Classe_in_Armi (Nome_Arma, Nome_Classe, Livello_Classe);

create index FKCom_CLA_1_IND
     on Competenza_della_Classe_in_Armi (Nome_Classe, Livello_Classe);

create unique index ID_Competenza_della_Classe_in_Strumenti_IND
     on Competenza_della_Classe_in_Strumenti (Nome_Strumento, Nome_Classe, Livello_Classe);

create index FKCom_CLA_IND
     on Competenza_della_Classe_in_Strumenti (Nome_Classe, Livello_Classe);

create unique index ID_Competenze_Abilita_IND
     on Competenze_Abilita (Nome_Abilita, ID_Personaggio);

create index FKCom_PER_IND
     on Competenze_Abilita (ID_Personaggio);

create unique index ID_Conosce_IND
     on Conosce (Nome_Incantesimo, ID_Personaggio);

create index FKCon_PER_IND
     on Conosce (ID_Personaggio);

create unique index ID_Contiene_IND
     on Contiene (Nome_Oggetto, ID_Borsa);

create index FKCon_BOR_IND
     on Contiene (ID_Borsa);

create unique index ID_Impara_Classe_IND
     on Impara_Classe (Nome_Classe, Livello_Classe, Nome_Capacita);

create index FKImp_CAP_1_IND
     on Impara_Classe (Nome_Capacita);

create unique index ID_Impara_Sottoclasse_IND
     on Impara_Sottoclasse (Nome_Sottoclasse, Livello_Sottoclasse, Nome_Capacita);

create index FKImp_CAP_IND
     on Impara_Sottoclasse (Nome_Capacita);

create unique index ID_INCANTESIMO_IND
     on INCANTESIMO (Nome);

create index FKSblocca_Mago_IND
     on INCANTESIMO (ID_Mago);

create index FKSblocca_Bardo_IND
     on INCANTESIMO (ID_Bardo);

create unique index ID_LADRO_IND
     on LADRO (ID_Ladro);

create index FKScelta_Ladro_IND
     on LADRO (Nome_Classe, Livello_Classe);

create unique index ID_Lancia_Bardo_IND
     on Lancia_Bardo (ID_Bardo, Livello_Slot);

create index FKLan_SLO_1_IND
     on Lancia_Bardo (Livello_Slot);

create unique index ID_Lancia_Mago_IND
     on Lancia_Mago (ID_Mago, Livello_Slot);

create index FKLan_SLO_IND
     on Lancia_Mago (Livello_Slot);

create unique index ID_LINGUE_IND
     on LINGUE (Nome);

create unique index ID_Lingue_Aggiuntive_IND
     on Lingue_Aggiuntive (Nome_Lingua, Nome_Origine);

create index FKLin_ORI_IND
     on Lingue_Aggiuntive (Nome_Origine);

create unique index ID_Lingue_Conosciute_IND
     on Lingue_Conosciute (Nome_Lingua, ID_Personaggio);

create index FKLin_PER_IND
     on Lingue_Conosciute (ID_Personaggio);

create unique index ID_Lingue_della_Razza_IND
     on Lingue_della_Razza (Nome_Lingua, Nome_Razza);

create index FKLin_RAZ_IND
     on Lingue_della_Razza (Nome_Razza);

create unique index ID_MAGO_IND
     on MAGO (ID_Mago);

create index FKScelta_Mago_IND
     on MAGO (Nome_Classe, Livello_Classe);

create unique index ID_Oggetti_dell_Origine_IND
     on Oggetti_dell_Origine (Nome_Oggetto, Nome_Origine);

create index FKOgg_ORI_IND
     on Oggetti_dell_Origine (Nome_Oggetto);

create unique index ID_Oggetti_di_Classe_IND
     on Oggetti_di_Classe (Nome_Oggetto, Nome_Classe, Livello_Classe);

create index FKOgg_CLA_IND
     on Oggetti_di_Classe (Nome_Classe, Livello_Classe);

create unique index ID_OGGETTO_IND
     on OGGETTO (Nome);

create unique index ID_ORIGINE_IND
     on ORIGINE (Nome);

create index FKConcede_IND
     on ORIGINE (Con_Nome);

create unique index ID_Origine_Migliora_IND
     on Origine_Migliora (Nome_Abilita, Nome_Origine);

create index FKOri_ORI_IND
     on Origine_Migliora (Nome_Origine);

create unique index ID_PERSONAGGIO_IND
     on PERSONAGGIO (ID_Personaggio);

create index FKPossiede_IND
     on PERSONAGGIO (ID_Utente);

create index FKHa_Origine_IND
     on PERSONAGGIO (Ha__Nome);

create index FKEquipaggia_armatura_IND
     on PERSONAGGIO (Equ_Nome);

create index FKEquipaggia_arma_IND
     on PERSONAGGIO (Equ_Nome_1);

create index FKCaratterizza_IND
     on PERSONAGGIO (Car_Nome);

create index FKAppartiene_IND
     on PERSONAGGIO (App_Nome);

create unique index ID_PRIVILEGIO_IND
     on PRIVILEGIO (Nome);

create unique index ID_PROPRIETA_IND
     on PROPRIETA (Nome);

create unique index ID_Proprieta_Arma_IND
     on Proprieta_Arma (Nome_Proprieta, Nome_Arma);

create index FKPro_PRO_IND
     on Proprieta_Arma (Nome_Proprieta);

create unique index ID_RAZZA_IND
     on RAZZA (Nome);

create unique index ID_Scelta_Classe_IND
     on Scelta_Classe (Nome_Classe, Livello_Classe, ID_Personaggio);

create index FKSce_PER_1_IND
     on Scelta_Classe (ID_Personaggio);

create unique index ID_Scelta_Sottoclasse_IND
     on Scelta_Sottoclasse (Nome_Sottoclasse, Livello_Sottoclasse, ID_Personaggio);

create index FKSce_PER_IND
     on Scelta_Sottoclasse (ID_Personaggio);

create unique index ID_SLOT_INCANTESIMO_IND
     on SLOT_INCANTESIMO (Livello_Slot);

create unique index ID_SOTTOCLASSE_IND
     on SOTTOCLASSE (Nome, Livello);

create index FKSpecializzazione_IND
     on SOTTOCLASSE (Spe_Nome, Spe_Livello);

create unique index ID_SOTTORAZZA_IND
     on SOTTORAZZA (Nome);

create index FKIdentifica_IND
     on SOTTORAZZA (Ind_Nome);

create unique index ID_Tiri_Salvezza_Personaggio_IND
     on Tiri_Salvezza_Personaggio (Nome_Caratteristica, ID_Personaggio);

create index FKTir_PER_IND
     on Tiri_Salvezza_Personaggio (ID_Personaggio);

create unique index ID_TIRO_SALVEZZA_IND
     on TIRO_SALVEZZA (Nome_Caratteristica);

create unique index ID_Tratti_della_Razza_IND
     on Tratti_della_Razza (Nome_Razza, Nome_Tratto);

create index FKTra_RAZ_IND
     on Tratti_della_Razza (Nome_Tratto);

create unique index ID_Tratti_della_Sottorazza_IND
     on Tratti_della_Sottorazza (Nome_Sottorazza, Nome_Tratto);

create index FKTra_TRA_IND
     on Tratti_della_Sottorazza (Nome_Tratto);

create unique index ID_TRATTI_RAZZIALI_IND
     on TRATTI_RAZZIALI (Nome);

create unique index ID_UTENTE_IND
     on UTENTE (ID_Utente);
     
-- Constraints Section
-- ___________________ 

alter table Abilita_personaggio add constraint FKAbi_PER
     foreign key (ID_Personaggio)
     references PERSONAGGIO (ID_Personaggio);

alter table Abilita_personaggio add constraint FKAbi_ABI_FK
     foreign key (Nome_Abilita)
     references ABILITA (Nome);

alter table BARBARO add constraint FKScelta_Barbaro_FK
     foreign key (Nome_Classe, Livello_Classe)
     references CLASSE (Nome, Livello);

alter table BARDO add constraint FKScelta_Bardo_FK
     foreign key (Nome_Classe, Livello_Classe)
     references CLASSE (Nome, Livello);

alter table BORSA add constraint FKTiene_FK
     foreign key (ID_Personaggio)
     references PERSONAGGIO (ID_Personaggio);

alter table Classe_Migliora add constraint FKCla_CLA_FK
     foreign key (Nome_Classe, Livello_Classe)
     references CLASSE (Nome, Livello);

alter table Classe_Migliora add constraint FKCla_ABI
     foreign key (Nome_Abilita)
     references ABILITA (Nome);

alter table Competenza add constraint FKCom_TIR
     foreign key (Nome_TiroSalvezza)
     references TIRO_SALVEZZA (Nome_Caratteristica);

alter table Competenza add constraint FKCom_CLA_3_FK
     foreign key (Nome_Classe, Livello_Classe)
     references CLASSE (Nome, Livello);

alter table Competenza_dell_Origine_in_Strumenti add constraint FKCom_ORI_FK
     foreign key (Nome_Origine)
     references ORIGINE (Nome);

alter table Competenza_dell_Origine_in_Strumenti add constraint FKCom_OGG_3
     foreign key (Nome_Strumento)
     references OGGETTO (Nome);

alter table Competenza_della_Classe_in_Armature add constraint FKCom_OGG_2
     foreign key (Nome_Armatura)
     references OGGETTO (Nome);

alter table Competenza_della_Classe_in_Armature add constraint FKCom_CLA_2_FK
     foreign key (Nome_Classe, Livello_Classe)
     references CLASSE (Nome, Livello);

alter table Competenza_della_Classe_in_Armi add constraint FKCom_OGG_1
     foreign key (Nome_Arma)
     references OGGETTO (Nome);

alter table Competenza_della_Classe_in_Armi add constraint FKCom_CLA_1_FK
     foreign key (Nome_Classe, Livello_Classe)
     references CLASSE (Nome, Livello);

alter table Competenza_della_Classe_in_Strumenti add constraint FKCom_OGG
     foreign key (Nome_Strumento)
     references OGGETTO (Nome);

alter table Competenza_della_Classe_in_Strumenti add constraint FKCom_CLA_FK
     foreign key (Nome_Classe, Livello_Classe)
     references CLASSE (Nome, Livello);

alter table Competenze_Abilita add constraint FKCom_PER_FK
     foreign key (ID_Personaggio)
     references PERSONAGGIO (ID_Personaggio);

alter table Competenze_Abilita add constraint FKCom_ABI
     foreign key (Nome_Abilita)
     references ABILITA (Nome);

alter table Conosce add constraint FKCon_PER_FK
     foreign key (ID_Personaggio)
     references PERSONAGGIO (ID_Personaggio);

alter table Conosce add constraint FKCon_INC
     foreign key (Nome_Incantesimo)
     references INCANTESIMO (Nome);

alter table Contiene add constraint FKCon_OGG
     foreign key (Nome_Oggetto)
     references OGGETTO (Nome);

alter table Contiene add constraint FKCon_BOR_FK
     foreign key (ID_Borsa)
     references BORSA (ID_Borsa);

alter table Impara_Classe add constraint FKImp_CLA
     foreign key (Nome_Classe, Livello_Classe)
     references CLASSE (Nome, Livello);

alter table Impara_Classe add constraint FKImp_CAP_1_FK
     foreign key (Nome_Capacita)
     references CAPACITA_DI_CLASSE (Nome);

alter table Impara_Sottoclasse add constraint FKImp_SOT
     foreign key (Nome_Sottoclasse, Livello_Sottoclasse)
     references SOTTOCLASSE (Nome, Livello);

alter table Impara_Sottoclasse add constraint FKImp_CAP_FK
     foreign key (Nome_Capacita)
     references CAPACITA_DI_SOTTOCLASSE (Nome);

alter table INCANTESIMO add constraint FKSblocca_Mago_FK
     foreign key (ID_Mago)
     references MAGO (ID_Mago);

alter table INCANTESIMO add constraint FKSblocca_Bardo_FK
     foreign key (ID_Bardo)
     references BARDO (ID_Bardo);

alter table LADRO add constraint FKScelta_Ladro_FK
     foreign key (Nome_Classe, Livello_Classe)
     references CLASSE (Nome, Livello);

alter table Lancia_Bardo add constraint FKLan_SLO_1_FK
     foreign key (Livello_Slot)
     references SLOT_INCANTESIMO (Livello_Slot);

alter table Lancia_Bardo add constraint FKLan_BAR
     foreign key (ID_Bardo)
     references BARDO (ID_Bardo);

alter table Lancia_Mago add constraint FKLan_SLO_FK
     foreign key (Livello_Slot)
     references SLOT_INCANTESIMO (Livello_Slot);

alter table Lancia_Mago add constraint FKLan_MAG
     foreign key (ID_Mago)
     references MAGO (ID_Mago);

alter table Lingue_Aggiuntive add constraint FKLin_ORI_FK
     foreign key (Nome_Origine)
     references ORIGINE (Nome);

alter table Lingue_Aggiuntive add constraint FKLin_LIN_2
     foreign key (Nome_Lingua)
     references LINGUE (Nome);

alter table Lingue_Conosciute add constraint FKLin_PER_FK
     foreign key (ID_Personaggio)
     references PERSONAGGIO (ID_Personaggio);

alter table Lingue_Conosciute add constraint FKLin_LIN_1
     foreign key (Nome_Lingua)
     references LINGUE (Nome);

alter table Lingue_della_Razza add constraint FKLin_RAZ_FK
     foreign key (Nome_Razza)
     references RAZZA (Nome);

alter table Lingue_della_Razza add constraint FKLin_LIN
     foreign key (Nome_Lingua)
     references LINGUE (Nome);

alter table MAGO add constraint FKScelta_Mago_FK
     foreign key (Nome_Classe, Livello_Classe)
     references CLASSE (Nome, Livello);

alter table Oggetti_dell_Origine add constraint FKOgg_ORI_FK
     foreign key (Nome_Origine)
     references ORIGINE (Nome);

alter table Oggetti_dell_Origine add constraint FKOgg_OGG_1
     foreign key (Nome_Oggetto)
     references OGGETTO (Nome);

alter table Oggetti_di_Classe add constraint FKOgg_OGG
     foreign key (Nome_Oggetto)
     references OGGETTO (Nome);

alter table Oggetti_di_Classe add constraint FKOgg_CLA_FK
     foreign key (Nome_Classe, Livello_Classe)
     references CLASSE (Nome, Livello);

alter table ORIGINE add constraint FKConcede_FK
     foreign key (Con_Nome)
     references PRIVILEGIO (Nome);

alter table Origine_Migliora add constraint FKOri_ORI_FK
     foreign key (Nome_Origine)
     references ORIGINE (Nome); 

alter table Origine_Migliora add constraint FKOri_ABI
     foreign key (Nome_Abilita)
     references ABILITA (Nome);

alter table PERSONAGGIO add constraint FKPossiede_FK
     foreign key (ID_Utente)
     references UTENTE (ID_Utente);

alter table PERSONAGGIO add constraint FKHa_Origine_FK
     foreign key (Ha__Nome)
     references ORIGINE (Nome);

alter table PERSONAGGIO add constraint FKEquipaggia_armatura_FK
     foreign key (Equ_Nome)
     references OGGETTO (Nome);

alter table PERSONAGGIO add constraint FKEquipaggia_arma_FK
     foreign key (Equ_Nome_1)
     references OGGETTO (Nome);

alter table PERSONAGGIO add constraint FKCaratterizza_FK
     foreign key (Car_Nome)
     references ALLINEAMENTO (Nome);

alter table PERSONAGGIO add constraint FKAppartiene_FK
     foreign key (App_Nome)
     references RAZZA (Nome);

alter table Proprieta_Arma add constraint FKPro_PRO_FK
     foreign key (Nome_Proprieta)
     references PROPRIETA (Nome);

alter table Proprieta_Arma add constraint FKPro_OGG
     foreign key (Nome_Arma)
     references OGGETTO (Nome);

alter table Scelta_Classe add constraint FKSce_PER_1_FK
     foreign key (ID_Personaggio)
     references PERSONAGGIO (ID_Personaggio);

alter table Scelta_Classe add constraint FKSce_CLA
     foreign key (Nome_Classe, Livello_Classe)
     references CLASSE (Nome, Livello);

alter table Scelta_Sottoclasse add constraint FKSce_SOT
     foreign key (Nome_Sottoclasse, Livello_Sottoclasse)
     references SOTTOCLASSE (Nome, Livello);

alter table Scelta_Sottoclasse add constraint FKSce_PER_FK
     foreign key (ID_Personaggio)
     references PERSONAGGIO (ID_Personaggio);

alter table SOTTOCLASSE add constraint FKSpecializzazione_FK
     foreign key (Spe_Nome, Spe_Livello)
     references CLASSE (Nome, Livello);

alter table SOTTORAZZA add constraint FKIdentifica_FK
     foreign key (Ind_Nome)
     references RAZZA (Nome);

alter table Tiri_Salvezza_Personaggio add constraint FKTir_TIR
     foreign key (Nome_Caratteristica)
     references TIRO_SALVEZZA (Nome_Caratteristica);

alter table Tiri_Salvezza_Personaggio add constraint FKTir_PER_FK
     foreign key (ID_Personaggio)
     references PERSONAGGIO (ID_Personaggio);

alter table Tratti_della_Razza add constraint FKTra_TRA_1
     foreign key (Nome_Tratto)
     references TRATTI_RAZZIALI (Nome);

alter table Tratti_della_Razza add constraint FKTra_RAZ_FK
     foreign key (Nome_Razza)
     references RAZZA (Nome);

alter table Tratti_della_Sottorazza add constraint FKTra_TRA_FK
     foreign key (Nome_Tratto)
     references TRATTI_RAZZIALI (Nome);

alter table Tratti_della_Sottorazza add constraint FKTra_SOT
     foreign key (Nome_Sottorazza)
     references SOTTORAZZA (Nome);




