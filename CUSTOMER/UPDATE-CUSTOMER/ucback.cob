      ******************************************************************
      *    [SK-RD] Ce programme effectue les modifications dans la DB  *
      *    en fonction des informations saisies  par l'utilisateur     *
      *    dans le formulaire de modification.                         *
      ******************************************************************       

       IDENTIFICATION DIVISION.
       PROGRAM-ID. ucback.
       AUTHOR. Safaa.       

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
       01 DBNAME PIC X(11) VALUE 'boboniortdb'.
       01 USERNAME PIC X(05) VALUE 'cobol'.
       01 PASSWD PIC X(10) VALUE 'cbl85'.
OCESQL*EXEC SQL END DECLARE SECTION END-EXEC.
OCESQL*EXEC SQL INCLUDE SQLCA END-EXEC.       
OCESQL     copy "sqlca.cbl".

OCESQL*
OCESQL 01  SQ0001.
OCESQL     02  FILLER PIC X(014) VALUE "DISCONNECT ALL".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
OCESQL 01  SQ0002.
OCESQL     02  FILLER PIC X(256) VALUE "UPDATE CUSTOMER SET CUSTOMER_G"
OCESQL  &  "ENDER = TRIM( $1 ), CUSTOMER_LASTNAME = TRIM( $2 ), CUSTOM"
OCESQL  &  "ER_FIRSTNAME = TRIM( $3 ), CUSTOMER_ADRESS1 = TRIM( $4 ), "
OCESQL  &  "CUSTOMER_ADRESS2 = TRIM( $5 ), CUSTOMER_ZIPCODE = TRIM( $6"
OCESQL  &  " ), CUSTOMER_TOWN = TRIM( $7 ), CUSTOMER_COUNTRY = T".
OCESQL     02  FILLER PIC X(256) VALUE "RIM( $8 ), CUSTOMER_PHONE = TR"
OCESQL  &  "IM( $9 ), CUSTOMER_MAIL = TRIM( $10 ), CUSTOMER_BIRTH_DATE"
OCESQL  &  " = $11, CUSTOMER_DOCTOR = TRIM( $12 ), CUSTOMER_CODE_SECU "
OCESQL  &  "= $13, CUSTOMER_CODE_IBAN = TRIM( $14 ), CUSTOMER_NBCHILDR"
OCESQL  &  "EN = $15, CUSTOMER_COUPLE = $16, CUSTOMER_UPDATE_DAT".
OCESQL     02  FILLER PIC X(033) VALUE "E = $17 WHERE UUID_CUSTOMER = "
OCESQL  &  "$18".
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

      ******************************************************************       
       
       PROCEDURE DIVISION USING LK-CUSTOMER.    

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

           PERFORM 2000-START-UPDATE-DATA-DB
              THRU END-2000-UPDATE-DATA-DB.

           MOVE WS-CUSTOMER TO LK-CUSTOMER.
       END-0000-MAIN.
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
      *    [SK-RD] Initialisation des données pour la requête SQL.     *
      ******************************************************************
       1000-START-INITIALIZATION.
      *    [SK] Convertit le statut de couple en 't' ou 'f' pour la DB. 
           IF LK-CUS-COUPLE EQUAL 'oui' THEN
               MOVE 't' TO LK-CUS-COUPLE
           ELSE IF LK-CUS-COUPLE EQUAL 'non' THEN
               MOVE 'f' TO LK-CUS-COUPLE
           END-IF. 

           MOVE LK-CUSTOMER TO WS-CUSTOMER.    

           ACCEPT WS-CUS-UPDATE-DATE FROM DATE YYYYMMDD.
       END-1000-INITIALIZATION.
           EXIT.

      ******************************************************************
      *    [SK-RD] Met à jour les données de l'adhérent en fonction des*
      *    modifications saisies par l'utilisateur dans le formulaire  *
      *    de modification.                                            *
      ******************************************************************
       2000-START-UPDATE-DATA-DB.
OCESQL*    EXEC SQL
OCESQL*        UPDATE CUSTOMER SET
OCESQL*            CUSTOMER_GENDER      = TRIM(:WS-CUS-GENDER), 
OCESQL*            CUSTOMER_LASTNAME    = TRIM(:WS-CUS-LASTNAME),
OCESQL*            CUSTOMER_FIRSTNAME   = TRIM(:WS-CUS-FIRSTNAME), 
OCESQL*            CUSTOMER_ADRESS1     = TRIM(:WS-CUS-ADRESS1), 
OCESQL*            CUSTOMER_ADRESS2     = TRIM(:WS-CUS-ADRESS2), 
OCESQL*            CUSTOMER_ZIPCODE     = TRIM(:WS-CUS-ZIPCODE), 
OCESQL*            CUSTOMER_TOWN        = TRIM(:WS-CUS-TOWN), 
OCESQL*            CUSTOMER_COUNTRY     = TRIM(:WS-CUS-COUNTRY), 
OCESQL*            CUSTOMER_PHONE       = TRIM(:WS-CUS-PHONE), 
OCESQL*            CUSTOMER_MAIL        = TRIM(:WS-CUS-MAIL),
OCESQL*            CUSTOMER_BIRTH_DATE  = :WS-CUS-BIRTH-DATE,
OCESQL*            CUSTOMER_DOCTOR      = TRIM(:WS-CUS-DOCTOR),
OCESQL*            CUSTOMER_CODE_SECU   = :WS-CUS-CODE-SECU,
OCESQL*            CUSTOMER_CODE_IBAN   = TRIM(:WS-CUS-CODE-IBAN),
OCESQL*            CUSTOMER_NBCHILDREN  = :WS-CUS-NBCHILDREN,
OCESQL*            CUSTOMER_COUPLE      = :WS-CUS-COUPLE,
OCESQL*            CUSTOMER_UPDATE_DATE = :WS-CUS-UPDATE-DATE
OCESQL*        WHERE UUID_CUSTOMER = :WS-CUS-UUID
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
OCESQL          BY VALUE 8
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-CUS-UPDATE-DATE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 36
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-CUS-UUID
OCESQL     END-CALL
OCESQL     CALL "OCESQLExecParams" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE SQ0002
OCESQL          BY VALUE 18
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL.
       END-2000-UPDATE-DATA-DB.
           EXIT.
           EXIT.
           EXIT.
