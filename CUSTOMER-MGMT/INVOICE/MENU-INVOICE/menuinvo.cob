      ****************************************************************** 
      *
      ******************************************************************

       IDENTIFICATION DIVISION.
       PROGRAM-ID. menuinvo RECURSIVE.
       AUTHOR. Martial.

      ******************************************************************

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-CUSTOMER-NAME      PIC X(55).
       01  WS-INVOICE-UUID       PIC X(36).  
       01  WS-INITIAL-AMOUNT     PIC 9(05).
       01  WS-MADE-AMOUNT        PIC 9(05)V99.
       01  WS-REMAINING-AMOUNT   PIC 9(05)V99.
       01  WS-PAYMENT-AMOUNT     PIC 9(05)V99.
       01  WS-ACCEPT-PAYMENT     PIC X(01).
       01  WS-ERROR-MESSAGE      PIC X(70).
       01  WS-GENERATED-INVOICE  PIC X(01).
       01  WS-RETURN-MENU        PIC X(01).

       01 WS-CUSTOMER.
           03 WS-CUS-UUID        PIC X(36).
           03 WS-CUS-GENDER      PIC X(10).
           03 WS-CUS-LASTNAME    PIC X(20).
           03 WS-CUS-FIRSTNAME   PIC X(20).
           03 WS-CUS-ADRESS1	 PIC X(50).
           03 WS-CUS-ADRESS2	 PIC X(50).
           03 WS-CUS-ZIPCODE	 PIC X(15).
           03 WS-CUS-TOWN	     PIC X(50).
           03 WS-CUS-COUNTRY	 PIC X(20).
           03 WS-CUS-PHONE	     PIC X(10).
           03 WS-CUS-MAIL	     PIC X(50).
           03 WS-CUS-BIRTH-DATE.
               05 WS-YEAR        PIC X(04).
               05 WS-SEPARATOR1  PIC X(01).
               05 WS-MONTH       PIC X(02).
               05 WS-SEPARATOR2  PIC X(01).
               05 WS-DAY         PIC X(02).
           03 WS-CUS-DOCTOR	     PIC X(50).
           03 WS-CUS-CODE-SECU.
               05 WS-SECU-1      PIC X(01).
               05 WS-SECU-2      PIC X(02).
               05 WS-SECU-3      PIC X(02).
               05 WS-SECU-4      PIC X(02).
               05 WS-SECU-5      PIC X(03).
               05 WS-SECU-6      PIC X(03).
               05 WS-SECU-7      PIC X(02).
           03 WS-CUS-CODE-IBAN   PIC X(34).
           03 WS-CUS-NBCHILDREN  PIC 9(03).
           03 WS-CUS-COUPLE      PIC X(05).
           03 WS-CUS-CREATE-DATE PIC X(10).
           03 WS-CUS-UPDATE-DATE PIC X(10).
           03 WS-CUS-CLOSE-DATE  PIC X(10).
           03 WS-CUS-ACTIVE	     PIC X(01).

OCESQL*EXEC SQL BEGIN DECLARE SECTION END-EXEC.
       01  DBNAME   PIC X(11) VALUE 'boboniortdb'.
       01  USERNAME PIC X(05) VALUE 'cobol'.
       01  PASSWD   PIC X(10) VALUE 'cbl85'.
OCESQL*EXEC SQL END DECLARE SECTION END-EXEC.
OCESQL*EXEC SQL INCLUDE SQLCA END-EXEC.
OCESQL     copy "sqlca.cbl".

OCESQL*
OCESQL 01  SQ0001.
OCESQL     02  FILLER PIC X(082) VALUE "SELECT REIMBURSEMENT_COST * 3 "
OCESQL  &  "FROM CUSTOMER_REIMBURSEMENT WHERE UUID_CUSTOMER = $1".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
OCESQL 01  SQ0002.
OCESQL     02  FILLER PIC X(136) VALUE "SELECT UUID_INVOICE, INVOICE_I"
OCESQL  &  "NCOME FROM INVOICE WHERE UUID_CUSTOMER = $1 ORDER BY INVOI"
OCESQL  &  "CE_CREATE_DATE DESC, INVOICE_NUMBER DESC LIMIT 1".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
OCESQL 01  SQ0003.
OCESQL     02  FILLER PIC X(014) VALUE "DISCONNECT ALL".
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
           03 LK-CUS-BIRTH-DATE.
               05 LK-YEAR        PIC X(04).
               05 LK-SEPARATOR1  PIC X(01).
               05 LK-MONTH       PIC X(02).
               05 LK-SEPARATOR2  PIC X(01).
               05 LK-DAY         PIC X(02).
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

       SCREEN SECTION.
       COPY 'screen-invoice.cpy'.

      ******************************************************************

       PROCEDURE DIVISION USING LK-CUSTOMER.
       0000-START-MAIN.
           INITIALIZE WS-INVOICE-UUID
                      WS-MADE-AMOUNT
                      WS-PAYMENT-AMOUNT 
                      WS-ACCEPT-PAYMENT
                      WS-ERROR-MESSAGE     
                      WS-GENERATED-INVOICE       
                      WS-RETURN-MENU .
           
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
           
           PERFORM 2000-START-SCREEN
              THRU END-2000-SCREEN.
       END-0000-MAIN.
           GOBACK.
           
      ******************************************************************
      *    [RD-MF] Initialisation des variables utilisées dans ce      *
      *    programme.                                                  *
      ****************************************************************** 
       1000-START-INITIALIZATION.
           STRING FUNCTION TRIM (LK-CUS-FIRSTNAME)
                  SPACE 
                  FUNCTION TRIM (LK-CUS-LASTNAME)
                  SPACE 
                  LK-SECU-1 '-' 
                  LK-SECU-2 '-'
                  LK-SECU-3 '-'
                  LK-SECU-4 '-'
                  LK-SECU-5 '-'
                  LK-SECU-6 '-'
                  LK-SECU-7  
           DELIMITED BY SIZE 
           INTO WS-CUSTOMER-NAME.  

           MOVE LK-CUSTOMER TO WS-CUSTOMER.

OCESQL*    EXEC SQL
OCESQL*        SELECT
OCESQL*            REIMBURSEMENT_COST * 3
OCESQL*        INTO
OCESQL*            :WS-INITIAL-AMOUNT
OCESQL*        FROM CUSTOMER_REIMBURSEMENT
OCESQL*        WHERE UUID_CUSTOMER = :WS-CUS-UUID
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 5
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-INITIAL-AMOUNT
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 36
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-CUS-UUID
OCESQL     END-CALL
OCESQL     CALL "OCESQLExecSelectIntoOne" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE SQ0001
OCESQL          BY VALUE 1
OCESQL          BY VALUE 1
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL.

OCESQL*    EXEC SQL
OCESQL*        SELECT UUID_INVOICE, INVOICE_INCOME 
OCESQL*        INTO :WS-INVOICE-UUID, :WS-REMAINING-AMOUNT
OCESQL*        FROM INVOICE
OCESQL*        WHERE UUID_CUSTOMER = :WS-CUS-UUID
OCESQL*        ORDER BY INVOICE_CREATE_DATE DESC, 
OCESQL*                 INVOICE_NUMBER DESC
OCESQL*        LIMIT 1
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 36
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-INVOICE-UUID
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 7
OCESQL          BY VALUE -2
OCESQL          BY REFERENCE WS-REMAINING-AMOUNT
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 36
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-CUS-UUID
OCESQL     END-CALL
OCESQL     CALL "OCESQLExecSelectIntoOne" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE SQ0002
OCESQL          BY VALUE 1
OCESQL          BY VALUE 2
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL.

           IF WS-INVOICE-UUID EQUAL SPACE THEN
               MOVE WS-INITIAL-AMOUNT TO WS-REMAINING-AMOUNT
           END-IF.
       END-1000-INITIALIZATION.
           EXIT.

      ******************************************************************
      *    [RD-MF] Appel la SCREEN SECTION et les différents           *
      *    paragraphes qui s'occupent d'effectuer divers traitement en *
      *    fonction de la saisie de l'utilisateur.                     *
      ******************************************************************  
       2000-START-SCREEN.
           ACCEPT SCREEN-INVOICE.

           PERFORM 2100-START-RETURN-MENU
              THRU END-2100-RETURN-MENU.

           PERFORM 2200-START-GENERATED-INVOICE
              THRU END-2200-GENERATED-INVOICE.

           PERFORM 2300-START-ACCEPT-PAYMENT
              THRU END-2300-ACCEPT-PAYMENT.

           PERFORM 2400-START-NO-ENTRY
              THRU END-2400-NO-ENTRY.  
       END-2000-SCREEN.
           EXIT.

      ******************************************************************
      *    [RD-MF] Gestion du retour menu.                             *
      ******************************************************************       
       2100-START-RETURN-MENU.
           MOVE FUNCTION UPPER-CASE(WS-RETURN-MENU) TO
           WS-RETURN-MENU.

           IF WS-RETURN-MENU EQUAL 'O'
OCESQL*        EXEC SQL COMMIT WORK END-EXEC
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLExec" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "COMMIT" & x"00"
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL
OCESQL*        EXEC SQL DISCONNECT ALL END-EXEC
OCESQL     CALL "OCESQLDisconnect" USING
OCESQL          BY REFERENCE SQLCA
OCESQL     END-CALL
               
               CALL
                   'mcfront'
                   USING BY CONTENT
                   WS-CUS-UUID
               END-CALL 
           
           ELSE IF WS-RETURN-MENU NOT EQUAL SPACE
           AND WS-RETURN-MENU NOT EQUAL 'O' THEN
               MOVE 'Veuillez entrer "O" pour retourner au menu.'
               TO WS-ERROR-MESSAGE
               
               INITIALIZE WS-PAYMENT-AMOUNT
                          WS-ACCEPT-PAYMENT
                          WS-GENERATED-INVOICE  
                          WS-RETURN-MENU

               GO TO 2000-START-SCREEN
           END-IF.
       END-2100-RETURN-MENU.
           EXIT.

      ******************************************************************
      *    [RD-MF] Gestion du bouton de génération de facture.         *
      ******************************************************************       
       2200-START-GENERATED-INVOICE.
           MOVE FUNCTION UPPER-CASE(WS-GENERATED-INVOICE) TO
           WS-GENERATED-INVOICE.

           IF WS-GENERATED-INVOICE EQUAL 'O' THEN
               CALL
                   'geneinvo'
                   USING BY CONTENT
                   LK-CUSTOMER, WS-REMAINING-AMOUNT, WS-MADE-AMOUNT
               END-CALL
       
               MOVE 'Facture genere avec succes' 
               TO WS-ERROR-MESSAGE
       
               INITIALIZE WS-PAYMENT-AMOUNT
                          WS-ACCEPT-PAYMENT
                          WS-GENERATED-INVOICE  
                          WS-RETURN-MENU
       
               GO TO 2000-START-SCREEN
           END-IF.
       END-2200-GENERATED-INVOICE.
           EXIT.

      ******************************************************************
      *    [RD-MF] Gestion lorsque l'utilisateur selectionne le bouton *
      *    "Accepter".                                                 *
      ******************************************************************   
       2300-START-ACCEPT-PAYMENT.
           MOVE FUNCTION UPPER-CASE(WS-ACCEPT-PAYMENT) TO
           WS-ACCEPT-PAYMENT.

           IF  WS-ACCEPT-PAYMENT EQUAL 'O' THEN
               IF WS-PAYMENT-AMOUNT LESS THAN WS-REMAINING-AMOUNT
               OR  WS-PAYMENT-AMOUNT EQUAL WS-REMAINING-AMOUNT THEN

                   ADD WS-PAYMENT-AMOUNT TO WS-MADE-AMOUNT

                   SUBTRACT WS-REMAINING-AMOUNT FROM WS-PAYMENT-AMOUNT 
                   GIVING WS-REMAINING-AMOUNT

                   INITIALIZE WS-PAYMENT-AMOUNT WS-ACCEPT-PAYMENT

                   GO TO 2000-START-SCREEN

           ELSE IF WS-ACCEPT-PAYMENT NOT EQUAL 'O' 
               AND WS-ACCEPT-PAYMENT NOT EQUAL SPACE THEN

               MOVE 'Veuillez entrer "O" pour accepter.'
               TO WS-ERROR-MESSAGE
               GO TO 2000-START-SCREEN

           ELSE IF WS-PAYMENT-AMOUNT GREATER
              THAN WS-REMAINING-AMOUNT THEN
               MOVE "Le montant est trop eleve par rapport au reste a pa
      -    "yer" 
               TO WS-ERROR-MESSAGE

               INITIALIZE WS-PAYMENT-AMOUNT
                              WS-ACCEPT-PAYMENT
                              WS-GENERATED-INVOICE  
                              WS-RETURN-MENU

               GO TO 2000-START-SCREEN
           END-IF.
       END-2300-ACCEPT-PAYMENT.
           EXIT.

      ******************************************************************
      *    [RD-MF] Gestion si l'utilisateur n'a rien saisi dans aucun  *
      *    input.                                                      *
      ******************************************************************  
       2400-START-NO-ENTRY.
           MOVE 'Veuillez entrer "O" pour effectuer votre choix.'
           TO WS-ERROR-MESSAGE.
           GO TO 2000-START-SCREEN.
       END-2400-NO-ENTRY.
           EXIT.
           EXIT.
           EXIT.
