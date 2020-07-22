DROP DATABASE strangguß;
CREATE DATABASE strangguß;
USE strangguß;

create table Personalplan(
                             Anlage_ID  int(11) NOT NULL,
                             Gußzeit    time,
                             Schicht_ID int(11),
                             PRIMARY KEY (Anlage_ID),
                             CONSTRAINT gußzeit_fk
                                 FOREIGN KEY (Gußzeit)
                                     REFERENCES Gußplan (Gußzeit),
                             CONSTRAINT schicht_fk
                                 FOREIGN KEY (Schicht_ID)
                                     REFERENCES Schichtplan (Schicht_ID)
);

create table Gußplan
(
    Gußzeit           time NOT NULL,
    Anlage_ID         int(11),
    Pfannen_Charge_ID int(11),
    PRIMARY KEY (Gußzeit),
    CONSTRAINT anlage_fk
        FOREIGN KEY (Anlage_ID)
            REFERENCES Anlage (Anlage_ID),
    CONSTRAINT pfannen_charge_fk
        FOREIGN KEY (Pfannen_Charge_ID)
            REFERENCES Pfannen_Charge (Pfannen_Charge_ID)
);

create table Pfanne
(
    Pfanne_ID          int(11) NOT NULL,
    Pfanne_Bezeichnung varchar(40),
    Pfanne_Inhalt      double,
    Wartungs_ID        int(11),
    PRIMARY KEY (Pfanne_ID),
    CONSTRAINT wartungs_fk
        FOREIGN KEY (Wartungs_ID)
            REFERENCES Wartungsplan (Wartungs_ID)
);

create table Pfannen_Charge
(
    Pfannen_Charge_ID int(11) NOT NULL,
    Pfanne_ID         int(11),
    Charge_ID         int(11),
    PRIMARY KEY (Pfannen_Charge_ID),
    CONSTRAINT pfanne_fk
        FOREIGN KEY (Pfanne_ID)
            REFERENCES Pfanne (Pfanne_ID),
    CONSTRAINT charge_fk
        FOREIGN KEY (Charge_ID)
            REFERENCES Charge (Charge_ID)
);

create table Charge
(
    Charge_ID               int(11) NOT NULL,
    Werksmarke_ID           int(11),
    Plandaten_ID            int(11),
    Schnittplan_ID          int(11),
    Erzeugungsvorschrift_ID int(11),
    PRIMARY KEY (Charge_ID),
    CONSTRAINT werksmarke_fk
        FOREIGN KEY (Werksmarke_ID)
            REFERENCES Werksmarke (Werksmarke_ID),
    CONSTRAINT plandaten_fk
        FOREIGN KEY (Plandaten_ID)
            REFERENCES Plandaten (Plandaten_ID),
    CONSTRAINT schnittplan_fk
        FOREIGN KEY (Schnittplan_ID)
            REFERENCES Schnittplan (Schnittplan_ID),
);

create table Anlage
(
    Anlage_ID                  int(11) NOT NULL,
    Verteiler_ID               int(11),
    Kokille_ID                 int(11),
    Anlage_Laenge              int(11),
    Strang_Anzahl              int(1),
    Zone_1_ID                  int(11),
    Zone_2_ID                  int(11),
    Zone_3_ID                  int(11),
    Zone_4_ID                  int(11),
    Gießgeschwindigkeit        double,
    spezifisches_Gewicht_Stahl double,
    Wartungs_ID                int(11),
    maximale_Chargenanzahl     int(11),
    aktuelle_Chargenanzahl     int(11),
    PRIMARY KEY (Anlage_ID),
    CONSTRAINT verteiler_fk
        FOREIGN KEY (Verteiler_ID)
            REFERENCES Verteiler (Verteiler_ID),
    CONSTRAINT kokille_fk
        FOREIGN KEY (Kokille_ID)
            REFERENCES Kokille (Kokille_ID),
    CONSTRAINT zone_1_fk
        FOREIGN KEY (Zone_1_ID)
            REFERENCES Zone_1 (Zone_1_ID),
    CONSTRAINT zone_1_fk
        FOREIGN KEY (Zone_2_ID)
            REFERENCES Zone_2 (Zone_2_ID),
    CONSTRAINT zone_1_fk
        FOREIGN KEY (Zone_3_ID)
            REFERENCES Zone_3 (Zone_3_ID),
    CONSTRAINT zone_1_fk
        FOREIGN KEY (Zone_4_ID)
            REFERENCES Zone_4 (Zone_4_ID)
);

create table Zone_1
(
    Zone_1_ID int(11) NOT NULL,
    Kühlung   boolean,
    PRIMARY KEY (Zone_1_ID)
);

create table Zone_2
(
    Zone_2_ID int(11) NOT NULL,
    Kühlung   boolean,
    PRIMARY KEY (Zone_2_ID)
);

create table Zone_3
(
    Zone_3_ID int(11) NOT NULL,
    Kühlung   boolean,
    PRIMARY KEY (Zone_3_ID)
);

create table Zone_4
(
    Zone_4_ID int(11) NOT NULL,
    Kühlung   boolean,
    PRIMARY KEY (Zone_4_ID)
);

create table Anlage_Straenge
(
    Anlage_ID int(11) NOT NULL,
    Strang_ID int(11) NOT NULL,
    PRIMARY KEY (Anlage_ID, Strang_ID),
    CONSTRAINT anlage_straenge_fk
        FOREIGN KEY (Anlage_ID)
            REFERENCES Anlage (Anlage_ID),
    CONSTRAINT straenge_anlage_fk
        FOREIGN KEY (Strang_ID)
            REFERENCES Strang (Strang_ID)
);

create table Strang
(
    Strang_ID int(11) NOT NULL,
    PRIMARY KEY (Strang_ID)
);

create table Verteiler
(
    Verteiler_ID     int(11) NOT NULL,
    Verteiler_Typ_ID int(11),
    Wartungs_ID      int(11),
    PRIMARY KEY (Verteiler_ID),
    CONSTRAINT veteiler_typ_fk
        FOREIGN KEY (Verteiler_Typ_ID)
            REFERENCES Verteiler_Typ (Verteiler_Typ_ID)
);

create table Verteiler_Typ
(
    Verteiler_Typ_ID      int(11) NOT NULL,
    Verteiler_Bezeichnung varchar(500),
    PRIMARY KEY (Verteiler_Typ_ID)
);

create table Kokille
(
    Kokille_ID     int(11) NOT NULL,
    Kokille_Typ_ID int(11),
    Wartungs_ID    int(11),
    PRIMARY KEY (Kokille_ID),
    CONSTRAINT kokille_typ_fk
        FOREIGN KEY (Kokille_Typ_ID)
            REFERENCES Kokille_Typ (Kokille_Typ_ID)
);

create table Kokille_Typ
(
    Kokille_Typ_ID      int(11) NOT NULL,
    Kokille_Bezeichnung varchar(500),
    Format_ID           int(11),
    PRIMARY KEY (Kokille_Typ_ID),
    CONSTRAINT format_fk
        FOREIGN KEY (Format_ID)
            REFERENCES Format (Format_ID)
);

create table Format
(
    Format_ID          int(11) NOT NULL,
    Format_Bezeichnung varchar(500),
    Breite             double,
    Dicke              double,
    PRIMARY KEY (Format_ID)
);

create table Produkt
(
    Produkt_ID,
    Produkt_Beschreibung,
    Abschnittzeitpunkt,
    Produkt_Laenge
)
