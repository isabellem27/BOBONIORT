      ******************************************************************
      *    [AL] Ce programme gère la connexion d'un utilisateur. Il    *
      *    affiche l'écran de connexion jusqu'à ce que la connexion    *
      *    soit établie et appel le sous programme "siback".           *
      ****************************************************************** 
       IDENTIFICATION DIVISION.
       PROGRAM-ID. sifront RECURSIVE.
       AUTHOR. Alexandre.

      ******************************************************************

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  SCREEN-INPUT.
           05 SI-USER-ID       PIC X(14).
           05 SI-USER-PWD      PIC X(14).
           05 SI-CONNECT       PIC X(01).    
           05 SI-ERROR-MESSAGE PIC x(45).                     

       01  WS-MSG-ERROR        PIC X(35) 
           VALUE 'Veuillez entrer "O" pour confirmer.'.
       01  WS-MSG-FAILED       PIC X(45)
           VALUE 'Connexion echouee, verifier vos identifiants.'.

       01  WS-PWD-CHECK        PIC X(05) VALUE 'FALSE'.   
       01  WS-RETURN-CHOICE    PIC X(01).

       SCREEN SECTION.
           COPY 'screen-sign-in-data.cpy'.

      ******************************************************************

       PROCEDURE DIVISION.    
       0000-START-MAIN.
           INITIALIZE WS-RETURN-CHOICE
                      SI-ERROR-MESSAGE.
           MOVE 'FALSE' TO WS-PWD-CHECK.

           PERFORM 1000-START-SCREEN THRU END-1000-SCREEN.
           
      *    [AL] Appel le sous programme de Menu Data. 
           CALL 
               'menudata'
           END-CALL. 
       END-0000-MAIN.
           STOP RUN.  
   
      ******************************************************************
      *    [AL] Boucle d'affichage de l'écran de connexion.            *
      ****************************************************************** 
       1000-START-SCREEN.
           PERFORM UNTIL WS-PWD-CHECK EQUAL 'TRUE'
               INITIALIZE SI-USER-ID
                          SI-USER-PWD
                          SI-CONNECT

               ACCEPT screen-sign-in

               PERFORM 2000-START-CONNECT THRU END-2000-CONNECT
           END-PERFORM.
       END-1000-SCREEN.    
           EXIT. 

      ******************************************************************
      *    [AL] Vérifie le champ de saisi "Se connecter" :             *
      *    - S'il est correct, appel le paragraphe de validation.      *
      *    - Sinon, attribu un message d'erreur.                       * 
      ******************************************************************
       2000-START-CONNECT.
           MOVE FUNCTION UPPER-CASE(SI-CONNECT) TO SI-CONNECT.  

           IF SI-CONNECT EQUAL 'O'
               PERFORM 2100-START-VALIDATION 
                  THRU 2100-END-VALIDATION    
           ELSE   
               MOVE WS-MSG-ERROR TO SI-ERROR-MESSAGE
           END-IF.
       END-2000-CONNECT.
           EXIT.

      ******************************************************************
      *    [AL] Appel du sous programme 'siback' qui va vérifier si    *
      *    l'utilisateur existe dans DB par rapport aux informations   *
      *    qui ont été saisies dans l'écran de connexion.              *
      ******************************************************************
       2100-START-VALIDATION.
      *    [AL-YM] Envoie des saisies au Back.
           CALL 
               'siback' 
               USING BY REFERENCE 
               SI-USER-ID, SI-USER-PWD, WS-PWD-CHECK  
           END-CALL. 

      *    [YM] Lecture du contrôle de la requête SQL.
           IF WS-PWD-CHECK NOT EQUAL 'TRUE'
               MOVE WS-MSG-FAILED TO SI-ERROR-MESSAGE
           END-IF.
       2100-END-VALIDATION.
           EXIT.  
