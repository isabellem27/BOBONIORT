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
      *                                                                *
      * MAJ [IM] le 14-06-2024 Gestion du LK-CUSTOMER complet          *     
      * MAJV2 [IM] le 18-06-2024 1 client = 1 contrat                  *
      *          gestion d'une alerte affichée en haut de l'écran      *
      *        + conditionnement à l'existance du contrat pour charger *
      ******************************************************************        
       
       IDENTIFICATION DIVISION.
       PROGRAM-ID. clascont RECURSIVE.
       AUTHOR. Isabelle.

      ******************************************************************       
       
       ENVIRONMENT DIVISION.

      ******************************************************************

       DATA DIVISION.

       WORKING-STORAGE SECTION.                 
      *    gestion des erreurs de saisie
       01  WS-SELECT-OPTION        PIC X(05)   VALUE 'FALSE'     . 
       01  WS-ERROR-MESSAGE1       PIC X(35)                     .
       01  WS-ERROR-MESSAGE2       PIC X(35)                     .
      
      * MAJV2 [IM] le 18-06-2024 1 client = 1 contrat                  *
       01  WS-CONTRACT-CUSTOMER    PIC 9(01)   VALUE ZERO        .
       88  WS-FOUND-CONTRACT                   VALUE 1           .
                                  
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
OCESQL*EXEC SQL BEGIN DECLARE SECTION END-EXEC                   .
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
      
      * MAJV2 [IM] le 18-06-2024 1 client = 1 contrat         
       01  SQL-CUSTOMER-UUID       PIC X(36)   VALUE SPACES      .   

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
OCESQL     02  FILLER PIC X(256) VALUE "SELECT CLASSIC_REIMBURSEMENT_N"
OCESQL  &  "UMBER, CLASSIC_REIMBURSEMENT_LABEL, CLASSIC_REIMBURSEMENT_"
OCESQL  &  "DOCTOR, CLASSIC_REIMBURSEMENT_PARMEDICAL, CLASSIC_REIMBURS"
OCESQL  &  "EMENT_HOSPITAL, CLASSIC_REIMBURSEMENT_SINGLE_GLASSES, CLAS"
OCESQL  &  "SIC_REIMBURSEMENT_PROGRESSIVE_GLASSES, CLASSIC_REIMB".
OCESQL     02  FILLER PIC X(160) VALUE "URSEMENT_MOLAR_CROWNS, CLASSIC"
OCESQL  &  "_REIMBURSEMENT_NON_MOLAR_CROWNS, CLASSIC_REIMBURSEMENT_DES"
OCESQL  &  "CALINGS FROM CLASSIC_REIMBURSEMENT ORDER BY CLASSIC_REIMBU"
OCESQL  &  "RSEMENT_NUMBER".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
OCESQL 01  SQ0003.
OCESQL     02  FILLER PIC X(256) VALUE "SELECT cr.CLASSIC_REIMBURSEMEN"
OCESQL  &  "T_LABEL, cc.COST_CONDITION_AGEMIN, cc.COST_CONDITION_AGEMA"
OCESQL  &  "X, cc.COST_CONDITION_COST, (SELECT c2.COST_CONDITION_COST "
OCESQL  &  "FROM COST_CONDITION as c2 WHERE c2.COST_CONDITION_TYPE = '"
OCESQL  &  "1' AND c2.CLASSIC_REIMBURSEMENT_NUMBER = 1) FROM CLA".
OCESQL     02  FILLER PIC X(197) VALUE "SSIC_REIMBURSEMENT as cr INNER"
OCESQL  &  " JOIN COST_CONDITION as cc ON cr.CLASSIC_REIMBURSEMENT_NUM"
OCESQL  &  "BER = cc.CLASSIC_REIMBURSEMENT_NUMBER WHERE cc.COST_CONDIT"
OCESQL  &  "ION_TYPE = '2' AND cc.COST_CONDITION_COUPLE = False".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
OCESQL 01  SQ0004.
OCESQL     02  FILLER PIC X(070) VALUE "SELECT count( * ) FROM CUSTOME"
OCESQL  &  "R_REIMBURSEMENT WHERE UUID_CUSTOMER = $1".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
OCESQL 01  SQ0005.
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
OCESQL 01  SQ0006.
OCESQL     02  FILLER PIC X(118) VALUE "SELECT MAX(REIMBURSEMENT_NUM) "
OCESQL  &  "as MAX FROM CUSTOMER_REIMBURSEMENT WHERE REIMBURSEMENT_NUM"
OCESQL  &  " LIKE 'ALL' || $1 || $2 || '%'".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
OCESQL 01  SQ0007.
OCESQL     02  FILLER PIC X(118) VALUE "SELECT MAX(REIMBURSEMENT_NUM) "
OCESQL  &  "as MAX FROM CUSTOMER_REIMBURSEMENT WHERE REIMBURSEMENT_NUM"
OCESQL  &  " LIKE 'MOD' || $1 || $2 || '%'".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
OCESQL 01  SQ0008.
OCESQL     02  FILLER PIC X(118) VALUE "SELECT MAX(REIMBURSEMENT_NUM) "
OCESQL  &  "as MAX FROM CUSTOMER_REIMBURSEMENT WHERE REIMBURSEMENT_NUM"
OCESQL  &  " LIKE 'EXC' || $1 || $2 || '%'".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
       LINKAGE SECTION.
       01 LK-CUSTOMER.
           03 LK-CUS-UUID          PIC X(36)                     .
           03 LK-CUS-GENDER        PIC X(10)                     .
           03 LK-CUS-LASTNAME      PIC X(20)                     .
           03 LK-CUS-FIRSTNAME     PIC X(20)                     .
           03 LK-CUS-ADRESS1	   PIC X(50)                     .
           03 LK-CUS-ADRESS2	   PIC X(50)                     .
           03 LK-CUS-ZIPCODE	   PIC X(15)                     .
           03 LK-CUS-TOWN          PIC X(30)                     .
           03 LK-CUS-COUNTRY	   PIC X(20)                     .
           03 LK-CUS-PHONE	       PIC X(10)                     .
           03 LK-CUS-MAIL	       PIC X(50)                     .
           03 LK-CUS-BIRTH-DATE    PIC X(10)                     .
           03  WS-BIRTH REDEFINES LK-CUS-BIRTH-DATE.
              05 WS-YEAR           PIC 9(04)                     .
              05 FILLER            PIC X(01)      VALUE '-'      .     
              05 WS-MOUNTH         PIC 9(02)                     .
              05 FILLER            PIC X(01)      VALUE '-'      .           
              05 WS-DAY            PIC 9(02)                     .           
           03 LK-CUS-DOCTOR	       PIC X(20)                     .
           03 LK-CUS-CODE-SECU     PIC 9(15)                     .
           03 LK-CUS-CODE-IBAN     PIC X(34)                     .
           03 LK-CUS-NBCHILDREN    PIC 9(03)                     .
           03 LK-CUS-COUPLE        PIC X(05)                     .
           03 LK-CUS-CREATE-DATE   PIC X(10)                     .
           03 LK-CUS-UPDATE-DATE   PIC X(10)                     .
           03 LK-CUS-CLOSE-DATE    PIC X(10)                     .
           03 LK-CUS-ACTIVE	       PIC X(01)                     .

       01  LK-ERROR-MESSAGE-MENU   PIC X(70)                     .
    
      ******************************************************************
       SCREEN SECTION.
           COPY 'screen-classic-contract.cpy'.  
           COPY 'screen-classic-confirm.cpy'.  

      ******************************************************************

       PROCEDURE DIVISION USING LK-CUSTOMER, LK-ERROR-MESSAGE-MENU.
      * 
      ****************************************************************** 
      * [IM]- le 12-06-2024                                            *
      *    Le paragraphe affiche la screen, contrôle la saisie et      *
      *    appelle le programme correspondant au choix de l'utilisateur*
      ****************************************************************** 
       0000-START-MAIN.   
           INITIALIZE WS-SELECT-OPTION
                      SC-BUTTON
                      WS-ERROR-MESSAGE1
                      WS-ERROR-MESSAGE2
                      SC-CONFIRM-BUTTON .
             
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

      * MAJV2 [IM] le 18-06-2024 1 client = 1 contrat                  *        
      *    Si contrat trouvé on ne va pas plus loin et retour au menu  * 
              IF WS-FOUND-CONTRACT THEN
                 MOVE 'True' TO WS-SELECT-OPTION 
                 MOVE "Cet adherent a deja un contrat d'affecte." 
                 TO LK-ERROR-MESSAGE-MENU
                 CALL 'menucont' USING CONTENT LK-CUSTOMER
              END-IF   
      * Fin MAJV2 [IM] le 18-06-2024 1 client = 1 contrat              *

              ACCEPT SCREEN-CLASSIC-CONTRACT  

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
           PERFORM 1450-PREPARE-CRS-COUT-SCREEN-START
                 THRU END-1450-PREPARE-CRS-COUT-SCREEN. 
      * MAJV2 [IM] le 18-06-2024 1 client = 1 contrat                  *        
      *    On vérifie s'il existe un contrat pour le client            *             
           PERFORM 1560-CONTRACT-CUSTOMER-NUMBER-START
                 THRU END-1560-CONTRACT-CUSTOMER-NUMBER.   
      * Fin MAJV2 [IM] le 18-06-2024 1 client = 1 contrat              *                              
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
OCESQL*          SELECT   CLASSIC_REIMBURSEMENT_NUMBER,
OCESQL*                   CLASSIC_REIMBURSEMENT_LABEL,
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
OCESQL          BY REFERENCE "clascont_CRSCLASSIC" & x"00"
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
OCESQL          BY REFERENCE "clascont_CRSCLASSIC" & x"00"
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
OCESQL          BY REFERENCE "clascont_CRSCLASSIC" & x"00"
OCESQL     END-CALL
OCESQL    .
           IF  SQLCODE NOT = ZERO 
              MOVE 'FERMETURE CRS-CLASSIC' TO WS-SQL-LIB 
              PERFORM 9020-SQL-ERROR-START
                   THRU END-9020-SQL-ERROR
           END-IF.
       END-1400-PREPARE-CRS-CLASSIC-SCREEN.
           EXIT.    

       1450-PREPARE-CRS-COUT-SCREEN-START.
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
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLCursorDeclare" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "clascont_CRSCOUT" & x"00"
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
OCESQL          BY REFERENCE "clascont_CRSCOUT" & x"00"
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
OCESQL          BY REFERENCE "clascont_CRSCOUT" & x"00"
OCESQL     END-CALL
OCESQL    .
           IF  SQLCODE NOT = ZERO 
              MOVE 'FERMETURE CRS-COUT' TO WS-SQL-LIB 
              PERFORM 9020-SQL-ERROR-START
                   THRU END-9020-SQL-ERROR
           END-IF.
       END-1450-PREPARE-CRS-COUT-SCREEN.
           EXIT. 

       1500-CRS-CLASSIC-READ-START.
OCESQL*    EXEC SQL 
OCESQL*       FETCH CRSCLASSIC 
OCESQL*       INTO 
OCESQL*       :SQL-CLAS-NUMBER, :SQL-CLAS-LABEL, :SQL-CLAS-DOCTOR,
OCESQL*       :SQL-CLAS-PARMEDICAL, :SQL-CLAS-HOSPITAL,
OCESQL*       :SQL-CLAS-S-GLASSES, :SQL-CLAS-P-GLASSES, :SQL-CLAS-MOLAR,
OCESQL*       :SQL-CLAS-NON-MOLAR,:SQL-CLAS-DESCALINGS     
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 1
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CLAS-NUMBER
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
OCESQL          BY REFERENCE "clascont_CRSCLASSIC" & x"00"
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
OCESQL*             :SQL-CLAS-NUMBER, :SQL-CLAS-LABEL, :SQL-CLAS-DOCTOR,
OCESQL*             :SQL-CLAS-PARMEDICAL, :SQL-CLAS-HOSPITAL,
OCESQL*             :SQL-CLAS-S-GLASSES, :SQL-CLAS-P-GLASSES, 
OCESQL*             :SQL-CLAS-MOLAR,:SQL-CLAS-NON-MOLAR,
OCESQL*             :SQL-CLAS-DESCALINGS     
OCESQL*    END-EXEC
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 1
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CLAS-NUMBER
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
OCESQL          BY REFERENCE "clascont_CRSCLASSIC" & x"00"
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
OCESQL          BY REFERENCE "clascont_CRSCOUT" & x"00"
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL.
           IF  (SQLCODE NOT = ZERO) AND (SQLCODE NOT = FIN) THEN
              MOVE 'LECTURE CRS-COUT' TO WS-SQL-LIB 
              PERFORM 9020-SQL-ERROR-START
                   THRU END-9020-SQL-ERROR
           END-IF.

           PERFORM UNTIL SQLCODE = FIN 
              PERFORM 1650-CHARGE-CRS-COUT-SCREEN-START 
                       THRU END-1650-CHARGE-CRS-COUT-SCREEN

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
OCESQL          BY REFERENCE "clascont_CRSCOUT" & x"00"
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

      * MAJV2 [IM] le 18-06-2024 1 client = 1 contrat                  *        
      *    On vérifie s'il existe un contrat pour le client            * 
       1560-CONTRACT-CUSTOMER-NUMBER-START.
           MOVE LK-CUS-UUID TO SQL-CUSTOMER-UUID.
OCESQL*    EXEC SQL 
OCESQL*        SELECT count(*)
OCESQL*        INTO :SQL-NBCHILDREN                   
OCESQL*        FROM CUSTOMER_REIMBURSEMENT
OCESQL*        WHERE UUID_CUSTOMER = :SQL-CUSTOMER-UUID
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 2
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-NBCHILDREN
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 36
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUSTOMER-UUID
OCESQL     END-CALL
OCESQL     CALL "OCESQLExecSelectIntoOne" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE SQ0004
OCESQL          BY VALUE 1
OCESQL          BY VALUE 1
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL.
           IF  (SQLCODE NOT = ZERO) AND (SQLCODE NOT EQUAL FIN) THEN  
               MOVE 'RECHERCHE NB CONTRATS ' 
                       TO WS-SQL-LIB                     
               PERFORM 9020-SQL-ERROR-START THRU END-9020-SQL-ERROR                
           END-IF.
           IF (SQL-NBCHILDREN > 0) THEN
               SET WS-CONTRACT-CUSTOMER TO 1 
           ELSE  
               INITIALIZE WS-CONTRACT-CUSTOMER LK-ERROR-MESSAGE-MENU
           END-IF.
           INITIALIZE SQL-NBCHILDREN.
       END-1560-CONTRACT-CUSTOMER-NUMBER.
           EXIT.
      * Fin MAJV2 [IM] le 18-06-2024 1 client = 1 contrat              *     

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
           IF FUNCTION UPPER-CASE(SC-BUTTON-RETURN) EQUAL 'O' THEN
               MOVE 'True' TO WS-SELECT-OPTION 
               CALL 'menucont' USING CONTENT LK-CUSTOMER

           ELSE IF FUNCTION UPPER-CASE(SC-BUTTON-PERSO) EQUAL 'O' THEN
               MOVE 'True' TO WS-SELECT-OPTION    
               CALL 'speccont' USING CONTENT LK-CUSTOMER    

           ELSE IF FUNCTION UPPER-CASE(SC-BUTTON-CONFIRM) EQUAL 'O' THEN

               IF (FUNCTION UPPER-CASE(SC-BUTTON-ALLEGE) 
                  EQUAL 'O') OR  
                  (FUNCTION UPPER-CASE(SC-BUTTON-MODERE) 
                  EQUAL 'O') OR          
                  (FUNCTION UPPER-CASE(SC-BUTTON-EXCELLENCE) 
                  EQUAL 'O') THEN

                  INITIALIZE SC-CONFIRM-BUTTON 
                  PERFORM 3100-DISPLAY-CONFIRM-START
                     THRU END-3100-DISPLAY-CONFIRM

               ELSE 
      *        Aucun contrat type sélectionné
                  PERFORM 9200-ERROR-MESSAGE-START 
                     THRU END-9200-ERROR-MESSAGE
               END-IF    

           ELSE
      *    Aucun bouton action sélectionné                 
               PERFORM 9200-ERROR-MESSAGE-START 
                  THRU END-9200-ERROR-MESSAGE                                                                                     
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
      
           ACCEPT SCREEN-CLASSIC-CONFIRM.
           IF (FUNCTION UPPER-CASE(SC-BUTTON-OUI) EQUAL 'O') THEN
      *    Si choix confirmé on enregistre et on revient au menu
              PERFORM 6000-SQL-ACTION-START
                 THRU END-6000-SQL-ACTION
              MOVE 'True' TO WS-SELECT-OPTION 
              CALL 'menucont' USING CONTENT LK-CUSTOMER 
           ELSE IF (FUNCTION UPPER-CASE(SC-BUTTON-NON) EQUAL 'O') THEN
      *    Si choix non confirmé, on revient à l'écran de sélection
                    INITIALIZE SC-BUTTON-PERSO SC-BUTTON-CONFIRM    
                               SC-BUTTON-RETURN WS-ERROR-MESSAGE1
                               WS-ERROR-MESSAGE2   
                    ACCEPT SCREEN-CLASSIC-CONTRACT
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
      * MAJ [IM] le 14-06-2024 Gestion du LK-CUSTOMER complet          *     
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
OCESQL          BY REFERENCE SQ0005
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


       6120-PREPARE-SQL-VARIABLE-START.
      * [IM] récupère le numéro de contrat max pour le type de contrat
      *      et fait plus 1 sur le max pour créer le numéro à inserrer
      *    Charge les variables SQL-* avec les varaibles du type de 
      *    contrat et calcule le coût du contrat en fonction de la 
      *    composition de la famille.
     
      * MAJ [IM] le 14-06-2024 Gestion du LK-CUSTOMER complet          *  
           MOVE LK-CUS-NBCHILDREN TO WS-NBCHILDREN.  
           PERFORM 6125-CALC-CUSTOMER-AGE-START 
                    THRU END-6125-CALC-CUSTOMER-AGE.
           EVALUATE (WS-CONTRACT)
              WHEN 'ALLEGE'
OCESQL*          EXEC SQL 
OCESQL*             SELECT MAX(REIMBURSEMENT_NUM) as MAX
OCESQL*             INTO :SQL-MAX                   
OCESQL*             FROM CUSTOMER_REIMBURSEMENT
OCESQL*             WHERE REIMBURSEMENT_NUM LIKE 'ALL'||:SQL-CYEAR||
OCESQL*             :SQL-CMOUNTH||'%'
OCESQL*          END-EXEC
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
OCESQL          BY REFERENCE SQ0006
OCESQL          BY VALUE 2
OCESQL          BY VALUE 1
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL
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
OCESQL*          EXEC SQL 
OCESQL*             SELECT MAX(REIMBURSEMENT_NUM) as MAX
OCESQL*             INTO :SQL-MAX                   
OCESQL*             FROM CUSTOMER_REIMBURSEMENT
OCESQL*             WHERE REIMBURSEMENT_NUM LIKE 'MOD'||:SQL-CYEAR||
OCESQL*             :SQL-CMOUNTH||'%'
OCESQL*          END-EXEC
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
OCESQL          BY REFERENCE SQ0007
OCESQL          BY VALUE 2
OCESQL          BY VALUE 1
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL
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
OCESQL*          EXEC SQL 
OCESQL*             SELECT MAX(REIMBURSEMENT_NUM) as MAX
OCESQL*             INTO :SQL-MAX                   
OCESQL*             FROM CUSTOMER_REIMBURSEMENT
OCESQL*             WHERE REIMBURSEMENT_NUM LIKE 'EXC'||:SQL-CYEAR||
OCESQL*             :SQL-CMOUNTH||'%'
OCESQL*          END-EXEC
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
OCESQL          BY REFERENCE SQ0008
OCESQL          BY VALUE 2
OCESQL          BY VALUE 1
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL
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
           STRING WS-YEAR WS-MOUNTH WS-DAY 
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
           MOVE 'Veuillez entrer "O" pour confirmer.' 
           TO WS-ERROR-MESSAGE1.  

           INITIALIZE SC-BUTTON-PERSO
                      SC-BUTTON-CONFIRM                      
                      SC-BUTTON-RETURN .                   
       END-9200-ERROR-MESSAGE.
           EXIT.
       
       9300-ERROR-MSG-CONFIRM-START. 
           MOVE 'Veuillez entrer "O" pour confirmer.' 
           TO WS-ERROR-MESSAGE2.  

           INITIALIZE SC-CONFIRM-BUTTON.  
           PERFORM 3100-DISPLAY-CONFIRM-START
                    THRU END-3100-DISPLAY-CONFIRM.                    
       END-9300-ERROR-MSG-CONFIRM.
           EXIT.




