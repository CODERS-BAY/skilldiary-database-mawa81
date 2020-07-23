
Erzeugungsvorschrift_Produkt (**Text-Number** : int(11), ProduktID : varchar(32) )
Produkt( **ProduktID** : varchar(32), ProduktName : varchar(32), ProduktGruppeID : varchar(32) )
Produktgruppe( **ProduktGruppeID** : varchar(32) , ProduktGruppenName : varchar(32) )
Prozess ()

Erzeugungsvorschrift ( **Text-Number** : int(11), aktiv : boolean, Bereich : varchar(32), Unterbereich : varchar(32), Prozessparameter : varchar(32), Qualitätsparameter : varchar(32), DefaultwertEinheit : varchar(32), ObergrenzeEinheit : varchar(32), UntergrenzeEinheit : varchar(32), Messzeitpunkt : timestamp, Einheit : varchar(32), Quelle : varchar(32), Eingabeart : varchar(32) )


Stranggießanlage:

Stahlproduktion
Pfanne (Pfanneninhalt ca. 120 t)
Produktionseinheit (Charge)
Gießen erfolgt über Kokille über den Verteiler in Strängen (2 Strang / 4 Strang Anlagen)
Produkte (4-8m lange Stücke) werden am Ende der Anlage abgeschnitten


## Charge:

Werksmarke -> chemische Zusammensetzung einer Charge (z.B. Werksmarke X79 beinhaltet S 0.04%, Ph 0.008% ....)

Plandaten -> z.B. Gießgeschwindigkeit, Kühlwassermenge, Kokillenpulver ....)

Werkmarke und Plandaten gelten für eine Charge

Ausgenommen sind die Schnittlängen der Produkte

Es muss aber nicht für jede zu mögliche  Werksmarke eine Charge vorhanden sein. 


## Strang:

in Zonen eingeteilt
 
je nach Zone wird während des Gießens Wasser auf den  Strang gespritzt
  
Diese Zonen sind fix (für immer! Zone 1, Zone 2, Zone 3, Zone 4) für beide Anlagen) 


Infrastruktur:

Ort:             Persontyp:     Person:                         Schicht:    Bildschirm:

Büro                1           Betriebsingenieur               nein            ja  
                    2           Sekretärin                      nein            ja  
                    3           Arbeitsaufbereiter              nein            ja  
                    4           Metallurge                      nein            ja  
                    5           EDV Techniker                   nein            ja 
Hauptleitstand      6           Schichtmeister                  ja              ja  
                    7           Operator1 
                                (Schichtmeisterstellvertreter)  ja              ja  
                    8           Schichtarbeiter1                ja  
Schneideleitstand   7           Operator2                       ja              ja  
                    8           Schichtarbeiter2                ja  
Serviceraum         9           Elektriker                      nein   
                    10          Schlosser                       nein   
                    11          Helfer1                         ja  
Kran                12          Kranfahrer1                     ja  
 
In einer Anlage gibt es 2 Leitstände  
Hauptleitstand:   2 Personen     4 Bildschirme 
Schneideleitstand :   1 Personen     2 Bildschirme 
Beim Verteiler und Schneidemaschine        : 2 Schichtarbeiter 1x Kranfahrer 

select p.personal_id, p.personal_name, t.personal_typ_bezeichnung,  a.schichtplan_datum, a.schichtplan_typ_id from cc_personal p, 
cc_personal_schichtplan_akt a, cc_personal_typ t WHERE a.personal_id = p.personal_id  AND p.personal_typ = t.personal_typ_id order by t.personal_typ_bezeichnung 

Zur Vereinfachung der Berechnung der Schichten im Programm 12 Stunden Schicht 0-12Uhr und 12Uhr bis 24Uhr 


## Aggregate Anzeige

Aggregat ( maximale_Chargenanzahl, aktuelle_Chargenanzahl, Wartungsdatum)

Verteiler

Verteilertyp

Kokille (bestimmt Format)

Kokillentyp

Pfanne

Charge (Schnittplan, Erzeugungsvorschrift)



Format (Strang_Breite, Strang_Dicke)


Schnittplan - Charge 1:n


Gußplan (**Gußzeit**, *Anlage_ID*, *Pfannen_Chargen_ID* )
Personalplan (*Anlage_ID*, Gußzeit, Schicht )
Pfanne (**Pfanne_ID**, Pfanne_Bezeichnung, Pfanne_Inhalt, Wartungs_ID )
Pfannen_Chargen(**Pfannen_Chargen_ID**:int(11), *Pfanne_ID*:int(11), *Charge_ID*:int(11) )
    
Anlage (**Anlage_ID**, Strang_Anzahl, *Verteiler_ID*, *Kokille_ID*, Zone_1, Zone_2, Zone_3, Zone_4, Anlage_Laenge, Gießgeschwindigkeit, spezifisches_Gewicht_Stahl, Wartungs_ID, maximale_Chargenanzahl, aktuelle_Chargenanzahl )
Anlage_Straenge (**Anlage_ID**,**Strang_ID**)
Strang(**Strang_ID**, )
Strang_Abschnittszeitpunkte(Strang_ID:int(11), Abschnittszeitpunkt_ID:time)
Abschnittszeitpunkte (Abschnittszeitpunkte_ID time)

    ( Strang_Kühlung(**Kühl_ID**, Zone_1, Zone_2, Zone_3, Zone_4) )
Zone_1(**Zone1_ID** int(11), Kühlung boolean )
Zone_2(**Zone1_ID** int(11), Kühlung boolean )
Zone_3(**Zone1_ID** int(11), Kühlung boolean )
Zone_4(**Zone1_ID** int(11), Kühlung boolean )
Format (**Format_ID**, Strang_Breite, Strang_Dicke )
Verteiler (**Verteiler_ID**, *Verteiler_Typ_ID*, *Wartungs_ID*)
Verteilertyp (**Verteiler_Typ_ID**, *Verteiler_Bezeichnung*)
Kokille (**Kokille_ID**, *Kokille_Typ_ID*, *Wartungs_ID*)
Kokilletyp (**Kokille_Typ_ID**, Kokillen_Bezeichnung, *Format_ID*)
Produkt (**Produkt_ID**, Produkt_Beschreibung, Abschnittzeitpunkt, Produkt_Laenge)
Charge (**Charge_ID**, *Werksmarke_ID*, *Plandaten_ID*, *Schnittplan_ID*, *Erzeugungsvorschrift_ID*)
Werksmarke (**Werksmarke_ID**, Werksmarke_Beschreibung)
Werksmarke_Elemente (**Werksmarke_ID**, **Element_ID**, Anteil_min, Anteil_max)
Element (**Element_ID**, Element_Name, Element_Beschreibung)
Plandaten (**Plandaten_ID**, Gießgeschwindigkeit, Kühlwassermenge, Kokillenpulver)


Wartungsplan (**Wartungs_ID**, Wartungsdatum_geplant, Wartungsdatum_history)


Produkt( **Produkt_ID** : varchar(32), Produkt_Name : varchar(32), ProduktGruppeID : varchar(32), Abschnittzeitpunkt)
Produktgruppe( **Produktgruppe_ID** : varchar(32) , Produktgruppe_Name : varchar(32) )
Prozess (**Prozess_ID**: int(11), Text-Number : int(11), aktiv : boolean, Bereich : varchar(32), Unterbereich : varchar(32), Prozessparameter : varchar(32), Qualitätsparameter : varchar(32), DefaultwertEinheit : varchar(32), ObergrenzeEinheit : varchar(32), UntergrenzeEinheit : varchar(32), Messzeitpunkt : timestamp, Einheit : varchar(32), Quelle : varchar(32), Eingabeart : varchar(32) )
Prozess_Liste (**Erzeugungsvorschrift_ID**:int(11), **Prozess_ID**:int(11) )
Erzeugungsvorschrift (**Erzeugungsvorschrift_ID**:int(11), *Produktgruppe_ID* : int(11) )
Schnittplan (**Schnittplan_ID**, *Produktgruppe_ID*, Laenge)



cc_personal (personal_id, p.personal_name, personal_typ, Bildschirm)
cc_personal_typ (personal_typ_id, personal_typ_bezeichnung)
cc_personal_schichtplan_akt (schichtplan_datum, schichtplan_typ_id)

karriere@gepardtec.com