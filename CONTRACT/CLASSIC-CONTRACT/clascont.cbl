      ****************************************************************** 
      * L'adhérent doit d'abord choisir le type de contrat sur lequel  *
      * baser la personnalisation. Cet écran affiche les informations  *
      * des 3 contrats types disponibles et les actions possibles:     *
      *    choisir un contrat, confirmer sans changement,              *
      *    demander une personnalisation,                              *
      *    revenir au menu contrat                                     *
      *    Programme précédent: menu contrat (menucont.cbl)            *
      *    Programme suivant : dépend du choix de l'utilisateur        *
      * Auteur: Isabelle                                               *     
      * Date de création : le 12/06/2024                               *
      ******************************************************************        
       
       IDENTIFICATION DIVISION.
       PROGRAM-ID. clascont.
       AUTHOR. Isabelle.

      ******************************************************************       
       
       ENVIRONMENT DIVISION.

      ******************************************************************

       DATA DIVISION.

       WORKING-STORAGE SECTION.                 
      *    gestion des erreurs de saisie
       01 WS-SELECT-OPTION         PIC X(05)   VALUE 'FALSE'     . 
       01 WS-MESSAGE.
           05 WS-MESSAGE1          PIC X(31)
               VALUE 'ERREUR DE SAISIE, VEUILLEZ SELE'        .
           05 WS-MESSAGE2          PIC X(31)
               VALUE 'CTIONNER VOTRE CHOIX AVEC "O".'         .
      *[IM] message trop long mise en commentaire de la dernière partie        
      *     05 WS-MESSAGE3          PIC X(45)
      *         VALUE 'Y COMPRIS POUR VALIDER OU RETOURNER AU MENU.'. 

      *    gestion de l'affichage et de la saisie
       01  SC-BUTTON.
           05 SC-BUTTON-ALLEGE     PIC X       VALUE SPACE       .
           05 SC-BUTTON-MODERE     PIC X       VALUE SPACE       .
           05 SC-BUTTON-EXCELLENCE PIC X       VALUE SPACE       .  
           05 SC-BUTTON-PERSO      PIC X       VALUE SPACE       .
           05 SC-BUTTON-CONFIRM    PIC X       VALUE SPACE       .                          
           05 SC-BUTTON-RETURN     PIC X       VALUE SPACE       .


       01  SC-CONFIRM-BUTTON.
           05 SC-BUTTON-OUI        PIC X       VALUE SPACE       .
           05 SC-BUTTON-NON        PIC X       VALUE SPACE       . 
  
       
       01  WS-CUSTOMER             PIC X(45)   VALUE SPACE       .   
       01  WS-CONTRACT             PIC X(10)   VALUE SPACE       .
       01  WS-CONTRACT-NUM         PIC 9(01)   VALUE ZERO        .
       01  WS-NUM                  PIC 9(03)   VALUE 0           .
       01  WS-NUM-CHAR REDEFINES WS-NUM PIC X(03)                .
       01  WS-AGE                  PIC 9(03)   VALUE 0           .
       01  WS-BIRTHD               PIC 9(08)   VALUE 0           .
       01  WS-NBCHILDREN           PIC 9(02)   VALUE 0           .
       01  WS-CHILDREN-COST        PIC 9(03)   VALUE 0           .

      *    variable pour gérer l'affichage des informations sql
       01  WS-ALLEGE-NUM           PIC 9(01)   VALUE 0           . 
       01  WS-ALLEGE-LABEL         PIC X(12)   VALUE SPACES      .  
       01  WS-ALLEGE-DOCTOR        PIC Z(02)9  VALUE 0           . 
       01  WS-ALLEGE-PARMEDICAL    PIC Z(02)9  VALUE 0           .      
       01  WS-ALLEGE-HOSPITAL      PIC Z(02)9  VALUE 0           . 
       01  WS-ALLEGE-S-GLASSES     PIC Z(02)9  VALUE 0           . 
       01  WS-ALLEGE-P-GLASSES     PIC Z(02)9  VALUE 0           . 
       01  WS-ALLEGE-MOLAR         PIC Z(02)9  VALUE 0           . 
       01  WS-ALLEGE-NON-MOLAR     PIC Z(02)9  VALUE 0           . 
       01  WS-ALLEGE-DESCALINGS    PIC Z(02)9  VALUE 0           .
       01  WS-MODERE-NUM           PIC 9(01)   VALUE 0           .       
       01  WS-MODERE-LABEL         PIC X(12)   VALUE SPACES      .  
       01  WS-MODERE-DOCTOR        PIC Z(02)9  VALUE 0           . 
       01  WS-MODERE-PARMEDICAL    PIC Z(02)9  VALUE 0           .      
       01  WS-MODERE-HOSPITAL      PIC Z(02)9  VALUE 0           . 
       01  WS-MODERE-S-GLASSES     PIC Z(02)9  VALUE 0           . 
       01  WS-MODERE-P-GLASSES     PIC Z(02)9  VALUE 0           . 
       01  WS-MODERE-MOLAR         PIC Z(02)9  VALUE 0           . 
       01  WS-MODERE-NON-MOLAR     PIC Z(02)9  VALUE 0           . 
       01  WS-MODERE-DESCALINGS    PIC Z(02)9  VALUE 0           .
       01  WS-EXCELL-NUM           PIC 9(01)   VALUE 0           .  
       01  WS-EXCELL-LABEL         PIC X(12)   VALUE SPACES      .  
       01  WS-EXCELL-DOCTOR        PIC Z(02)9  VALUE 0           . 
       01  WS-EXCELL-PARMEDICAL    PIC Z(02)9  VALUE 0           .      
       01  WS-EXCELL-HOSPITAL      PIC Z(02)9  VALUE 0           . 
       01  WS-EXCELL-S-GLASSES     PIC Z(02)9  VALUE 0           . 
       01  WS-EXCELL-P-GLASSES     PIC Z(02)9  VALUE 0           . 
       01  WS-EXCELL-MOLAR         PIC Z(02)9  VALUE 0           . 
       01  WS-EXCELL-NON-MOLAR     PIC Z(02)9  VALUE 0           . 
       01  WS-EXCELL-DESCALINGS    PIC Z(02)9  VALUE 0           .  

       01  WS-ALLEGE-COST-65       PIC Z(02)9  VALUE 0           .  
       01  WS-ALLEGE-COST-30       PIC Z(02)9  VALUE 0           . 
       01  WS-ALLEGE-COST          PIC Z(02)9  VALUE 0           .
       01  WS-MODERE-COST-65       PIC Z(02)9  VALUE 0           .  
       01  WS-MODERE-COST-30       PIC Z(02)9  VALUE 0           . 
       01  WS-MODERE-COST          PIC Z(02)9  VALUE 0           .
       01  WS-EXCELL-COST-65       PIC Z(02)9  VALUE 0           .  
       01  WS-EXCELL-COST-30       PIC Z(02)9  VALUE 0           . 
       01  WS-EXCELL-COST          PIC Z(02)9  VALUE 0           .
       
      ******************************************************************
      *    [IM] - le 12/06/2024: SQL                                   *
      *    CHARGEMENT DES ELEMENTS DES CONTRATS AVEC LES INFORMATIONS  *
      *    DE LA TABLE CLASSIC_REIMBURSEMENT                           *
      *    ENREGISTREMENT DES INFORMATIONS DU CONTRAT SELECTIONNE      *
      *    DANS LA TABLE CUSTOMER_REIMBURSEMENT  SI CONFIRME           *
      ******************************************************************
      * Gestion de sql (fin de lecture et erreur)
       01  WS-SQL-LIB              PIC X(80)                     .  
       01  FIN                     PIC S9(9)   VALUE 100         .     
      ******************************************************************
      * Déclaration des variables correspondant à sql 
       EXEC SQL BEGIN DECLARE SECTION END-EXEC                   .
      * paramètres pour connexion à la base 
       01  DBNAME                  PIC X(11)   VALUE 'boboniortdb'.
       01  USERNAME                PIC X(05)   VALUE 'cobol'     .
       01  PASSWD                  PIC X(05)   VALUE 'cbl85'     .

      * CURSEUR POUR RECUPERER LES INFORMATIONS CONTRAT
       01  CURS-CLASSIC.
           05 SQL-CLAS-NUMBER      PIC 9(01)   VALUE 0           .
           05 SQL-CLAS-LABEL       PIC X(12)   VALUE SPACES      .  
           05 SQL-CLAS-DOCTOR      PIC 9(03)   VALUE 0           . 
           05 SQL-CLAS-PARMEDICAL  PIC 9(03)   VALUE 0           .      
           05 SQL-CLAS-HOSPITAL    PIC 9(03)   VALUE 0           . 
           05 SQL-CLAS-S-GLASSES   PIC 9(03)   VALUE 0           . 
           05 SQL-CLAS-P-GLASSES   PIC 9(03)   VALUE 0           . 
           05 SQL-CLAS-MOLAR       PIC 9(03)   VALUE 0           . 
           05 SQL-CLAS-NON-MOLAR   PIC 9(03)   VALUE 0           . 
           05 SQL-CLAS-DESCALINGS  PIC 9(03)   VALUE 0           . 

      * CURSEUR POUR RECUPERER LES COUTS CONTRAT
       01  CURS-COUT.
           05 SQL-COUT-LABEL       PIC X(12)   VALUE SPACE       .
           05 SQL-COUT-AGEMIN      PIC 9(02)   VALUE 0           .  
           05 SQL-COUT-AGEMAX      PIC 9(02)   VALUE 0           . 
           05 SQL-COUT-COST        PIC 9(03)   VALUE 0           .
           05 SQL-COUT-CHILDREN    PIC 9(03)   VALUE 0           .           

      * VARIABLES POUR PREPARER L'INSERT
       01  SQL-MAX                 PIC X(10)   VALUE SPACES      .
       01  SQL-REIMBURSEMENT-NUM   PIC X(10)   VALUE SPACES      .
       01  SQL-REIMBURSEMENT-COST  PIC 9(05)   VALUE 0           .       
       01  SQL-SECU                PIC 9(15)   VALUE 0           .
       01  SQL-NBCHILDREN          PIC 9(02)   VALUE 0           .
       01  SQL-BIRTHD              PIC X(10)   VALUE SPACES      .
       01  SQL-BIRTH REDEFINES SQL-BIRTHD.
           05 SQL-YEAR             PIC 9(04)                     .
           05 FILLER               PIC X(01)   VALUE '-'         .     
           05 SQL-MOUNTH           PIC 9(02)                     .
           05 FILLER               PIC X(01)   VALUE '-'         .           
           05 SQL-DAY              PIC 9(02)                     . 
      * Gestion de la date système
       01  SQL-CDATE.
           05 SQL-CSIECLE          PIC X(02)   VALUE SPACES      .       
           05 SQL-CYEAR            PIC X(02)   VALUE SPACES      .
           05 SQL-CMOUNTH          PIC X(02)   VALUE SPACES      .
           05 SQL-CDAY             PIC X(02)   VALUE SPACES      .
       EXEC SQL END DECLARE SECTION END-EXEC                     . 
       EXEC SQL INCLUDE SQLCA END-EXEC                           .
      ******************************************************************
      * LINKAGE SECTION.
       01  LK-CUSTOMER.
           05 LK-FIRSTNAME         PIC X(14)                     .
           05 FILLER               PIC X(01)                     .
           05 LK-LASTNAME          PIC X(14)                     . 
           05 FILLER               PIC X(01)                     .
           05 LK-SECU              PIC 9(15)                     .     
      ******************************************************************
       SCREEN SECTION.
           COPY 'CLASSIC-CONTRACT-SCREEN.cpy'.  
           COPY 'CLASSIC-CONFIRM-SCREEN.cpy'.  

      ******************************************************************

       PROCEDURE DIVISION.
      * USING LK-CUSTOMER.
      ****************************************************************** 
      * [IM]- le 12-06-2024                                            *
      *    Le paragraphe affiche la screen, contrôle la saisie et      *
      *    appelle le programme correspondant au choix de l'utilisateur*
      ****************************************************************** 
       0000-START-MAIN.          
           PERFORM 1000-SCREEN-LOOP-START THRU END-1000-SCREEN-LOOP.
       END-0000-MAIN.
      *    GOBACK.
           STOP RUN.
      ******************************************************************       
 
      ******************************************************************    
      *    [IM] - le 05-06-2024                                        *
      *    Pour permettre de boucler sur l'affichage en cas d'erreur   *
      *    de saisie de l'utilisateur                                  *
      ****************************************************************** 
       1000-SCREEN-LOOP-START.  
           MOVE 'Jean' TO LK-FIRSTNAME.
           MOVE 'Guarette' TO LK-LASTNAME .
           MOVE '195063475290876' TO LK-SECU .

           PERFORM 1100-PREPARE-SCREEN-START 
                    THRU END-1100-PREPARE-SCREEN.     
           PERFORM UNTIL WS-SELECT-OPTION = 'TRUE'            
              ACCEPT CLASSIC-CONTRACT-SCREEN  
              PERFORM 3000-WITCH-CHOICE-START
                    THRU END-3000-WITCH-CHOICE
           END-PERFORM.          
       END-1000-SCREEN-LOOP. 
           EXIT.   

      ******************************************************************    
      *    [IM] - le 12-06-2024                                        *
      *    Pour meilleure ergonomie je retire les espaces              *
      ******************************************************************
       1100-PREPARE-SCREEN-START.
           STRING FUNCTION TRIM (LK-FIRSTNAME)
                  SPACE 
                  FUNCTION TRIM (LK-LASTNAME)
                  SPACE 
                  LK-SECU 
           DELIMITED BY SIZE 
           INTO WS-CUSTOMER.  
           PERFORM 1200-SQL-CONNECTION-START
                 THRU END-1200-SQL-CONNECTION.
           PERFORM 1400-PREPARE-CRS-CLASSIC-SCREEN-START
                 THRU END-1400-PREPARE-CRS-CLASSIC-SCREEN. 
           PERFORM 1450-PREPARE-CRS-COUT-SCREEN-START
                 THRU END-1450-PREPARE-CRS-COUT-SCREEN.       
           PERFORM 1300-SQL-DISCONNECTION-START
                 THRU END-1300-SQL-DISCONNECTION.           
       END-1100-PREPARE-SCREEN.
           EXIT.

       1200-SQL-CONNECTION-START.
           EXEC SQL 
              CONNECT :USERNAME IDENTIFIED BY :PASSWD USING :DBNAME 
           END-EXEC.
           IF  SQLCODE NOT = ZERO 
               MOVE 'CONNECTION BASE' TO WS-SQL-LIB
               PERFORM 9020-SQL-ERROR-START
                   THRU END-9020-SQL-ERROR
           END-IF.       
       END-1200-SQL-CONNECTION.
           EXIT.
       1300-SQL-DISCONNECTION-START.
           EXEC SQL DISCONNECT ALL END-EXEC.
           IF  SQLCODE NOT = ZERO 
              MOVE 'DISCONNECTION BASE' TO WS-SQL-LIB 
              PERFORM 9020-SQL-ERROR-START
                   THRU END-9020-SQL-ERROR
           END-IF.          
       END-1300-SQL-DISCONNECTION.
           EXIT.

       1400-PREPARE-CRS-CLASSIC-SCREEN-START.
           EXEC SQL 
              DECLARE CRSCLASSIC CURSOR FOR
                 SELECT   CLASSIC_REIMBURSEMENT_NUMBER,
                          CLASSIC_REIMBURSEMENT_LABEL,
                          CLASSIC_REIMBURSEMENT_DOCTOR,
                          CLASSIC_REIMBURSEMENT_PARMEDICAL,
                          CLASSIC_REIMBURSEMENT_HOSPITAL,
                          CLASSIC_REIMBURSEMENT_SINGLE_GLASSES,
                          CLASSIC_REIMBURSEMENT_PROGRESSIVE_GLASSES,
                          CLASSIC_REIMBURSEMENT_MOLAR_CROWNS,
                          CLASSIC_REIMBURSEMENT_NON_MOLAR_CROWNS,
                          CLASSIC_REIMBURSEMENT_DESCALINGS
                 FROM CLASSIC_REIMBURSEMENT 
                 ORDER BY CLASSIC_REIMBURSEMENT_NUMBER     
           END-EXEC.
           IF  SQLCODE NOT = ZERO 
              MOVE 'DECLARATION CRS-CLASSIC' TO WS-SQL-LIB 
              PERFORM 9020-SQL-ERROR-START
                   THRU END-9020-SQL-ERROR
           END-IF.   
           EXEC SQL
              OPEN CRSCLASSIC
           END-EXEC.
           IF  SQLCODE NOT = ZERO 
              MOVE 'OUVERTURE CRS-CLASSIC' TO WS-SQL-LIB 
              PERFORM 9020-SQL-ERROR-START
                   THRU END-9020-SQL-ERROR
           END-IF.

           PERFORM 1500-CRS-CLASSIC-READ-START 
                 THRU END-1500-CRS-CLASSIC-READ.
           
           EXEC SQL
              CLOSE CRSCLASSIC
           END-EXEC.
           IF  SQLCODE NOT = ZERO 
              MOVE 'FERMETURE CRS-CLASSIC' TO WS-SQL-LIB 
              PERFORM 9020-SQL-ERROR-START
                   THRU END-9020-SQL-ERROR
           END-IF.
       END-1400-PREPARE-CRS-CLASSIC-SCREEN.
           EXIT.    

       1450-PREPARE-CRS-COUT-SCREEN-START.
           EXEC SQL 
              DECLARE CRSCOUT CURSOR FOR
                 SELECT   cr.CLASSIC_REIMBURSEMENT_LABEL,
                          cc.COST_CONDITION_AGEMIN,
                          cc.COST_CONDITION_AGEMAX,
                          cc.COST_CONDITION_COST,
                          (SELECT c2.COST_CONDITION_COST 
                          FROM COST_CONDITION as c2
                          WHERE c2.COST_CONDITION_TYPE = '1'
                          AND c2.CLASSIC_REIMBURSEMENT_NUMBER = 1)
                 FROM CLASSIC_REIMBURSEMENT as cr 
                 INNER JOIN COST_CONDITION as cc
                 ON  cr.CLASSIC_REIMBURSEMENT_NUMBER 
                     =  cc.CLASSIC_REIMBURSEMENT_NUMBER 
                 WHERE cc.COST_CONDITION_TYPE ='2'
                 AND cc.COST_CONDITION_COUPLE = False 
           END-EXEC.
           IF  SQLCODE NOT = ZERO 
              MOVE 'DECLARATION CRS-COUT' TO WS-SQL-LIB 
              PERFORM 9020-SQL-ERROR-START
                   THRU END-9020-SQL-ERROR
           END-IF.   
           EXEC SQL
              OPEN CRSCOUT
           END-EXEC.
           IF  SQLCODE NOT = ZERO 
              MOVE 'OUVERTURE CRS-COUT' TO WS-SQL-LIB 
              PERFORM 9020-SQL-ERROR-START
                   THRU END-9020-SQL-ERROR
           END-IF.

               PERFORM 1550-CRS-COUT-READ-START 
                       THRU END-1550-CRS-COUT-READ.
           
           EXEC SQL
              CLOSE CRSCOUT
           END-EXEC.
           IF  SQLCODE NOT = ZERO 
              MOVE 'FERMETURE CRS-COUT' TO WS-SQL-LIB 
              PERFORM 9020-SQL-ERROR-START
                   THRU END-9020-SQL-ERROR
           END-IF.
       END-1450-PREPARE-CRS-COUT-SCREEN.
           EXIT. 

       1500-CRS-CLASSIC-READ-START.
           EXEC SQL 
              FETCH CRSCLASSIC 
              INTO 
              :SQL-CLAS-NUMBER, :SQL-CLAS-LABEL, :SQL-CLAS-DOCTOR,
              :SQL-CLAS-PARMEDICAL, :SQL-CLAS-HOSPITAL,
              :SQL-CLAS-S-GLASSES, :SQL-CLAS-P-GLASSES, :SQL-CLAS-MOLAR,
              :SQL-CLAS-NON-MOLAR,:SQL-CLAS-DESCALINGS     
           END-EXEC.
           IF  (SQLCODE NOT = ZERO) AND (SQLCODE NOT = FIN) THEN
              MOVE 'LECTURE CRS-CLASSIC' TO WS-SQL-LIB 
              PERFORM 9020-SQL-ERROR-START
                   THRU END-9020-SQL-ERROR
           END-IF.

           PERFORM UNTIL SQLCODE = FIN 
              PERFORM 1600-CHARGE-CRS-CLASSIC-SCREEN-START 
                       THRU END-1600-CHARGE-CRS-CLASSIC-SCREEN

           EXEC SQL 
                 FETCH CRSCLASSIC
                 INTO 
                    :SQL-CLAS-NUMBER, :SQL-CLAS-LABEL, :SQL-CLAS-DOCTOR,
                    :SQL-CLAS-PARMEDICAL, :SQL-CLAS-HOSPITAL,
                    :SQL-CLAS-S-GLASSES, :SQL-CLAS-P-GLASSES, 
                    :SQL-CLAS-MOLAR,:SQL-CLAS-NON-MOLAR,
                    :SQL-CLAS-DESCALINGS     
           END-EXEC
              IF  (SQLCODE NOT = ZERO) AND (SQLCODE NOT = FIN) THEN
                 MOVE 'LECTURE SUIVANTE CRS-CLASSIC' TO WS-SQL-LIB 
                 PERFORM 9020-SQL-ERROR-START
                       THRU END-9020-SQL-ERROR
              END-IF
           END-PERFORM.    
       END-1500-CRS-CLASSIC-READ.
           EXIT.

       1550-CRS-COUT-READ-START. 
           EXEC SQL 
              FETCH CRSCOUT 
              INTO 
              :SQL-COUT-LABEL, :SQL-COUT-AGEMIN, :SQL-COUT-AGEMAX,
              :SQL-COUT-COST, :SQL-COUT-CHILDREN    
           END-EXEC.
           IF  (SQLCODE NOT = ZERO) AND (SQLCODE NOT = FIN) THEN
              MOVE 'LECTURE CRS-COUT' TO WS-SQL-LIB 
              PERFORM 9020-SQL-ERROR-START
                   THRU END-9020-SQL-ERROR
           END-IF.

           PERFORM UNTIL SQLCODE = FIN 
              PERFORM 1650-CHARGE-CRS-COUT-SCREEN-START 
                       THRU END-1650-CHARGE-CRS-COUT-SCREEN

           EXEC SQL 
                 FETCH CRSCOUT
                 INTO 
                    :SQL-COUT-LABEL, :SQL-COUT-AGEMIN, :SQL-COUT-AGEMAX,
                    :SQL-COUT-COST, :SQL-COUT-CHILDREN     
           END-EXEC
              IF  (SQLCODE NOT = ZERO) AND (SQLCODE NOT = FIN) THEN
                 MOVE 'LECTURE SUIVANTE CRS-COUT' TO WS-SQL-LIB 
                 PERFORM 9020-SQL-ERROR-START
                       THRU END-9020-SQL-ERROR
              END-IF
           END-PERFORM.         
       END-1550-CRS-COUT-READ.
           EXIT.

       1600-CHARGE-CRS-CLASSIC-SCREEN-START.
           EVALUATE (FUNCTION UPPER-CASE(SQL-CLAS-LABEL))
              WHEN  'ALLEGE'
                 MOVE SQL-CLAS-NUMBER TO WS-ALLEGE-NUM 
                 MOVE SQL-CLAS-LABEL TO WS-ALLEGE-LABEL 
                 MOVE SQL-CLAS-DOCTOR TO WS-ALLEGE-DOCTOR 
                 MOVE SQL-CLAS-PARMEDICAL TO WS-ALLEGE-PARMEDICAL      
                 MOVE SQL-CLAS-HOSPITAL TO WS-ALLEGE-HOSPITAL 
                 MOVE SQL-CLAS-S-GLASSES TO WS-ALLEGE-S-GLASSES 
                 MOVE SQL-CLAS-P-GLASSES TO WS-ALLEGE-P-GLASSES 
                 MOVE SQL-CLAS-MOLAR TO WS-ALLEGE-MOLAR 
                 MOVE SQL-CLAS-NON-MOLAR TO WS-ALLEGE-NON-MOLAR 
                 MOVE SQL-CLAS-DESCALINGS TO WS-ALLEGE-DESCALINGS 
              WHEN  'MODERE'
                 MOVE SQL-CLAS-NUMBER TO WS-MODERE-NUM              
                 MOVE SQL-CLAS-LABEL TO WS-MODERE-LABEL 
                 MOVE SQL-CLAS-DOCTOR TO WS-MODERE-DOCTOR 
                 MOVE SQL-CLAS-PARMEDICAL TO WS-MODERE-PARMEDICAL      
                 MOVE SQL-CLAS-HOSPITAL TO WS-MODERE-HOSPITAL 
                 MOVE SQL-CLAS-S-GLASSES TO WS-MODERE-S-GLASSES 
                 MOVE SQL-CLAS-P-GLASSES TO WS-MODERE-P-GLASSES 
                 MOVE SQL-CLAS-MOLAR TO WS-MODERE-MOLAR 
                 MOVE SQL-CLAS-NON-MOLAR TO WS-MODERE-NON-MOLAR 
                 MOVE SQL-CLAS-DESCALINGS TO WS-MODERE-DESCALINGS
              WHEN  'EXCELLENCE'
                 MOVE SQL-CLAS-NUMBER TO WS-EXCELL-NUM              
                 MOVE SQL-CLAS-LABEL TO WS-EXCELL-LABEL 
                 MOVE SQL-CLAS-DOCTOR TO WS-EXCELL-DOCTOR 
                 MOVE SQL-CLAS-PARMEDICAL TO WS-EXCELL-PARMEDICAL      
                 MOVE SQL-CLAS-HOSPITAL TO WS-EXCELL-HOSPITAL 
                 MOVE SQL-CLAS-S-GLASSES TO WS-EXCELL-S-GLASSES 
                 MOVE SQL-CLAS-P-GLASSES TO WS-EXCELL-P-GLASSES 
                 MOVE SQL-CLAS-MOLAR TO WS-EXCELL-MOLAR 
                 MOVE SQL-CLAS-NON-MOLAR TO WS-EXCELL-NON-MOLAR 
                 MOVE SQL-CLAS-DESCALINGS TO WS-EXCELL-DESCALINGS
           END-EVALUATE.   
       END-1600-CHARGE-CRS-CLASSIC-SCREEN.
           EXIT.    
 
       1650-CHARGE-CRS-COUT-SCREEN-START.
           EVALUATE (FUNCTION UPPER-CASE(FUNCTION TRIM(SQL-COUT-LABEL)))
              WHEN  'ALLEGE'
                 IF (SQL-COUT-AGEMIN EQUAL 30) THEN
                    MOVE SQL-COUT-COST TO WS-ALLEGE-COST
                 ELSE
                    IF (SQL-COUT-AGEMAX EQUAL 30) THEN
                        MOVE SQL-COUT-COST TO WS-ALLEGE-COST-30  
                    ELSE
                        MOVE SQL-COUT-COST TO WS-ALLEGE-COST-65                    
                    END-IF         
                 END-IF
                 MOVE SQL-COUT-CHILDREN TO WS-CHILDREN-COST 
              WHEN  'MODERE'
                 IF (SQL-COUT-AGEMIN EQUAL 30) THEN
                    MOVE SQL-COUT-COST TO WS-MODERE-COST
                 ELSE
                    IF (SQL-COUT-AGEMAX EQUAL 30) THEN
                        MOVE SQL-COUT-COST TO WS-MODERE-COST-30  
                    ELSE
                        MOVE SQL-COUT-COST TO WS-MODERE-COST-65                    
                    END-IF         
                 END-IF
              WHEN  'EXCELLENCE'
                 IF (SQL-COUT-AGEMIN EQUAL 30) THEN
                    MOVE SQL-COUT-COST TO WS-EXCELL-COST
                 ELSE
                    IF (SQL-COUT-AGEMAX EQUAL 30) THEN
                        MOVE SQL-COUT-COST TO WS-EXCELL-COST-30  
                    ELSE
                        MOVE SQL-COUT-COST TO WS-EXCELL-COST-65                    
                    END-IF         
                 END-IF           
           END-EVALUATE.   
       END-1650-CHARGE-CRS-COUT-SCREEN.
           EXIT.              
      ******************************************************************    
      *    [IM] - le 11-06-2024                                        *
      *    Je vérifie la saisie                                        *
      ******************************************************************
       3000-WITCH-CHOICE-START.
           IF FUNCTION UPPER-CASE(SC-BUTTON-RETURN)
           EQUAL 'O' THEN
               MOVE 'True' TO WS-SELECT-OPTION 
               CALL 'menucont' USING CONTENT LK-CUSTOMER
           ELSE         
               IF (FUNCTION UPPER-CASE(SC-BUTTON-ALLEGE) EQUAL 'O')
               OR  (FUNCTION UPPER-CASE(SC-BUTTON-MODERE) EQUAL 'O')
               OR  (FUNCTION UPPER-CASE(SC-BUTTON-EXCELLENCE) EQUAL 'O')  
               THEN
                   IF FUNCTION UPPER-CASE(SC-BUTTON-CONFIRM)
                    EQUAL 'O' THEN 
                       PERFORM 3100-DISPLAY-CONFIRM-START
                             THRU END-3100-DISPLAY-CONFIRM
                   ELSE IF FUNCTION UPPER-CASE(SC-BUTTON-PERSO)
                          EQUAL 'O' THEN 
                          IF FUNCTION UPPER-CASE(SC-BUTTON-ALLEGE) 
                          EQUAL 'O' THEN
                             MOVE WS-ALLEGE-NUM  TO WS-CONTRACT-NUM
                          ELSE IF FUNCTION UPPER-CASE(SC-BUTTON-MODERE) 
                                EQUAL 'O' THEN
                             MOVE WS-MODERE-NUM TO WS-CONTRACT-NUM
                          ELSE  
                             MOVE WS-EXCELL-NUM TO WS-CONTRACT-NUM               
                          END-IF
                          MOVE 'True' TO WS-SELECT-OPTION    
                          CALL 'speccont' 
                          USING CONTENT LK-CUSTOMER WS-CONTRACT-NUM
                       ELSE 
                          PERFORM 9200-ERROR-MESSAGE-START 
                             THRU END-9200-ERROR-MESSAGE
                   END-IF    
               ELSE  
                   PERFORM 9200-ERROR-MESSAGE-START 
                             THRU END-9200-ERROR-MESSAGE
               END-IF                              
           END-IF.
       END-3000-WITCH-CHOICE.
           EXIT.

       3100-DISPLAY-CONFIRM-START.
           IF FUNCTION UPPER-CASE(SC-BUTTON-ALLEGE) EQUAL 'O' THEN
               MOVE WS-ALLEGE-LABEL  TO WS-CONTRACT
           ELSE IF FUNCTION UPPER-CASE(SC-BUTTON-MODERE) EQUAL 'O' THEN
                    MOVE WS-MODERE-LABEL TO WS-CONTRACT
               ELSE  
                    MOVE WS-EXCELL-LABEL TO WS-CONTRACT               
           END-IF.  
      
           ACCEPT CLASSIC-CONFIRM-SCREEN.
           IF (FUNCTION UPPER-CASE(SC-BUTTON-OUI) EQUAL 'O') THEN
      *    Si choix confirmé on enregistre et on revient au menu
              PERFORM 6000-SQL-ACTION-START
                 THRU END-6000-SQL-ACTION
              MOVE 'True' TO WS-SELECT-OPTION 
              CALL 'menucont' USING CONTENT LK-CUSTOMER 
           ELSE IF (FUNCTION UPPER-CASE(SC-BUTTON-NON) EQUAL 'O') THEN
      *    Si choix non confirmé, on revient à l'écran de sélection     
                    ACCEPT CLASSIC-CONTRACT-SCREEN
                    PERFORM 3000-WITCH-CHOICE-START
                          THRU END-3000-WITCH-CHOICE  
               ELSE 
      *    Si aucune action, on demande de choisir
                    PERFORM 9300-ERROR-MSG-CONFIRM-START
                          THRU END-9300-ERROR-MSG-CONFIRM                    
               END-IF            
           END-IF.
       END-3100-DISPLAY-CONFIRM.
           EXIT.
   
       6000-SQL-ACTION-START.
           PERFORM 1200-SQL-CONNECTION-START
                 THRU END-1200-SQL-CONNECTION.
           PERFORM 6100-SQL-INSERT-START
                 THRU END-6100-SQL-INSERT. 
           PERFORM 1300-SQL-DISCONNECTION-START
                 THRU END-1300-SQL-DISCONNECTION.   
       END-6000-SQL-ACTION.
           EXIT.      
      ******************************************************************    
      *    [IM] - le 13-06-2024                                        *
      *    Si confirmation du choix d'un contrat type sans modification*
      *    on crée directement l'enregistrement dans la table          *
      ****************************************************************** 
       6100-SQL-INSERT-START. 
      * [IM] récupère année et mois 
           MOVE FUNCTION CURRENT-DATE(1:8) TO SQL-CDATE.  
           MOVE LK-SECU TO SQL-SECU.
           PERFORM 6120-PREPARE-SQL-VARIABLE-START
                 THRU END-6120-PREPARE-SQL-VARIABLE.
           EXEC SQL
                 INSERT INTO CUSTOMER_REIMBURSEMENT
                 (UUID_CUSTOMER, REIMBURSEMENT_NUM,  
                 REIMBURSEMENT_CREATE_DATE, REIMBURSEMENT_COST, 
                 REIMBURSEMENT_DOCTOR, REIMBURSEMENT_PARMEDICAL,
                 REIMBURSEMENT_HOSPITAL, REIMBURSEMENT_SINGLE_GLASSES, 
                 REIMBURSEMENT_PROGRESSIVE_GLASSES, 
                 REIMBURSEMENT_MOLAR_CROWNS, REIMBURSEMENT_DESCALINGS,
                 REIMBURSEMENT_NON_MOLAR_CROWNS)
                 VALUES 
                 ((SELECT UUID_CUSTOMER FROM CUSTOMER 
                    WHERE CUSTOMER_CODE_SECU = :SQL-SECU), 
                    :SQL-REIMBURSEMENT-NUM, CURRENT_DATE,
                    :SQL-REIMBURSEMENT-COST, 
                    :SQL-CLAS-DOCTOR, :SQL-CLAS-PARMEDICAL,
                    :SQL-CLAS-HOSPITAL, :SQL-CLAS-S-GLASSES,
                    :SQL-CLAS-P-GLASSES, :SQL-CLAS-MOLAR,
                    :SQL-CLAS-DESCALINGS,:SQL-CLAS-NON-MOLAR                     
                 )
           END-EXEC.
           IF  SQLCODE NOT = ZERO 
                 MOVE 'INSERT CUSTOMER_REIMBURSEMENT' TO WS-SQL-LIB                     
                 PERFORM 9020-SQL-ERROR-START THRU END-9020-SQL-ERROR                
           END-IF.
           EXEC SQL COMMIT WORK END-EXEC.
       END-6100-SQL-INSERT.
           EXIT. 


       6120-PREPARE-SQL-VARIABLE-START.
      * [IM] récupère le numéro de contrat max pour le type de contrat
      *      et fait plus 1 sur le max pour créer le numéro à inserrer
      *    Charge les variables SQL-* avec les varaibles du type de 
      *    contrat et calcule le coût du contrat en fonction de la 
      *    composition de la famille.
      * [IM] Récupération des informations client
      
           EXEC SQL 
               SELECT CUSTOMER_NBCHILDREN, CUSTOMER_BIRTH_DATE
               INTO :SQL-NBCHILDREN, :SQL-BIRTHD
               FROM CUSTOMER
               WHERE CUSTOMER_CODE_SECU = :SQL-SECU
           END-EXEC.
           IF  (SQLCODE NOT = ZERO) AND (SQLCODE NOT EQUAL FIN) THEN
               MOVE 'RECHERCHE INFOS ADHERENT' TO WS-SQL-LIB                      
               PERFORM 9020-SQL-ERROR-START THRU END-9020-SQL-ERROR                
           END-IF.
           MOVE SQL-NBCHILDREN TO WS-NBCHILDREN.  
           PERFORM 6125-CALC-CUSTOMER-AGE-START 
                    THRU END-6125-CALC-CUSTOMER-AGE.
           EVALUATE (WS-CONTRACT)
              WHEN 'ALLEGE'
                 EXEC SQL 
                    SELECT MAX(REIMBURSEMENT_NUM) as MAX
                    INTO :SQL-MAX                   
                    FROM CUSTOMER_REIMBURSEMENT
                    WHERE REIMBURSEMENT_NUM LIKE 'ALL'||:SQL-CYEAR||
                    :SQL-CMOUNTH||'%'
                 END-EXEC
                 IF  (SQLCODE NOT = ZERO) AND (SQLCODE NOT EQUAL FIN)
                 THEN 
                    MOVE 'RECHERCHE MAX REIMBURSEMENT_NUM - ALLEGE' 
                       TO WS-SQL-LIB                     
                    PERFORM 9020-SQL-ERROR-START THRU END-9020-SQL-ERROR                
                 END-IF
                 IF (SQLCODE NOT EQUAL FIN) THEN
                    MOVE FUNCTION NUMVAL(SQL-MAX(8:3)) TO WS-NUM
                 END-IF
                 ADD 1 TO WS-NUM
                 STRING 'ALL'
                        SQL-CYEAR
                        SQL-CMOUNTH 
                        WS-NUM  
                 DELIMITED BY SIZE
                 INTO SQL-REIMBURSEMENT-NUM
                 MOVE WS-ALLEGE-DOCTOR TO SQL-CLAS-DOCTOR 
                 MOVE WS-ALLEGE-PARMEDICAL TO SQL-CLAS-PARMEDICAL
                 MOVE WS-ALLEGE-HOSPITAL TO SQL-CLAS-HOSPITAL 
                 MOVE WS-ALLEGE-S-GLASSES TO SQL-CLAS-S-GLASSES
                 MOVE WS-ALLEGE-P-GLASSES TO SQL-CLAS-P-GLASSES 
                 MOVE WS-ALLEGE-MOLAR TO SQL-CLAS-MOLAR
                 MOVE WS-ALLEGE-DESCALINGS TO SQL-CLAS-DESCALINGS 
                 MOVE WS-ALLEGE-NON-MOLAR TO SQL-CLAS-NON-MOLAR
      *    [IM] Calcul du prix en fonction contrat-age           
                 IF (WS-AGE < 30) THEN
                    MOVE WS-ALLEGE-COST-30 TO SQL-REIMBURSEMENT-COST
                 ELSE IF (WS-AGE > 65) THEN
                          MOVE WS-ALLEGE-COST-65 
                                TO SQL-REIMBURSEMENT-COST
                      ELSE 
                          MOVE WS-ALLEGE-COST TO SQL-REIMBURSEMENT-COST
                      END-IF                             
                 END-IF      
              WHEN 'MODERE'
                 EXEC SQL 
                    SELECT MAX(REIMBURSEMENT_NUM) as MAX
                    INTO :SQL-MAX                   
                    FROM CUSTOMER_REIMBURSEMENT
                    WHERE REIMBURSEMENT_NUM LIKE 'MOD'||:SQL-CYEAR||
                    :SQL-CMOUNTH||'%'
                 END-EXEC
                 IF  (SQLCODE NOT = ZERO) AND (SQLCODE NOT EQUAL FIN)
                 THEN
                    MOVE 'RECHERCHE MAX REIMBURSEMENT_NUM - MODERE' 
                       TO WS-SQL-LIB                     
                    PERFORM 9020-SQL-ERROR-START THRU END-9020-SQL-ERROR                
                 END-IF
                 IF (SQLCODE NOT EQUAL FIN) THEN
                    MOVE FUNCTION NUMVAL(SQL-MAX(8:3)) TO WS-NUM
                 END-IF
                 ADD 1 TO WS-NUM
                 STRING 'MOD'
                        SQL-CYEAR
                        SQL-CMOUNTH 
                        WS-NUM  
                 DELIMITED BY SIZE
                 INTO SQL-REIMBURSEMENT-NUM
                 MOVE WS-MODERE-DOCTOR TO SQL-CLAS-DOCTOR 
                 MOVE WS-MODERE-PARMEDICAL TO SQL-CLAS-PARMEDICAL
                 MOVE WS-MODERE-HOSPITAL TO SQL-CLAS-HOSPITAL 
                 MOVE WS-MODERE-S-GLASSES TO SQL-CLAS-S-GLASSES
                 MOVE WS-MODERE-P-GLASSES TO SQL-CLAS-P-GLASSES 
                 MOVE WS-MODERE-MOLAR TO SQL-CLAS-MOLAR
                 MOVE WS-MODERE-DESCALINGS TO SQL-CLAS-DESCALINGS 
                 MOVE WS-MODERE-NON-MOLAR TO SQL-CLAS-NON-MOLAR  
      *    [IM] Calcul du prix en fonction contrat-age           
                 IF (WS-AGE < 30) THEN
                    MOVE WS-MODERE-COST-30 TO SQL-REIMBURSEMENT-COST
                 ELSE IF (WS-AGE > 65) THEN
                          MOVE WS-MODERE-COST-65 
                                TO SQL-REIMBURSEMENT-COST
                      ELSE 
                          MOVE WS-MODERE-COST TO SQL-REIMBURSEMENT-COST                             
                 END-IF                    
              WHEN 'EXCELLENCE'
                 EXEC SQL 
                    SELECT MAX(REIMBURSEMENT_NUM) as MAX
                    INTO :SQL-MAX                   
                    FROM CUSTOMER_REIMBURSEMENT
                    WHERE REIMBURSEMENT_NUM LIKE 'EXC'||:SQL-CYEAR||
                    :SQL-CMOUNTH||'%'
                 END-EXEC
                 IF  (SQLCODE NOT = ZERO) AND (SQLCODE NOT EQUAL FIN)
                 THEN
                    MOVE 'RECHERCHE MAX REIMBURSEMENT_NUM - EXCELLENCE' 
                       TO WS-SQL-LIB                     
                    PERFORM 9020-SQL-ERROR-START THRU END-9020-SQL-ERROR                
                 END-IF
                 IF (SQLCODE NOT EQUAL FIN) THEN
                    MOVE FUNCTION NUMVAL(SQL-MAX(8:3)) TO WS-NUM
                 END-IF
                 ADD 1 TO WS-NUM
                 STRING 'EXC'
                        SQL-CYEAR 
                        SQL-CMOUNTH
                        WS-NUM  
                 DELIMITED BY SIZE
                 INTO SQL-REIMBURSEMENT-NUM
                 MOVE WS-EXCELL-DOCTOR TO SQL-CLAS-DOCTOR 
                 MOVE WS-EXCELL-PARMEDICAL TO SQL-CLAS-PARMEDICAL
                 MOVE WS-EXCELL-HOSPITAL TO SQL-CLAS-HOSPITAL 
                 MOVE WS-EXCELL-S-GLASSES TO SQL-CLAS-S-GLASSES
                 MOVE WS-EXCELL-P-GLASSES TO SQL-CLAS-P-GLASSES 
                 MOVE WS-EXCELL-MOLAR TO SQL-CLAS-MOLAR
                 MOVE WS-EXCELL-DESCALINGS TO SQL-CLAS-DESCALINGS 
                 MOVE WS-EXCELL-NON-MOLAR TO SQL-CLAS-NON-MOLAR  
      *    [IM] Calcul du prix en fonction contrat-age           
                 IF (WS-AGE < 30) THEN
                    MOVE WS-EXCELL-COST-30 TO SQL-REIMBURSEMENT-COST
                 ELSE IF (WS-AGE > 65) THEN
                          MOVE WS-EXCELL-COST-65 
                                TO SQL-REIMBURSEMENT-COST
                      ELSE 
                          MOVE WS-EXCELL-COST TO SQL-REIMBURSEMENT-COST                             
                 END-IF                       
           END-EVALUATE.  
      * [IM] Gestion du nombre d'enfants pour calculer le coût 
           MULTIPLY WS-NBCHILDREN BY WS-CHILDREN-COST
                    GIVING WS-CHILDREN-COST.
           ADD WS-CHILDREN-COST TO SQL-REIMBURSEMENT-COST
           GIVING SQL-REIMBURSEMENT-COST.         
       END-6120-PREPARE-SQL-VARIABLE.
           EXIT.   

       6125-CALC-CUSTOMER-AGE-START. 
           STRING SQL-YEAR SQL-MOUNTH SQL-DAY 
           DELIMITED BY SIZE 
           INTO WS-BIRTHD.
           SUBTRACT WS-BIRTHD FROM FUNCTION NUMVAL(SQL-CDATE(1:8))
                                GIVING WS-BIRTHD.
           MOVE WS-BIRTHD(3:2) TO WS-AGE.
       END-6125-CALC-CUSTOMER-AGE.
           EXIT.


      ******************************************************************    
      *    [IM] - le 12-06-2024                                        *
      *    gestion d'erreur SQL                                        *
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
                 EXEC SQL
                     ROLLBACK
                 END-EXEC
              WHEN  OTHER
                 DISPLAY "Undefined error"
                 DISPLAY "ERRCODE:" SPACE SQLSTATE
                 DISPLAY SQLERRMC
           END-EVALUATE.
       END-9020-SQL-ERROR.
           STOP RUN.
 
      ******************************************************************    
      *    [IM] - le 12-06-2024                                        *
      *    J'envoie un message si erreur de saisie et efface la saisie *
      ****************************************************************** 
       9200-ERROR-MESSAGE-START. 
            DISPLAY WS-MESSAGE
            LINE 32 COL 20 FOREGROUND-COLOR IS 7.            
            INITIALIZE SC-BUTTON.                      
       END-9200-ERROR-MESSAGE.
           EXIT.
       
       9300-ERROR-MSG-CONFIRM-START. 
            DISPLAY WS-MESSAGE
            LINE 14 COL 87 FOREGROUND-COLOR IS 7.            
            INITIALIZE SC-CONFIRM-BUTTON.  
            PERFORM 3100-DISPLAY-CONFIRM-START
                    THRU END-3100-DISPLAY-CONFIRM.                    
       END-9300-ERROR-MSG-CONFIRM.
           EXIT.


