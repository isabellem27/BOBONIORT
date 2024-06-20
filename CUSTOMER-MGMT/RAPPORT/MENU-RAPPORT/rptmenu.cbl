      ****************************************************************** 

       IDENTIFICATION DIVISION.
       PROGRAM-ID. rptmenu RECURSIVE.
       AUTHOR. Martial.

      ******************************************************************

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-ERROR-MESSAGE     PIC X(70).
       01  WS-UPDATE-VALIDATION PIC X(01).
       01  WS-MENU-RETURN       PIC X(01).
       01  WS-GENERATE-CHOICE   PIC X.
       01  WS-MAIL-AROBASE      PIC 9(01) VALUE 0.
       01  WS-RETURN-CHOICE     PIC X.
       01  WS-PAID-EXPECT   PIC 9(7)V99.
       01  WS-PAID-INCOME-INPUT PIC 9(5)V99.
       01  WS-PAID-INCOME-BUTTON PIC X.
       01  WS-TOTAL-INCOME PIC 9(7)V99.
       01  WS-TOTAL-REST   PIC 9(7)V99.

       01  WS-RAW-COST     PIC 9(7)V99.
   
     
      

       01  DISPLAY-INVOICE-INCOME     PIC ZZZZZZ9.99.
       01  DISPLAY-INVOICE-EXPECT     PIC ZZZZZZ9.99.
       01  DISPLAY-RESULT             PIC ZZZZZZ9.99. 

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

       EXEC SQL BEGIN DECLARE SECTION END-EXEC.
       01 DBNAME PIC X(11) VALUE 'boboniortdb'.
       01 USERNAME PIC X(05) VALUE 'cobol'.
       01 PASSWD PIC X(10) VALUE 'cbl85'.
       EXEC SQL END DECLARE SECTION END-EXEC.
       EXEC SQL INCLUDE SQLCA END-EXEC.

       LINKAGE SECTION.
       01 LK-CUSTOMER.
           03 LK-CUS-UUID        PIC X(36).
           03 LK-CUS-GENDER      PIC X(10).
           03 LK-CUS-LASTNAME    PIC X(20).
           03 LK-CUS-FIRSTNAME   PIC X(20).
           03 LK-CUS-ADRESS1	 PIC X(50).
           03 LK-CUS-ADRESS2	 PIC X(50).
           03 LK-CUS-ZIPCODE	 PIC X(15).
           03 LK-CUS-TOWN	     PIC X(50).
           03 LK-CUS-COUNTRY	 PIC X(20).
           03 LK-CUS-PHONE	     PIC X(10).
           03 LK-CUS-MAIL	     PIC X(50).
           03 LK-CUS-BIRTH-DATE.
               05 LK-YEAR        PIC X(04).
               05 LK-SEPARATOR1  PIC X(01).
               05 LK-MONTH       PIC X(02).
               05 LK-SEPARATOR2  PIC X(01).
               05 LK-DAY         PIC X(02).
           03 LK-CUS-DOCTOR	     PIC X(50).
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
       01  LK-TOTAL-REST         PIC 9(7)V99.

       SCREEN SECTION.
       COPY 'screen-invoice.cpy'.

      ******************************************************************

       PROCEDURE DIVISION
           USING LK-CUSTOMER.
       EXEC SQL
               CONNECT :USERNAME IDENTIFIED BY :PASSWD USING :DBNAME
           END-EXEC.

           EXEC SQL
           SELECT
               REIMBURSEMENT_COST * 3,
               REIMBURSEMENT_COST * 3,
               REIMBURSEMENT_COST * 3
           INTO
               :WS-PAID-EXPECT,
               :WS-TOTAL-REST,
               :DISPLAY-RESULT
           FROM CUSTOMER_REIMBURSEMENT
           WHERE UUID_CUSTOMER = :WS-CUS-UUID
           END-EXEC.
       
       1000-MAIN.    
           MOVE LK-CUSTOMER TO WS-CUSTOMER.
           
             EXEC SQL
               SELECT INVOICE_INCOME
               INTO :WS-TOTAL-INCOME
               FROM INVOICE
               WHERE UUID_CUSTOMER_REIMBOURSEMENT = :WS-CUS-UUID
           END-EXEC.
           
           MOVE WS-PAID-EXPECT TO DISPLAY-INVOICE-EXPECT.
           ACCEPT SCREEN-INVOICE.

           MOVE FUNCTION UPPER-CASE(WS-PAID-INCOME-BUTTON) TO
           WS-PAID-INCOME-BUTTON.

           MOVE FUNCTION UPPER-CASE(WS-GENERATE-CHOICE) TO
           WS-GENERATE-CHOICE.
            MOVE FUNCTION UPPER-CASE(WS-MENU-RETURN) TO
           WS-MENU-RETURN.

            IF WS-PAID-INCOME-BUTTON = "O" AND WS-PAID-INCOME-INPUT 
            < WS-TOTAL-REST
              
                   ADD WS-PAID-INCOME-INPUT TO WS-TOTAL-INCOME
                   MOVE WS-TOTAL-INCOME TO DISPLAY-INVOICE-INCOME
                   SUBTRACT WS-TOTAL-REST FROM WS-PAID-INCOME-INPUT 
                   GIVING WS-TOTAL-REST
                   MOVE WS-TOTAL-REST TO DISPLAY-RESULT
                   
           EXEC SQL
           UPDATE INVOICE
           SET INVOICE_INCOME = INVOICE_INCOME + :WS-TOTAL-INCOME
            WHERE UUID_CUSTOMER_REIMBOURSEMENT = :WS-CUS-UUID
           END-EXEC.

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

           IF WS-GENERATE-CHOICE = "O" 
           MOVE WS-TOTAL-REST TO LK-TOTAL-REST
           CALL
               'rptbill'
               USING BY REFERENCE
               LK-CUSTOMER, LK-TOTAL-REST
           END-CALL
           MOVE "Facture genere avec succes" TO WS-ERROR-MESSAGE
           GO TO 1000-MAIN
           END-IF.

           IF WS-MENU-RETURN = "O"
           EXEC SQL COMMIT WORK END-EXEC.
           EXEC SQL DISCONNECT ALL END-EXEC.
           GOBACK
           END-IF.

           GO TO 1000-MAIN.

