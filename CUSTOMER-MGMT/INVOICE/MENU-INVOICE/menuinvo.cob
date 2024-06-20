      ****************************************************************** 

       IDENTIFICATION DIVISION.
       PROGRAM-ID. menuinvo RECURSIVE.
       AUTHOR. Martial.

      ******************************************************************

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-CUSTOMER-NAME      PIC X(55).
       01  WS-ERROR-MESSAGE      PIC X(70).
       01  WS-RETURN-CHOICE      PIC X(01).
       01  WS-GENERATE-CHOICE    PIC X.
       01  WS-PAID-EXPECT        PIC 9(05).
       01  WS-PAID-INCOME-INPUT  PIC 9(05)V99.
       01  WS-PAID-INCOME-BUTTON PIC X.
       01  WS-TOTAL-INCOME       PIC 9(05)V99.
       01  WS-TOTAL-REST         PIC 9(05)V99.

       01  DISPLAY-INVOICE-INCOME     PIC 9(05)V99.
       01  DISPLAY-INVOICE-EXPECT     PIC 9(05)V99.
       01  DISPLAY-RESULT             PIC 9(05)V99. 

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
OCESQL     02  FILLER PIC X(074) VALUE "SELECT INVOICE_INCOME FROM INV"
OCESQL  &  "OICE WHERE UUID_CUSTOMER_REIMBOURSEMENT = $1".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
OCESQL 01  SQ0003.
OCESQL     02  FILLER PIC X(014) VALUE "DISCONNECT ALL".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
OCESQL 01  SQ0004.
OCESQL     02  FILLER PIC X(095) VALUE "UPDATE INVOICE SET INVOICE_INC"
OCESQL  &  "OME = INVOICE_INCOME + $1 WHERE UUID_CUSTOMER_REIMBOURSEME"
OCESQL  &  "NT = $2".
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
           INITIALIZE WS-ERROR-MESSAGE     
                      WS-RETURN-CHOICE     
                      WS-GENERATE-CHOICE       
                      WS-PAID-INCOME-INPUT 
                      WS-PAID-INCOME-BUTTON .

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

           MOVE LK-CUSTOMER TO WS-CUSTOMER.

OCESQL*    EXEC SQL
OCESQL*        SELECT
OCESQL*            REIMBURSEMENT_COST * 3
OCESQL*        INTO
OCESQL*            :WS-PAID-EXPECT
OCESQL*        FROM CUSTOMER_REIMBURSEMENT
OCESQL*        WHERE UUID_CUSTOMER = :WS-CUS-UUID
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 5
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-PAID-EXPECT
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
           
           MOVE WS-PAID-EXPECT TO WS-TOTAL-REST.
           MOVE WS-PAID-EXPECT TO DISPLAY-RESULT.
        1000-MAIN.    
           MOVE WS-PAID-EXPECT TO DISPLAY-INVOICE-EXPECT.

OCESQL*    EXEC SQL
OCESQL*        SELECT INVOICE_INCOME
OCESQL*        INTO :WS-TOTAL-INCOME
OCESQL*        FROM INVOICE
OCESQL*        WHERE UUID_CUSTOMER_REIMBOURSEMENT = :WS-CUS-UUID
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 7
OCESQL          BY VALUE -2
OCESQL          BY REFERENCE WS-TOTAL-INCOME
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
OCESQL          BY VALUE 1
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL.

           ACCEPT SCREEN-INVOICE.

           MOVE FUNCTION UPPER-CASE(WS-PAID-INCOME-BUTTON) TO
           WS-PAID-INCOME-BUTTON.

           MOVE FUNCTION UPPER-CASE(WS-GENERATE-CHOICE) TO
           WS-GENERATE-CHOICE.

           MOVE FUNCTION UPPER-CASE(WS-RETURN-CHOICE) TO
           WS-RETURN-CHOICE.

           IF WS-RETURN-CHOICE EQUAL 'O'
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
           END-IF.

           IF WS-GENERATE-CHOICE = "O" 
           MOVE WS-TOTAL-REST TO WS-TOTAL-REST
               CALL
                   'geneinvo'
                   USING BY CONTENT
                   LK-CUSTOMER, WS-TOTAL-REST, WS-TOTAL-INCOME
               END-CALL
               MOVE "Facture genere avec succes" TO WS-ERROR-MESSAGE
               INITIALIZE WS-GENERATE-CHOICE  
                          WS-PAID-INCOME-BUTTON 
               GO TO 1000-MAIN
           END-IF.

           IF WS-PAID-INCOME-BUTTON = "O" 
           AND WS-PAID-INCOME-INPUT < WS-TOTAL-REST
           OR WS-PAID-INCOME-INPUT = WS-TOTAL-REST

               ADD WS-PAID-INCOME-INPUT TO WS-TOTAL-INCOME

               MOVE WS-TOTAL-INCOME TO DISPLAY-INVOICE-INCOME

               SUBTRACT WS-TOTAL-REST FROM WS-PAID-INCOME-INPUT 
               GIVING WS-TOTAL-REST

               MOVE WS-TOTAL-REST TO DISPLAY-RESULT

OCESQL*        EXEC SQL
OCESQL*           UPDATE INVOICE
OCESQL*           SET INVOICE_INCOME = INVOICE_INCOME + :WS-TOTAL-INCOME
OCESQL*           WHERE UUID_CUSTOMER_REIMBOURSEMENT = :WS-CUS-UUID
OCESQL*        END-EXEC
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 7
OCESQL          BY VALUE -2
OCESQL          BY REFERENCE WS-TOTAL-INCOME
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 36
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-CUS-UUID
OCESQL     END-CALL
OCESQL     CALL "OCESQLExecParams" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE SQ0004
OCESQL          BY VALUE 2
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL

               GO TO 1000-MAIN

           ELSE
               IF WS-PAID-INCOME-BUTTON NOT = "O" 
               AND WS-PAID-INCOME-BUTTON NOT = SPACE

                   MOVE "Veuillez entrer 'O' dans Accepter" 
                   TO WS-ERROR-MESSAGE
                   GO TO 1000-MAIN
               END-IF

               IF WS-PAID-INCOME-INPUT > WS-TOTAL-REST
               MOVE "Le montant est trop eleve par rapport au reste a pa
      -    "yer" 
                   TO WS-ERROR-MESSAGE
                   GO TO 1000-MAIN
               END-IF
           END-IF.

           GO TO 1000-MAIN.
           GO TO 1000-MAIN.
           GO TO 1000-MAIN.
