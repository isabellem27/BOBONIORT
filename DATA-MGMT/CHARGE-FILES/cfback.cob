      ***************************************************************
      *    Chargement du fichier individus.csv                      *
      *    création d'une table spécifique au format du fichier     *
      *    chargement de la table                                   *      
      *    Exécution du script de reformatage des données et de     *
      *    chargement de la table CUSTOMER                          * 
      *    Affichage d'un compte-rendu d'exécution                  *
      *                                                             *
      *    Auteur : Isabelle Marand                                 *
      *    Date création 16/06/2024                                 *
      ***************************************************************
      ***************************************************************     
       IDENTIFICATION DIVISION.
       PROGRAM-ID. cfback.
       AUTHOR . Isabelle.       
      ******************************************************************       
       ENVIRONMENT DIVISION.                  
       INPUT-OUTPUT SECTION. 
       FILE-CONTROL. 
           SELECT F-INPUT 
           ASSIGN TO 'Individus.csv' 
           ORGANIZATION IS LINE SEQUENTIAL 
           ACCESS MODE IS SEQUENTIAL
           FILE STATUS IS F-INPUT-STATUS.
      ******************************************************************
       DATA DIVISION.
       FILE SECTION. 
       FD  F-INPUT
           RECORD CONTAINS 2 TO 1000 CHARACTERS 
           RECORDING MODE IS V.
      * taille 203?
       01  REC-F-INPUT        PIC X(300)                   .    
      ******************************************************************
       WORKING-STORAGE SECTION.
      * gestion des status des fichiers  
       01  F-INPUT-STATUS       PIC XX                     .
       88  F-INPUT-STATUS-OK                VALUE '00'     .
       88  F-INPUT-STATUS-EOF               VALUE '10'     .

      * gestion de la lecture du fichier
       01  WS-LIG-RAP           PIC X(250)  VALUE SPACES   .   
       01  WS-SQL-LIB           PIC X(80)   VALUE SPACES   .  
       01  WS-POS               PIC 999     VALUE ZERO     .
       01  WS-LENGTH            PIC 999     VALUE ZERO     .
       01  WS-LENGTHCP          PIC 999     VALUE ZERO     . 
       01  WS-NBCHAMP           PIC 99      VALUE ZERO     .
       01  WS-CHAMP             PIC X(50)   VALUE SPACES   .
       01  WS-LENGTH-REC        PIC 999     VALUE ZERO     .

      ******************************************************************
      * Déclaration des variables correspondant à sql 
OCESQL*EXEC SQL BEGIN DECLARE SECTION END-EXEC             .
      * paramètres pour connexion à la base 
       01  DBNAME               PIC X(11)   VALUE'boboniortdb'.
       01  USERNAME             PIC X(05)   VALUE 'cobol'  .
       01  PASSWD               PIC X(05)   VALUE 'cbl85'  .
      * 01  PASSWD                           VALUE 'cbl85'  .

      * Variables pour charger la table HISTO-CUSTOMER
       01  SQL-CUSTOMER.
           03  SQL-FIRSTNAME    PIC X(020) VALUE SPACE     .
           03  SQL-LASTNAME     PIC X(020) VALUE SPACE    .
           03  SQL-GENDER       PIC X(1)   VALUE SPACE    .
           03  SQL-EMAIL        PIC X(040) VALUE SPACE    .
           03  SQL-BIRTHDATE    PIC X(010) VALUE SPACE    .
           03  SQL-PHONE        PIC X(014) VALUE SPACE    .
           03  SQL-ADRESS       PIC X(036) VALUE SPACE    .
           03  SQL-ZIPCODE      PIC X(005) VALUE SPACE    .
           03  SQL-REGION       PIC X(025) VALUE SPACE    .
           03  SQL-COUNTRY      PIC X(020) VALUE SPACE    .
           03  SQL-IBAN         PIC X(034) VALUE SPACE    .
           03  SQL-MARITAL      PIC X(08)  VALUE SPACE    . 
       01  SQL-NB-CUSTOMER      PIC 999    VALUE ZERO     . 

OCESQL*EXEC SQL END DECLARE SECTION END-EXEC               . 
OCESQL*EXEC SQL INCLUDE SQLCA END-EXEC                     .
OCESQL     copy "sqlca.cbl".

      ***************************************************************
OCESQL*
OCESQL 01  SQ0001.
OCESQL     02  FILLER PIC X(014) VALUE "DISCONNECT ALL".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
OCESQL 01  SQ0002.
OCESQL     02  FILLER PIC X(034) VALUE "DROP TABLE IF EXISTS BOBO_CUST"
OCESQL  &  "OMER".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
OCESQL 01  SQ0003.
OCESQL     02  FILLER PIC X(256) VALUE "CREATE TABLE BOBO_CUSTOMER ( F"
OCESQL  &  "IRSTNAME VARCHAR(20), LASTNAME VARCHAR(20), GENDER VARCHAR"
OCESQL  &  "(01), EMAIL VARCHAR(50), BIRTHDATE VARCHAR(10), PHONE VARC"
OCESQL  &  "HAR(14), ADRESS VARCHAR(50), ZIPCODE VARCHAR(05), REGION V"
OCESQL  &  "ARCHAR(25), COUNTRY VARCHAR(20), IBAN VARCHAR(34), M".
OCESQL     02  FILLER PIC X(056) VALUE "ARITAL VARCHAR(08), TOWN VARCH"
OCESQL  &  "AR(30), CODE_SECU BIGINT )".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
OCESQL 01  SQ0004.
OCESQL     02  FILLER PIC X(190) VALUE "INSERT INTO BOBO_CUSTOMER (FIR"
OCESQL  &  "STNAME, LASTNAME, GENDER, EMAIL, BIRTHDATE, PHONE, ADRESS,"
OCESQL  &  " ZIPCODE, REGION, COUNTRY, IBAN, MARITAL) VALUES ( $1, $2,"
OCESQL  &  " $3, $4, $5, $6, $7, $8, $9, $10, $11, $12 )".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
OCESQL 01  SQ0005.
OCESQL     02  FILLER PIC X(036) VALUE "SELECT COUNT( * ) FROM BOBO_CU"
OCESQL  &  "STOMER".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
       PROCEDURE DIVISION .
       0000-MAIN-START.
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
               PERFORM 9020-ERROR-SQL-START
                   THRU END-9020-ERROR-SQL
           END-IF.

           PERFORM 1000-CREATE-TAB-START THRU END-1000-CREATE-TAB.
           PERFORM 1020-LECT1-FILE-START THRU END-1020-LECT1-FILE.
           PERFORM 2000-CHARGE-HISTOTAB-START 
                    THRU END-2000-CHARGE-HISTOTAB.
           PERFORM 1040-CLOSE-FILE-START THRU END-1040-CLOSE-FILE. 
           PERFORM 2050-SQL-SCRIPT-EXECUTE-START
                    THRU END-SQL-SCRIPT-EXECUTE.

OCESQL*    EXEC SQL DISCONNECT ALL END-EXEC.
OCESQL     CALL "OCESQLDisconnect" USING
OCESQL          BY REFERENCE SQLCA
OCESQL     END-CALL.
           IF  SQLCODE NOT = ZERO 
              MOVE 'DISCONNECTION BASE' TO WS-SQL-LIB 
              PERFORM 9020-ERROR-SQL-START
                   THRU END-9020-ERROR-SQL
           END-IF.  
       END-0000-MAIN.    
           STOP RUN.
      *    GOBACK.    

      * Suppression - Création de la table
       1000-CREATE-TAB-START.
OCESQL*    EXEC SQL 
OCESQL*       DROP TABLE IF EXISTS BOBO_CUSTOMER  
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLExec" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE SQ0002
OCESQL     END-CALL.
           IF  SQLCODE NOT = ZERO 
              MOVE 'DROP TABLE ' TO WS-SQL-LIB 
              PERFORM 9020-ERROR-SQL-START THRU END-9020-ERROR-SQL
           END-IF.
OCESQL*    EXEC SQL 
OCESQL*       CREATE TABLE BOBO_CUSTOMER (
OCESQL*          FIRSTNAME   VARCHAR(20)  ,
OCESQL*          LASTNAME    VARCHAR(20)  ,
OCESQL*          GENDER      VARCHAR(01)  ,
OCESQL*          EMAIL       VARCHAR(50)  ,
OCESQL*            BIRTHDATE   VARCHAR(10)  ,
OCESQL*            PHONE       VARCHAR(14)  ,
OCESQL*            ADRESS      VARCHAR(50)  ,
OCESQL*            ZIPCODE     VARCHAR(05)  ,
OCESQL*            REGION      VARCHAR(25)  ,
OCESQL*            COUNTRY     VARCHAR(20)  ,
OCESQL*            IBAN        VARCHAR(34)  ,
OCESQL*            MARITAL     VARCHAR(08)  ,
OCESQL*            TOWN        VARCHAR(30)  ,
OCESQL*            CODE_SECU   BIGINT 
OCESQL*         )
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLExec" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE SQ0003
OCESQL     END-CALL.
           IF  SQLCODE NOT = ZERO 
              MOVE 'TABLE CREATION' TO WS-SQL-LIB 
              PERFORM 9020-ERROR-SQL-START THRU END-9020-ERROR-SQL
           END-IF.
       END-1000-CREATE-TAB.
           EXIT.

      * Lecture du fichier client et chargement de la table
       1020-LECT1-FILE-START. 
           OPEN INPUT F-INPUT .
           IF (NOT F-INPUT-STATUS-OK) THEN 
              PERFORM 9000-TEST-STATUT-START THRU END-9000-TEST-STATUT 
           END-IF.
           PERFORM 1030-LECT-FILE-START THRU END-1030-LECT-FILE.
      * Je passe l'entête du fichier     
           PERFORM 1030-LECT-FILE-START THRU END-1030-LECT-FILE.
       END-1020-LECT1-FILE.
           EXIT.
       
       1030-LECT-FILE-START.
           READ F-INPUT.
           IF (NOT F-INPUT-STATUS-OK) AND (NOT F-INPUT-STATUS-EOF) THEN 
              PERFORM 9000-TEST-STATUT-START THRU END-9000-TEST-STATUT 
           END-IF.
       END-1030-LECT-FILE.
           EXIT.

       1040-CLOSE-FILE-START.
           CLOSE F-INPUT.
           IF (NOT F-INPUT-STATUS-OK) AND (NOT F-INPUT-STATUS-EOF) THEN 
              PERFORM 9000-TEST-STATUT-START THRU END-9000-TEST-STATUT 
           END-IF.
       END-1040-CLOSE-FILE.
           EXIT.

      *    Pour chaque enregistremnet du fichier, charge les variables
      *    SQL puis fait un insert dans la table. 
      *    commit quand on est arrivé à la fin du fichier.
       2000-CHARGE-HISTOTAB-START.
           PERFORM UNTIL F-INPUT-STATUS-EOF
              PERFORM 2010-CHERCHE-VAR-START 
                          THRU END-2010-CHERCHE-VAR
OCESQL*       EXEC SQL
OCESQL*          INSERT INTO BOBO_CUSTOMER
OCESQL*          (FIRSTNAME,LASTNAME,GENDER,EMAIL,BIRTHDATE,PHONE,
OCESQL*          ADRESS,ZIPCODE,REGION,COUNTRY,IBAN,MARITAL)
OCESQL*          VALUES
OCESQL*          (:SQL-FIRSTNAME,:SQL-LASTNAME,:SQL-GENDER,:SQL-EMAIL,
OCESQL*          :SQL-BIRTHDATE,:SQL-PHONE,:SQL-ADRESS, :SQL-ZIPCODE,
OCESQL*          :SQL-REGION,:SQL-COUNTRY,:SQL-IBAN,:SQL-MARITAL)
OCESQL*       END-EXEC 
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 20
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-FIRSTNAME
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 20
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-LASTNAME
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 1
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-GENDER
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 40
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-EMAIL
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-BIRTHDATE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 14
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-PHONE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 36
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-ADRESS
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 5
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-ZIPCODE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 25
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-REGION
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 20
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-COUNTRY
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 34
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-IBAN
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 8
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-MARITAL
OCESQL     END-CALL
OCESQL     CALL "OCESQLExecParams" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE SQ0004
OCESQL          BY VALUE 12
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL

              IF  SQLCODE NOT = ZERO 
                 MOVE 'RECORD BOBO_CUSTOMER WRITE' 
                       TO WS-SQL-LIB
                 PERFORM 9020-ERROR-SQL-START THRU END-9020-ERROR-SQL                  
              END-IF

              PERFORM 1030-LECT-FILE-START THRU END-1030-LECT-FILE
           END-PERFORM.
OCESQL*    EXEC SQL COMMIT WORK END-EXEC.
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLExec" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "COMMIT" & x"00"
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL.

OCESQL*    EXEC SQL
OCESQL*       SELECT COUNT(*) INTO :SQL-NB-CUSTOMER 
OCESQL*       FROM BOBO_CUSTOMER
OCESQL*    END-EXEC. 
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-NB-CUSTOMER
OCESQL     END-CALL
OCESQL     CALL "OCESQLExecSelectIntoOne" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE SQ0005
OCESQL          BY VALUE 0
OCESQL          BY VALUE 1
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL.
           IF  SQLCODE NOT = ZERO 
                 MOVE 'NB BOBO_CUSTOMER ' 
                       TO WS-SQL-LIB
                 PERFORM 9020-ERROR-SQL-START THRU END-9020-ERROR-SQL                  
           END-IF.  
       END-2000-CHARGE-HISTOTAB.
           EXIT.
   
       2010-CHERCHE-VAR-START.     
      * Les enregistrements et les champs sont de taille variable.
      * Je récupère la taille de l'enregistrement 
      * Initialisation des variables qui me permettront de découper
      * l'enregistrement 
           SET WS-POS        TO 1.
           INITIALIZE WS-NBCHAMP.
           SET WS-LENGTH     TO 
                           FUNCTION LENGTH(FUNCTION TRIM(REC-F-INPUT)).
           SET WS-LENGTH-REC TO WS-LENGTH.

      * Je descend ma ligne champ par champ.
      * Ils sont séparés par un point-virgule sauf le dernier
      * Pour avancer dans ma ligne je récupère la position du point-virgule
      * L'inspect donne la longueur du champ (ws-lengthcp). 
      * jusqu'à arriver en fin de ligne.       
           PERFORM UNTIL (WS-LENGTH NOT > 0) 
                          OR (WS-POS > WS-LENGTH-REC)
      * Je compte le nombre de caractères positionnés devant le 
      * point-virgule
               INSPECT REC-F-INPUT(WS-POS: WS-LENGTH)
               TALLYING WS-LENGTHCP FOR CHARACTERS 
               BEFORE ';'
               IF (WS-LENGTHCP > 0) THEN
      * Je charge mon champ dans la bonne variable SQL pour l'insert 
                   INITIALIZE WS-CHAMP
                   MOVE REC-F-INPUT(WS-POS:WS-LENGTHCP) TO WS-CHAMP
                   ADD 1 TO WS-NBCHAMP GIVING WS-NBCHAMP
                   PERFORM 2020-CHARGE-SQLVAR-START 
                                THRU END-2020-CHARGE-SQLVAR            
               END-IF

      *    Je me positionne sur le caractère suivant le point-virgule  
               ADD WS-LENGTHCP TO WS-POS GIVING WS-POS
               ADD 1 TO WS-POS GIVING WS-POS
               SUBTRACT WS-POS FROM WS-LENGTH GIVING WS-LENGTH
               ADD 1 TO WS-LENGTH GIVING WS-LENGTH
               INITIALIZE WS-LENGTHCP               
           END-PERFORM.              
       END-2010-CHERCHE-VAR.    
           EXIT.

       2020-CHARGE-SQLVAR-START.
           EVALUATE (WS-NBCHAMP) 
              WHEN 1 
                 MOVE FUNCTION TRIM(WS-CHAMP) TO SQL-FIRSTNAME
              WHEN 2
                 MOVE FUNCTION TRIM(WS-CHAMP) TO SQL-LASTNAME
              WHEN 3
                 MOVE FUNCTION TRIM(WS-CHAMP) TO SQL-GENDER
              WHEN 4
                 MOVE FUNCTION TRIM(WS-CHAMP) TO SQL-EMAIL
              WHEN 5
                 MOVE FUNCTION TRIM(WS-CHAMP) TO SQL-BIRTHDATE
              WHEN 6
      *    [IM] Sur cetains enregistrements le numéro de téléphone est 
      *    éclaté ce qui décalle les informations suivantes.
      *    Si la longueur du champs est inférieure à 14 , On récupère la 
      *    fin du numéro de téléphone avant de la charger dans la varia-
      *    ble SQL téléphone.        
                 IF WS-LENGTHCP < 14 THEN
                    ADD WS-LENGTHCP TO WS-POS GIVING WS-POS
                    SUBTRACT WS-LENGTHCP FROM 14 GIVING WS-LENGTHCP
                    STRING FUNCTION TRIM(WS-CHAMP)   
                          REC-F-INPUT(WS-POS: WS-LENGTHCP)
                    DELIMITED BY SIZE 
                    INTO WS-CHAMP
                 END-IF
                 MOVE FUNCTION TRIM(WS-CHAMP) TO SQL-PHONE
              WHEN 7
                 MOVE FUNCTION TRIM(WS-CHAMP) TO SQL-ADRESS
              WHEN 8                
      *    [IM] Si la longueur du champs est supérieure à 5 ou si le
      *    code postal n'est pas numérique, c'est que l'adresse est 
      *    éclatée entre deux champs. On concatène la fin de l'adresse 
      *    au champ adresse pour la charger dans la variable SQL adresse.                    
                 IF (WS-LENGTHCP > 5) OR 
                 (FUNCTION TRIM(WS-CHAMP) IS NOT NUMERIC) THEN
                    STRING FUNCTION TRIM(SQL-ADRESS)   
                         FUNCTION TRIM(REC-F-INPUT(WS-POS: WS-LENGTHCP))
                    DELIMITED BY SIZE 
                    INTO SQL-ADRESS
      *    Je décrémente de 1 pour charger la prochaine info lue dans la
      *    variable SQL code postale. 
                    SUBTRACT 1 FROM WS-NBCHAMP GIVING WS-NBCHAMP 
                 ELSE 
      *    [IM] Tous les codes postaux ne sont pas correctement chargés
      *    dans le fichier. Règle corrective appliquée:
      *    On ajoute '00' ou '0' à la fin du code en fonction du nb chiffres.
                    IF (FUNCTION LENGTH(FUNCTION TRIM(WS-CHAMP)) 
                       EQUAL 3) THEN
                       STRING FUNCTION TRIM(WS-CHAMP) '00'
                       DELIMITED BY SIZE INTO WS-CHAMP
                    ELSE 
                       IF (FUNCTION LENGTH(FUNCTION TRIM(WS-CHAMP)) 
                       EQUAL 4 ) THEN
                          STRING FUNCTION TRIM(WS-CHAMP) '0' 
                          DELIMITED BY SIZE INTO WS-CHAMP
                       END-IF
                    END-IF                            
                    MOVE FUNCTION TRIM(WS-CHAMP) TO SQL-ZIPCODE                             
                 END-IF
              WHEN 9
                 MOVE FUNCTION TRIM(WS-CHAMP) TO SQL-REGION
              WHEN 10
                 MOVE FUNCTION TRIM(WS-CHAMP) TO SQL-COUNTRY
              WHEN 11
                 MOVE FUNCTION TRIM(WS-CHAMP) TO SQL-IBAN
              WHEN 12
                 MOVE FUNCTION TRIM(WS-CHAMP) TO SQL-MARITAL
           END-EVALUATE.
       END-2020-CHARGE-SQLVAR.
           EXIT.
      ******************************************************************
      * Exécution d'un script SQL pour reformatage des données et      * 
      * chargement des enregistrements dans la table CUSTOMER          *
      ******************************************************************
       2050-SQL-SCRIPT-EXECUTE-START.
           CALL 'SYSTEM' USING      
           'psql -h localhost -d boboniortdb -U cobol -f IND-UPDATE.sql'
           .        
           IF  SQLCODE NOT = ZERO 
                 MOVE 'Execution script IND-UPDATE.sql' 
                       TO WS-SQL-LIB
                 PERFORM 9020-ERROR-SQL-START THRU END-9020-ERROR-SQL                  
           END-IF.  

      *    Retour au menu     
           CALL 'menudata'.
       END-SQL-SCRIPT-EXECUTE.
           EXIT.


       9000-TEST-STATUT-START.
           IF (NOT F-INPUT-STATUS-OK) 
              AND (NOT F-INPUT-STATUS-EOF) THEN 
              MOVE ALL  '/' TO WS-LIG-RAP
              DISPLAY WS-LIG-RAP 
              DISPLAY 'CODE RETOUR D''ERREUR' SPACE F-INPUT-STATUS 
              MOVE ALL  '/' TO WS-LIG-RAP
              DISPLAY WS-LIG-RAP
              STOP RUN 
           END-IF. 
       END-9000-TEST-STATUT.     
           EXIT.
 
       9020-ERROR-SQL-START.
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
       END-9020-ERROR-SQL.
           STOP RUN.   
           STOP RUN.   
           STOP RUN.   
