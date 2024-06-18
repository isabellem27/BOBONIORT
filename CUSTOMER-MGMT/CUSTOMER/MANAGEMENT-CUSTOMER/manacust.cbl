      ****************************************************************** 
      * [IM]- le 06/06/2024                                            *
      *    Gestion du menu pour créer ou chercher un adhérent.         *
      *    Programme précédent: menu principal(tableau de bord)        *
      *    Programme suivant : dépend du choix de l'utilisateur        *
      *    Le menu affiche les options et un bouton retour             *
      ****************************************************************** 
       IDENTIFICATION DIVISION.
       PROGRAM-ID. manacust RECURSIVE.
       AUTHOR. Isabelle.
      ******************************************************************
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *    gestion des erreurs de saisie
       01  WS-SELECT-OPTION      PIC X(05)                    . 
       01  WS-SCREEN-ERROR       PIC X(35)                    .
       01  WS-ERROR-MESSAGE      PIC X(35)
           VALUE 'Veuillez entrer "O" pour confirmer.'        .
      *    gestion de la saisie
       01  WS-CREATE-CHOICE     PIC X(01)   VALUE SPACE       .
       01  WS-SEARCH-CHOICE     PIC X(01)   VALUE SPACE       .

       01  LK-RETURN-CHOICE     PIC X(01)   VALUE SPACE       .

      ******************************************************************
       SCREEN SECTION.
           COPY 'screen-management-customer.cpy'.

      ******************************************************************
       PROCEDURE DIVISION.
      ****************************************************************** 
      * [IM]- le 06-06-2024                                            *
      *    Le paragraphe affiche la screen, contrôle la saisie et      *
      *    appelle le programme correspondant au choix de l'utilisateur*
      ****************************************************************** 
       0000-START-MAIN.          
           PERFORM 1000-SCREEN-LOOP-START THRU END-1000-SCREEN-LOOP.
       END-0000-MAIN.
           GOBACK. 

      ******************************************************************    
      *    [IM] - le 05-06-2024                                        *
      *    Pour permettre de boucler sur l'affichage en cas d'erreur   *
      *    de saisie de l'utilisateur                                  *
      ****************************************************************** 
       1000-SCREEN-LOOP-START. 
           INITIALIZE WS-CREATE-CHOICE
                      WS-SEARCH-CHOICE
                      LK-RETURN-CHOICE 
                      WS-SCREEN-ERROR  .
           MOVE 'FALSE' TO WS-SELECT-OPTION.

           PERFORM UNTIL WS-SELECT-OPTION EQUAL 'TRUE'            
              ACCEPT SCREEN-MANAGEMENT-CUSTOMER 

              PERFORM 3000-WITCH-CHOICE-START
                 THRU END-3000-WITCH-CHOICE
           END-PERFORM.          
       END-1000-SCREEN-LOOP. 
           EXIT.   

      ******************************************************************    
      *    [IM] - le 06-06-2024                                        *
      *    Je vérifie la saisie                                        *
      ******************************************************************
       3000-WITCH-CHOICE-START.
           IF FUNCTION UPPER-CASE(LK-RETURN-CHOICE)
                   EQUAL 'O' THEN
               MOVE 'TRUE' TO WS-SELECT-OPTION 
               CALL 'sifront'

           ELSE IF FUNCTION UPPER-CASE(WS-CREATE-CHOICE) 
                   EQUAL 'O' THEN
               MOVE 'TRUE' TO WS-SELECT-OPTION  
               CALL 'ccfront'  

           ELSE IF FUNCTION UPPER-CASE(WS-SEARCH-CHOICE)
                   EQUAL 'O' THEN
               MOVE 'TRUE' TO WS-SELECT-OPTION 
               CALL 'scfront'  

           ELSE  
              PERFORM 9000-ERROR-MESSAGE-START 
                 THRU END-9000-ERROR-MESSAGE
           END-IF.
       END-3000-WITCH-CHOICE.
           EXIT.

      ******************************************************************    
      *    [IM] - le 06-06-2024                                        *
      *    J'envoie un message si erreur de saisie et efface la saisie *
      ****************************************************************** 
       9000-ERROR-MESSAGE-START. 
           MOVE WS-ERROR-MESSAGE TO WS-SCREEN-ERROR.
           INITIALIZE WS-CREATE-CHOICE
                      WS-SEARCH-CHOICE
                      LK-RETURN-CHOICE .                      
       END-9000-ERROR-MESSAGE.
           EXIT.

      
