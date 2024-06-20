      ******************************************************************
      *    [AL-YM] Sous programme gérant l'affichage de l'écran de     *
      *    menu de l'adherent.                                         *
      ****************************************************************** 
      
       IDENTIFICATION DIVISION.
       PROGRAM-ID. mcfront RECURSIVE.
       AUTHOR. Yves&Alexandre.

      ******************************************************************

       DATA DIVISION.
       WORKING-STORAGE SECTION. 
       01  WS-OPTIONS-MENU-CUST.
           03 WS-CUSTOMER-MODIF     PIC X(01).
           03 WS-CUST-ARCHIVE       PIC X(01).
           03 WS-CONTRACT-LIST      PIC X(01). 
           03 WS-MENU-FACTURE       PIC X(01).  
           03 WS-MENU-REMBOURSEMENT PIC X(01).             
           03 WS-MENU-RETURN        PIC X(01).    
           03 WS-ERROR-MESSAGE      PIC X(62).    

       01  WS-CUSTOMER.
           03 WS-CUS-UUID           PIC X(36).
           03 WS-CUS-GENDER         PIC X(10).
           03 WS-CUS-LASTNAME       PIC X(20).
           03 WS-CUS-FIRSTNAME      PIC X(20).
           03 WS-CUS-ADRESS1	    PIC X(50).
           03 WS-CUS-ADRESS2	    PIC X(50).
           03 WS-CUS-ZIPCODE	    PIC X(15).
           03 WS-CUS-TOWN	        PIC X(30).
           03 WS-CUS-COUNTRY	    PIC X(20).
           03 WS-CUS-PHONE	        PIC X(10).
           03 WS-CUS-MAIL	        PIC X(50).
           03 WS-CUS-BIRTH-DATE.   
               05 WS-CUB-YEAR       PIC X(04).
               05 FILLER            PIC X(01).
               05 WS-CUB-MONTH      PIC X(02).
               05 FILLER            PIC X(01).
               05 WS-CUB-DAY        PIC X(02).
           03 WS-CUS-DOCTOR	        PIC X(20).
           03 WS-CUS-CODE-SECU.   
               05 WS-CCS-SECU-1     PIC X(01).
               05 WS-CCS-SECU-2     PIC X(02).
               05 WS-CCS-SECU-3     PIC X(02).
               05 WS-CCS-SECU-4     PIC X(02).
               05 WS-CCS-SECU-5     PIC X(03).
               05 WS-CCS-SECU-6     PIC X(03).
               05 WS-CCS-SECU-7     PIC X(02). 
           03 WS-CUS-CODE-IBAN      PIC X(34).
           03 WS-CUS-NBCHILDREN     PIC 9(03).
           03 WS-CUS-COUPLE         PIC X(05).
           03 WS-CUS-CREATE-DATE    PIC X(10).
           03 WS-CUS-UPDATE-DATE    PIC X(10).
           03 WS-CUS-CLOSE-DATE     PIC X(10).
           03 WS-CUS-ACTIVE	        PIC X(01).            
   
       LINKAGE SECTION.   
       01  LK-CUS-UUID              PIC X(36).

       SCREEN SECTION.
           COPY 'screen-menu-customer.cpy'.   

      ******************************************************************

       PROCEDURE DIVISION USING LK-CUS-UUID.
       
       0000-START-MAIN.
           CALL
               'mcback'
               USING BY REFERENCE 
               LK-CUS-UUID, WS-CUSTOMER
           END-CALL.

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

           IF WS-CUS-COUPLE EQUAL 't'
               MOVE 'oui' TO WS-CUS-COUPLE
           ELSE IF WS-CUS-COUPLE EQUAL 'f'
               MOVE 'non' TO WS-CUS-COUPLE
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
               CALL 'ucfront' USING WS-CUSTOMER

           ELSE IF FUNCTION UPPER-CASE(WS-CONTRACT-LIST)
                   EQUAL 'O' THEN
               CALL 'menucont' USING WS-CUSTOMER

           ELSE IF FUNCTION UPPER-CASE(WS-CUST-ARCHIVE)
                   EQUAL 'O' THEN           
               CALL 'acfront' USING WS-CUSTOMER

           ELSE IF FUNCTION UPPER-CASE(WS-MENU-FACTURE)
                   EQUAL 'O' THEN           
               CALL 'menuinvo' USING WS-CUSTOMER

           ELSE IF FUNCTION UPPER-CASE(WS-MENU-REMBOURSEMENT)
                   EQUAL 'O' THEN           
               CALL 'rembmenu' USING WS-CUSTOMER

           ELSE  
              MOVE 'Veuillez entrer "O" pour confirmer.' 
              TO WS-ERROR-MESSAGE
              GO TO 2000-START-SCREEN
           END-IF.
       2100-END-CHECK-CHOICE.
           EXIT.  
