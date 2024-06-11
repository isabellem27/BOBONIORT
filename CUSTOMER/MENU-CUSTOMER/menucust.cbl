      ******************************************************************
      *    Sous programme gerant l'affichage                           *
      *    de l'écran de menu de l'adherent  et la gestion d'erreur    *
      ****************************************************************** 
      
       IDENTIFICATION DIVISION.
       PROGRAM-ID. menucust.
       AUTHOR. Yves&Alexandre.

      ******************************************************************

       DATA DIVISION.
       WORKING-STORAGE SECTION. 
       01  WS-OPTIONS-MENU-CUST.
           03 WS-CUSTOMER-MODIF  PIC X(01).
           03 WS-CUST-ARCHIVE    PIC X(01).
           03 WS-CONTRACT-LIST   PIC X(01).             
           03 WS-MENU-RETURN     PIC X(01).    
           03 WS-ERROR-MESSAGE   PIC X(62).  

       01  CUS-CODE-SECU. 
           03 CCS-SECU-1 PIC X(01).
           03 CCS-SECU-2 PIC X(02).
           03 CCS-SECU-3 PIC X(02).
           03 CCS-SECU-4 PIC X(02).
           03 CCS-SECU-5 PIC X(03).
           03 CCS-SECU-6 PIC X(03).
           03 CCS-SECU-7 PIC X(02). 

       01  WS-COUPLE PIC X(03).                

       LINKAGE SECTION.
       01 LK-CUSTOMER.
           03 LK-CUR-UUID        PIC X(36).
           03 LK-CUR-GENDER      PIC X(10).
           03 LK-CUR-LASTNAME    PIC X(20).
           03 LK-CUR-FIRSTNAME   PIC X(20).
           03 LK-CUR-ADRESS1	 PIC X(50).
           03 LK-CUR-ADRESS2	 PIC X(50).
           03 LK-CUR-ZIPCODE	 PIC X(15).
           03 LK-CUR-TOWN	     PIC X(50).
           03 LK-CUR-COUNTRY	 PIC X(20).
           03 LK-CUR-PHONE	     PIC X(10).
           03 LK-CUR-MAIL	     PIC X(50).
           03 LK-CUR-BIRTH-DATE  PIC X(10).
           03 LK-CUR-DOCTOR	     PIC X(50).
           03 LK-CUR-CODE-SECU   PIC 9(15).
           03 LK-CUR-CODE-IBAN   PIC X(34).
           03 LK-CUR-NBCHILDREN  PIC 9(03).
           03 LK-CUR-COUPLE      PIC X(05).
           03 LK-CUR-CREATE-DATE PIC X(10).
           03 LK-CUR-UPDATE-DATE PIC X(10).
           03 LK-CUR-CLOSE-DATE  PIC X(10).
           03 LK-CUR-ACTIVE	     PIC X(01).

       SCREEN SECTION.
           COPY 'screen-menu-customer.cpy'.   

      ******************************************************************

       PROCEDURE DIVISION USING LK-CUSTOMER.
       
       0000-START-MAIN.
           MOVE LK-CUR-CODE-SECU TO CUS-CODE-SECU.

           IF LK-CUR-COUPLE EQUAL 't'
               MOVE 'Oui' TO WS-COUPLE
           ELSE IF LK-CUR-COUPLE EQUAL 'f'
               MOVE 'Non' TO WS-COUPLE
           END-IF.

           ACCEPT SCREEN-MENU-CUSTOMER.
       
           PERFORM 1100-START-CHECK-CHOICE 
              THRU 1100-END-CHECK-CHOICE.
       END-0000-MAIN.
           GOBACK.

      ******************************************************************      
       1100-START-CHECK-CHOICE.
      *    YM - Vérifie la saisine utilisateur : 'O' dans l'input
      *    et appelle le sous programme necessaire.

           IF FUNCTION UPPER-CASE(WS-CUSTOMER-MODIF) 
           EQUAL 'O' THEN
              CALL 'updacust'  USING LK-CUSTOMER

           ELSE IF FUNCTION UPPER-CASE(WS-CONTRACT-LIST)
           EQUAL 'O' THEN
              CALL 'contcust'  USING LK-CUSTOMER

           ELSE IF FUNCTION UPPER-CASE(WS-CUST-ARCHIVE)
           EQUAL 'O' THEN           
              CALL 'archust'   USING LK-CUSTOMER

           ELSE IF FUNCTION UPPER-CASE(WS-MENU-RETURN)
           EQUAL 'O' THEN
               CALL 'menuuser' USING LK-CUSTOMER
           ELSE  
              MOVE 'ERREUR DE SAISIE' TO WS-ERROR-MESSAGE
              GO TO 0000-START-MAIN
           END-IF.
       1100-END-CHECK-CHOICE.
           EXIT.  
       