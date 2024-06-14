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

       EXEC SQL BEGIN DECLARE SECTION END-EXEC.
       01 DBNAME PIC X(11) VALUE 'boboniortdb'.
       01 USERNAME PIC X(05) VALUE 'cobol'.
       01 PASSWD PIC X(10) VALUE 'cbl85'.
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

      ******************************************************************       
       
       PROCEDURE DIVISION USING LK-CUSTOMER.    

       0000-START-MAIN.
           EXEC SQL
               CONNECT :USERNAME IDENTIFIED BY :PASSWD USING :DBNAME
           END-EXEC.

           PERFORM 1000-START-INITIALIZATION 
              THRU END-1000-INITIALIZATION.       

           PERFORM 2000-START-UPDATE-DATA-DB
              THRU END-2000-UPDATE-DATA-DB.

           MOVE WS-CUSTOMER TO LK-CUSTOMER.
       END-0000-MAIN.
           EXEC SQL COMMIT WORK END-EXEC.
           EXEC SQL DISCONNECT ALL END-EXEC.
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
           EXEC SQL
               UPDATE CUSTOMER SET
                   CUSTOMER_GENDER      = TRIM(:WS-CUS-GENDER), 
                   CUSTOMER_LASTNAME    = TRIM(:WS-CUS-LASTNAME),
                   CUSTOMER_FIRSTNAME   = TRIM(:WS-CUS-FIRSTNAME), 
                   CUSTOMER_ADRESS1     = TRIM(:WS-CUS-ADRESS1), 
                   CUSTOMER_ADRESS2     = TRIM(:WS-CUS-ADRESS2), 
                   CUSTOMER_ZIPCODE     = TRIM(:WS-CUS-ZIPCODE), 
                   CUSTOMER_TOWN        = TRIM(:WS-CUS-TOWN), 
                   CUSTOMER_COUNTRY     = TRIM(:WS-CUS-COUNTRY), 
                   CUSTOMER_PHONE       = TRIM(:WS-CUS-PHONE), 
                   CUSTOMER_MAIL        = TRIM(:WS-CUS-MAIL),
                   CUSTOMER_BIRTH_DATE  = :WS-CUS-BIRTH-DATE,
                   CUSTOMER_DOCTOR      = TRIM(:WS-CUS-DOCTOR),
                   CUSTOMER_CODE_SECU   = :WS-CUS-CODE-SECU,
                   CUSTOMER_CODE_IBAN   = TRIM(:WS-CUS-CODE-IBAN),
                   CUSTOMER_NBCHILDREN  = :WS-CUS-NBCHILDREN,
                   CUSTOMER_COUPLE      = :WS-CUS-COUPLE,
                   CUSTOMER_UPDATE_DATE = :WS-CUS-UPDATE-DATE
               WHERE UUID_CUSTOMER = :WS-CUS-UUID
           END-EXEC.       
       END-2000-UPDATE-DATA-DB.
           EXIT.
