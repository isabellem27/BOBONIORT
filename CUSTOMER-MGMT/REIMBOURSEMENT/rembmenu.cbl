      ****************************************************************** 

       IDENTIFICATION DIVISION.
       PROGRAM-ID. rembmenu RECURSIVE.
       AUTHOR. Alexandre.

      ******************************************************************

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-MENU-RETURN       PIC X(01).
       01  WS-ERROR-MESSAGE     PIC X(45).


       LINKAGE SECTION.
       01 LK-CUSTOMER.
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
           03 LK-CUS-CODE-IBAN.
               05 LK-IBAN-1      PIC X(04).
               05 LK-IBAN-2      PIC X(04).
               05 LK-IBAN-3      PIC X(04).
               05 LK-IBAN-4      PIC X(04).
               05 LK-IBAN-5      PIC X(04).
               05 LK-IBAN-6      PIC X(04).
               05 LK-IBAN-7      PIC X(04).
               05 LK-IBAN-8      PIC X(04).
               05 LK-IBAN-9      PIC X(02).
           03 LK-CUS-NBCHILDREN  PIC 9(03).
           03 LK-CUS-COUPLE      PIC X(05).
           03 LK-CUS-CREATE-DATE PIC X(10).
           03 LK-CUS-UPDATE-DATE PIC X(10).
           03 LK-CUS-CLOSE-DATE  PIC X(10).
           03 LK-CUS-ACTIVE	     PIC X(01).

     
       SCREEN SECTION.
       COPY 'screen-reimboursement-customer.cpy'.

      ******************************************************************

       PROCEDURE DIVISION USING LK-CUSTOMER.
 
       0000-START-MAIN.
           INITIALIZE WS-MENU-RETURN.
           ACCEPT SCREEN-REIMBOURSEMENT-CUSTOMER.

           PERFORM 2100-START-CHECK-CHOICE
              THRU 2100-END-CHECK-CHOICE.              
       END-0000-MAIN.
           GOBACK.

       2100-START-CHECK-CHOICE.
           IF FUNCTION UPPER-CASE(WS-MENU-RETURN)
              EQUAL 'O' THEN
               CALL 'mcfront' USING LK-CUS-UUID
           ELSE  
              MOVE 'Veuillez entrer "O" pour confirmer.' 
              TO WS-ERROR-MESSAGE
           END-IF.
       2100-END-CHECK-CHOICE.
           EXIT.  
