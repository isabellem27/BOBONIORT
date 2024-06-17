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

       EXEC SQL BEGIN DECLARE SECTION END-EXEC.
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
       EXEC SQL END DECLARE SECTION END-EXEC.
       EXEC SQL INCLUDE SQLCA END-EXEC.  

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
           EXEC SQL
               CONNECT :USERNAME IDENTIFIED BY :PASSWD USING :DBNAME 
           END-EXEC.

           PERFORM 1000-START-HANDLE-CUSTOMER-ACCEPT
              THRU END-1000-HANDLE-CUSTOMER-ACCEPT.
           
           PERFORM 2000-START-SQL-REQUEST 
              THRU END-2000-SQL-REQUEST.

           PERFORM 3000-START-FETCH-CRSUUID 
              THRU END-3000-FETCH-CRSUUID.
       END-0000-MAIN.
           EXEC SQL COMMIT WORK END-EXEC.
           EXEC SQL DISCONNECT ALL END-EXEC. 
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
           EXEC SQL
               DECLARE CRSUUID CURSOR FOR
               SELECT uuid_customer, customer_gender, 
               customer_lastname, customer_firstname, customer_adress1,
               customer_adress2, customer_zipcode, customer_town,
               customer_country, customer_phone, customer_mail,
               customer_birth_date, customer_doctor, customer_code_secu,
               customer_code_iban, customer_nbchildren, customer_couple,
               customer_create_date, customer_update_date,
               customer_close_date, customer_active
               FROM customer
               WHERE uuid_customer = :WS-UUID-RECIEVED
           END-EXEC.
       END-2000-SQL-REQUEST.
           EXIT.

      ******************************************************************
      *    [RD] Effectue le FECTH pour le CURSOR CRSUUID.              *
      ******************************************************************
       3000-START-FETCH-CRSUUID.
           EXEC SQL  
               OPEN CRSUUID  
           END-EXEC.

           PERFORM UNTIL SQLCODE = 100
               EXEC SQL
                   FETCH CRSUUID
                   INTO :SQL-CUS-UUID, :SQL-CUS-GENDER,
                        :SQL-CUS-LASTNAME, :SQL-CUS-FIRSTNAME,
                        :SQL-CUS-ADRESS1, :SQL-CUS-ADRESS2, 
                        :SQL-CUS-ZIPCODE, :SQL-CUS-TOWN,
                        :SQL-CUS-COUNTRY, :SQL-CUS-PHONE,
                        :SQL-CUS-MAIL, :SQL-CUS-BIRTH-DATE, 
                        :SQL-CUS-DOCTOR, :SQL-CUS-CODE-SECU, 
                        :SQL-CUS-CODE-IBAN, :SQL-CUS-NBCHILDREN, 
                        :SQL-CUS-COUPLE, :SQL-CUS-CREATE-DATE, 
                        :SQL-CUS-UPDATE-DATE, :SQL-CUS-CLOSE-DATE, 
                        :SQL-CUS-ACTIVE
               END-EXEC

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

           EXEC SQL  
               CLOSE CRSUUID   
           END-EXEC.
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
