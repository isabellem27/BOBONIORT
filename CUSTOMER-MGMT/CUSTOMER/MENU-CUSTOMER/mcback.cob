      ******************************************************************
      *    [RD] Ce programme recherche dans la table 'customer' un     *
      *    adhérent en fonction de l'UUID reçu par le programme        *
      *    appelant et le stock dans le CUSTOMER de la LINKAGE SECTION.*
      *    de l'utilisateur dans les différents champs de recherche.   *
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. mcback.
       AUTHOR.       Rémi.

      ******************************************************************

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-UUID-RECIEVED PIC X(36).

OCESQL*EXEC SQL BEGIN DECLARE SECTION END-EXEC.
       01  DBNAME   PIC  X(11) VALUE 'boboniortdb'.
       01  USERNAME PIC  X(05) VALUE 'cobol'.
       01  PASSWD   PIC  X(10) VALUE 'cbl85'.

       01  SQL-CUSTOMER.
           03 SQL-CUS-UUID        PIC X(36).
           03 SQL-CUS-GENDER      PIC X(10).
           03 SQL-CUS-LASTNAME    PIC X(20).
           03 SQL-CUS-FIRSTNAME   PIC X(20).
           03 SQL-CUS-ADRESS1	  PIC X(50).
           03 SQL-CUS-ADRESS2	  PIC X(50).
           03 SQL-CUS-ZIPCODE	  PIC X(15).
           03 SQL-CUS-TOWN	      PIC X(30).
           03 SQL-CUS-COUNTRY	  PIC X(20).
           03 SQL-CUS-PHONE	      PIC X(10).
           03 SQL-CUS-MAIL	      PIC X(50).
           03 SQL-CUS-BIRTH-DATE  PIC X(10).
           03 SQL-CUS-DOCTOR	  PIC X(20).
           03 SQL-CUS-CODE-SECU   PIC 9(15).
           03 SQL-CUS-CODE-IBAN   PIC X(34).
           03 SQL-CUS-NBCHILDREN  PIC 9(03).
           03 SQL-CUS-COUPLE      PIC X(05).
           03 SQL-CUS-CREATE-DATE PIC X(10).
           03 SQL-CUS-UPDATE-DATE PIC X(10).
           03 SQL-CUS-CLOSE-DATE  PIC X(10).
           03 SQL-CUS-ACTIVE	  PIC X(01).
OCESQL*EXEC SQL END DECLARE SECTION END-EXEC.
OCESQL*EXEC SQL INCLUDE SQLCA END-EXEC.  
OCESQL     copy "sqlca.cbl".

OCESQL*
OCESQL 01  SQ0001.
OCESQL     02  FILLER PIC X(014) VALUE "DISCONNECT ALL".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
OCESQL 01  SQ0002.
OCESQL     02  FILLER PIC X(256) VALUE "SELECT uuid_customer, customer"
OCESQL  &  "_gender, customer_lastname, customer_firstname, customer_a"
OCESQL  &  "dress1, customer_adress2, customer_zipcode, customer_town,"
OCESQL  &  " customer_country, customer_phone, customer_mail, customer"
OCESQL  &  "_birth_date, customer_doctor, customer_code_secu, cu".
OCESQL     02  FILLER PIC X(175) VALUE "stomer_code_iban, customer_nbc"
OCESQL  &  "hildren, customer_couple, customer_create_date, customer_u"
OCESQL  &  "pdate_date, customer_close_date, customer_active FROM cust"
OCESQL  &  "omer WHERE uuid_customer = $1".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
       LINKAGE SECTION.
       01  LK-UUID-RECIEVED      PIC X(36).
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
           03 LK-CUS-CODE-SECU   PIC 9(15).
           03 LK-CUS-CODE-IBAN   PIC X(34).
           03 LK-CUS-NBCHILDREN  PIC 9(03).
           03 LK-CUS-COUPLE      PIC X(05).
           03 LK-CUS-CREATE-DATE PIC X(10).
           03 LK-CUS-UPDATE-DATE PIC X(10).
           03 LK-CUS-CLOSE-DATE  PIC X(10).
           03 LK-CUS-ACTIVE	     PIC X(01).

      ******************************************************************

       PROCEDURE DIVISION USING LK-UUID-RECIEVED, LK-CUSTOMER.
       
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

           PERFORM 1000-START-HANDLE-CUSTOMER-ACCEPT
              THRU END-1000-HANDLE-CUSTOMER-ACCEPT.
           
           PERFORM 2000-START-SQL-REQUEST 
              THRU END-2000-SQL-REQUEST.

           PERFORM 3000-START-FETCH-CRSUUID 
              THRU END-3000-FETCH-CRSUUID.
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
      *    [RD] Transfert les données de LK-UUID-RECIEVED vers         *
      *    WS-UUID-RECIEVED.                                           *
      ******************************************************************
       1000-START-HANDLE-CUSTOMER-ACCEPT.
           INITIALIZE WS-UUID-RECIEVED.
           INITIALIZE SQL-CUSTOMER.

           MOVE LK-UUID-RECIEVED TO WS-UUID-RECIEVED.
       END-1000-HANDLE-CUSTOMER-ACCEPT.
           EXIT.

      ******************************************************************
      *    [RD] Requêtes SQL qui retourne un adhérent en fonction du   *
      *    UUID reçu par le programme appelant.                        *
      ******************************************************************
       2000-START-SQL-REQUEST.
      *    Recherche en fonction du UUID.
OCESQL*    EXEC SQL
OCESQL*        DECLARE CRSUUID CURSOR FOR
OCESQL*        SELECT uuid_customer, customer_gender, 
OCESQL*        customer_lastname, customer_firstname, customer_adress1,
OCESQL*        customer_adress2, customer_zipcode, customer_town,
OCESQL*        customer_country, customer_phone, customer_mail,
OCESQL*        customer_birth_date, customer_doctor, customer_code_secu,
OCESQL*        customer_code_iban, customer_nbchildren, customer_couple,
OCESQL*        customer_create_date, customer_update_date,
OCESQL*        customer_close_date, customer_active
OCESQL*        FROM customer
OCESQL*        WHERE uuid_customer = :WS-UUID-RECIEVED
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 36
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-UUID-RECIEVED
OCESQL     END-CALL
OCESQL     CALL "OCESQLCursorDeclareParams" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "mcback_CRSUUID" & x"00"
OCESQL          BY REFERENCE SQ0002
OCESQL          BY VALUE 1
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL.
       END-2000-SQL-REQUEST.
           EXIT.

      ******************************************************************
      *    [RD] Effectue le FECTH pour le CURSOR CRSUUID.              *
      ******************************************************************
       3000-START-FETCH-CRSUUID.
OCESQL*    EXEC SQL  
OCESQL*        OPEN CRSUUID  
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLCursorOpen" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "mcback_CRSUUID" & x"00"
OCESQL     END-CALL.

           PERFORM UNTIL SQLCODE = 100
OCESQL*        EXEC SQL
OCESQL*            FETCH CRSUUID
OCESQL*            INTO :SQL-CUS-UUID, :SQL-CUS-GENDER,
OCESQL*                 :SQL-CUS-LASTNAME, :SQL-CUS-FIRSTNAME,
OCESQL*                 :SQL-CUS-ADRESS1, :SQL-CUS-ADRESS2, 
OCESQL*                 :SQL-CUS-ZIPCODE, :SQL-CUS-TOWN,
OCESQL*                 :SQL-CUS-COUNTRY, :SQL-CUS-PHONE,
OCESQL*                 :SQL-CUS-MAIL, :SQL-CUS-BIRTH-DATE, 
OCESQL*                 :SQL-CUS-DOCTOR, :SQL-CUS-CODE-SECU, 
OCESQL*                 :SQL-CUS-CODE-IBAN, :SQL-CUS-NBCHILDREN, 
OCESQL*                 :SQL-CUS-COUPLE, :SQL-CUS-CREATE-DATE, 
OCESQL*                 :SQL-CUS-UPDATE-DATE, :SQL-CUS-CLOSE-DATE, 
OCESQL*                 :SQL-CUS-ACTIVE
OCESQL*        END-EXEC
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 36
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-UUID
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-GENDER
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 20
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-LASTNAME
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 20
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-FIRSTNAME
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 50
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-ADRESS1
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 50
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-ADRESS2
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 15
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-ZIPCODE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 30
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-TOWN
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 20
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-COUNTRY
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-PHONE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 50
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-MAIL
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-BIRTH-DATE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 20
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-DOCTOR
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 15
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-CODE-SECU
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 34
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-CODE-IBAN
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-NBCHILDREN
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 5
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-COUPLE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-CREATE-DATE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-UPDATE-DATE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-CLOSE-DATE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 1
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-ACTIVE
OCESQL     END-CALL
OCESQL     CALL "OCESQLCursorFetchOne" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "mcback_CRSUUID" & x"00"
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL

               EVALUATE SQLCODE
                   WHEN ZERO
                       PERFORM 3100-START-HANDLE THRU END-3100-HANDLE
                   WHEN 100
                       DISPLAY 'NO MORE ROWS IN CURSOR RESULT SET'
                   WHEN OTHER
                       DISPLAY 'ERROR FETCHING CURSOR CRSUUID:'
                       SPACE SQLCODE
               END-EVALUATE
           END-PERFORM.

OCESQL*    EXEC SQL  
OCESQL*        CLOSE CRSUUID   
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLCursorClose"  USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "mcback_CRSUUID" & x"00"
OCESQL     END-CALL
OCESQL    .
       END-3000-FETCH-CRSUUID.
           EXIT.

      ******************************************************************
      *    [RD] Stock le résultat de la requête SQL dans le CUSTOME de *
      *    la LINKAGE SECTION.                                         *
      ******************************************************************
       3100-START-HANDLE.
           INITIALIZE LK-CUSTOMER.

           MOVE SQL-CUS-UUID        TO LK-CUS-UUID.
           MOVE SQL-CUS-GENDER      TO LK-CUS-GENDER.
           MOVE SQL-CUS-LASTNAME    TO LK-CUS-LASTNAME.
           MOVE SQL-CUS-FIRSTNAME   TO LK-CUS-FIRSTNAME.
           MOVE SQL-CUS-ADRESS1     TO LK-CUS-ADRESS1.
           MOVE SQL-CUS-ADRESS2     TO LK-CUS-ADRESS2.
           MOVE SQL-CUS-ZIPCODE     TO LK-CUS-ZIPCODE.
           MOVE SQL-CUS-TOWN        TO LK-CUS-TOWN.
           MOVE SQL-CUS-COUNTRY     TO LK-CUS-COUNTRY.
           MOVE SQL-CUS-PHONE       TO LK-CUS-PHONE.
           MOVE SQL-CUS-MAIL        TO LK-CUS-MAIL.
           MOVE SQL-CUS-BIRTH-DATE  TO LK-CUS-BIRTH-DATE.
           MOVE SQL-CUS-DOCTOR      TO LK-CUS-DOCTOR.
           MOVE SQL-CUS-CODE-SECU   TO LK-CUS-CODE-SECU.
           MOVE SQL-CUS-CODE-IBAN   TO LK-CUS-CODE-IBAN.
           MOVE SQL-CUS-NBCHILDREN  TO LK-CUS-NBCHILDREN.
           MOVE SQL-CUS-COUPLE      TO LK-CUS-COUPLE.
           MOVE SQL-CUS-CREATE-DATE TO LK-CUS-CREATE-DATE.
           MOVE SQL-CUS-UPDATE-DATE TO LK-CUS-UPDATE-DATE.
           MOVE SQL-CUS-CLOSE-DATE  TO LK-CUS-CLOSE-DATE.
           MOVE SQL-CUS-ACTIVE      TO LK-CUS-ACTIVE.
       END-3100-HANDLE.
           EXIT.
           EXIT.
           EXIT.
