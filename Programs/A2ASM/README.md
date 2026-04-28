# A2 Konstanten, Variablen und Operationen auf Daten 

VariableA = 0xBEEF

Anw01 - LDR R0, =VariableA -> lädt in Register 0 
R2, R3 und Memory bleiben unverändert

Anw02 - LoadRegisterByte R2, [R0]  -> lädt 1 byte von R0 nach R2 (0x000000EF)

R0, R3, Memory bleiben unverändert

Anw03 - LDRB R3, [R0, #1] -> lädt 1 byte von R0 #1 nach R3
       in R0: 0xBEEF
       in R2: 0x00EF
       in R3: 0x00BE
    Memory: keine veränderung

Anw04 - LSL R2, #8 
        lsl = logischer linksshift !
        #8 = 8 bit    -> also wird R2 um 8 bit, also 1byte nach links verschoben, jetzt nicht mehr 0x00ef sondern 0xEF00. 
        REST BLEIBT UNVERÄNDERT

Anw05 - ORR R2, R3    ORR = Kombiniert die Werte von R2, R3 in R2
        
       R2 jetzt also 0xEFBE

    REST BLEIBT UNVERÄNDERT

Anw06  STRH R2, R[0]
        Speichert die unteren 16 bit als Halfword nach VariableA
        R0, R2, R3: unverändert
        Memory: 0x2000000c	be	ef	34	12	00	00	00	00	00	00	00	00	00	00	00	00
 wir sehen die umstellung zu BEEF

# Probleme 
Ich finde nicht heraus wo ich das lesen kann, wo ich 0xBEEF finde, die alten werte bleiben bei mir im memory bestehen. // NVM, ich habe vergessen GO zu drücken !!

Ohne zu wissen was die befehle eigentlich machen unmöglich

Die besonders einfach lösung bei 3. hat nicht geklappt 



