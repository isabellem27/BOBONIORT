      ****************************************************************** 
      * L'adhérent a choisi le type de contrat sur lequel baser  la    *
      *  personnalisation. Cet écran affiche les informations des 3    *
      *  contrats types disponibles et permet de faire un mixte des    *
      *  prestations                                                   *
      *  Le bouton valider contrat: pour charger les données dans la   *
      *                     table et revenir au menu contrat           *
      *  Le bouton valider choix: pour valider la selection            *
      *  Le bouton Retour: pour revenir au menu contrat                *
      *    Programme précédent: classic contrat (clascont.cbl)         *
      *    Programme suivant : menu contrat (menucont.cbl)             *
      * Auteur: Isabelle                                               *     
      * Date de création : le 13/06/2024                               *
      ******************************************************************      
       IDENTIFICATION DIVISION.
       PROGRAM-ID. speccont RECURSIVE.
       AUTHOR. Isabelle.

      ******************************************************************       
       
       ENVIRONMENT DIVISION.

      ******************************************************************

       DATA DIVISION.

       WORKING-STORAGE SECTION.
      *    gestion des erreurs de saisie

       01  WS-SELECT-OPTION              PIC X(05) VALUE 'FALSE' . 
       01  WS-CHOICE                     PIC X(01) VALUE 'N'     .
       88  WS-CHOICE-OK                  VALUE 'O'               .
       01  WS-CHOICE-NB                  PIC 9(02) VALUE ZERO    . 

      *    gestion de l'affichage et de la saisie         
       01  SC-BUTTON.
           05 SC-BUTTON-CONT-VALIDATE    PIC X                   .               
           05 SC-BUTTON-RETURN           PIC X                   .
           05 SC-BUTTON-CHOICE-VALIDATE  PIC X                   .                                
       
       01  SC-BUTTON-VALUE.
           05 SC-VALUE-MEDIC-1           PIC X                   .
           05 SC-VALUE-MEDIC-2           PIC X                   .
           05 SC-VALUE-MEDIC-3           PIC X                   . 
           05 SC-VALUE-PARAMEDIC-1       PIC X                   .
           05 SC-VALUE-PARAMEDIC-2       PIC X                   .
           05 SC-VALUE-PARAMEDIC-3       PIC X                   . 
           05 SC-VALUE-HOSPITAL-1        PIC X                   .
           05 SC-VALUE-HOSPITAL-2        PIC X                   .
           05 SC-VALUE-HOSPITAL-3        PIC X                   . 
           05 SC-VALUE-S-GLASSES-1       PIC X                   .
           05 SC-VALUE-S-GLASSES-2       PIC X                   .
           05 SC-VALUE-S-GLASSES-3       PIC X                   . 
           05 SC-VALUE-P-GLASSES-1       PIC X                   .
           05 SC-VALUE-P-GLASSES-2       PIC X                   .
           05 SC-VALUE-P-GLASSES-3       PIC X                   .
           05 SC-VALUE-MOLAR-1           PIC X                   .
           05 SC-VALUE-MOLAR-2           PIC X                   .
           05 SC-VALUE-MOLAR-3           PIC X                   .    
           05 SC-VALUE-NON-MOLAR-1       PIC X                   .
           05 SC-VALUE-NON-MOLAR-2       PIC X                   .
           05 SC-VALUE-NON-MOLAR-3       PIC X                   .  
           05 SC-VALUE-DESCALINGS-1      PIC X                   .
           05 SC-VALUE-DESCALINGS-2      PIC X                   .
           05 SC-VALUE-DESCALINGS-3      PIC X                   .                           
       
       
      *    variable pour gérer l'affichage des informations sql
       01  WS-SC-VALUE                                           . 
           05  WS-ALLEGE-LABEL           PIC X(12)   VALUE SPACES.
           05  WS-ALLEGE-DOCTOR          PIC Z(02)9  VALUE ZERO  . 
           05  WS-ALLEGE-PARMEDICAL      PIC Z(02)9  VALUE ZERO  .      
           05  WS-ALLEGE-HOSPITAL        PIC Z(02)9  VALUE ZERO  . 
           05  WS-ALLEGE-S-GLASSES       PIC Z(02)9  VALUE ZERO  . 
           05  WS-ALLEGE-P-GLASSES       PIC Z(02)9  VALUE ZERO  . 
           05  WS-ALLEGE-MOLAR           PIC Z(02)9  VALUE ZERO  . 
           05  WS-ALLEGE-NON-MOLAR       PIC Z(02)9  VALUE ZERO  . 
           05  WS-ALLEGE-DESCALINGS      PIC Z(02)9  VALUE ZERO  . 
           05  WS-MODERE-LABEL           PIC X(12)   VALUE SPACES. 
           05  WS-MODERE-DOCTOR          PIC Z(02)9  VALUE ZERO  . 
           05  WS-MODERE-PARMEDICAL      PIC Z(02)9  VALUE ZERO  .      
           05  WS-MODERE-HOSPITAL        PIC Z(02)9  VALUE ZERO  . 
           05  WS-MODERE-S-GLASSES       PIC Z(02)9  VALUE ZERO  . 
           05  WS-MODERE-P-GLASSES       PIC Z(02)9  VALUE ZERO  . 
           05  WS-MODERE-MOLAR           PIC Z(02)9  VALUE ZERO  . 
           05  WS-MODERE-NON-MOLAR       PIC Z(02)9  VALUE ZERO  . 
           05  WS-MODERE-DESCALINGS      PIC Z(02)9  VALUE ZERO  . 
           05  WS-EXCELL-LABEL           PIC X(12)   VALUE SPACES.             
           05  WS-EXCELL-DOCTOR          PIC Z(02)9  VALUE ZERO  . 
           05  WS-EXCELL-PARMEDICAL      PIC Z(02)9  VALUE ZERO  .      
           05  WS-EXCELL-HOSPITAL        PIC Z(02)9  VALUE ZERO  . 
           05  WS-EXCELL-S-GLASSES       PIC Z(02)9  VALUE ZERO  . 
           05  WS-EXCELL-P-GLASSES       PIC Z(02)9  VALUE ZERO  . 
           05  WS-EXCELL-MOLAR           PIC Z(02)9  VALUE ZERO  . 
           05  WS-EXCELL-NON-MOLAR       PIC Z(02)9  VALUE ZERO  . 
           05  WS-EXCELL-DESCALINGS      PIC Z(02)9  VALUE ZERO  .  

       01  SC-CONTRACT-COST              PIC Z(02)9              . 
       01  SC-MESSAGE                    PIC X(70)   VALUE SPACES.                      

       01  WS-ALLEGE-COST-65             PIC 9(03)   VALUE ZERO  .  
       01  WS-ALLEGE-COST-30             PIC 9(03)   VALUE ZERO  . 
       01  WS-ALLEGE-COST                PIC 9(03)   VALUE ZERO  .

       01  WS-NUM                        PIC 9(03)   VALUE ZERO  .
       01  WS-CUSTOMER                   PIC X(45)   VALUE SPACE .
       01  WS-CHILDREN-TOTAL             PIC 9(03)   VALUE 0     .
       01  WS-CHILDREN-COST              PIC 9(03)   VALUE 0     .
       01  WS-AGE                        PIC 9(03)   VALUE 0     .
       01  WS-BIRTHD                     PIC 9(08)   VALUE 0     .
       01  WS-NBCHILDREN                 PIC 9(02)   VALUE 0     .
       
      ******************************************************************
      *    [IM] - le 13/06/2024: SQL                                   *
      *    CHARGEMENT DES ELEMENTS DES CONTRATS AVEC LES INFORMATIONS  *
      *    DE LA TABLE CLASSIC_REIMBURSEMENT                           *
      *    ENREGISTREMENT DES PRESTATIONS SELECTIONNEES DANS LA TABLE  *
      *    CUSTOMER_REIMBURSEMENT  A LA VALIDATION                     *
      ******************************************************************
      * Gestion de sql (fin de lecture et erreur)
       01  WS-SQL-LIB                 PIC X(80)                  .  
       01  FIN                        PIC S9(9)      VALUE 100   .     
      ******************************************************************
      * Déclaration des variables correspondant à sql 
OCESQL*EXEC SQL BEGIN DECLARE SECTION END-EXEC                   .
      * paramètres pour connexion à la base 
       01  DBNAME                     PIC X(11)   VALUE 'boboniortdb'.
       01  USERNAME                   PIC X(05)      VALUE 'cobol'.
       01  PASSWD                     PIC X(05)      VALUE 'cbl85'.

      * CURSEUR POUR RECUPERER LES INFORMATIONS CONTRAT 
      *    ET INSERRER L'ENREGISTREMENT
       01  CURS-CLASSIC.
           05 SQL-CLAS-LABEL          PIC X(12)      VALUE SPACES.  
           05 SQL-CLAS-DOCTOR         PIC 9(03)      VALUE ZERO  . 
           05 SQL-CLAS-PARMEDICAL     PIC 9(03)      VALUE ZERO  .      
           05 SQL-CLAS-HOSPITAL       PIC 9(03)      VALUE ZERO  . 
           05 SQL-CLAS-S-GLASSES      PIC 9(03)      VALUE ZERO  . 
           05 SQL-CLAS-P-GLASSES      PIC 9(03)      VALUE ZERO  . 
           05 SQL-CLAS-MOLAR          PIC 9(03)      VALUE ZERO  . 
           05 SQL-CLAS-NON-MOLAR      PIC 9(03)      VALUE ZERO  . 
           05 SQL-CLAS-DESCALINGS     PIC 9(03)      VALUE ZERO  . 

      * CURSEUR POUR RECUPERER LES COUTS DU CONTRAT ALLEGE
       01  CURS-COUT.
           05 SQL-COUT-LABEL          PIC X(12)      VALUE SPACE .
           05 SQL-COUT-AGEMIN         PIC 9(02)      VALUE ZERO  .  
           05 SQL-COUT-AGEMAX         PIC 9(02)      VALUE ZERO  . 
           05 SQL-COUT-COST           PIC 9(03)      VALUE ZERO  .
           05 SQL-COUT-CHILDREN       PIC 9(03)      VALUE ZERO  .           

      * VARIABLES POUR PREPARER L'INSERT
       01  SQL-MAX                    PIC X(10)      VALUE SPACES.
       01  SQL-REIMBURSEMENT-NUM      PIC X(10)      VALUE SPACES.
       01  SQL-REIMBURSEMENT-COST     PIC 9(05)      VALUE ZERO  .       
       01  SQL-SECU                   PIC 9(15)      VALUE ZERO  .       
      * Gestion de la date système
       01  SQL-CDATE.
           05 SQL-CSIECLE             PIC X(02)      VALUE SPACES.       
           05 SQL-CYEAR               PIC X(02)      VALUE SPACES.
           05 SQL-CMOUNTH             PIC X(02)      VALUE SPACES.
           05 SQL-CDAY                PIC X(02)      VALUE SPACES.
OCESQL*EXEC SQL END DECLARE SECTION END-EXEC                     . 
OCESQL*EXEC SQL INCLUDE SQLCA END-EXEC                           .
OCESQL     copy "sqlca.cbl".
      ******************************************************************
OCESQL*
OCESQL 01  SQ0001.
OCESQL     02  FILLER PIC X(014) VALUE "DISCONNECT ALL".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
OCESQL 01  SQ0002.
OCESQL     02  FILLER PIC X(256) VALUE "SELECT CLASSIC_REIMBURSEMENT_L"
OCESQL  &  "ABEL, CLASSIC_REIMBURSEMENT_DOCTOR, CLASSIC_REIMBURSEMENT_"
OCESQL  &  "PARMEDICAL, CLASSIC_REIMBURSEMENT_HOSPITAL, CLASSIC_REIMBU"
OCESQL  &  "RSEMENT_SINGLE_GLASSES, CLASSIC_REIMBURSEMENT_PROGRESSIVE_"
OCESQL  &  "GLASSES, CLASSIC_REIMBURSEMENT_MOLAR_CROWNS, CLASSIC".
OCESQL     02  FILLER PIC X(130) VALUE "_REIMBURSEMENT_NON_MOLAR_CROWN"
OCESQL  &  "S, CLASSIC_REIMBURSEMENT_DESCALINGS FROM CLASSIC_REIMBURSE"
OCESQL  &  "MENT ORDER BY CLASSIC_REIMBURSEMENT_NUMBER".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
OCESQL 01  SQ0003.
OCESQL     02  FILLER PIC X(256) VALUE "SELECT cr.CLASSIC_REIMBURSEMEN"
OCESQL  &  "T_LABEL, cc.COST_CONDITION_AGEMIN, cc.COST_CONDITION_AGEMA"
OCESQL  &  "X, cc.COST_CONDITION_COST, (SELECT c2.COST_CONDITION_COST "
OCESQL  &  "FROM COST_CONDITION as c2 WHERE c2.COST_CONDITION_TYPE = '"
OCESQL  &  "1' AND c2.CLASSIC_REIMBURSEMENT_NUMBER = 1) FROM CLA".
OCESQL     02  FILLER PIC X(243) VALUE "SSIC_REIMBURSEMENT as cr INNER"
OCESQL  &  " JOIN COST_CONDITION as cc ON cr.CLASSIC_REIMBURSEMENT_NUM"
OCESQL  &  "BER = cc.CLASSIC_REIMBURSEMENT_NUMBER WHERE cc.COST_CONDIT"
OCESQL  &  "ION_TYPE = '2' AND cc.COST_CONDITION_COUPLE = False AND cr"
OCESQL  &  ".CLASSIC_REIMBURSEMENT_LABEL = 'ALLEGE'".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
OCESQL 01  SQ0004.
OCESQL     02  FILLER PIC X(256) VALUE "INSERT INTO CUSTOMER_REIMBURSE"
OCESQL  &  "MENT (UUID_CUSTOMER, REIMBURSEMENT_NUM, REIMBURSEMENT_CREA"
OCESQL  &  "TE_DATE, REIMBURSEMENT_COST, REIMBURSEMENT_DOCTOR, REIMBUR"
OCESQL  &  "SEMENT_PARMEDICAL, REIMBURSEMENT_HOSPITAL, REIMBURSEMENT_S"
OCESQL  &  "INGLE_GLASSES, REIMBURSEMENT_PROGRESSIVE_GLASSES, RE".
OCESQL     02  FILLER PIC X(217) VALUE "IMBURSEMENT_MOLAR_CROWNS, REIM"
OCESQL  &  "BURSEMENT_DESCALINGS, REIMBURSEMENT_NON_MOLAR_CROWNS) VALU"
OCESQL  &  "ES ((SELECT UUID_CUSTOMER FROM CUSTOMER WHERE CUSTOMER_COD"
OCESQL  &  "E_SECU = $1 ), $2, CURRENT_DATE, $3, $4, $5, $6, $7, $8, $"
OCESQL  &  "9, $10, $11 )".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
OCESQL 01  SQ0005.
OCESQL     02  FILLER PIC X(118) VALUE "SELECT MAX(REIMBURSEMENT_NUM) "
OCESQL  &  "as MAX FROM CUSTOMER_REIMBURSEMENT WHERE REIMBURSEMENT_NUM"
OCESQL  &  " LIKE 'SPE' || $1 || $2 || '%'".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
       LINKAGE SECTION.
       01 LK-CUSTOMER.
           03 LK-CUS-UUID             PIC X(36).
           03 LK-CUS-GENDER           PIC X(10).
           03 LK-CUS-LASTNAME         PIC X(20).
           03 LK-CUS-FIRSTNAME        PIC X(20).
           03 LK-CUS-ADRESS1	        PIC X(50).
           03 LK-CUS-ADRESS2	        PIC X(50).
           03 LK-CUS-ZIPCODE	        PIC X(15).
           03 LK-CUS-TOWN             PIC X(30).
           03 LK-CUS-COUNTRY	        PIC X(20).
           03 LK-CUS-PHONE	           PIC X(10).
           03 LK-CUS-MAIL	           PIC X(50).
           03 LK-CUS-BIRTH-DATE       PIC X(10).
           03  WS-BIRTH REDEFINES LK-CUS-BIRTH-DATE              .
              05 WS-YEAR              PIC 9(04)                  .
              05 FILLER               PIC X(01)      VALUE '-'   .     
              05 WS-MOUNTH            PIC 9(02)                  .
              05 FILLER               PIC X(01)      VALUE '-'   .           
              05 WS-DAY               PIC 9(02)                  .           
           03 LK-CUS-DOCTOR	        PIC X(20).
           03 LK-CUS-CODE-SECU        PIC 9(15).
           03 LK-CUS-CODE-IBAN        PIC X(34).
           03 LK-CUS-NBCHILDREN       PIC 9(03).
           03 LK-CUS-COUPLE           PIC X(05).
           03 LK-CUS-CREATE-DATE      PIC X(10).
           03 LK-CUS-UPDATE-DATE      PIC X(10).
           03 LK-CUS-CLOSE-DATE       PIC X(10).
           03 LK-CUS-ACTIVE	        PIC X(01).

      ******************************************************************
       SCREEN SECTION.
           COPY 'screen-specific-contract.cpy'.   

      ******************************************************************

       PROCEDURE DIVISION USING LK-CUSTOMER.
      ****************************************************************** 
      * [IM]- le 13-06-2024                                            *
      *    Le paragraphe affiche la screen, contrôle la saisie ,       *
      *    enreigstre le choix et appelle le programme menu contrat    *
      ****************************************************************** 
       0000-START-MAIN. 
           INITIALIZE SC-BUTTON 
                      SC-BUTTON-VALUE
                      SC-MESSAGE .                      

           PERFORM 1000-SCREEN-LOOP-START THRU END-1000-SCREEN-LOOP.
       END-0000-MAIN.
           GOBACK.
      ******************************************************************
 
      ******************************************************************    
      *    [IM] - le 05-06-2024                                        *
      *    Pour permettre de boucler sur l'affichage en cas d'erreur   *
      *    de saisie de l'utilisateur                                  *
      ****************************************************************** 
       1000-SCREEN-LOOP-START. 
           PERFORM 1100-PREPARE-SCREEN-START 
                    THRU END-1100-PREPARE-SCREEN.     
           PERFORM UNTIL WS-SELECT-OPTION = 'TRUE'            
              ACCEPT SCREEN-SPECIFIC-CONTRACT  
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
           STRING FUNCTION TRIM (LK-CUS-FIRSTNAME)
                  SPACE 
                  FUNCTION TRIM (LK-CUS-LASTNAME)
                  SPACE 
                  LK-CUS-CODE-SECU(1:1) '-' 
                  LK-CUS-CODE-SECU(2:2) '-'
                  LK-CUS-CODE-SECU(4:2) '-'
                  LK-CUS-CODE-SECU(6:2) '-'
                  LK-CUS-CODE-SECU(8:3) '-'
                  LK-CUS-CODE-SECU(11:3) '-'
                  LK-CUS-CODE-SECU(14:2)  
           DELIMITED BY SIZE 
           INTO WS-CUSTOMER.  
           PERFORM 1200-SQL-CONNECTION-START
                 THRU END-1200-SQL-CONNECTION.
           PERFORM 1400-PREPARE-CRS-CLASSIC-SCREEN-START
                 THRU END-1400-PREPARE-CRS-CLASSIC-SCREEN. 
           PERFORM 1450-PREPARE-CRS-COUT-START
                 THRU END-1450-PREPARE-CRS-COUT.        
           PERFORM 1300-SQL-DISCONNECTION-START
                 THRU END-1300-SQL-DISCONNECTION.           
       END-1100-PREPARE-SCREEN.
           EXIT.

       1200-SQL-CONNECTION-START.
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
       END-1200-SQL-CONNECTION.
           EXIT.
       1300-SQL-DISCONNECTION-START.
OCESQL*    EXEC SQL DISCONNECT ALL END-EXEC.
OCESQL     CALL "OCESQLDisconnect" USING
OCESQL          BY REFERENCE SQLCA
OCESQL     END-CALL.
           IF  SQLCODE NOT = ZERO 
              MOVE 'DISCONNECTION BASE' TO WS-SQL-LIB 
              PERFORM 9020-SQL-ERROR-START
                   THRU END-9020-SQL-ERROR
           END-IF.          
       END-1300-SQL-DISCONNECTION.
           EXIT.

       1400-PREPARE-CRS-CLASSIC-SCREEN-START.
OCESQL*    EXEC SQL 
OCESQL*       DECLARE CRSCLASSIC CURSOR FOR
OCESQL*          SELECT   CLASSIC_REIMBURSEMENT_LABEL,
OCESQL*                   CLASSIC_REIMBURSEMENT_DOCTOR,
OCESQL*                   CLASSIC_REIMBURSEMENT_PARMEDICAL,
OCESQL*                   CLASSIC_REIMBURSEMENT_HOSPITAL,
OCESQL*                   CLASSIC_REIMBURSEMENT_SINGLE_GLASSES,
OCESQL*                   CLASSIC_REIMBURSEMENT_PROGRESSIVE_GLASSES,
OCESQL*                   CLASSIC_REIMBURSEMENT_MOLAR_CROWNS,
OCESQL*                   CLASSIC_REIMBURSEMENT_NON_MOLAR_CROWNS,
OCESQL*                   CLASSIC_REIMBURSEMENT_DESCALINGS
OCESQL*          FROM CLASSIC_REIMBURSEMENT 
OCESQL*          ORDER BY CLASSIC_REIMBURSEMENT_NUMBER     
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLCursorDeclare" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "speccont_CRSCLASSIC" & x"00"
OCESQL          BY REFERENCE SQ0002
OCESQL     END-CALL.
           IF  SQLCODE NOT = ZERO 
              MOVE 'DECLARATION CRS-CLASSIC' TO WS-SQL-LIB 
              PERFORM 9020-SQL-ERROR-START
                   THRU END-9020-SQL-ERROR
           END-IF.   
OCESQL*    EXEC SQL
OCESQL*       OPEN CRSCLASSIC
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLCursorOpen" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "speccont_CRSCLASSIC" & x"00"
OCESQL     END-CALL.
           IF  SQLCODE NOT = ZERO 
              MOVE 'OUVERTURE CRS-CLASSIC' TO WS-SQL-LIB 
              PERFORM 9020-SQL-ERROR-START
                   THRU END-9020-SQL-ERROR
           END-IF.

           PERFORM 1500-CRS-CLASSIC-READ-START 
                 THRU END-1500-CRS-CLASSIC-READ.
           
OCESQL*    EXEC SQL
OCESQL*       CLOSE CRSCLASSIC
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLCursorClose"  USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "speccont_CRSCLASSIC" & x"00"
OCESQL     END-CALL
OCESQL    .
           IF  SQLCODE NOT = ZERO 
              MOVE 'FERMETURE CRS-CLASSIC' TO WS-SQL-LIB 
              PERFORM 9020-SQL-ERROR-START
                   THRU END-9020-SQL-ERROR
           END-IF.
       END-1400-PREPARE-CRS-CLASSIC-SCREEN.
           EXIT.

       1450-PREPARE-CRS-COUT-START.
OCESQL*    EXEC SQL 
OCESQL*       DECLARE CRSCOUT CURSOR FOR
OCESQL*          SELECT   cr.CLASSIC_REIMBURSEMENT_LABEL,
OCESQL*                   cc.COST_CONDITION_AGEMIN,
OCESQL*                   cc.COST_CONDITION_AGEMAX,
OCESQL*                   cc.COST_CONDITION_COST,
OCESQL*                   (SELECT c2.COST_CONDITION_COST 
OCESQL*                   FROM COST_CONDITION as c2
OCESQL*                   WHERE c2.COST_CONDITION_TYPE = '1'
OCESQL*                   AND c2.CLASSIC_REIMBURSEMENT_NUMBER = 1)
OCESQL*          FROM CLASSIC_REIMBURSEMENT as cr 
OCESQL*          INNER JOIN COST_CONDITION as cc
OCESQL*          ON  cr.CLASSIC_REIMBURSEMENT_NUMBER 
OCESQL*              =  cc.CLASSIC_REIMBURSEMENT_NUMBER 
OCESQL*          WHERE cc.COST_CONDITION_TYPE ='2'
OCESQL*          AND cc.COST_CONDITION_COUPLE = False 
OCESQL*          AND cr.CLASSIC_REIMBURSEMENT_LABEL = 'ALLEGE'                  
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLCursorDeclare" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "speccont_CRSCOUT" & x"00"
OCESQL          BY REFERENCE SQ0003
OCESQL     END-CALL.
           IF  SQLCODE NOT = ZERO 
              MOVE 'DECLARATION CRS-COUT' TO WS-SQL-LIB 
              PERFORM 9020-SQL-ERROR-START
                   THRU END-9020-SQL-ERROR
           END-IF.   
OCESQL*    EXEC SQL
OCESQL*       OPEN CRSCOUT
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLCursorOpen" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "speccont_CRSCOUT" & x"00"
OCESQL     END-CALL.
           IF  SQLCODE NOT = ZERO 
              MOVE 'OUVERTURE CRS-COUT' TO WS-SQL-LIB 
              PERFORM 9020-SQL-ERROR-START
                   THRU END-9020-SQL-ERROR
           END-IF.

               PERFORM 1550-CRS-COUT-READ-START 
                       THRU END-1550-CRS-COUT-READ.
           
OCESQL*    EXEC SQL
OCESQL*       CLOSE CRSCOUT
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLCursorClose"  USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "speccont_CRSCOUT" & x"00"
OCESQL     END-CALL
OCESQL    .
           IF  SQLCODE NOT = ZERO 
              MOVE 'FERMETURE CRS-COUT' TO WS-SQL-LIB 
              PERFORM 9020-SQL-ERROR-START
                   THRU END-9020-SQL-ERROR
           END-IF.
       END-1450-PREPARE-CRS-COUT.
           EXIT. 

       1500-CRS-CLASSIC-READ-START.
OCESQL*    EXEC SQL 
OCESQL*       FETCH CRSCLASSIC 
OCESQL*       INTO 
OCESQL*       :SQL-CLAS-LABEL, :SQL-CLAS-DOCTOR,
OCESQL*       :SQL-CLAS-PARMEDICAL, :SQL-CLAS-HOSPITAL,
OCESQL*       :SQL-CLAS-S-GLASSES, :SQL-CLAS-P-GLASSES, :SQL-CLAS-MOLAR,
OCESQL*       :SQL-CLAS-NON-MOLAR,:SQL-CLAS-DESCALINGS     
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 12
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CLAS-LABEL
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CLAS-DOCTOR
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CLAS-PARMEDICAL
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CLAS-HOSPITAL
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CLAS-S-GLASSES
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CLAS-P-GLASSES
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CLAS-MOLAR
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CLAS-NON-MOLAR
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CLAS-DESCALINGS
OCESQL     END-CALL
OCESQL     CALL "OCESQLCursorFetchOne" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "speccont_CRSCLASSIC" & x"00"
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL.
           IF  (SQLCODE NOT = ZERO) AND (SQLCODE NOT = FIN) THEN
              MOVE 'LECTURE CRS-CLASSIC' TO WS-SQL-LIB 
              PERFORM 9020-SQL-ERROR-START
                   THRU END-9020-SQL-ERROR
           END-IF.

           PERFORM UNTIL SQLCODE = FIN 
              PERFORM 1600-CHARGE-CRS-CLASSIC-SCREEN-START 
                       THRU END-1600-CHARGE-CRS-CLASSIC-SCREEN

OCESQL*    EXEC SQL 
OCESQL*          FETCH CRSCLASSIC
OCESQL*          INTO 
OCESQL*             :SQL-CLAS-LABEL, :SQL-CLAS-DOCTOR,
OCESQL*             :SQL-CLAS-PARMEDICAL, :SQL-CLAS-HOSPITAL,
OCESQL*             :SQL-CLAS-S-GLASSES, :SQL-CLAS-P-GLASSES, 
OCESQL*             :SQL-CLAS-MOLAR,:SQL-CLAS-NON-MOLAR,
OCESQL*             :SQL-CLAS-DESCALINGS     
OCESQL*    END-EXEC
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 12
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CLAS-LABEL
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CLAS-DOCTOR
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CLAS-PARMEDICAL
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CLAS-HOSPITAL
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CLAS-S-GLASSES
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CLAS-P-GLASSES
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CLAS-MOLAR
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CLAS-NON-MOLAR
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CLAS-DESCALINGS
OCESQL     END-CALL
OCESQL     CALL "OCESQLCursorFetchOne" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "speccont_CRSCLASSIC" & x"00"
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL
              IF  (SQLCODE NOT = ZERO) AND (SQLCODE NOT = FIN) THEN
                 MOVE 'LECTURE SUIVANTE CRS-CLASSIC' TO WS-SQL-LIB 
                 PERFORM 9020-SQL-ERROR-START
                       THRU END-9020-SQL-ERROR
              END-IF
           END-PERFORM.    
       END-1500-CRS-CLASSIC-READ.
           EXIT.
       
       1550-CRS-COUT-READ-START. 
OCESQL*    EXEC SQL 
OCESQL*       FETCH CRSCOUT 
OCESQL*       INTO 
OCESQL*       :SQL-COUT-LABEL, :SQL-COUT-AGEMIN, :SQL-COUT-AGEMAX,
OCESQL*       :SQL-COUT-COST, :SQL-COUT-CHILDREN    
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 12
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-COUT-LABEL
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 2
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-COUT-AGEMIN
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 2
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-COUT-AGEMAX
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-COUT-COST
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-COUT-CHILDREN
OCESQL     END-CALL
OCESQL     CALL "OCESQLCursorFetchOne" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "speccont_CRSCOUT" & x"00"
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL.
           IF  (SQLCODE NOT = ZERO) AND (SQLCODE NOT = FIN) THEN
              MOVE 'LECTURE CRS-COUT' TO WS-SQL-LIB 
              PERFORM 9020-SQL-ERROR-START
                   THRU END-9020-SQL-ERROR
           END-IF.

           PERFORM UNTIL SQLCODE = FIN 
              PERFORM 1650-CHARGE-COUT-START 
                       THRU END-1650-CHARGE-COUT

OCESQL*    EXEC SQL 
OCESQL*          FETCH CRSCOUT
OCESQL*          INTO 
OCESQL*             :SQL-COUT-LABEL, :SQL-COUT-AGEMIN, :SQL-COUT-AGEMAX,
OCESQL*             :SQL-COUT-COST, :SQL-COUT-CHILDREN     
OCESQL*    END-EXEC
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 12
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-COUT-LABEL
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 2
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-COUT-AGEMIN
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 2
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-COUT-AGEMAX
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-COUT-COST
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-COUT-CHILDREN
OCESQL     END-CALL
OCESQL     CALL "OCESQLCursorFetchOne" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "speccont_CRSCOUT" & x"00"
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL
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
 
       1650-CHARGE-COUT-START.
           IF (SQL-COUT-AGEMIN EQUAL 30) THEN
               MOVE SQL-COUT-COST TO WS-ALLEGE-COST
           ELSE
               IF (SQL-COUT-AGEMAX EQUAL 30) THEN
                   MOVE SQL-COUT-COST TO WS-ALLEGE-COST-30  
               ELSE
                   MOVE SQL-COUT-COST TO WS-ALLEGE-COST-65                    
               END-IF         
           END-IF.
           MOVE SQL-COUT-CHILDREN TO WS-CHILDREN-COST.   
       END-1650-CHARGE-COUT.
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
           ELSE IF FUNCTION UPPER-CASE(SC-BUTTON-CHOICE-VALIDATE) 
                 EQUAL 'O' THEN
      *             Vérifie si toutes les prestations ont un choix           
                    IF ((FUNCTION UPPER-CASE(SC-VALUE-MEDIC-1) 
                       EQUAL 'O') OR 
                       (FUNCTION UPPER-CASE(SC-VALUE-MEDIC-2) 
                       EQUAL 'O') OR 
                       (FUNCTION UPPER-CASE(SC-VALUE-MEDIC-3) 
                       EQUAL 'O')) 
                    AND ((FUNCTION UPPER-CASE(SC-VALUE-PARAMEDIC-1) 
                       EQUAL 'O') OR 
                       (FUNCTION UPPER-CASE(SC-VALUE-PARAMEDIC-2) 
                       EQUAL 'O') OR 
                       (FUNCTION UPPER-CASE(SC-VALUE-PARAMEDIC-3) 
                       EQUAL 'O')) 
                    AND ((FUNCTION UPPER-CASE(SC-VALUE-HOSPITAL-1) 
                       EQUAL 'O') OR 
                       (FUNCTION UPPER-CASE(SC-VALUE-HOSPITAL-2) 
                       EQUAL 'O') OR 
                       (FUNCTION UPPER-CASE(SC-VALUE-HOSPITAL-3) 
                       EQUAL 'O')) 
                    AND ((FUNCTION UPPER-CASE(SC-VALUE-S-GLASSES-1) 
                       EQUAL 'O') OR 
                       (FUNCTION UPPER-CASE(SC-VALUE-S-GLASSES-2) 
                       EQUAL 'O') OR 
                       (FUNCTION UPPER-CASE(SC-VALUE-S-GLASSES-3) 
                       EQUAL 'O')) 
                    AND ((FUNCTION UPPER-CASE(SC-VALUE-P-GLASSES-1) 
                       EQUAL 'O') OR 
                       (FUNCTION UPPER-CASE(SC-VALUE-P-GLASSES-2) 
                       EQUAL 'O') OR 
                       (FUNCTION UPPER-CASE(SC-VALUE-P-GLASSES-3) 
                       EQUAL 'O'))
                    AND ((FUNCTION UPPER-CASE(SC-VALUE-MOLAR-1) 
                       EQUAL 'O') OR 
                       (FUNCTION UPPER-CASE(SC-VALUE-MOLAR-2) 
                       EQUAL 'O') OR 
                       (FUNCTION UPPER-CASE(SC-VALUE-MOLAR-3) 
                       EQUAL 'O'))
                    AND ((FUNCTION UPPER-CASE(SC-VALUE-NON-MOLAR-1) 
                       EQUAL 'O') OR 
                       (FUNCTION UPPER-CASE(SC-VALUE-NON-MOLAR-2) 
                       EQUAL 'O') OR 
                       (FUNCTION UPPER-CASE(SC-VALUE-NON-MOLAR-3) 
                       EQUAL 'O'))
                    AND ((FUNCTION UPPER-CASE(SC-VALUE-DESCALINGS-1) 
                       EQUAL 'O') OR 
                       (FUNCTION UPPER-CASE(SC-VALUE-DESCALINGS-2) 
                       EQUAL 'O') OR 
                       (FUNCTION UPPER-CASE(SC-VALUE-DESCALINGS-3) 
                       EQUAL 'O'))        
                 THEN
      *          c'est le cas, je complète le contrôle de la sélection
                    PERFORM 6130-VALIDE-CHOICE-START 
                             THRU END-6130-VALIDE-CHOICE
      *          Si OK, je calcule le coût de la sélection
                    IF WS-CHOICE-OK THEN          
                          PERFORM 6125-CALC-CONTRACT-COST-START
                                   THRU  END-6125-CALC-CONTRACT-COST
      *          et je vérifie si la validation contrat a été demandée
                          IF (FUNCTION UPPER-CASE(
                                SC-BUTTON-CONT-VALIDATE) EQUAL 'O') THEN 
      *          alors j'enregistre dans la table.
                             MOVE 'True' TO WS-SELECT-OPTION
                             PERFORM 1200-SQL-CONNECTION-START
                                   THRU END-1200-SQL-CONNECTION                             
                             PERFORM 6100-SQL-INSERT-START
                                      THRU END-6100-SQL-INSERT                                       
                             PERFORM 1300-SQL-DISCONNECTION-START
                                   THRU END-1300-SQL-DISCONNECTION 
                             CALL 'menucont' USING CONTENT LK-CUSTOMER          
                          END-IF
                    ELSE
      *             Il y a des doublons dans le choix de prestation
                       PERFORM 9220-ERROR-MESSAGE-START 
                                THRU END-9220-ERROR-MESSAGE                              
                    END-IF                 
                 ELSE 
      *             Il manque au moins une prestation dans le choix
                    PERFORM 9210-ERROR-MESSAGE-START 
                                THRU END-9210-ERROR-MESSAGE   
                 END-IF      
           ELSE 
      *       D'abord valider le choix avant d'aller plus loin                 
              PERFORM 9200-ERROR-MESSAGE-START 
                 THRU END-9200-ERROR-MESSAGE
           END-IF.                          
       END-3000-WITCH-CHOICE.
           EXIT.

      ******************************************************************    
      *    [IM] - le 14-06-2024                                        *
      *    Si confirmation du contrat spécifique et que choix des pres-*
      *    tations valide, on crée directement l'enregistrement dans la*
      *    table                                                       *
      ****************************************************************** 
       6100-SQL-INSERT-START. 
      * [IM] récupère année et mois 
           MOVE FUNCTION CURRENT-DATE(1:8) TO SQL-CDATE. 
           MOVE LK-CUS-CODE-SECU TO SQL-SECU.  
           PERFORM 6120-PREPARE-SQL-VARIABLE-START
                 THRU END-6120-PREPARE-SQL-VARIABLE.
OCESQL*    EXEC SQL
OCESQL*          INSERT INTO CUSTOMER_REIMBURSEMENT
OCESQL*          (UUID_CUSTOMER, REIMBURSEMENT_NUM,  
OCESQL*          REIMBURSEMENT_CREATE_DATE, REIMBURSEMENT_COST, 
OCESQL*          REIMBURSEMENT_DOCTOR, REIMBURSEMENT_PARMEDICAL,
OCESQL*          REIMBURSEMENT_HOSPITAL, REIMBURSEMENT_SINGLE_GLASSES, 
OCESQL*          REIMBURSEMENT_PROGRESSIVE_GLASSES, 
OCESQL*          REIMBURSEMENT_MOLAR_CROWNS, REIMBURSEMENT_DESCALINGS,
OCESQL*          REIMBURSEMENT_NON_MOLAR_CROWNS)
OCESQL*          VALUES 
OCESQL*          ((SELECT UUID_CUSTOMER FROM CUSTOMER 
OCESQL*             WHERE CUSTOMER_CODE_SECU = :SQL-SECU), 
OCESQL*             :SQL-REIMBURSEMENT-NUM, CURRENT_DATE,
OCESQL*             :SQL-REIMBURSEMENT-COST, 
OCESQL*             :SQL-CLAS-DOCTOR, :SQL-CLAS-PARMEDICAL,
OCESQL*             :SQL-CLAS-HOSPITAL, :SQL-CLAS-S-GLASSES,
OCESQL*             :SQL-CLAS-P-GLASSES, :SQL-CLAS-MOLAR,
OCESQL*             :SQL-CLAS-DESCALINGS,:SQL-CLAS-NON-MOLAR                     
OCESQL*          )
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 15
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-SECU
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-REIMBURSEMENT-NUM
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 5
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-REIMBURSEMENT-COST
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CLAS-DOCTOR
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CLAS-PARMEDICAL
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CLAS-HOSPITAL
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CLAS-S-GLASSES
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CLAS-P-GLASSES
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CLAS-MOLAR
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CLAS-DESCALINGS
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CLAS-NON-MOLAR
OCESQL     END-CALL
OCESQL     CALL "OCESQLExecParams" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE SQ0004
OCESQL          BY VALUE 11
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL.
           IF  SQLCODE NOT = ZERO 
                 MOVE 'INSERT CUSTOMER_REIMBURSEMENT' TO WS-SQL-LIB                     
                 PERFORM 9020-SQL-ERROR-START THRU END-9020-SQL-ERROR                
           END-IF.
OCESQL*    EXEC SQL COMMIT WORK END-EXEC. 
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLExec" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "COMMIT" & x"00"
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL.
       END-6100-SQL-INSERT.
           EXIT. 
       
      ****************************************************************** 
      * [IM] récupère le numéro de contrat max pour le type ALLEGE     *
      *    et fait plus 1 sur le max pour créer le numéro à inserrer   *
      ******************************************************************
       6120-PREPARE-SQL-VARIABLE-START.
OCESQL*    EXEC SQL 
OCESQL*        SELECT MAX(REIMBURSEMENT_NUM) as MAX
OCESQL*        INTO :SQL-MAX                   
OCESQL*        FROM CUSTOMER_REIMBURSEMENT
OCESQL*        WHERE REIMBURSEMENT_NUM LIKE 'SPE'||:SQL-CYEAR||
OCESQL*             :SQL-CMOUNTH||'%'
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-MAX
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 2
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CYEAR
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 2
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CMOUNTH
OCESQL     END-CALL
OCESQL     CALL "OCESQLExecSelectIntoOne" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE SQ0005
OCESQL          BY VALUE 2
OCESQL          BY VALUE 1
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL.
           IF  (SQLCODE NOT = ZERO) AND (SQLCODE NOT EQUAL FIN) THEN  
               MOVE 'RECHERCHE MAX REIMBURSEMENT_NUM - SPECIFIQUE' 
                       TO WS-SQL-LIB                     
               PERFORM 9020-SQL-ERROR-START THRU END-9020-SQL-ERROR                
           END-IF.
           IF (SQLCODE NOT EQUAL FIN) THEN
               MOVE FUNCTION NUMVAL(SQL-MAX(8:3)) TO WS-NUM
           END-IF.
           ADD 1 TO WS-NUM.
           STRING 'SPE' SQL-CYEAR SQL-CMOUNTH WS-NUM DELIMITED BY SIZE
           INTO SQL-REIMBURSEMENT-NUM.      
       END-6120-PREPARE-SQL-VARIABLE.
           EXIT.   

      ****************************************************************** 
      * [IM] Calcul le cout du contrat en fonction de l'âge et des     *
      *    enfants à charge. Affichage                                 *
      ******************************************************************
       6125-CALC-CONTRACT-COST-START.
      *     INITIALIZE WS-CHILDREN-TOTAL WS-NBCHILDREN.
           MOVE LK-CUS-NBCHILDREN TO WS-NBCHILDREN.  
           PERFORM 6135-CALC-CUSTOMER-AGE-START 
                    THRU END-6135-CALC-CUSTOMER-AGE. 
      * [IM] Au cout des choix, j'ajoute le prix en fonction de l'age           
           IF (WS-AGE < 30) THEN
               ADD WS-ALLEGE-COST-30 TO SQL-REIMBURSEMENT-COST
               GIVING SQL-REIMBURSEMENT-COST
           ELSE IF (WS-AGE > 65) THEN
                    ADD WS-ALLEGE-COST-65 TO SQL-REIMBURSEMENT-COST
                    GIVING SQL-REIMBURSEMENT-COST                   
                ELSE 
                    ADD WS-ALLEGE-COST TO SQL-REIMBURSEMENT-COST
                    GIVING SQL-REIMBURSEMENT-COST
                END-IF                             
           END-IF.        
      * [IM] Gestion du nombre d'enfants pour calculer le coût 
           MULTIPLY WS-NBCHILDREN BY WS-CHILDREN-COST
                    GIVING WS-CHILDREN-TOTAL.
           ADD WS-CHILDREN-TOTAL TO SQL-REIMBURSEMENT-COST
           GIVING SQL-REIMBURSEMENT-COST. 
      * [IM] Je charge la zone d'affichage avec le résultat     
           MOVE SQL-REIMBURSEMENT-COST TO SC-CONTRACT-COST.
       END-6125-CALC-CONTRACT-COST.
           EXIT.
 
      ****************************************************************** 
      * [IM] Contrôle qu'il n'y a qu'un choix par prestation           *
      *    Si oui on profite pour charger les variables sql et calculer*
      *    l'impact des modifications sur le prix du contrat           *
      ******************************************************************      
       6130-VALIDE-CHOICE-START. 
           PERFORM 8100-INITIALIZE-SQL-START
                                THRU END-8100-INITIALIZE-SQL.
      *    Contrôle de la prestation honoraire médecin     
           IF (FUNCTION UPPER-CASE(SC-VALUE-MEDIC-1) EQUAL 'O') THEN
              MOVE WS-ALLEGE-DOCTOR TO SQL-CLAS-DOCTOR
              ADD 1 TO WS-CHOICE-NB
           END-IF.
           IF (FUNCTION UPPER-CASE(SC-VALUE-MEDIC-2) EQUAL 'O') THEN
              MOVE WS-MODERE-DOCTOR TO SQL-CLAS-DOCTOR
              ADD 2 TO SQL-REIMBURSEMENT-COST
              ADD 1 TO WS-CHOICE-NB
           END-IF.     
           IF (FUNCTION UPPER-CASE(SC-VALUE-MEDIC-3) EQUAL 'O') THEN
              MOVE WS-EXCELL-DOCTOR TO SQL-CLAS-DOCTOR
              ADD 4 TO SQL-REIMBURSEMENT-COST
              ADD 1 TO WS-CHOICE-NB
           END-IF. 
      *    Contrôle de la prestation paramédical              
           IF (FUNCTION UPPER-CASE(SC-VALUE-PARAMEDIC-1) EQUAL 'O') THEN 
              MOVE WS-ALLEGE-PARMEDICAL TO SQL-CLAS-PARMEDICAL
              ADD 1 TO WS-CHOICE-NB
           END-IF.            
           IF (FUNCTION UPPER-CASE(SC-VALUE-PARAMEDIC-2) EQUAL 'O') THEN 
              MOVE WS-MODERE-PARMEDICAL TO SQL-CLAS-PARMEDICAL
              ADD 2 TO SQL-REIMBURSEMENT-COST
              ADD 1 TO WS-CHOICE-NB           
           END-IF.            
           IF (FUNCTION UPPER-CASE(SC-VALUE-PARAMEDIC-3) EQUAL 'O') THEN
              MOVE WS-EXCELL-PARMEDICAL TO SQL-CLAS-PARMEDICAL
              ADD 4 TO SQL-REIMBURSEMENT-COST
              ADD 1 TO WS-CHOICE-NB
           END-IF.             
      *    Contrôle de la prestation hôpital                  
           IF (FUNCTION UPPER-CASE(SC-VALUE-HOSPITAL-1) EQUAL 'O') THEN
              MOVE WS-ALLEGE-HOSPITAL TO SQL-CLAS-HOSPITAL
              ADD 1 TO WS-CHOICE-NB
           END-IF.            
           IF (FUNCTION UPPER-CASE(SC-VALUE-HOSPITAL-2) EQUAL 'O') THEN
              MOVE WS-MODERE-HOSPITAL TO SQL-CLAS-HOSPITAL
              ADD 2 TO SQL-REIMBURSEMENT-COST
              ADD 1 TO WS-CHOICE-NB
           END-IF.             
           IF (FUNCTION UPPER-CASE(SC-VALUE-HOSPITAL-3) EQUAL 'O') THEN
              MOVE WS-EXCELL-HOSPITAL TO SQL-CLAS-HOSPITAL
              ADD 4 TO SQL-REIMBURSEMENT-COST
              ADD 1 TO WS-CHOICE-NB
           END-IF.             
      *    Contrôle de la prestation verre simple                 
           IF (FUNCTION UPPER-CASE(SC-VALUE-S-GLASSES-1) EQUAL 'O') THEN                    
              MOVE WS-ALLEGE-S-GLASSES TO SQL-CLAS-S-GLASSES
              ADD 1 TO WS-CHOICE-NB
           END-IF.  
           IF (FUNCTION UPPER-CASE(SC-VALUE-S-GLASSES-2) EQUAL 'O') THEN
              MOVE WS-MODERE-S-GLASSES TO SQL-CLAS-S-GLASSES
              ADD 2 TO SQL-REIMBURSEMENT-COST
              ADD 1 TO WS-CHOICE-NB
           END-IF.             
           IF (FUNCTION UPPER-CASE(SC-VALUE-S-GLASSES-3) EQUAL 'O') THEN
              MOVE WS-EXCELL-S-GLASSES TO SQL-CLAS-S-GLASSES
              ADD 4 TO SQL-REIMBURSEMENT-COST
              ADD 1 TO WS-CHOICE-NB
           END-IF.            
      *    Contrôle de la prestation verre progressif                
           IF (FUNCTION UPPER-CASE(SC-VALUE-P-GLASSES-1) EQUAL 'O') THEN
              MOVE WS-ALLEGE-P-GLASSES TO SQL-CLAS-P-GLASSES
              ADD 1 TO WS-CHOICE-NB
           END-IF.             
           IF (FUNCTION UPPER-CASE(SC-VALUE-P-GLASSES-2) EQUAL 'O') THEN
              MOVE WS-MODERE-P-GLASSES TO SQL-CLAS-P-GLASSES
              ADD 2 TO SQL-REIMBURSEMENT-COST
              ADD 1 TO WS-CHOICE-NB
           END-IF.             
           IF (FUNCTION UPPER-CASE(SC-VALUE-P-GLASSES-3) EQUAL 'O') THEN
              MOVE WS-EXCELL-P-GLASSES TO SQL-CLAS-P-GLASSES
              ADD 4 TO SQL-REIMBURSEMENT-COST
              ADD 1 TO WS-CHOICE-NB
           END-IF.            
      *    Contrôle de la prestation couronne molaire                  
           IF (FUNCTION UPPER-CASE(SC-VALUE-MOLAR-1) EQUAL 'O') THEN
              MOVE WS-ALLEGE-MOLAR TO SQL-CLAS-MOLAR
              ADD 1 TO WS-CHOICE-NB
           END-IF.             
           IF (FUNCTION UPPER-CASE(SC-VALUE-MOLAR-2) EQUAL 'O') THEN 
              MOVE WS-MODERE-MOLAR TO SQL-CLAS-MOLAR
              ADD 2 TO SQL-REIMBURSEMENT-COST
              ADD 1 TO WS-CHOICE-NB
           END-IF.            
           IF (FUNCTION UPPER-CASE(SC-VALUE-MOLAR-3) EQUAL 'O') THEN
              MOVE WS-EXCELL-MOLAR TO SQL-CLAS-MOLAR
              ADD 4 TO SQL-REIMBURSEMENT-COST
              ADD 1 TO WS-CHOICE-NB
           END-IF.            
      *    Contrôle de la prestation couronne hors molaire                 
           IF (FUNCTION UPPER-CASE(SC-VALUE-NON-MOLAR-1) EQUAL 'O') THEN
              MOVE WS-ALLEGE-NON-MOLAR TO SQL-CLAS-NON-MOLAR
              ADD 1 TO WS-CHOICE-NB
           END-IF.             
           IF (FUNCTION UPPER-CASE(SC-VALUE-NON-MOLAR-2) EQUAL 'O') THEN
              MOVE WS-MODERE-NON-MOLAR TO SQL-CLAS-NON-MOLAR
              ADD 2 TO SQL-REIMBURSEMENT-COST
              ADD 1 TO WS-CHOICE-NB
           END-IF.             
           IF (FUNCTION UPPER-CASE(SC-VALUE-NON-MOLAR-3) EQUAL 'O') THEN
              MOVE WS-EXCELL-NON-MOLAR TO SQL-CLAS-NON-MOLAR
              ADD 4 TO SQL-REIMBURSEMENT-COST
              ADD 1 TO WS-CHOICE-NB
           END-IF.            
      *    Contrôle de la prestation détartrage                 
           IF (FUNCTION UPPER-CASE(SC-VALUE-DESCALINGS-1) EQUAL 'O') 
           THEN
              MOVE WS-ALLEGE-DESCALINGS TO SQL-CLAS-DESCALINGS
              ADD 1 TO WS-CHOICE-NB
           END-IF.             
           IF (FUNCTION UPPER-CASE(SC-VALUE-DESCALINGS-2) EQUAL 'O')
           THEN
              MOVE WS-MODERE-DESCALINGS TO SQL-CLAS-DESCALINGS
              ADD 2 TO SQL-REIMBURSEMENT-COST
              ADD 1 TO WS-CHOICE-NB
           END-IF. 
           IF (FUNCTION UPPER-CASE(SC-VALUE-DESCALINGS-3) EQUAL 'O') 
           THEN
              MOVE WS-EXCELL-DESCALINGS TO SQL-CLAS-DESCALINGS
              ADD 4 TO SQL-REIMBURSEMENT-COST
              ADD 1 TO WS-CHOICE-NB
           END-IF.        
           IF WS-CHOICE-NB > 8 THEN 
              MOVE 'N' TO WS-CHOICE 
           ELSE 
              MOVE 'O' TO WS-CHOICE         
           END-IF.               
       END-6130-VALIDE-CHOICE.          
           EXIT.

       6135-CALC-CUSTOMER-AGE-START. 
           STRING WS-YEAR WS-MOUNTH WS-DAY 
           DELIMITED BY SIZE 
           INTO WS-BIRTHD.
           SUBTRACT WS-BIRTHD FROM FUNCTION NUMVAL(SQL-CDATE(1:8))
                                GIVING WS-BIRTHD.
           MOVE WS-BIRTHD(3:2) TO WS-AGE.
       END-6135-CALC-CUSTOMER-AGE.
           EXIT.

       8000-INITIALIZE-SCREEN-START.
           INITIALIZE SC-BUTTON SC-MESSAGE.
      *    INITIALIZE SC-BUTTON-VALUE.
       END-8000-INITIALIZE-SCREEN.
           EXIT.

       8100-INITIALIZE-SQL-START.
           INITIALIZE CURS-CLASSIC SQL-REIMBURSEMENT-COST 
                      WS-CHILDREN-TOTAL WS-NBCHILDREN WS-CHOICE-NB.
           MOVE 'N' TO WS-CHOICE.
       END-8100-INITIALIZE-SQL.
           EXIT.    
      ******************************************************************    
      *    [IM] - le 12-06-2024                                        *
      *    gestion d'erreur SQL                                        *
      ******************************************************************       
       9020-SQL-ERROR-START.
           DISPLAY '*** SQL ERROR ***'.
           DISPLAY WS-SQL-LIB SPACE 'SQLCODE: ' SQLCODE SPACE.
           EVALUATE SQLCODE
              WHEN  +100
                 DISPLAY 'Record not found'
              WHEN  -01
                 DISPLAY 'Connection failed'
              WHEN  -20
                 DISPLAY 'Internal error'
              WHEN  -30
                 DISPLAY 'PostgreSQL error'
                 DISPLAY 'ERRCODE:' SPACE SQLSTATE
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
                 DISPLAY 'Undefined error'
                 DISPLAY 'ERRCODE:' SPACE SQLSTATE
                 DISPLAY SQLERRMC
           END-EVALUATE.
       END-9020-SQL-ERROR.
           STOP RUN.
 
      ******************************************************************    
      *    [IM] - le 12-06-2024                                        *
      *    J'envoie un message si erreur de saisie et efface la saisie *
      ****************************************************************** 
       9200-ERROR-MESSAGE-START.
           INITIALIZE SC-MESSAGE.
           STRING
               'Erreur de saisie, veuillez valider votre choix en'
               SPACE 'premier.' 
               DELIMITED BY SIZE
               INTO SC-MESSAGE
           END-STRING.                                          
       END-9200-ERROR-MESSAGE.
           EXIT. 

       9210-ERROR-MESSAGE-START.
           INITIALIZE SC-MESSAGE.
           STRING
               'Veuillez selectionner une valeur pour chaque'
               SPACE 'prestation.' 
               DELIMITED BY SIZE
               INTO SC-MESSAGE
           END-STRING.                                          
       END-9210-ERROR-MESSAGE.
           EXIT. 

       9220-ERROR-MESSAGE-START.
           INITIALIZE SC-MESSAGE.
           STRING
               "Veuillez ne selectionner qu'une valeur pour chaque"
               SPACE 'prestation.' 
               DELIMITED BY SIZE
               INTO SC-MESSAGE
           END-STRING.                                          
       END-9220-ERROR-MESSAGE.
           EXIT. 



