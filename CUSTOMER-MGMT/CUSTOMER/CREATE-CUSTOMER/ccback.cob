      ******************************************************************
      *    [MF] Le programme 'Create Adherent logic' ajoute un         *
      *    adhérent à la table customer.                               *
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ccback.
       AUTHOR. Martial.

      ******************************************************************

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-CUSTOMER.
           03 WS-CUS-UUID        PIC X(36).
           03 WS-CUS-GENDER      PIC X(10).
           03 WS-CUS-LASTNAME    PIC X(20).
           03 WS-CUS-FIRSTNAME   PIC X(20).
           03 WS-CUS-ADRESS1	 PIC X(50).
           03 WS-CUS-ADRESS2	 PIC X(50).
           03 WS-CUS-ZIPCODE	 PIC X(15).
           03 WS-CUS-TOWN	     PIC X(30).
           03 WS-CUS-COUNTRY	 PIC X(20).
           03 WS-CUS-PHONE	     PIC X(10).
           03 WS-CUS-MAIL	     PIC X(50).
           03 WS-CUS-BIRTH-DATE  PIC X(10).
           03 WS-CUS-DOCTOR	     PIC X(20).
           03 WS-CUS-CODE-SECU   PIC 9(15).
           03 WS-CUS-CODE-IBAN   PIC X(34).
           03 WS-CUS-NBCHILDREN  PIC 9(03).
           03 WS-CUS-COUPLE      PIC X(05).
           03 WS-CUS-CREATE-DATE PIC X(10).
           03 WS-CUS-UPDATE-DATE PIC X(08).
           03 WS-CUS-CLOSE-DATE  PIC X(10).
           03 WS-CUS-ACTIVE	     PIC X(01). 

OCESQL*EXEC SQL BEGIN DECLARE SECTION END-EXEC.
       01  DBNAME   PIC  X(11) VALUE 'boboniortdb'.
       01  USERNAME PIC  X(05) VALUE 'cobol'.
       01  PASSWD   PIC  X(10) VALUE 'cbl85'.

       01  SQL-CUS-UUID        PIC X(36).
OCESQL*EXEC SQL END DECLARE SECTION END-EXEC.
OCESQL*EXEC SQL INCLUDE SQLCA END-EXEC.
OCESQL     copy "sqlca.cbl".

OCESQL*
OCESQL 01  SQ0001.
OCESQL     02  FILLER PIC X(014) VALUE "DISCONNECT ALL".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
OCESQL 01  SQ0002.
OCESQL     02  FILLER PIC X(064) VALUE "SELECT uuid_customer FROM cust"
OCESQL  &  "omer WHERE customer_code_secu = $1".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
OCESQL 01  SQ0003.
OCESQL     02  FILLER PIC X(256) VALUE "INSERT INTO CUSTOMER ( CUSTOME"
OCESQL  &  "R_GENDER, CUSTOMER_LASTNAME, CUSTOMER_FIRSTNAME, CUSTOMER_"
OCESQL  &  "ADRESS1, CUSTOMER_ADRESS2, CUSTOMER_ZIPCODE, CUSTOMER_TOWN"
OCESQL  &  ", CUSTOMER_COUNTRY, CUSTOMER_PHONE, CUSTOMER_MAIL, CUSTOME"
OCESQL  &  "R_BIRTH_DATE, CUSTOMER_DOCTOR, CUSTOMER_CODE_SECU, C".
OCESQL     02  FILLER PIC X(256) VALUE "USTOMER_CODE_IBAN, CUSTOMER_NB"
OCESQL  &  "CHILDREN, CUSTOMER_COUPLE, CUSTOMER_CREATE_DATE, CUSTOMER_"
OCESQL  &  "ACTIVE ) VALUES ( TRIM( $1 ), TRIM( $2 ), TRIM( $3 ), TRIM"
OCESQL  &  "( $4 ), TRIM( $5 ), TRIM( $6 ), TRIM( $7 ), TRIM( $8 ), TR"
OCESQL  &  "IM( $9 ), TRIM( $10 ), $11, TRIM( $12 ), $13, TRIM( ".
OCESQL     02  FILLER PIC X(027) VALUE "$14 ), $15, $16, $17, '1' )".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
OCESQL 01  SQ0004.
OCESQL     02  FILLER PIC X(064) VALUE "SELECT uuid_customer FROM cust"
OCESQL  &  "omer WHERE customer_code_secu = $1".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
       LINKAGE SECTION.
       01  LK-CUSTOMER.
           03 LK-CUS-UUID        PIC X(36).
           03 LK-CUS-GENDER      PIC X(10).
           03 LK-CUS-LASTNAME    PIC X(20).
           03 LK-CUS-FIRSTNAME   PIC X(20).
           03 LK-CUS-ADRESS1	 PIC X(50).
           03 LK-CUS-ADRESS2	 PIC X(50).
           03 LK-CUS-ZIPCODE	 PIC X(15).
           03 LK-CUS-TOWN	     PIC X(30).
           03 LK-CUS-COUNTRY	 PIC X(20).
           03 LK-CUS-PHONE	     PIC X(10).
           03 LK-CUS-MAIL	     PIC X(50).
           03 LK-CUS-BIRTH-DATE  PIC X(10).
           03 LK-CUS-DOCTOR	     PIC X(20).
           03 LK-CUS-CODE-SECU.
               05 LK-SECU-1      PIC X(01).
               05 LK-SECU-2      PIC X(02).
               05 LK-SECU-3      PIC X(02).
               05 LK-SECU-4      PIC X(02).
               05 LK-SECU-5      PIC X(03).
               05 LK-SECU-6      PIC X(03).
               05 LK-SECU-7      PIC X(02).
           03 LK-CUS-CODE-IBAN   PIC X(34).
           03 LK-CUS-NBCHILDREN  PIC 9(03).
           03 LK-CUS-COUPLE      PIC X(05).
           03 LK-CUS-CREATE-DATE PIC X(10).
           03 LK-CUS-UPDATE-DATE PIC X(10).
           03 LK-CUS-CLOSE-DATE  PIC X(10).
           03 LK-CUS-ACTIVE	     PIC X(01). 

       01  LK-COUNT-CUSTOMER     PIC 9(05).

      ******************************************************************

       PROCEDURE DIVISION USING LK-CUSTOMER, LK-COUNT-CUSTOMER.

       0000-START-MAIN.
OCESQL*    EXEC SQL
OCESQL*        CONNECT :USERNAME IDENTIFIED BY :PASSWD USING :DBNAME 
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLConnect" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE USERNAME
OCESQL          BY VALUE 5
OCESQL          BY REFERENCE PASSWD
OCESQL          BY VALUE 10
OCESQL          BY REFERENCE DBNAME
OCESQL          BY VALUE 11
OCESQL     END-CALL.
           
           PERFORM 1000-START-INITIALIZATION 
              THRU END-1000-INITIALIZATION. 

           PERFORM 2000-START-SELECT-EXISTING-CUSTOMER
              THRU END-2000-SELECT-EXISTING-CUSTOMER.

           IF LK-COUNT-CUSTOMER LESS THAN 1 THEN         
               PERFORM 3000-START-INSERT-DATA-DB
                  THRU END-3000-INSERT-DATA-DB
       
               PERFORM 4000-START-SELECT-CUSTOMER-CREATE
                  THRU END-4000-SELECT-CUSTOMER-CREATE
       
               MOVE WS-CUSTOMER TO LK-CUSTOMER
           END-IF.
       0000-END-MAIN.    
OCESQL*    EXEC SQL COMMIT WORK END-EXEC.
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLExec" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "COMMIT" & x"00"
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL.
OCESQL*    EXEC SQL DISCONNECT ALL END-EXEC.
OCESQL     CALL "OCESQLDisconnect" USING
OCESQL          BY REFERENCE SQLCA
OCESQL     END-CALL.
           GOBACK.

      ******************************************************************
      *    [MF-RD] Initialisation des données pour la requête SQL.     *
      ******************************************************************
       1000-START-INITIALIZATION.
      *    [MF] Convertit le statut de couple en 't' ou 'f' pour la DB. 
           IF LK-CUS-COUPLE EQUAL 'oui' THEN
               MOVE 't' TO LK-CUS-COUPLE
           ELSE IF LK-CUS-COUPLE EQUAL 'non' THEN
               MOVE 'f' TO LK-CUS-COUPLE
           END-IF. 

      *    [MF] Déplace les données de la LINKAGE vers la WS. 
           MOVE LK-CUSTOMER TO WS-CUSTOMER.    

      *    [RD] Initialise la date de création.   
           ACCEPT WS-CUS-CREATE-DATE FROM DATE YYYYMMDD.
       END-1000-INITIALIZATION.
           EXIT.

      ******************************************************************
      *    [RD] Récupère l'UUID de l'adhérent par rapport au numéro de *
      *    sécurité sociale saisi dans le FRONT.                       *
      ****************************************************************** 
       2000-START-SELECT-EXISTING-CUSTOMER.
           INITIALIZE LK-COUNT-CUSTOMER.

OCESQL*    EXEC SQL
OCESQL*        DECLARE CRSEXIST CURSOR FOR
OCESQL*        SELECT uuid_customer
OCESQL*        FROM customer
OCESQL*        WHERE customer_code_secu = :WS-CUS-CODE-SECU
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 15
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-CUS-CODE-SECU
OCESQL     END-CALL
OCESQL     CALL "OCESQLCursorDeclareParams" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "ccback_CRSEXIST" & x"00"
OCESQL          BY REFERENCE SQ0002
OCESQL          BY VALUE 1
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL.

OCESQL*    EXEC SQL  
OCESQL*        OPEN CRSEXIST
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLCursorOpen" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "ccback_CRSEXIST" & x"00"
OCESQL     END-CALL.

           PERFORM UNTIL SQLCODE = 100
OCESQL*        EXEC SQL
OCESQL*            FETCH CRSEXIST
OCESQL*            INTO :SQL-CUS-UUID
OCESQL*        END-EXEC
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 36
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-UUID
OCESQL     END-CALL
OCESQL     CALL "OCESQLCursorFetchOne" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "ccback_CRSEXIST" & x"00"
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL
               
               EVALUATE SQLCODE
                   WHEN ZERO
                       ADD 1 TO LK-COUNT-CUSTOMER
                       MOVE SQL-CUS-UUID TO WS-CUS-UUID
                   WHEN 100
                       DISPLAY 'NO MORE ROWS IN CURSOR RESULT SET'
                   WHEN OTHER
                       DISPLAY 'ERROR FETCHING CURSOR CRSEXIST :'
                       SPACE SQLCODE
               END-EVALUATE
           END-PERFORM.
OCESQL*    EXEC SQL  
OCESQL*        CLOSE CRSEXIST  
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLCursorClose"  USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "ccback_CRSEXIST" & x"00"
OCESQL     END-CALL
OCESQL    .
       END-2000-SELECT-EXISTING-CUSTOMER.
           EXIT.

      ****************************************************************** 
      *    [MF] Insère les données dans la table CUSTOMER.             *
      ****************************************************************** 
       3000-START-INSERT-DATA-DB.
OCESQL*    EXEC SQL
OCESQL*        INSERT INTO CUSTOMER (
OCESQL*            CUSTOMER_GENDER, 
OCESQL*            CUSTOMER_LASTNAME, 
OCESQL*            CUSTOMER_FIRSTNAME, 
OCESQL*            CUSTOMER_ADRESS1, 
OCESQL*            CUSTOMER_ADRESS2, 
OCESQL*            CUSTOMER_ZIPCODE, 
OCESQL*            CUSTOMER_TOWN, 
OCESQL*            CUSTOMER_COUNTRY, 
OCESQL*            CUSTOMER_PHONE, 
OCESQL*            CUSTOMER_MAIL, 
OCESQL*            CUSTOMER_BIRTH_DATE,
OCESQL*            CUSTOMER_DOCTOR, 
OCESQL*            CUSTOMER_CODE_SECU,
OCESQL*            CUSTOMER_CODE_IBAN, 
OCESQL*            CUSTOMER_NBCHILDREN, 
OCESQL*            CUSTOMER_COUPLE,
OCESQL*            CUSTOMER_CREATE_DATE, 
OCESQL*            CUSTOMER_ACTIVE
OCESQL*        )
OCESQL*        VALUES ( 
OCESQL*            TRIM(:WS-CUS-GENDER), 
OCESQL*            TRIM(:WS-CUS-LASTNAME), 
OCESQL*            TRIM(:WS-CUS-FIRSTNAME), 
OCESQL*            TRIM(:WS-CUS-ADRESS1), 
OCESQL*            TRIM(:WS-CUS-ADRESS2), 
OCESQL*            TRIM(:WS-CUS-ZIPCODE), 
OCESQL*            TRIM(:WS-CUS-TOWN), 
OCESQL*            TRIM(:WS-CUS-COUNTRY), 
OCESQL*            TRIM(:WS-CUS-PHONE), 
OCESQL*            TRIM(:WS-CUS-MAIL), 
OCESQL*            :WS-CUS-BIRTH-DATE,
OCESQL*            TRIM(:WS-CUS-DOCTOR), 
OCESQL*            :WS-CUS-CODE-SECU, 
OCESQL*            TRIM(:WS-CUS-CODE-IBAN),
OCESQL*            :WS-CUS-NBCHILDREN, 
OCESQL*            :WS-CUS-COUPLE, 
OCESQL*            :WS-CUS-CREATE-DATE,
OCESQL*            '1'
OCESQL*       )
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-CUS-GENDER
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 20
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-CUS-LASTNAME
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 20
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-CUS-FIRSTNAME
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 50
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-CUS-ADRESS1
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 50
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-CUS-ADRESS2
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 15
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-CUS-ZIPCODE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 30
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-CUS-TOWN
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 20
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-CUS-COUNTRY
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-CUS-PHONE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 50
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-CUS-MAIL
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-CUS-BIRTH-DATE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 20
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-CUS-DOCTOR
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 15
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-CUS-CODE-SECU
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 34
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-CUS-CODE-IBAN
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-CUS-NBCHILDREN
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 5
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-CUS-COUPLE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-CUS-CREATE-DATE
OCESQL     END-CALL
OCESQL     CALL "OCESQLExecParams" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE SQ0003
OCESQL          BY VALUE 17
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL.

      *    COMMIT l'insertion de l'adhérent. 
OCESQL*    EXEC SQL COMMIT WORK END-EXEC.
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLExec" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "COMMIT" & x"00"
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL.
       END-3000-INSERT-DATA-DB.
           EXIT.

      ******************************************************************
      *    [RD] Récupère l'UUID de l'adhérent qui a été inséré dans la *
      *    DB.                                                         *
      ****************************************************************** 
       4000-START-SELECT-CUSTOMER-CREATE.
           INITIALIZE LK-COUNT-CUSTOMER.

OCESQL*    EXEC SQL
OCESQL*        DECLARE CRSCREATE CURSOR FOR
OCESQL*        SELECT uuid_customer
OCESQL*        FROM customer
OCESQL*        WHERE customer_code_secu = :WS-CUS-CODE-SECU
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 15
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-CUS-CODE-SECU
OCESQL     END-CALL
OCESQL     CALL "OCESQLCursorDeclareParams" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "ccback_CRSCREATE" & x"00"
OCESQL          BY REFERENCE SQ0004
OCESQL          BY VALUE 1
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL.

OCESQL*    EXEC SQL  
OCESQL*        OPEN CRSCREATE
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLCursorOpen" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "ccback_CRSCREATE" & x"00"
OCESQL     END-CALL.

           PERFORM UNTIL SQLCODE = 100
OCESQL*        EXEC SQL
OCESQL*            FETCH CRSCREATE
OCESQL*            INTO :SQL-CUS-UUID
OCESQL*        END-EXEC
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 36
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-UUID
OCESQL     END-CALL
OCESQL     CALL "OCESQLCursorFetchOne" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "ccback_CRSCREATE" & x"00"
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL
               
               EVALUATE SQLCODE
                   WHEN ZERO
                       MOVE SQL-CUS-UUID TO WS-CUS-UUID
                   WHEN 100
                       DISPLAY 'NO MORE ROWS IN CURSOR RESULT SET'
                   WHEN OTHER
                       DISPLAY 'ERROR FETCHING CURSOR CRSCREATE :'
                       SPACE SQLCODE
               END-EVALUATE
           END-PERFORM.
OCESQL*    EXEC SQL  
OCESQL*        CLOSE CRSCREATE  
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLCursorClose"  USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "ccback_CRSCREATE" & x"00"
OCESQL     END-CALL
OCESQL    .
       END-4000-SELECT-CUSTOMER-CREATE.
           EXIT.
           EXIT.
           EXIT.
