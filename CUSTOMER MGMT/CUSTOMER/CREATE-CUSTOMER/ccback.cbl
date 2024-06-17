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

       EXEC SQL BEGIN DECLARE SECTION END-EXEC.
       01  DBNAME   PIC  X(11) VALUE 'boboniortdb'.
       01  USERNAME PIC  X(05) VALUE 'cobol'.
       01  PASSWD   PIC  X(10) VALUE 'cbl85'.

       01  SQL-CUS-UUID        PIC X(36).
       EXEC SQL END DECLARE SECTION END-EXEC.
       EXEC SQL INCLUDE SQLCA END-EXEC.

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
           EXEC SQL
               CONNECT :USERNAME IDENTIFIED BY :PASSWD USING :DBNAME 
           END-EXEC.
           
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
           EXEC SQL COMMIT WORK END-EXEC.
           EXEC SQL DISCONNECT ALL END-EXEC.
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

           EXEC SQL
               DECLARE CRSEXIST CURSOR FOR
               SELECT uuid_customer
               FROM customer
               WHERE customer_code_secu = :WS-CUS-CODE-SECU
           END-EXEC.

           EXEC SQL  
               OPEN CRSEXIST
           END-EXEC.

           PERFORM UNTIL SQLCODE = 100
               EXEC SQL
                   FETCH CRSEXIST
                   INTO :SQL-CUS-UUID
               END-EXEC
               
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
           EXEC SQL  
               CLOSE CRSEXIST  
           END-EXEC.
       END-2000-SELECT-EXISTING-CUSTOMER.
           EXIT.

      ****************************************************************** 
      *    [MF] Insère les données dans la table CUSTOMER.             *
      ****************************************************************** 
       3000-START-INSERT-DATA-DB.
           EXEC SQL
               INSERT INTO CUSTOMER (
                   CUSTOMER_GENDER, 
                   CUSTOMER_LASTNAME, 
                   CUSTOMER_FIRSTNAME, 
                   CUSTOMER_ADRESS1, 
                   CUSTOMER_ADRESS2, 
                   CUSTOMER_ZIPCODE, 
                   CUSTOMER_TOWN, 
                   CUSTOMER_COUNTRY, 
                   CUSTOMER_PHONE, 
                   CUSTOMER_MAIL, 
                   CUSTOMER_BIRTH_DATE,
                   CUSTOMER_DOCTOR, 
                   CUSTOMER_CODE_SECU,
                   CUSTOMER_CODE_IBAN, 
                   CUSTOMER_NBCHILDREN, 
                   CUSTOMER_COUPLE,
                   CUSTOMER_CREATE_DATE, 
                   CUSTOMER_ACTIVE
               )
               VALUES ( 
                   TRIM(:WS-CUS-GENDER), 
                   TRIM(:WS-CUS-LASTNAME), 
                   TRIM(:WS-CUS-FIRSTNAME), 
                   TRIM(:WS-CUS-ADRESS1), 
                   TRIM(:WS-CUS-ADRESS2), 
                   TRIM(:WS-CUS-ZIPCODE), 
                   TRIM(:WS-CUS-TOWN), 
                   TRIM(:WS-CUS-COUNTRY), 
                   TRIM(:WS-CUS-PHONE), 
                   TRIM(:WS-CUS-MAIL), 
                   :WS-CUS-BIRTH-DATE,
                   TRIM(:WS-CUS-DOCTOR), 
                   :WS-CUS-CODE-SECU, 
                   TRIM(:WS-CUS-CODE-IBAN),
                   :WS-CUS-NBCHILDREN, 
                   :WS-CUS-COUPLE, 
                   :WS-CUS-CREATE-DATE,
                   '1'
              )
           END-EXEC.

      *    COMMIT l'insertion de l'adhérent. 
           EXEC SQL COMMIT WORK END-EXEC.
       END-3000-INSERT-DATA-DB.
           EXIT.

      ******************************************************************
      *    [RD] Récupère l'UUID de l'adhérent qui a été inséré dans la *
      *    DB.                                                         *
      ****************************************************************** 
       4000-START-SELECT-CUSTOMER-CREATE.
           INITIALIZE LK-COUNT-CUSTOMER.

           EXEC SQL
               DECLARE CRSCREATE CURSOR FOR
               SELECT uuid_customer
               FROM customer
               WHERE customer_code_secu = :WS-CUS-CODE-SECU
           END-EXEC.

           EXEC SQL  
               OPEN CRSCREATE
           END-EXEC.

           PERFORM UNTIL SQLCODE = 100
               EXEC SQL
                   FETCH CRSCREATE
                   INTO :SQL-CUS-UUID
               END-EXEC
               
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
           EXEC SQL  
               CLOSE CRSCREATE  
           END-EXEC.
       END-4000-SELECT-CUSTOMER-CREATE.
           EXIT.
