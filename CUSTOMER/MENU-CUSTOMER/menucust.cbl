      ******************************************************************
      *    [AL-YM] Sous programme gérant l'affichage de l'écran de     *
      *    menu de l'adherent.                                         *
      ****************************************************************** 
      
       IDENTIFICATION DIVISION.
       PROGRAM-ID. menucust RECURSIVE.
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

       01  CUS-BIRTH-DATE.
           03 CUB-DAY       PIC X(02).
           03 CUB-MONTH     PIC X(02).
           03 CUB-YEAR      PIC X(04).

       01  WS-COUPLE PIC X(03).                

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
           03 LK-CUS-CODE-SECU   PIC 9(15).
           03 LK-CUS-CODE-IBAN   PIC X(34).
           03 LK-CUS-NBCHILDREN  PIC 9(03).
           03 LK-CUS-COUPLE      PIC X(05).
           03 LK-CUS-CREATE-DATE PIC X(10).
           03 LK-CUS-UPDATE-DATE PIC X(10).
           03 LK-CUS-CLOSE-DATE  PIC X(10).
           03 LK-CUS-ACTIVE	     PIC X(01).

       SCREEN SECTION.
           COPY 'screen-menu-customer.cpy'.   

      ******************************************************************

       PROCEDURE DIVISION USING LK-CUSTOMER.
       
       0000-START-MAIN.
           PERFORM 1000-START-INITIALIZATION 
              THRU END-1000-INITIALIZATION.

           PERFORM 2000-START-SCREEN 
              THRU END-2000-SCREEN.
       END-0000-MAIN.
           GOBACK.

      ******************************************************************
      *    [RD] Réinitialise les options du menu, envoi le code de     *
      *    sécurité sociale et couple de la linkage à celui de la      *
      *    working-storage qui sont au bon format.                     *
      ****************************************************************** 
       1000-START-INITIALIZATION.
           INITIALIZE WS-OPTIONS-MENU-CUST.

           MOVE LK-CUS-CODE-SECU TO CUS-CODE-SECU.
           MOVE LK-CUS-BIRTH-DATE(1:4) TO CUB-YEAR.
           MOVE LK-CUS-BIRTH-DATE(6:2) TO CUB-MONTH.
           MOVE LK-CUS-BIRTH-DATE(9:2) TO CUB-DAY.

           IF LK-CUS-COUPLE EQUAL 't'
               MOVE 'Oui' TO WS-COUPLE
           ELSE IF LK-CUS-COUPLE EQUAL 'f'
               MOVE 'Non' TO WS-COUPLE
           END-IF.
       END-1000-INITIALIZATION.
           EXIT.

      ******************************************************************
      *    [RD] Affiche l'écran du menu de l'adhérent et appel le      *
      *    paragraphe qui vérifie le choix effectué au niveau de la    *
      *    navigation.                                                 *    
      ****************************************************************** 
       2000-START-SCREEN.
           ACCEPT SCREEN-MENU-CUSTOMER.

           PERFORM 2100-START-CHECK-CHOICE 
              THRU 2100-END-CHECK-CHOICE.
       END-2000-SCREEN.
           EXIT.

      ******************************************************************
      *    [YM] Vérifie la saisie de l'utilisateur : 'O' dans l'input  *
      *    et appelle le sous programme correspondant.                 *
      ******************************************************************      
       2100-START-CHECK-CHOICE.
           IF FUNCTION UPPER-CASE(WS-MENU-RETURN)
              EQUAL 'O' THEN
               CALL 'scfront'

           ELSE IF FUNCTION UPPER-CASE(WS-CUSTOMER-MODIF) 
                   EQUAL 'O' THEN
               CALL 'ucfront' USING LK-CUSTOMER

           ELSE IF FUNCTION UPPER-CASE(WS-CONTRACT-LIST)
                   EQUAL 'O' THEN
               CALL 'contcust' USING LK-CUSTOMER

           ELSE IF FUNCTION UPPER-CASE(WS-CUST-ARCHIVE)
                   EQUAL 'O' THEN           
               CALL 'archust' USING LK-CUSTOMER

           ELSE  
              MOVE 'Veuillez entrer "O" pour confirmer.' 
              TO WS-ERROR-MESSAGE
              GO TO 2000-START-SCREEN
           END-IF.
       2100-END-CHECK-CHOICE.
           EXIT.  
       