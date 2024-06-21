      ****************************************************************** 
      * Gestion des statitistiques de Boboniort                        *
      *    Programme précédent: Menu des fonctionnalités annexes       *
      *                         (menudata.cbl)                         *
      *    Programme suivant : Menu des fonctionnalités annexes        *
      *                         (menudata.cbl)                         *
      *    Le menu affiche les statistiques et un bouton Retour        *                   *
      * Auteur: Isabelle                                               *     
      * Date de création : le 19/06/2024                               * 
      ****************************************************************** 
       IDENTIFICATION DIVISION.
       PROGRAM-ID. stfront RECURSIVE.
       AUTHOR. Isabelle.      
      ******************************************************************
       DATA DIVISION.
       WORKING-STORAGE SECTION. 
       01  SC-RETURN           PIC X(01)   VALUE SPACE . 

      * zones d'affichage des calculs pour les statistiques du client
       01  SC-STAT-REGION-CUSTOMER.
      * tableau répartition géographique  
           05 SC-STAT-REG01           PIC ZZ9     VALUE ZERO.
           05 SC-STAT-REG02           PIC ZZ9     VALUE ZERO.
           05 SC-STAT-REG03           PIC ZZ9     VALUE ZERO.
           05 SC-STAT-REG04           PIC ZZ9     VALUE ZERO.
           05 SC-STAT-REG05           PIC ZZ9     VALUE ZERO.
           05 SC-STAT-REG06           PIC ZZ9     VALUE ZERO.
           05 SC-STAT-REG07           PIC ZZ9     VALUE ZERO.
           05 SC-STAT-REG08           PIC ZZ9     VALUE ZERO.
           05 SC-STAT-REG09           PIC ZZ9     VALUE ZERO.
           05 SC-STAT-REG10           PIC ZZ9     VALUE ZERO.
           05 SC-STAT-REG11           PIC ZZ9     VALUE ZERO.
           05 SC-STAT-REG12           PIC ZZ9     VALUE ZERO.
           05 SC-STAT-REG13           PIC ZZ9     VALUE ZERO.
           05 SC-STAT-REG14           PIC ZZ9     VALUE ZERO.
      * tableau répartition par age et genre         
       01  SC-STAT-AGE-CUSTOMER.
           05 SC-STAT-HOMME.   
              10 SC-H-TOT-POURCENT    PIC ZZ9.99  VALUE ZERO.
              10 SC-H-TOT-NB          PIC ZZ9     VALUE ZERO.
              10 SC-H-30-NB           PIC ZZ9     VALUE ZERO.
              10 SC-H-30-39-NB        PIC ZZ9     VALUE ZERO.
              10 SC-H-40-49-NB        PIC ZZ9     VALUE ZERO.
              10 SC-H-50-59-NB        PIC ZZ9     VALUE ZERO.
              10 SC-H-60-69-NB        PIC ZZ9     VALUE ZERO.
              10 SC-H-70-NB           PIC ZZ9     VALUE ZERO.  
           05 SC-STAT-FEMME.   
              10 SC-F-TOT-POURCENT    PIC ZZ9.99  VALUE ZERO.
              10 SC-F-TOT-NB          PIC ZZ9     VALUE ZERO.
              10 SC-F-30-NB           PIC ZZ9     VALUE ZERO.
              10 SC-F-30-39-NB        PIC ZZ9     VALUE ZERO.
              10 SC-F-40-49-NB        PIC ZZ9     VALUE ZERO.
              10 SC-F-50-59-NB        PIC ZZ9     VALUE ZERO.
              10 SC-F-60-69-NB        PIC ZZ9     VALUE ZERO.
              10 SC-F-70-NB           PIC ZZ9     VALUE ZERO. 
           05 SC-STAT-AUTRE.   
              10 SC-X-TOT-POURCENT    PIC ZZ9.99  VALUE ZERO.
              10 SC-X-TOT-NB          PIC ZZ9     VALUE ZERO.
              10 SC-X-30-NB           PIC ZZ9     VALUE ZERO.
              10 SC-X-30-39-NB        PIC ZZ9     VALUE ZERO.
              10 SC-X-40-49-NB        PIC ZZ9     VALUE ZERO.
              10 SC-X-50-59-NB        PIC ZZ9     VALUE ZERO.
              10 SC-X-60-69-NB        PIC ZZ9     VALUE ZERO.
              10 SC-X-70-NB           PIC ZZ9     VALUE ZERO.
           05 SC-STAT-TOT.   
              10 SC-TOT-NB            PIC ZZ9     VALUE ZERO.
              10 SC-TOT-30-NB         PIC ZZ9.99  VALUE ZERO.
              10 SC-TOT-30-39-NB      PIC ZZ9.99  VALUE ZERO.
              10 SC-TOT-40-49-NB      PIC ZZ9.99  VALUE ZERO.
              10 SC-TOT-50-59-NB      PIC ZZ9.99  VALUE ZERO.
              10 SC-TOT-60-69-NB      PIC ZZ9.99  VALUE ZERO.
              10 SC-TOT-70-NB         PIC ZZ9.99  VALUE ZERO.  
      * tableau taux d'activité par genre et statut marital
       01  SC-STAT-ACTIVITY-CUSTOMER.
           05 SC-ACT-COUPLE.   
              10 SC-ACT-C-HOMME       PIC ZZ9.99  VALUE ZERO.
              10 SC-ACT-C-FEMME       PIC ZZ9.99  VALUE ZERO.
              10 SC-ACT-C-AUTRE       PIC ZZ9.99  VALUE ZERO.
           05 SC-ACT-SINGLE.   
              10 SC-ACT-S-HOMME       PIC ZZ9.99  VALUE ZERO.
              10 SC-ACT-S-FEMME       PIC ZZ9.99  VALUE ZERO.
              10 SC-ACT-S-AUTRE       PIC ZZ9.99  VALUE ZERO.   
      
      * zones d'affichage des calculs pour les statistiques d'activité
       01 SC-STAT-MEDICAL.
              10 SC-STAT-MED-TOT         PIC ZZZ9.99 VALUE ZERO.
              10 SC-STAT-MED-POURCENT    PIC Z9.99   VALUE ZERO.
              10 SC-STAT-MED-MOYEN       PIC ZZZ9.99 VALUE ZERO.
              10 SC-MED-30-POURCENT      PIC Z9.99   VALUE ZERO.
              10 SC-MED-30-39-POURCENT   PIC Z9.99   VALUE ZERO.
              10 SC-MED-40-49-POURCENT   PIC Z9.99   VALUE ZERO.
              10 SC-MED-50-59-POURCENT   PIC Z9.99   VALUE ZERO.
              10 SC-MED-60-69-POURCENT   PIC Z9.99   VALUE ZERO.
              10 SC-MED-70-POURCENT      PIC Z9.99   VALUE ZERO.
       01 SC-STAT-PARAMEDICAL.
              10 SC-STAT-PAR-TOT         PIC ZZZ9.99 VALUE ZERO.
              10 SC-STAT-PAR-POURCENT    PIC Z9.99   VALUE ZERO.
              10 SC-STAT-PAR-MOYEN       PIC ZZZ9.99 VALUE ZERO.
              10 SC-PAR-30-POURCENT      PIC Z9.99   VALUE ZERO.
              10 SC-PAR-30-39-POURCENT   PIC Z9,99   VALUE ZERO.
              10 SC-PAR-40-49-POURCENT   PIC Z9,99   VALUE ZERO.
              10 SC-PAR-50-59-POURCENT   PIC Z9,99   VALUE ZERO.
              10 SC-PAR-60-69-POURCENT   PIC Z9,99   VALUE ZERO.
              10 SC-PAR-70-POURCENT      PIC Z9,99   VALUE ZERO.     
       01 SC-STAT-HOSPITAL.
              10 SC-STAT-HOS-TOT         PIC ZZZ9,99 VALUE ZERO.
              10 SC-STAT-HOS-POURCENT    PIC Z9,99   VALUE ZERO.
              10 SC-STAT-HOS-MOYEN       PIC ZZZ9,99 VALUE ZERO.
              10 SC-HOS-30-POURCENT      PIC Z9,99   VALUE ZERO.
              10 SC-HOS-30-39-POURCENT   PIC Z9,99   VALUE ZERO.
              10 SC-HOS-40-49-POURCENT   PIC Z9,99   VALUE ZERO.
              10 SC-HOS-50-59-POURCENT   PIC Z9,99   VALUE ZERO.
              10 SC-HOS-60-69-POURCENT   PIC Z9,99   VALUE ZERO.
              10 SC-HOS-70-POURCENT      PIC Z9,99   VALUE ZERO. 
       01 SC-STAT-SINGLE-GLASSE.
              10 SC-STAT-SGL-TOT         PIC ZZZ9,99 VALUE ZERO.
              10 SC-STAT-SGL-POURCENT    PIC Z9,99   VALUE ZERO.
              10 SC-STAT-SGL-MOYEN       PIC ZZZ9,99 VALUE ZERO.
              10 SC-SGL-30-POURCENT      PIC Z9,99   VALUE ZERO.
              10 SC-SGL-30-39-POURCENT   PIC Z9,99   VALUE ZERO.
              10 SC-SGL-40-49-POURCENT   PIC Z9,99   VALUE ZERO.
              10 SC-SGL-50-59-POURCENT   PIC Z9,99   VALUE ZERO.
              10 SC-SGL-60-69-POURCENT   PIC Z9,99   VALUE ZERO.
              10 SC-SGL-70-POURCENT      PIC Z9,99   VALUE ZERO. 
       01 SC-STAT-PROGRESSIVE-GLASSE.
              10 SC-STAT-PGL-TOT         PIC ZZZ9,99 VALUE ZERO.
              10 SC-STAT-PGL-POURCENT    PIC Z9,99   VALUE ZERO.
              10 SC-STAT-PGL-MOYEN       PIC ZZZ9,99 VALUE ZERO.
              10 SC-PGL-30-POURCENT      PIC Z9,99   VALUE ZERO.
              10 SC-PGL-30-39-POURCENT   PIC Z9,99   VALUE ZERO.
              10 SC-PGL-40-49-POURCENT   PIC Z9,99   VALUE ZERO.
              10 SC-PGL-50-59-POURCENT   PIC Z9,99   VALUE ZERO.
              10 SC-PGL-60-69-POURCENT   PIC Z9,99   VALUE ZERO.
              10 SC-PGL-70-POURCENT      PIC Z9,99   VALUE ZERO. 
       01 SC-STAT-MOLARE-CROWN.
              10 SC-STAT-MOL-TOT         PIC ZZZ9,99 VALUE ZERO.
              10 SC-STAT-MOL-POURCENT    PIC Z9,99   VALUE ZERO.
              10 SC-STAT-MOL-MOYEN       PIC ZZZ9,99 VALUE ZERO.
              10 SC-MOL-30-POURCENT      PIC Z9,99   VALUE ZERO.
              10 SC-MOL-30-39-POURCENT   PIC Z9,99   VALUE ZERO.
              10 SC-MOL-40-49-POURCENT   PIC Z9,99   VALUE ZERO.
              10 SC-MOL-50-59-POURCENT   PIC Z9,99   VALUE ZERO.
              10 SC-MOL-60-69-POURCENT   PIC Z9,99   VALUE ZERO.
              10 SC-MOL-70-POURCENT      PIC Z9,99   VALUE ZERO. 
       01 SC-STAT-NON-MOLARE-CROWN.
              10 SC-STAT-NMOL-TOT        PIC ZZZ9,99 VALUE ZERO.
              10 SC-STAT-NMOL-POURCENT   PIC Z9,99   VALUE ZERO.
              10 SC-STAT-NMOL-MOYEN      PIC ZZZ9,99 VALUE ZERO.
              10 SC-NMOL-30-POURCENT     PIC Z9,99   VALUE ZERO.
              10 SC-NMOL-30-39-POURCENT  PIC Z9,99   VALUE ZERO.
              10 SC-NMOL-40-49-POURCENT  PIC Z9,99   VALUE ZERO.
              10 SC-NMOL-50-59-POURCENT  PIC Z9,99   VALUE ZERO.
              10 SC-NMOL-60-69-POURCENT  PIC Z9,99   VALUE ZERO.
              10 SC-NMOL-70-POURCENT     PIC Z9,99   VALUE ZERO. 
       01 SC-STAT-DESCALING.
              10 SC-STAT-DES-TOT         PIC ZZZ9,99 VALUE ZERO.
              10 SC-STAT-DES-POURCENT    PIC Z9,99   VALUE ZERO.
              10 SC-STAT-DES-MOYEN       PIC ZZZ9,99 VALUE ZERO.
              10 SC-DES-30-POURCENT      PIC Z9,99   VALUE ZERO.
              10 SC-DES-30-39-POURCENT   PIC Z9,99   VALUE ZERO.
              10 SC-DES-40-49-POURCENT   PIC Z9,99   VALUE ZERO.
              10 SC-DES-50-59-POURCENT   PIC Z9,99   VALUE ZERO.
              10 SC-DES-60-69-POURCENT   PIC Z9,99   VALUE ZERO.
              10 SC-DES-70-POURCENT      PIC Z9,99   VALUE ZERO.  

      * Tables de travail pour gérer les pourcentages
       01  TAB-ACTIVITY.
           05 WS-TAB-H-COUPLE-ACT1       PIC 9(03)   VALUE ZERO.
           05 WS-TAB-H-COUPLE-ACT0       PIC 9(03)   VALUE ZERO. 
           05 WS-TAB-H-SINGLE-ACT1       PIC 9(03)   VALUE ZERO.
           05 WS-TAB-H-SINGLE-ACT0       PIC 9(03)   VALUE ZERO.
           05 WS-TAB-F-COUPLE-ACT1       PIC 9(03)   VALUE ZERO.
           05 WS-TAB-F-COUPLE-ACT0       PIC 9(03)   VALUE ZERO. 
           05 WS-TAB-F-SINGLE-ACT1       PIC 9(03)   VALUE ZERO.
           05 WS-TAB-F-SINGLE-ACT0       PIC 9(03)   VALUE ZERO. 
           05 WS-TAB-X-COUPLE-ACT1       PIC 9(03)   VALUE ZERO.
           05 WS-TAB-X-COUPLE-ACT0       PIC 9(03)   VALUE ZERO. 
           05 WS-TAB-X-SINGLE-ACT1       PIC 9(03)   VALUE ZERO.
           05 WS-TAB-X-SINGLE-ACT0       PIC 9(03)   VALUE ZERO.                
       
       01  WS-H-TOT                      PIC 9(03)   VALUE ZERO.
       01  WS-F-TOT                      PIC 9(03)   VALUE ZERO.
       01  WS-X-TOT                      PIC 9(03)   VALUE ZERO.
       01  WS-AGE-30                     PIC 9(03)   VALUE ZERO.
       01  WS-AGE-TOT-30                 PIC 9(03)   VALUE ZERO.
       01  WS-AGE-TOT-30-39              PIC 9(03)   VALUE ZERO.
       01  WS-AGE-TOT-40-49              PIC 9(03)   VALUE ZERO.  
       01  WS-AGE-TOT-50-59              PIC 9(03)   VALUE ZERO.
       01  WS-AGE-TOT-60-69              PIC 9(03)   VALUE ZERO. 
       01  WS-AGE-TOT-70                 PIC 9(03)   VALUE ZERO.                   
       01  WS-AGE-70                     PIC 9(03)   VALUE ZERO.
       01  WS-ACT1                       PIC 9(03)   VALUE ZERO.
       01  WS-ACT0                       PIC 9(03)   VALUE ZERO.
       01  WS-TOTAL                      PIC 9(06)   VALUE ZERO.
       01  WS-POURCENT                   PIC 999V99  VALUE ZERO.
       01  H-DONE                        PIC 9(01)   VALUE ZERO.
       01  F-DONE                        PIC 9(01)   VALUE ZERO.
       01  WS-ZERO                       PIC 9(01)   VALUE ZERO.
       01  NB-REC                        PIC 9(02)   VALUE ZERO.
      ******************************************************************
      * Déclaration des variables correspondant à sql 
       01  WS-SQL-LIB                 PIC X(80)                  .  
       01  FIN                        PIC S9(9)      VALUE 100   .
OCESQL*EXEC SQL BEGIN DECLARE SECTION END-EXEC             .
      * paramètres pour connexion à la base 
       01  DBNAME                     PIC X(11)   VALUE'boboniortdb'.
       01  USERNAME                   PIC X(05)   VALUE 'cobol'  .
       01  PASSWD                     PIC X(05)   VALUE 'cbl85'  .
      * 01  PASSWD                           VALUE 'cbl85'  .


      * Variables pour les curseurs
       01  SQL-CURS-REGION.
           05 SQL-REG-NUM             PIC 9(01)   VALUE 0        .
           05 SQL-REG-NB-CUST         PIC 9(03)   VALUE 0        . 

       01  SQL-CURS-ACTIVITY.
           05 SQL-ACT-GENDER          PIC X(10)   VALUE SPACE    .
           05 SQL-ACT-COUPLE          PIC 9(01)   VALUE 0        . 
           05 SQL-ACT-ACTIVE          PIC X(01)   VALUE '0'      .          
           05 SQL-ACT-NB-CUST         PIC 9(03)   VALUE 0        .

       01  SQL-CURS-AGE.
           05 SQL-AGE-GENRE           PIC X(10)   VALUE SPACE    .
           05 SQL-AGE-AGE             PIC 9(03)   VALUE 0        .           
           05 SQL-AGE-NB-CUST         PIC 9(03)   VALUE 0        .  

OCESQL*EXEC SQL END DECLARE SECTION END-EXEC               . 
OCESQL*EXEC SQL INCLUDE SQLCA END-EXEC                     .                                                                  
OCESQL     copy "sqlca.cbl".
      ******************************************************************
OCESQL*
OCESQL 01  SQ0001.
OCESQL     02  FILLER PIC X(014) VALUE "DISCONNECT ALL".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
OCESQL 01  SQ0002.
OCESQL     02  FILLER PIC X(240) VALUE "SELECT r.REGION_NUM, COUNT(c.U"
OCESQL  &  "UID_CUSTOMER) AS NB_CUSTOMER FROM BOBO_REGION r JOIN CUSTO"
OCESQL  &  "MER c ON SUBSTRING(c.CUSTOMER_ZIPCODE FROM 1 FOR 2) = r.RE"
OCESQL  &  "GION_CODEDEP WHERE c.CUSTOMER_ACTIVE IN ('1', '0') GROUP B"
OCESQL  &  "Y r.REGION_NUM ORDER BY r.REGION_NUM".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
OCESQL 01  SQ0003.
OCESQL     02  FILLER PIC X(256) VALUE "SELECT CUSTOMER_GENDER, CASE W"
OCESQL  &  "HEN CUSTOMER_COUPLE = True THEN 1 ELSE 0 END AS COUPLE, CU"
OCESQL  &  "STOMER_ACTIVE, COUNT(UUID_CUSTOMER) AS NB_CUSTOMER FROM CU"
OCESQL  &  "STOMER WHERE CUSTOMER_ACTIVE IN ('1', '0') GROUP BY CUSTOM"
OCESQL  &  "ER_GENDER, COUPLE, CUSTOMER_ACTIVE ORDER BY CUSTOMER".
OCESQL     02  FILLER PIC X(046) VALUE "_GENDER DESC, COUPLE ASC, CUST"
OCESQL  &  "OMER_ACTIVE DESC".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
OCESQL 01  SQ0004.
OCESQL     02  FILLER PIC X(247) VALUE "SELECT CUSTOMER_GENDER, FLOOR("
OCESQL  &  "EXTRACT(YEAR FROM AGE(CUSTOMER_BIRTH_DATE)) / 10) * 10 AS "
OCESQL  &  "AGE, COUNT(UUID_CUSTOMER) AS NB_CUSTOMER FROM CUSTOMER WHE"
OCESQL  &  "RE CUSTOMER_ACTIVE IN ('0', '1') GROUP BY CUSTOMER_GENDER,"
OCESQL  &  " AGE ORDER BY CUSTOMER_GENDER DESC, AGE ASC".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
       SCREEN SECTION.      
       COPY 'screen-stat-data.cpy'.   

      ******************************************************************
       PROCEDURE DIVISION.      
       0000-START-MAIN.
           PERFORM 1000-PREPARE-DISPLAY-SCREEN-START 
                    THRU END-1000-PREPARE-DISPLAY-SCREEN.
           PERFORM 1100-DISPLAY-SCREEN-START 
                    THRU END-1100-DISPLAY-SCREEN.
       END-0000-MAIN.
           STOP RUN.

       1000-PREPARE-DISPLAY-SCREEN-START.
           PERFORM 1010-INITIALIZE-SCREEN-START
           THRU END-1010-INITIALIZE-SCREEN. 
           PERFORM 2000-SQL-CONNECTION-START
                 THRU END-2000-SQL-CONNECTION.
           PERFORM 1300-PREPARE-TABLE-REGION-START
                 THRU END-1300-PREPARE-TABLE-REGION.
           PERFORM 1310-PREPARE-TAUX-ACTIVITE-START
                 THRU END-1310-PREPARE-TAUX-ACTIVITE.
           PERFORM 1320-PREPARE-TABLE-AGE-START
                 THRU END-1320-PREPARE-TABLE-AGE.                                            
           PERFORM 2100-SQL-DISCONNECTION-START
                 THRU END-2100-SQL-DISCONNECTION.              
       END-1000-PREPARE-DISPLAY-SCREEN.
           EXIT.

      ******************************************************************
      *Pour une meilleur ergonomie j'initialise les variables de l'écran
      *    Le tableau du bas n'est pas géré car chargé en dur
      ******************************************************************
       1010-INITIALIZE-SCREEN-START.
           INITIALIZE SC-RETURN.
           MOVE WS-ZERO TO SC-STAT-REG01      .
           MOVE WS-ZERO TO SC-STAT-REG02      .
           MOVE WS-ZERO TO SC-STAT-REG03      .
           MOVE WS-ZERO TO SC-STAT-REG04      .
           MOVE WS-ZERO TO SC-STAT-REG05      .
           MOVE WS-ZERO TO SC-STAT-REG06      .
           MOVE WS-ZERO TO SC-STAT-REG07      .
           MOVE WS-ZERO TO SC-STAT-REG08      .
           MOVE WS-ZERO TO SC-STAT-REG09      .
           MOVE WS-ZERO TO SC-STAT-REG10      .
           MOVE WS-ZERO TO SC-STAT-REG11      .
           MOVE WS-ZERO TO SC-STAT-REG12      .
           MOVE WS-ZERO TO SC-STAT-REG13      .
           MOVE WS-ZERO TO SC-STAT-REG14      .   
           MOVE WS-ZERO TO SC-H-TOT-POURCENT  .
           MOVE WS-ZERO TO SC-H-TOT-NB        .
           MOVE WS-ZERO TO SC-H-30-NB         .
           MOVE WS-ZERO TO SC-H-30-39-NB      .
           MOVE WS-ZERO TO SC-H-40-49-NB      .
           MOVE WS-ZERO TO SC-H-50-59-NB      .
           MOVE WS-ZERO TO SC-H-60-69-NB      .
           MOVE WS-ZERO TO SC-H-70-NB         .     
           MOVE WS-ZERO TO SC-F-TOT-POURCENT  .
           MOVE WS-ZERO TO SC-F-TOT-NB        .
           MOVE WS-ZERO TO SC-F-30-NB         .
           MOVE WS-ZERO TO SC-F-30-39-NB      .
           MOVE WS-ZERO TO SC-F-40-49-NB      .
           MOVE WS-ZERO TO SC-F-50-59-NB      .
           MOVE WS-ZERO TO SC-F-60-69-NB      .
           MOVE WS-ZERO TO SC-F-70-NB         .    
           MOVE WS-ZERO TO SC-X-TOT-POURCENT  .
           MOVE WS-ZERO TO SC-X-TOT-NB        .
           MOVE WS-ZERO TO SC-X-30-NB         .
           MOVE WS-ZERO TO SC-X-30-39-NB      .
           MOVE WS-ZERO TO SC-X-40-49-NB      .
           MOVE WS-ZERO TO SC-X-50-59-NB      .
           MOVE WS-ZERO TO SC-X-60-69-NB      .
           MOVE WS-ZERO TO SC-X-70-NB         . 
           MOVE WS-ZERO TO SC-TOT-NB          .
           MOVE WS-ZERO TO SC-TOT-30-NB       .
           MOVE WS-ZERO TO SC-TOT-30-39-NB    .
           MOVE WS-ZERO TO SC-TOT-40-49-NB    .
           MOVE WS-ZERO TO SC-TOT-50-59-NB    .
           MOVE WS-ZERO TO SC-TOT-60-69-NB    .
           MOVE WS-ZERO TO SC-TOT-70-NB       .     
           MOVE WS-ZERO TO SC-ACT-C-HOMME     .
           MOVE WS-ZERO TO SC-ACT-C-FEMME     .
           MOVE WS-ZERO TO SC-ACT-C-AUTRE     .
           MOVE WS-ZERO TO SC-ACT-S-HOMME     .
           MOVE WS-ZERO TO SC-ACT-S-FEMME     .
           MOVE WS-ZERO TO SC-ACT-S-AUTRE     .              
       END-1010-INITIALIZE-SCREEN. 
           EXIT.
      ******************************************************************      
      *    SK- Boucle d'affichage de la gestion du menu en cas d'erreur   
      *    de saisie de l'utilisateur   
      ******************************************************************
       1100-DISPLAY-SCREEN-START. 
           PERFORM UNTIL FUNCTION UPPER-CASE(SC-RETURN) EQUAL 'O'              
              ACCEPT STAT-DATA-SCREEN 
           END-PERFORM. 
           PERFORM 1200-CHECK-CHOICE-START 
                    THRU END-1200-CHECK-CHOICE.        
       END-1100-DISPLAY-SCREEN.
           EXIT.    

       1200-CHECK-CHOICE-START.  
           IF FUNCTION UPPER-CASE(SC-RETURN) EQUAL 'O' THEN               
                 CALL 'menudata'       
            END-IF.          
       END-1200-CHECK-CHOICE.
           EXIT.   

       1300-PREPARE-TABLE-REGION-START.
      *    Préparation et chargement de la répartition géographique
           PERFORM 2200-SQL-CRS-GEO-REPART-START
                 THRU END-2200-SQL-CRS-GEO-REPART.     
       END-1300-PREPARE-TABLE-REGION. 
           EXIT.
       1310-PREPARE-TAUX-ACTIVITE-START.
      *    Préparation et chargement du taux d'activité
           PERFORM 2210-SQL-CRS-ACTIVITY-START
                 THRU END-2210-SQL-CRS-ACTIVITY.     
       END-1310-PREPARE-TAUX-ACTIVITE. 
           EXIT. 
       1320-PREPARE-TABLE-AGE-START.
      *    Préparation et chargement de la répartition par age et genre
           PERFORM 2220-SQL-CRS-AGE-REPART-START
                 THRU END-2220-SQL-CRS-AGE-REPART.     
       END-1320-PREPARE-TABLE-AGE. 
           EXIT.
           
       1400-CHARGE-REGION-SCREEN-START. 
           EVALUATE (SQL-REG-NUM)
              WHEN 1 
                MOVE SQL-REG-NB-CUST TO SC-STAT-REG01
              WHEN 2 
                MOVE SQL-REG-NB-CUST TO SC-STAT-REG02
              WHEN 3 
                MOVE SQL-REG-NB-CUST TO SC-STAT-REG03 
              WHEN 4 
                MOVE SQL-REG-NB-CUST TO SC-STAT-REG04
              WHEN 5 
                MOVE SQL-REG-NB-CUST TO SC-STAT-REG05
              WHEN 6 
                MOVE SQL-REG-NB-CUST TO SC-STAT-REG06                                                                  
              WHEN 7 
                MOVE SQL-REG-NB-CUST TO SC-STAT-REG07
              WHEN 8 
                MOVE SQL-REG-NB-CUST TO SC-STAT-REG08
              WHEN 9 
                MOVE SQL-REG-NB-CUST TO SC-STAT-REG09
              WHEN 10 
                MOVE SQL-REG-NB-CUST TO SC-STAT-REG10
              WHEN 11 
                MOVE SQL-REG-NB-CUST TO SC-STAT-REG11
              WHEN 12 
                MOVE SQL-REG-NB-CUST TO SC-STAT-REG12
              WHEN 13 
                MOVE SQL-REG-NB-CUST TO SC-STAT-REG13
              WHEN 14 
                MOVE SQL-REG-NB-CUST TO SC-STAT-REG14                                                                                                                 
           END-EVALUATE.
       END-1400-CHARGE-REGION-SCREEN.
           EXIT.  

       1410-CHARGE-ACTIVITY-START. 
           EVALUATE (FUNCTION UPPER-CASE(FUNCTION TRIM(SQL-ACT-GENDER)))
              WHEN 'HOMME'
                 EVALUATE (SQL-ACT-COUPLE)
                    WHEN 1 
                       IF SQL-ACT-ACTIVE = '1' THEN                    
                          SET WS-TAB-H-COUPLE-ACT1 TO SQL-ACT-NB-CUST
                       ELSE     
                          SET WS-TAB-H-COUPLE-ACT0 TO SQL-ACT-NB-CUST
                       END-IF                       
                    WHEN OTHER
                       IF SQL-ACT-ACTIVE = '1' THEN
                          SET WS-TAB-H-SINGLE-ACT1 TO SQL-ACT-NB-CUST
                       ELSE
                          SET WS-TAB-H-SINGLE-ACT0 TO SQL-ACT-NB-CUST
                       END-IF
                 END-EVALUATE                       
              WHEN 'FEMME'
                EVALUATE (SQL-ACT-COUPLE)
                    WHEN 1 
                       IF SQL-ACT-ACTIVE = '1' THEN                    
                          SET WS-TAB-F-COUPLE-ACT1 TO SQL-ACT-NB-CUST
                       ELSE     
                          SET WS-TAB-F-COUPLE-ACT0 TO SQL-ACT-NB-CUST
                       END-IF                       
                    WHEN OTHER
                       IF SQL-ACT-ACTIVE = '1' THEN
                          SET WS-TAB-F-SINGLE-ACT1 TO SQL-ACT-NB-CUST
                       ELSE
                          SET WS-TAB-F-SINGLE-ACT0 TO SQL-ACT-NB-CUST
                       END-IF
                 END-EVALUATE               
              WHEN 'AUTRE'
                EVALUATE (SQL-ACT-COUPLE)
                    WHEN 1 
                       IF SQL-ACT-ACTIVE = '1' THEN                    
                          SET WS-TAB-X-COUPLE-ACT1 TO SQL-ACT-NB-CUST
                       ELSE     
                          SET WS-TAB-X-COUPLE-ACT0 TO SQL-ACT-NB-CUST
                       END-IF                       
                    WHEN OTHER
                       IF SQL-ACT-ACTIVE = '1' THEN
                          SET WS-TAB-X-SINGLE-ACT1 TO SQL-ACT-NB-CUST
                       ELSE
                          SET WS-TAB-X-SINGLE-ACT0 TO SQL-ACT-NB-CUST
                       END-IF
                 END-EVALUATE               
           END-EVALUATE.
       END-1410-CHARGE-ACTIVITY.
           EXIT. 

       1415-CHARGE-POURCENT-ACTIVITY-START. 
           INITIALIZE WS-ACT1 WS-ACT0.
           MOVE WS-TAB-H-COUPLE-ACT1 TO WS-ACT1.
           MOVE WS-TAB-H-COUPLE-ACT0 TO WS-ACT0.           
           PERFORM 1416-CALCUL-POURCENT-START 
                       THRU END-1416-CALCUL-POURCENT.
           MOVE WS-POURCENT TO SC-ACT-C-HOMME.

           INITIALIZE WS-ACT1 WS-ACT0.
           MOVE WS-TAB-H-SINGLE-ACT1 TO WS-ACT1.
           MOVE WS-TAB-H-SINGLE-ACT0 TO WS-ACT0.
           PERFORM 1416-CALCUL-POURCENT-START 
                       THRU END-1416-CALCUL-POURCENT.
           MOVE WS-POURCENT TO SC-ACT-S-HOMME.     

           INITIALIZE WS-ACT1 WS-ACT0.
           MOVE WS-TAB-F-COUPLE-ACT1 TO WS-ACT1.
           MOVE WS-TAB-F-COUPLE-ACT0 TO WS-ACT0.
           PERFORM 1416-CALCUL-POURCENT-START 
                       THRU END-1416-CALCUL-POURCENT.
           MOVE WS-POURCENT TO SC-ACT-C-FEMME.   

           INITIALIZE WS-ACT1 WS-ACT0.
           MOVE WS-TAB-F-SINGLE-ACT1 TO WS-ACT1.
           MOVE WS-TAB-F-SINGLE-ACT0 TO WS-ACT0.
           PERFORM 1416-CALCUL-POURCENT-START 
                       THRU END-1416-CALCUL-POURCENT.
           MOVE WS-POURCENT TO SC-ACT-S-FEMME.     

           INITIALIZE WS-ACT1 WS-ACT0.
           MOVE WS-TAB-X-COUPLE-ACT1 TO WS-ACT1.
           MOVE WS-TAB-X-COUPLE-ACT0 TO WS-ACT0.
           PERFORM 1416-CALCUL-POURCENT-START 
                       THRU END-1416-CALCUL-POURCENT.
           MOVE WS-POURCENT TO SC-ACT-C-AUTRE.              

           INITIALIZE WS-ACT1 WS-ACT0.
           MOVE WS-TAB-X-SINGLE-ACT1 TO WS-ACT1.
           MOVE WS-TAB-X-SINGLE-ACT0 TO WS-ACT0.
           PERFORM 1416-CALCUL-POURCENT-START 
                       THRU END-1416-CALCUL-POURCENT.
           MOVE WS-POURCENT TO SC-ACT-S-AUTRE.
           INITIALIZE WS-POURCENT WS-TOTAL.     
       END-1415-CHARGE-POURCENT-ACTIVITY.
           EXIT.     
               
       1416-CALCUL-POURCENT-START. 
           INITIALIZE WS-TOTAL WS-POURCENT.
           ADD WS-ACT1 TO WS-ACT0
           GIVING   WS-TOTAL.
           IF WS-TOTAL > 0 THEN
              COMPUTE WS-POURCENT ROUNDED = (WS-ACT1 / WS-TOTAL ) * 100                                                           
           END-IF.          
       END-1416-CALCUL-POURCENT.
           EXIT.    
       1420-CHARGE-AGE-START.
           IF (FUNCTION UPPER-CASE(SQL-AGE-GENRE) = 'HOMME') THEN 
              EVALUATE (SQL-AGE-AGE)
      *    Inférieur à 30 ans cumul des informations              
                 WHEN 10
                    ADD SQL-AGE-NB-CUST TO WS-AGE-30 GIVING WS-AGE-30
                    ADD SQL-AGE-NB-CUST TO WS-AGE-TOT-30 
                    GIVING WS-AGE-TOT-30
                    ADD SQL-AGE-NB-CUST TO WS-H-TOT
                    GIVING WS-H-TOT
                    ADD SQL-AGE-NB-CUST TO WS-TOTAL                     
                    GIVING WS-TOTAL                                        
                 WHEN 20
                    ADD SQL-AGE-NB-CUST TO WS-AGE-30 GIVING WS-AGE-30
                    ADD SQL-AGE-NB-CUST TO WS-AGE-TOT-30 
                    GIVING WS-AGE-TOT-30
                    ADD SQL-AGE-NB-CUST TO WS-H-TOT
                    GIVING WS-H-TOT
                    ADD SQL-AGE-NB-CUST TO WS-TOTAL                     
                    GIVING WS-TOTAL 
      *    30-39 ans                                  
                 WHEN 30 
                    MOVE SQL-AGE-NB-CUST TO SC-H-30-39-NB
                    ADD SQL-AGE-NB-CUST TO WS-AGE-TOT-30-39 
                    GIVING WS-AGE-TOT-30-39
                    ADD SQL-AGE-NB-CUST TO WS-H-TOT
                    GIVING WS-H-TOT
                    ADD SQL-AGE-NB-CUST TO WS-TOTAL                     
                    GIVING WS-TOTAL                     
      *    30-39 ans           
                 WHEN 40
                    MOVE SQL-AGE-NB-CUST TO SC-H-40-49-NB
                    ADD SQL-AGE-NB-CUST TO WS-AGE-TOT-40-49 
                    GIVING WS-AGE-TOT-40-49
                    ADD SQL-AGE-NB-CUST TO WS-H-TOT
                    GIVING WS-H-TOT
                    ADD SQL-AGE-NB-CUST TO WS-TOTAL                     
                    GIVING WS-TOTAL                                      
      *    30-39 ans            
                 WHEN 50 
                    MOVE SQL-AGE-NB-CUST TO SC-H-50-59-NB
                    ADD SQL-AGE-NB-CUST TO WS-AGE-TOT-50-59 
                    GIVING WS-AGE-TOT-50-59
                    ADD SQL-AGE-NB-CUST TO WS-H-TOT
                    GIVING WS-H-TOT
                    ADD SQL-AGE-NB-CUST TO WS-TOTAL                     
                    GIVING WS-TOTAL                      
      *    30-39 ans           
                 WHEN 60 
                    MOVE SQL-AGE-NB-CUST TO SC-H-60-69-NB
                    ADD SQL-AGE-NB-CUST TO WS-AGE-TOT-60-69 
                    GIVING WS-AGE-TOT-60-69 
                    ADD SQL-AGE-NB-CUST TO WS-H-TOT
                    GIVING WS-H-TOT
                    ADD SQL-AGE-NB-CUST TO WS-TOTAL                     
                    GIVING WS-TOTAL                                      
      *    70 ans et + cumul des informations
                 WHEN 70 
                    ADD SQL-AGE-NB-CUST TO WS-AGE-70 GIVING WS-AGE-70
                    ADD SQL-AGE-NB-CUST TO WS-AGE-TOT-70 
                    GIVING WS-AGE-TOT-70
                    ADD SQL-AGE-NB-CUST TO WS-H-TOT
                    GIVING WS-H-TOT
                    ADD SQL-AGE-NB-CUST TO WS-TOTAL                     
                    GIVING WS-TOTAL                                       
                 WHEN  OTHER
                    ADD SQL-AGE-NB-CUST TO WS-AGE-70 GIVING WS-AGE-70
                    ADD SQL-AGE-NB-CUST TO WS-AGE-TOT-70 
                    GIVING WS-AGE-TOT-70
                    ADD SQL-AGE-NB-CUST TO WS-H-TOT
                    GIVING WS-H-TOT
                    ADD SQL-AGE-NB-CUST TO WS-TOTAL                     
                    GIVING WS-TOTAL                                       
              END-EVALUATE
           ELSE 
              IF (FUNCTION UPPER-CASE(SQL-AGE-GENRE) = 'FEMME') THEN
      *    Je finis de charger les hommes et initialize les compteurs
                 IF H-DONE = 0 THEN
                    MOVE WS-AGE-30 TO SC-H-30-NB
                    MOVE WS-AGE-70 TO SC-H-70-NB
                    INITIALIZE WS-AGE-30 WS-AGE-70
                    SET H-DONE TO 1
                 END-IF                                
                 EVALUATE (SQL-AGE-AGE)
      *    Inférieur à 30 ans cumul des informations              
                    WHEN 10
                       ADD SQL-AGE-NB-CUST TO WS-AGE-30 GIVING WS-AGE-30
                       ADD SQL-AGE-NB-CUST TO WS-AGE-TOT-30 
                       GIVING WS-AGE-TOT-30
                       ADD SQL-AGE-NB-CUST TO WS-F-TOT
                       GIVING WS-F-TOT
                       ADD SQL-AGE-NB-CUST TO WS-TOTAL                     
                       GIVING WS-TOTAL                                            
                    WHEN 20
                       ADD SQL-AGE-NB-CUST TO WS-AGE-30 GIVING WS-AGE-30
                       ADD SQL-AGE-NB-CUST TO WS-AGE-TOT-30 
                       GIVING WS-AGE-TOT-30
                       ADD SQL-AGE-NB-CUST TO WS-F-TOT
                       GIVING WS-F-TOT
                       ADD SQL-AGE-NB-CUST TO WS-TOTAL                     
                       GIVING WS-TOTAL                       
      *    30-39 ans                                  
                    WHEN 30 
                       MOVE SQL-AGE-NB-CUST TO SC-F-30-39-NB
                       ADD SQL-AGE-NB-CUST TO WS-AGE-TOT-30-39 
                       GIVING WS-AGE-TOT-30-39
                       ADD SQL-AGE-NB-CUST TO WS-F-TOT
                       GIVING WS-F-TOT
                       ADD SQL-AGE-NB-CUST TO WS-TOTAL                     
                       GIVING WS-TOTAL                       
      *    30-39 ans           
                    WHEN 40
                       MOVE SQL-AGE-NB-CUST TO SC-F-40-49-NB
                       ADD SQL-AGE-NB-CUST TO WS-AGE-TOT-40-49 
                       GIVING WS-AGE-TOT-40-49
                       ADD SQL-AGE-NB-CUST TO WS-F-TOT
                       GIVING WS-F-TOT
                       ADD SQL-AGE-NB-CUST TO WS-TOTAL                     
                       GIVING WS-TOTAL                                        
      *    30-39 ans            
                    WHEN 50 
                       MOVE SQL-AGE-NB-CUST TO SC-F-50-59-NB
                       ADD SQL-AGE-NB-CUST TO WS-AGE-TOT-50-59 
                       GIVING WS-AGE-TOT-50-59
                       ADD SQL-AGE-NB-CUST TO WS-F-TOT
                       GIVING WS-F-TOT
                       ADD SQL-AGE-NB-CUST TO WS-TOTAL                     
                       GIVING WS-TOTAL                        
      *    30-39 ans           
                    WHEN 60 
                       MOVE SQL-AGE-NB-CUST TO SC-F-60-69-NB
                       ADD SQL-AGE-NB-CUST TO WS-AGE-TOT-60-69 
                       GIVING WS-AGE-TOT-60-69
                       ADD SQL-AGE-NB-CUST TO WS-F-TOT
                       GIVING WS-F-TOT
                       ADD SQL-AGE-NB-CUST TO WS-TOTAL                     
                       GIVING WS-TOTAL                                         
      *    70 ans et + cumul des informations
                    WHEN 70 
                       ADD SQL-AGE-NB-CUST TO WS-AGE-70 GIVING WS-AGE-70
                       ADD SQL-AGE-NB-CUST TO WS-AGE-TOT-70 
                       GIVING WS-AGE-TOT-70
                       ADD SQL-AGE-NB-CUST TO WS-F-TOT
                       GIVING WS-F-TOT
                       ADD SQL-AGE-NB-CUST TO WS-TOTAL                     
                       GIVING WS-TOTAL                                         
                    WHEN  OTHER
                       ADD SQL-AGE-NB-CUST TO WS-AGE-70 GIVING WS-AGE-70
                       ADD SQL-AGE-NB-CUST TO WS-AGE-TOT-70 
                       GIVING WS-AGE-TOT-70
                       ADD SQL-AGE-NB-CUST TO WS-F-TOT
                       GIVING WS-F-TOT
                       ADD SQL-AGE-NB-CUST TO WS-TOTAL                     
                       GIVING WS-TOTAL                                         
              END-EVALUATE
              ELSE
      *    Je finis de charger les femmes et initialize les compteurs
                 IF F-DONE = 0 THEN
                    MOVE WS-AGE-30 TO SC-F-30-NB
                    MOVE WS-AGE-70 TO SC-F-70-NB
                    INITIALIZE WS-AGE-30 WS-AGE-70
                    SET F-DONE TO 1
                 END-IF                      
                 EVALUATE (SQL-AGE-AGE)
      *    Inférieur à 30 ans cumul des informations              
                    WHEN 10
                       ADD SQL-AGE-NB-CUST TO WS-AGE-30 GIVING WS-AGE-30
                       ADD SQL-AGE-NB-CUST TO WS-AGE-TOT-30 
                       GIVING WS-AGE-TOT-30
                       ADD SQL-AGE-NB-CUST TO WS-X-TOT
                       GIVING WS-X-TOT
                       ADD SQL-AGE-NB-CUST TO WS-TOTAL                     
                       GIVING WS-TOTAL                                           
                    WHEN 20
                       ADD SQL-AGE-NB-CUST TO WS-AGE-30 GIVING WS-AGE-30
                       ADD SQL-AGE-NB-CUST TO WS-AGE-TOT-30 
                       GIVING WS-AGE-TOT-30
                       ADD SQL-AGE-NB-CUST TO WS-X-TOT
                       GIVING WS-X-TOT
                       ADD SQL-AGE-NB-CUST TO WS-TOTAL                     
                       GIVING WS-TOTAL                       
      *    30-39 ans                                  
                    WHEN 30 
                       MOVE SQL-AGE-NB-CUST TO SC-F-30-39-NB
                       ADD SQL-AGE-NB-CUST TO WS-AGE-TOT-30-39 
                       GIVING WS-AGE-TOT-30-39
                       ADD SQL-AGE-NB-CUST TO WS-X-TOT
                       GIVING WS-X-TOT
                       ADD SQL-AGE-NB-CUST TO WS-TOTAL                     
                       GIVING WS-TOTAL                       
      *    30-39 ans           
                    WHEN 40
                       MOVE SQL-AGE-NB-CUST TO SC-F-40-49-NB
                       ADD SQL-AGE-NB-CUST TO WS-AGE-TOT-40-49 
                       GIVING WS-AGE-TOT-40-49
                       ADD SQL-AGE-NB-CUST TO WS-X-TOT
                       GIVING WS-X-TOT
                       ADD SQL-AGE-NB-CUST TO WS-TOTAL                     
                       GIVING WS-TOTAL                                        
      *    30-39 ans            
                    WHEN 50 
                       MOVE SQL-AGE-NB-CUST TO SC-F-50-59-NB
                       ADD SQL-AGE-NB-CUST TO WS-AGE-TOT-50-59 
                       GIVING WS-AGE-TOT-50-59 
                       ADD SQL-AGE-NB-CUST TO WS-X-TOT
                       GIVING WS-X-TOT
                       ADD SQL-AGE-NB-CUST TO WS-TOTAL                     
                       GIVING WS-TOTAL                       
      *    30-39 ans           
                    WHEN 60 
                       MOVE SQL-AGE-NB-CUST TO SC-F-60-69-NB
                       ADD SQL-AGE-NB-CUST TO WS-AGE-TOT-60-69 
                       GIVING WS-AGE-TOT-60-69 
                       ADD SQL-AGE-NB-CUST TO WS-X-TOT
                       GIVING WS-X-TOT
                       ADD SQL-AGE-NB-CUST TO WS-TOTAL                     
                       GIVING WS-TOTAL                                        
      *    70 ans et + cumul des informations
                    WHEN 70 
                       ADD SQL-AGE-NB-CUST TO WS-AGE-70 GIVING WS-AGE-70
                       ADD SQL-AGE-NB-CUST TO WS-AGE-TOT-70 
                       GIVING WS-AGE-TOT-70
                       ADD SQL-AGE-NB-CUST TO WS-X-TOT
                       GIVING WS-X-TOT
                       ADD SQL-AGE-NB-CUST TO WS-TOTAL                     
                       GIVING WS-TOTAL                                         
                    WHEN  OTHER
                       ADD SQL-AGE-NB-CUST TO WS-AGE-70 GIVING WS-AGE-70
                       ADD SQL-AGE-NB-CUST TO WS-AGE-TOT-70 
                       GIVING WS-AGE-TOT-70
                       ADD SQL-AGE-NB-CUST TO WS-X-TOT
                       GIVING WS-X-TOT
                       ADD SQL-AGE-NB-CUST TO WS-TOTAL                     
                       GIVING WS-TOTAL                                         
                 END-EVALUATE                    
              END-IF                   
           END-IF.                                   
       END-1420-CHARGE-AGE.
           EXIT.

       1425-CHARGE-TOT-AGE-START. 
      *    Je finis de charger les "autre" 
           MOVE WS-AGE-30 TO SC-F-30-NB.
           MOVE WS-AGE-70 TO SC-F-70-NB.
           
      *    Je charge les totaux et initialize les compteurs
      *     MOVE WS-AGE-TOT-30      TO SC-TOT-30-NB.
      *     MOVE WS-AGE-TOT-30-39   TO SC-TOT-30-39-NB.
      *     MOVE WS-AGE-TOT-40-49   TO SC-TOT-40-49-NB.
      *     MOVE WS-AGE-TOT-50-59   TO SC-TOT-50-59-NB.
      *     MOVE WS-AGE-TOT-60-69   TO SC-TOT-60-69-NB.
      *     MOVE WS-AGE-TOT-70      TO SC-TOT-70-NB.

      *    Pourcentages par age
           INITIALIZE WS-ACT1. 
           SET WS-ACT1 TO WS-AGE-TOT-30.
           PERFORM  1426-CALCUL-POURCENT-TOT-START
                       THRU END-1426-CALCUL-POURCENT-TOT .
           MOVE WS-POURCENT TO SC-TOT-30-NB.
           INITIALIZE WS-ACT1. 
           SET WS-ACT1 TO WS-AGE-TOT-30-39.
           PERFORM  1426-CALCUL-POURCENT-TOT-START
                       THRU END-1426-CALCUL-POURCENT-TOT .
           MOVE WS-POURCENT TO SC-TOT-30-39-NB.
           INITIALIZE WS-ACT1. 
           SET WS-ACT1 TO WS-AGE-TOT-40-49.
           PERFORM  1426-CALCUL-POURCENT-TOT-START
                       THRU END-1426-CALCUL-POURCENT-TOT .
           MOVE WS-POURCENT TO SC-TOT-40-49-NB.
           INITIALIZE WS-ACT1. 
           SET WS-ACT1 TO WS-AGE-TOT-50-59.
           PERFORM  1426-CALCUL-POURCENT-TOT-START
                       THRU END-1426-CALCUL-POURCENT-TOT .
           MOVE WS-POURCENT TO SC-TOT-50-59-NB.
           INITIALIZE WS-ACT1. 
           SET WS-ACT1 TO WS-AGE-TOT-60-69.
           PERFORM  1426-CALCUL-POURCENT-TOT-START
                       THRU END-1426-CALCUL-POURCENT-TOT .
           MOVE WS-POURCENT TO SC-TOT-60-69-NB.
           INITIALIZE WS-ACT1. 
           SET WS-ACT1 TO WS-AGE-TOT-70.
           PERFORM  1426-CALCUL-POURCENT-TOT-START
                       THRU END-1426-CALCUL-POURCENT-TOT .
           MOVE WS-POURCENT TO SC-TOT-70-NB.

           MOVE WS-TOTAL           TO SC-TOT-NB.
           MOVE WS-H-TOT           TO SC-H-TOT-NB.
           MOVE WS-F-TOT           TO SC-F-TOT-NB.
           MOVE WS-X-TOT           TO SC-X-TOT-NB.

           INITIALIZE WS-ACT1. 
           SET WS-ACT1 TO WS-H-TOT.
           PERFORM  1426-CALCUL-POURCENT-TOT-START
                       THRU END-1426-CALCUL-POURCENT-TOT .
           MOVE WS-POURCENT TO SC-H-TOT-POURCENT.          
           INITIALIZE WS-ACT1. 
           SET WS-ACT1 TO WS-F-TOT.
           PERFORM  1426-CALCUL-POURCENT-TOT-START
                       THRU END-1426-CALCUL-POURCENT-TOT .
           MOVE WS-POURCENT TO SC-F-TOT-POURCENT.         
           INITIALIZE WS-ACT1. 
           SET WS-ACT1 TO WS-X-TOT.
           PERFORM  1426-CALCUL-POURCENT-TOT-START
                       THRU END-1426-CALCUL-POURCENT-TOT .
           MOVE WS-POURCENT TO SC-X-TOT-POURCENT.        

           INITIALIZE  WS-AGE-30 WS-AGE-70 WS-AGE-TOT-30
                       WS-AGE-TOT-30-39 WS-AGE-TOT-40-49
                       WS-AGE-TOT-50-59 WS-AGE-TOT-60-69
                       WS-H-TOT WS-F-TOT WS-X-TOT
                       WS-POURCENT WS-TOTAL WS-ACT1.
       END-1425-CHARGE-TOT-AGE.
           EXIT.

       1426-CALCUL-POURCENT-TOT-START. 
           INITIALIZE WS-POURCENT.
           IF WS-TOTAL > 0 THEN
              COMPUTE WS-POURCENT ROUNDED = (WS-ACT1 / WS-TOTAL ) * 100                                                           
           ELSE
              SET WS-POURCENT TO 0
           END-IF.          
       END-1426-CALCUL-POURCENT-TOT.
           EXIT.      
      ******************************************************************       
      *    Paragraphes liés à SQL 
       2000-SQL-CONNECTION-START.
OCESQL*    EXEC SQL 
OCESQL*       CONNECT :USERNAME IDENTIFIED BY :PASSWD USING :DBNAME 
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLConnect" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE USERNAME
OCESQL          BY VALUE 5
OCESQL          BY REFERENCE PASSWD
OCESQL          BY VALUE 5
OCESQL          BY REFERENCE DBNAME
OCESQL          BY VALUE 11
OCESQL     END-CALL.
           IF  SQLCODE NOT = ZERO 
               MOVE 'CONNECTION BASE' TO WS-SQL-LIB
               PERFORM 9020-SQL-ERROR-START
                   THRU END-9020-SQL-ERROR
           END-IF.       
       END-2000-SQL-CONNECTION.
           EXIT.
       2100-SQL-DISCONNECTION-START.
OCESQL*    EXEC SQL DISCONNECT ALL END-EXEC.
OCESQL     CALL "OCESQLDisconnect" USING
OCESQL          BY REFERENCE SQLCA
OCESQL     END-CALL.
           IF  SQLCODE NOT = ZERO 
              MOVE 'DISCONNECTION BASE' TO WS-SQL-LIB 
              PERFORM 9020-SQL-ERROR-START
                   THRU END-9020-SQL-ERROR
           END-IF.          
       END-2100-SQL-DISCONNECTION.
           EXIT.

       2200-SQL-CRS-GEO-REPART-START.
OCESQL*    EXEC SQL 
OCESQL*       DECLARE CRSREGION CURSOR FOR
OCESQL*          SELECT r.REGION_NUM, 
OCESQL*                   COUNT(c.UUID_CUSTOMER) AS NB_CUSTOMER
OCESQL*          FROM BOBO_REGION r JOIN CUSTOMER c
OCESQL*          ON SUBSTRING(c.CUSTOMER_ZIPCODE FROM 1 FOR 2) 
OCESQL*                = r.REGION_CODEDEP
OCESQL*          WHERE c.CUSTOMER_ACTIVE IN ('1','0')       
OCESQL*          GROUP BY r.REGION_NUM
OCESQL*          ORDER BY r.REGION_NUM     
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLCursorDeclare" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "stfront_CRSREGION" & x"00"
OCESQL          BY REFERENCE SQ0002
OCESQL     END-CALL.
           IF  SQLCODE NOT = ZERO 
              MOVE 'DECLARATION CRS-REGION' TO WS-SQL-LIB 
              PERFORM 9020-SQL-ERROR-START
                   THRU END-9020-SQL-ERROR
           END-IF.   
OCESQL*    EXEC SQL
OCESQL*       OPEN CRSREGION
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLCursorOpen" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "stfront_CRSREGION" & x"00"
OCESQL     END-CALL.
           IF  SQLCODE NOT = ZERO 
              MOVE 'OUVERTURE CRS-REGION' TO WS-SQL-LIB 
              PERFORM 9020-SQL-ERROR-START
                   THRU END-9020-SQL-ERROR
           END-IF.

           PERFORM 2300-CRS-REGION-READ-START 
                THRU END-2300-CRS-REGION-READ.
           
OCESQL*    EXEC SQL
OCESQL*       CLOSE CRSREGION
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLCursorClose"  USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "stfront_CRSREGION" & x"00"
OCESQL     END-CALL
OCESQL    .
           IF  SQLCODE NOT = ZERO 
              MOVE 'FERMETURE CRS-REGION' TO WS-SQL-LIB 
              PERFORM 9020-SQL-ERROR-START
                   THRU END-9020-SQL-ERROR
           END-IF.       
       END-2200-SQL-CRS-GEO-REPART.
           EXIT.
       2210-SQL-CRS-ACTIVITY-START.
OCESQL*    EXEC SQL 
OCESQL*       DECLARE CRSACTIVITY CURSOR FOR
OCESQL*            SELECT CUSTOMER_GENDER, 
OCESQL*             CASE WHEN CUSTOMER_COUPLE = True THEN 1 ELSE 0 END 
OCESQL*             AS COUPLE, 
OCESQL*                   CUSTOMER_ACTIVE, 
OCESQL*                   COUNT(UUID_CUSTOMER) AS NB_CUSTOMER
OCESQL*            FROM CUSTOMER 
OCESQL*            WHERE     CUSTOMER_ACTIVE IN ('1', '0') 
OCESQL*            GROUP BY  CUSTOMER_GENDER, COUPLE, 
OCESQL*                      CUSTOMER_ACTIVE
OCESQL*            ORDER BY  CUSTOMER_GENDER DESC, COUPLE ASC, 
OCESQL*                      CUSTOMER_ACTIVE DESC     
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLCursorDeclare" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "stfront_CRSACTIVITY" & x"00"
OCESQL          BY REFERENCE SQ0003
OCESQL     END-CALL.
           IF  SQLCODE NOT = ZERO 
              MOVE 'DECLARATION CRS-ACTIVITY' TO WS-SQL-LIB 
              PERFORM 9020-SQL-ERROR-START
                   THRU END-9020-SQL-ERROR
           END-IF.   
OCESQL*    EXEC SQL
OCESQL*       OPEN CRSACTIVITY
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLCursorOpen" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "stfront_CRSACTIVITY" & x"00"
OCESQL     END-CALL.
           IF  SQLCODE NOT = ZERO 
              MOVE 'OUVERTURE CRS-ACTIVITY' TO WS-SQL-LIB 
              PERFORM 9020-SQL-ERROR-START
                   THRU END-9020-SQL-ERROR
           END-IF.

           PERFORM 2310-CRS-ACTIVITY-READ-START 
                 THRU END-2310-CRS-ACTIVITY-READ.
           
OCESQL*    EXEC SQL
OCESQL*       CLOSE CRSACTIVITY
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLCursorClose"  USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "stfront_CRSACTIVITY" & x"00"
OCESQL     END-CALL
OCESQL    .
           IF  SQLCODE NOT = ZERO 
              MOVE 'FERMETURE CRS-ACTIVITY' TO WS-SQL-LIB 
              PERFORM 9020-SQL-ERROR-START
                   THRU END-9020-SQL-ERROR
           END-IF.        
       END-2210-SQL-CRS-ACTIVITY.
           EXIT.
       
       2220-SQL-CRS-AGE-REPART-START.
OCESQL*   EXEC SQL 
OCESQL*       DECLARE CRSAGE CURSOR FOR
OCESQL*          SELECT CUSTOMER_GENDER, 
OCESQL*                FLOOR(EXTRACT(YEAR FROM AGE(CUSTOMER_BIRTH_DATE))
OCESQL*                 / 10) * 10 AS AGE,
OCESQL*                COUNT(UUID_CUSTOMER) AS NB_CUSTOMER
OCESQL*          FROM CUSTOMER 
OCESQL*          WHERE CUSTOMER_ACTIVE  IN ('0', '1')
OCESQL*          GROUP BY CUSTOMER_GENDER, AGE
OCESQL*          ORDER BY CUSTOMER_GENDER DESC, AGE ASC   
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLCursorDeclare" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "stfront_CRSAGE" & x"00"
OCESQL          BY REFERENCE SQ0004
OCESQL     END-CALL.
           IF  SQLCODE NOT = ZERO 
              MOVE 'DECLARATION CRS-AGE' TO WS-SQL-LIB 
              PERFORM 9020-SQL-ERROR-START
                   THRU END-9020-SQL-ERROR
           END-IF.   
OCESQL*    EXEC SQL
OCESQL*       OPEN CRSAGE
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLCursorOpen" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "stfront_CRSAGE" & x"00"
OCESQL     END-CALL.
           IF  SQLCODE NOT = ZERO 
              MOVE 'OUVERTURE CRS-AGE' TO WS-SQL-LIB 
              PERFORM 9020-SQL-ERROR-START
                   THRU END-9020-SQL-ERROR
           END-IF.

           PERFORM 2320-CRS-AGE-READ-START 
                 THRU END-2320-CRS-AGE-READ.
           
OCESQL*    EXEC SQL
OCESQL*       CLOSE CRSAGE
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLCursorClose"  USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "stfront_CRSAGE" & x"00"
OCESQL     END-CALL
OCESQL    .
           IF  SQLCODE NOT = ZERO 
              MOVE 'FERMETURE CRS-AGE' TO WS-SQL-LIB 
              PERFORM 9020-SQL-ERROR-START
                   THRU END-9020-SQL-ERROR
           END-IF.        
       END-2220-SQL-CRS-AGE-REPART.      
           EXIT.

       2300-CRS-REGION-READ-START. 
OCESQL*    EXEC SQL 
OCESQL*       FETCH CRSREGION 
OCESQL*       INTO 
OCESQL*       :SQL-REG-NUM,:SQL-REG-NB-CUST    
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 1
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-REG-NUM
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-REG-NB-CUST
OCESQL     END-CALL
OCESQL     CALL "OCESQLCursorFetchOne" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "stfront_CRSREGION" & x"00"
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL.
           IF  (SQLCODE NOT = ZERO) AND (SQLCODE NOT = FIN) THEN
              MOVE 'LECTURE CRS-REGION' TO WS-SQL-LIB 
              PERFORM 9020-SQL-ERROR-START
                   THRU END-9020-SQL-ERROR
           END-IF.
      *  nb enregs = 8 ==> 8 fetch au total
      *     PERFORM UNTIL SQLCODE = FIN 
           PERFORM 1400-CHARGE-REGION-SCREEN-START 
                THRU END-1400-CHARGE-REGION-SCREEN.
OCESQL*    EXEC SQL 
OCESQL*             FETCH CRSREGION 
OCESQL*             INTO 
OCESQL*             :SQL-REG-NUM,:SQL-REG-NB-CUST     
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 1
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-REG-NUM
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-REG-NB-CUST
OCESQL     END-CALL
OCESQL     CALL "OCESQLCursorFetchOne" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "stfront_CRSREGION" & x"00"
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL.
           IF  (SQLCODE NOT = ZERO) AND (SQLCODE NOT = FIN) THEN
                    MOVE 'LECTURE CRS-REGION' TO WS-SQL-LIB 
                    PERFORM 9020-SQL-ERROR-START
                    THRU END-9020-SQL-ERROR
           END-IF.   
           PERFORM 1400-CHARGE-REGION-SCREEN-START 
                THRU END-1400-CHARGE-REGION-SCREEN.
OCESQL*    EXEC SQL 
OCESQL*             FETCH CRSREGION 
OCESQL*             INTO 
OCESQL*             :SQL-REG-NUM,:SQL-REG-NB-CUST     
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 1
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-REG-NUM
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-REG-NB-CUST
OCESQL     END-CALL
OCESQL     CALL "OCESQLCursorFetchOne" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "stfront_CRSREGION" & x"00"
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL.
           IF  (SQLCODE NOT = ZERO) AND (SQLCODE NOT = FIN) THEN
                    MOVE 'LECTURE CRS-REGION' TO WS-SQL-LIB 
                    PERFORM 9020-SQL-ERROR-START
                    THRU END-9020-SQL-ERROR
           END-IF.   
           PERFORM 1400-CHARGE-REGION-SCREEN-START 
               THRU END-1400-CHARGE-REGION-SCREEN.
OCESQL*    EXEC SQL 
OCESQL*             FETCH CRSREGION 
OCESQL*             INTO 
OCESQL*             :SQL-REG-NUM,:SQL-REG-NB-CUST     
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 1
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-REG-NUM
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-REG-NB-CUST
OCESQL     END-CALL
OCESQL     CALL "OCESQLCursorFetchOne" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "stfront_CRSREGION" & x"00"
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL.
           IF  (SQLCODE NOT = ZERO) AND (SQLCODE NOT = FIN) THEN
                    MOVE 'LECTURE CRS-REGION' TO WS-SQL-LIB 
                    PERFORM 9020-SQL-ERROR-START
                    THRU END-9020-SQL-ERROR
           END-IF.   
           PERFORM 1400-CHARGE-REGION-SCREEN-START 
                THRU END-1400-CHARGE-REGION-SCREEN.
      *     EXEC SQL 
      *              FETCH CRSREGION 
      *              INTO 
      *              :SQL-REG-NUM,:SQL-REG-NB-CUST     
      *     END-EXEC.
      *     IF  (SQLCODE NOT = ZERO) AND (SQLCODE NOT = FIN) THEN
      *              MOVE 'LECTURE CRS-REGION' TO WS-SQL-LIB 
      *              PERFORM 9020-SQL-ERROR-START
      *              THRU END-9020-SQL-ERROR
      *     END-IF.   
      *     PERFORM 1400-CHARGE-REGION-SCREEN-START 
      *          THRU END-1400-CHARGE-REGION-SCREEN.
      *     EXEC SQL 
      *              FETCH CRSREGION 
      *              INTO 
      *              :SQL-REG-NUM,:SQL-REG-NB-CUST     
      *     END-EXEC.
      *     IF  (SQLCODE NOT = ZERO) AND (SQLCODE NOT = FIN) THEN
      *              MOVE 'LECTURE CRS-REGION' TO WS-SQL-LIB 
      *              PERFORM 9020-SQL-ERROR-START
      *              THRU END-9020-SQL-ERROR
      *     END-IF.   
      *     PERFORM 1400-CHARGE-REGION-SCREEN-START 
      *          THRU END-1400-CHARGE-REGION-SCREEN.
      *     EXEC SQL 
      *              FETCH CRSREGION 
      *              INTO 
      *              :SQL-REG-NUM,:SQL-REG-NB-CUST     
      *     END-EXEC.
      *     IF  (SQLCODE NOT = ZERO) AND (SQLCODE NOT = FIN) THEN
      *              MOVE 'LECTURE CRS-REGION' TO WS-SQL-LIB 
      *              PERFORM 9020-SQL-ERROR-START
      *              THRU END-9020-SQL-ERROR
      *     END-IF.   
      *     PERFORM 1400-CHARGE-REGION-SCREEN-START 
      *          THRU END-1400-CHARGE-REGION-SCREEN.
      *     EXEC SQL 
      *              FETCH CRSREGION 
      *              INTO 
      *              :SQL-REG-NUM,:SQL-REG-NB-CUST     
      *     END-EXEC.
      *     IF  (SQLCODE NOT = ZERO) AND (SQLCODE NOT = FIN) THEN
      *              MOVE 'LECTURE CRS-REGION' TO WS-SQL-LIB 
      *              PERFORM 9020-SQL-ERROR-START
      *              THRU END-9020-SQL-ERROR
      *     END-IF.                                                                     
      *     END-PERFORM. 
       END-2300-CRS-REGION-READ.
           EXIT.

       2310-CRS-ACTIVITY-READ-START. 
OCESQL*    EXEC SQL 
OCESQL*       FETCH CRSACTIVITY 
OCESQL*       INTO 
OCESQL*             :SQL-ACT-GENDER,:SQL-ACT-COUPLE,
OCESQL*             :SQL-ACT-ACTIVE,:SQL-ACT-NB-CUST    
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-ACT-GENDER
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 1
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-ACT-COUPLE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 1
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-ACT-ACTIVE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-ACT-NB-CUST
OCESQL     END-CALL
OCESQL     CALL "OCESQLCursorFetchOne" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "stfront_CRSACTIVITY" & x"00"
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL.
           IF  (SQLCODE NOT = ZERO) AND (SQLCODE NOT = FIN) THEN
              MOVE 'LECTURE CRS-ACTIVITY' TO WS-SQL-LIB 
              PERFORM 9020-SQL-ERROR-START
                   THRU END-9020-SQL-ERROR
           END-IF.

           PERFORM UNTIL SQLCODE = FIN 
              PERFORM 1410-CHARGE-ACTIVITY-START 
                       THRU END-1410-CHARGE-ACTIVITY
OCESQL*       EXEC SQL 
OCESQL*             FETCH CRSACTIVITY
OCESQL*             INTO 
OCESQL*                :SQL-ACT-GENDER,:SQL-ACT-COUPLE,
OCESQL*                :SQL-ACT-ACTIVE,:SQL-ACT-NB-CUST     
OCESQL*       END-EXEC
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-ACT-GENDER
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 1
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-ACT-COUPLE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 1
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-ACT-ACTIVE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-ACT-NB-CUST
OCESQL     END-CALL
OCESQL     CALL "OCESQLCursorFetchOne" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "stfront_CRSACTIVITY" & x"00"
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL
              IF  (SQLCODE NOT = ZERO) AND (SQLCODE NOT = FIN) THEN
                    MOVE 'LECTURE SUIVANTE CRS-ACTIVITY' TO WS-SQL-LIB 
                    PERFORM 9020-SQL-ERROR-START
                       THRU END-9020-SQL-ERROR
              END-IF
           END-PERFORM. 
           PERFORM 1415-CHARGE-POURCENT-ACTIVITY-START 
                       THRU END-1415-CHARGE-POURCENT-ACTIVITY.
       END-2310-CRS-ACTIVITY-READ.
           EXIT.

       2320-CRS-AGE-READ-START.
OCESQL*    EXEC SQL 
OCESQL*       FETCH CRSAGE
OCESQL*       INTO :SQL-AGE-GENRE, :SQL-AGE-AGE, :SQL-AGE-NB-CUST    
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-AGE-GENRE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-AGE-AGE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-AGE-NB-CUST
OCESQL     END-CALL
OCESQL     CALL "OCESQLCursorFetchOne" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "stfront_CRSAGE" & x"00"
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL.
           IF  (SQLCODE NOT = ZERO) AND (SQLCODE NOT = FIN) THEN
              MOVE 'LECTURE CRS-AGE' TO WS-SQL-LIB 
              PERFORM 9020-SQL-ERROR-START
                   THRU END-9020-SQL-ERROR
           END-IF.

           PERFORM UNTIL SQLCODE = FIN 
              PERFORM 1420-CHARGE-AGE-START 
                       THRU END-1420-CHARGE-AGE
OCESQL*       EXEC SQL 
OCESQL*          FETCH CRSAGE
OCESQL*          INTO :SQL-AGE-GENRE, :SQL-AGE-AGE, :SQL-AGE-NB-CUST      
OCESQL*       END-EXEC
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-AGE-GENRE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-AGE-AGE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-AGE-NB-CUST
OCESQL     END-CALL
OCESQL     CALL "OCESQLCursorFetchOne" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "stfront_CRSAGE" & x"00"
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL
              IF  (SQLCODE NOT = ZERO) AND (SQLCODE NOT = FIN) THEN
                 MOVE 'LECTURE SUIVANTE CRS-AGE' TO WS-SQL-LIB 
                 PERFORM 9020-SQL-ERROR-START
                       THRU END-9020-SQL-ERROR
              END-IF
           END-PERFORM. 
           PERFORM 1425-CHARGE-TOT-AGE-START
                          THRU END-1425-CHARGE-TOT-AGE.      
       END-2320-CRS-AGE-READ.
           EXIT.

      ******************************************************************
      *                   Gestion des erreurs                          *
      ******************************************************************    
       9020-SQL-ERROR-START.
           DISPLAY "*** SQL ERROR ***".
           DISPLAY WS-SQL-LIB SPACE "SQLCODE: " SQLCODE SPACE.
           EVALUATE SQLCODE
              WHEN  +100
                 DISPLAY "Record not found"
              WHEN  -01
                 DISPLAY "Connection failed"
              WHEN  -20
                 DISPLAY "Internal error"
              WHEN  -30
                 DISPLAY "PostgreSQL error"
                 DISPLAY "ERRCODE:" SPACE SQLSTATE
                 DISPLAY SQLERRMC
OCESQL*          EXEC SQL
OCESQL*              ROLLBACK
OCESQL*          END-EXEC
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLExec" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "ROLLBACK" & x"00"
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL
              WHEN  OTHER
                 DISPLAY "Undefined error"
                 DISPLAY "ERRCODE:" SPACE SQLSTATE
                 DISPLAY SQLERRMC
           END-EVALUATE.
       END-9020-SQL-ERROR.
           STOP RUN.  



