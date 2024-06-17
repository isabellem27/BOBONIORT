      ******************************************************************
      *    [SK] programme gerant l'affichage                           *
      *    de l'écran de menu pour l'écran des fonctionnalités         *
      ******************************************************************

       IDENTIFICATION DIVISION.
       PROGRAM-ID. menuuser.
       AUTHOR. safaa.

      ******************************************************************
       ENVIRONMENT DIVISION.
      
      ******************************************************************

       DATA DIVISION.

       WORKING-STORAGE SECTION. 

       01  WS-OPTIONS-MENU-USER.
           05 WS-MANAGE-MEMBERS        PIC X(01).
           05 WS-MANAGE-FEES           PIC X(01).
           05 WS-MANAGE-REMBURSEMENTS  PIC X(01).
           05 WS-MANAGE-BENEFITS       PIC X(01).
           05 WS-GENERATE-REPORTS      PIC X(01).
           05 WS-CALL-MENU             PIC X(01).               
       01   WS-ERROR-MESSAGE           PIC X(62).                     
       
       01 WS-MESSAGE.
           05 WS-MESSAGE1              PIC X(31)
               VALUE 'ERREUR DE SAISIE, VEUILLEZ SELE'.
           05 WS-MESSAGE2              PIC X(31)
               VALUE 'CTIONNER VOTRE CHOIX AVEC "O".'.
       
       01 WS-SELECT-OPTION            PIC X(05) VALUE 'FALSE'.  
  
       SCREEN SECTION.
       
       COPY 'screen-section-menu-user.cpy'.   

      ******************************************************************

       PROCEDURE DIVISION .
      *    USING 
       
       0000-START-MAIN.

           PERFORM 1000-START-CONTROL-IMPUT 
           THRU 1000-END-CONTROL-IMPUT.

       END-0000-MAIN.
           STOP RUN.
      *    GOBACK.

      ******************************************************************      
      *    SK- Boucle d'affichage de la gestion du menu en cas d'erreur   
      *    de saisie de l'utilisateur   
      ******************************************************************
       1000-START-CONTROL-IMPUT.

           PERFORM UNTIL WS-SELECT-OPTION = 'TRUE'
               
              ACCEPT SCREEN-SECTION-MENU-USER 
              PERFORM 1100-START-CHECK-CHOICE 
              THRU 1100-END-CHECK-CHOICE
              END-PERFORM.

       1000-END-CONTROL-IMPUT.
           EXIT.    

      ******************************************************************      
      *     SK - Vérifie la saisine utilisateur : 'O' dans l'input
      *     et appelle le sous programme necessaire.
      ******************************************************************
       1100-START-CHECK-CHOICE.
       
            IF FUNCTION UPPER-CASE(WS-MANAGE-MEMBERS) 
            EQUAL 'O' THEN

               CALL "acfront" USING
      
      
            ELSE IF FUNCTION UPPER-CASE(WS-MANAGE-FEES)
            EQUAL 'O' THEN

               CALL ""    

            ELSE IF FUNCTION UPPER-CASE(WS-MANAGE-REMBURSEMENTS)
            EQUAL 'O' THEN           
                CALL "" 
      
            ELSE IF FUNCTION UPPER-CASE(WS-MANAGE-BENEFITS)
            EQUAL 'O' THEN           
                CALL ""
            
            ELSE IF FUNCTION UPPER-CASE(WS-GENERATE-REPORTS )
            EQUAL 'O' THEN           
                  
                CALL "" 
      
            ELSE IF FUNCTION UPPER-CASE(WS-CALL-MENU)
                EQUAL 'O' THEN
                CALL 'menuuser'
               
            ELSE  
               PERFORM 1200-START-ERROR-MESSAGE 
               THRU 1200-END-ERROR-MESSAGE
            END-IF.
           
       1100-END-CHECK-CHOICE.
           EXIT.   
      ******************************************************************       
      * 
      *    SK- Gère l'affichage du message d'erreur en 
      *    cas d'erreur de saisie 
      *
      ******************************************************************
       1200-START-ERROR-MESSAGE.
            MOVE WS-MESSAGE          
             TO WS-ERROR-MESSAGE.
            DISPLAY WS-ERROR-MESSAGE
            LINE 30 COL 55 FOREGROUND-COLOR IS 7.
            INITIALIZE WS-OPTIONS-MENU-USER.        

       1200-END-ERROR-MESSAGE.
           EXIT.

      ******************************************************************       
       