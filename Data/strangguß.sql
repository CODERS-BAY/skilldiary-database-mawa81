DROP DATABASE strangguß;
CREATE DATABASE strangguß;
USE strangguß;

create table Personalplan (
                    Anlage_ID int(11) NOT NULL,
                    Gußzeit time,
                    Schicht_ID int(11),
                    PRIMARY KEY (Anlage_ID)
                    CONSTRAINT gußzeit_fk
                        FOREIGN KEY (Gußzeit)
                    CONSTRAINT schicht_fk
                        FOREIGN KEY (Schicht_ID)
);

create table Gußplan (
                    Gußzeit time NOT NULL,
                    Anlage_ID int(11),
                    Pfanne_ID int(11),
                    Charge_ID int(11),
                    PRIMARY KEY (Gußzeit),
                    CONSTRAINT anlage_fk
                        FOREIGN KEY (Anlage_ID)
                        REFERENCES Anlage(Anlage_ID),
                    CONSTRAINT pfanne_fk
                        FOREIGN KEY (Pfanne_ID)
                        REFERENCES Pfanne(Pfanne_ID),
                    CONSTRAINT charge_fk
                        FOREIGN KEY (Charge_ID)
                        REFERENCES Charge(Charge_ID),
);

create table Pfanne (
                    Pfanne_ID int(11) NOT NULL,
                    Pfanne_Bezeichnung varchar(40),
                    Pfanne_Inhalt double,
                    Wartungs_ID date,
                    PRIMARY KEY (Pfanne_ID),
                    CONSTRAINT wartungs_fk
                        FOREIGN KEY (Wartungs_ID)
                        REFERENCES Wartungsplan(Wartungs_ID)
);

create table Anlage (
                    Anlage_ID int(11) NOT NULL,
                    Verteiler_ID int(11),
                    Kokille_ID int(11),
                    Anlage_Laenge int(11),
                    Strang_Anzahl int(1),
                    Gießgeschwindigkeit double
                    spezifisches_Gewicht_Stahl double,
                    Wartungs_ID date,
                    maximale_Chargenanzahl int(11),
                    aktuelle_Chargenanzahl int(11),
                    PRIMARY KEY (Anlage_ID),
                    CONSTRAINT verteiler_fk
                        FOREIGN KEY (Verteiler_ID)
                        REFERENCES Verteiler(Verteiler_ID),
                    CONSTRAINT kokille_fk
                        FOREIGN KEY (Kokille_ID)
                        REFERENCES Kokille(Kokille_ID)
);

create table Anlage_Straenge (
                    Anlage_ID int(11) NOT NULL,
                    Strang_ID int(11) NOT NULL,
                    PRIMARY KEY (Anlage_ID, Strang_ID),
                    CONSTRAINT anlage_straenge_fk
                        FOREIGN KEY (Anlage_ID)
                        REFERENCES Anlage(Anlage_ID),
                    CONSTRAINT straenge_anlage_fk
                        FOREIGN KEY (Strang_ID)
                        REFERENCES Strang(Strang_ID)
);

create table Strang(
                    Strang_ID int(11) NOT NULL,
                    Zone_1 boolean,
                    Zone_2 boolean,
                    Zone_3 boolean,
                    Zone_4 boolean,
                    PRIMARY KEY (Strang_ID)
);
