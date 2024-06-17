      ******************************************************************
      *    [MF-RD] Le programme affiche la SCREEN SECTION pour la      *
      *    recherche d'un adhérent et s'occupe des éventuels erreurs   *
      *    de saisi en affichant de nouveau la SCREEN SECTION avec le  *
      *    message d'erreur adéquat.                                   *
      ****************************************************************** 
       
       IDENTIFICATION DIVISION.
       PROGRAM-ID. scfront RECURSIVE.
       AUTHOR. Martial&Remi.

      ******************************************************************

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  SCREEN-CUSTOMER.
           05 SC-FIRSTNAME       PIC X(20).
           05 SC-LASTNAME        PIC X(20).
           05 SC-BIRTHDATE.   
               10 SCB-YEAR       PIC X(04).
               10 FILLER         PIC X(01) VALUE '-'.
               10 SCB-MONTH      PIC X(02).
               10 FILLER         PIC X(01) VALUE '-'.
               10 SCB-DAYS       PIC X(02).
           05 SC-CODE-SECU.    
               10 SCCS-SECU-1    PIC X(01).
               10 SCCS-SECU-2    PIC X(02).
               10 SCCS-SECU-3    PIC X(02).
               10 SCCS-SECU-4    PIC X(02).
               10 SCCS-SECU-5    PIC X(03).
               10 SCCS-SECU-6    PIC X(03).
               10 SCCS-SECU-7    PIC X(02).

       01  WS-CUS-UUID           PIC X(36).
       01  WS-MENU-RETURN        PIC X(01).
       01  WS-SEARCH-VALIDATION  PIC X(01).
       01  WS-ERROR-MESSAGE      PIC X(70).
       01  WS-CODE-REQUEST-SQL   PIC 9(01).
       01  WS-COUNT-CUSTOMER     PIC 9(05).

       SCREEN SECTION.
       COPY 'screen-search-customer.cpy'.

      ******************************************************************

       PROCEDURE DIVISION.
       0000-START-MAIN.
           INITIALIZE SCREEN-CUSTOMER
                      WS-CUS-UUID 
                      WS-MENU-RETURN
                      WS-SEARCH-VALIDATION
                      WS-ERROR-MESSAGE
                      WS-CODE-REQUEST-SQL
                      WS-COUNT-CUSTOMER.

           PERFORM 1000-START-INITIALIZATION 
              THRU END-1000-INITIALIZATION.
       END-0000-MAIN. 
           GOBACK.

      ******************************************************************
      *    [RD] Affiche l'écran de la recherche, appel les             *    
      *    paragraphes qui s'occupent de vérifier les saisis de        *
      *    l'utilisateur et appel les sous-programmes BACK et menu     *
      *    d'un adhérent.                                              *
      ****************************************************************** 
       1000-START-INITIALIZATION.
           ACCEPT SCREEN-SEARCH-CUSTOMER.
           
           PERFORM 1100-START-MENU-RETURN 
              THRU END-1100-MENU-RETURN.

           PERFORM 1200-START-SEARCH-VALIDATION
              THRU END-1200-SEARCH-VALIDATION.

           PERFORM 1300-START-ERROR-FIELDS 
              THRU END-1300-ERROR-FIELDS.

      *    [RD] Appel du BACK.
           CALL 
               'scback' 
               USING BY REFERENCE
               SCREEN-CUSTOMER, WS-CUS-UUID, WS-CODE-REQUEST-SQL,
               WS-COUNT-CUSTOMER
           END-CALL.

           PERFORM 2000-START-CUSTOMER-NOT-FOUND 
             THRU END-2000-CUSTOMER-NOT-FOUND.

           PERFORM 3000-START-CUSTOMER-SEVERAL-FOUND 
              THRU END-3000-CUSTOMER-SEVERAL-FOUND.

      *    [RD] Appel le MENU D'ADHERENT.
           CALL 
               'mcfront' 
               USING BY REFERENCE 
               WS-CUS-UUID
           END-CALL.
       END-1000-INITIALIZATION.
           EXIT. 

      ******************************************************************
      *    [RD] Si l'utilisateur a saisi "O" sur "Retour au menu"      *
      *    redirige vers la gestion d'adhérent.                        *
      *    Si l'utilisateur a effectué une saisie incorrecte redirige  *
      *    vers le début de ce programme avec un message d'erreur.     *
      ******************************************************************
       1100-START-MENU-RETURN.
           MOVE FUNCTION UPPER-CASE(WS-MENU-RETURN) TO WS-MENU-RETURN.

           IF WS-MENU-RETURN EQUAL 'O' THEN
               CALL 
                   'manacust'
               END-CALL
           
           ELSE IF WS-MENU-RETURN NOT EQUAL 'O' 
               AND WS-MENU-RETURN NOT EQUAL SPACE THEN

               MOVE 'Veuillez entrer "O" pour retourner au menu.' 
               TO WS-ERROR-MESSAGE

               GO TO 1000-START-INITIALIZATION
           END-IF.
       END-1100-MENU-RETURN.
           EXIT.

      ******************************************************************
      *    [RD] Si l'utilisateur n'a pas saisi "O" sur "Rechercher"    *
      *    redirige vers le début de ce programme.                     *
      ******************************************************************
       1200-START-SEARCH-VALIDATION.
           MOVE FUNCTION UPPER-CASE(WS-SEARCH-VALIDATION) 
           TO WS-SEARCH-VALIDATION.

           IF WS-SEARCH-VALIDATION NOT EQUAL 'O' THEN
               MOVE 'Veuillez entrer "O" pour rechercher.' 
               TO WS-ERROR-MESSAGE

               GO TO 1000-START-INITIALIZATION
           END-IF.
       END-1200-SEARCH-VALIDATION.
           EXIT.

      ******************************************************************
      *    [RD] En fonction des champs remplis, attribu un chiffre à   *
      *    LK-CODE-REQUEST-SQL qui va servir à déterminer quelle       *
      *    requête SQL effectuer.                                      *
      *    Si aucune des conditions n'est remplies redirige vers le    *
      *    début de ce programme avec le message d'erreur adéquat.     *
      ******************************************************************
       1300-START-ERROR-FIELDS.
           IF     SC-CODE-SECU IS NUMERIC
              AND SC-FIRSTNAME     EQUAL SPACES
              AND SC-LASTNAME      EQUAL SPACES
              AND SCB-DAYS         EQUAL SPACES
              AND SCB-MONTH        EQUAL SPACES
              AND SCB-YEAR         EQUAL SPACES
              THEN
      
               SET WS-CODE-REQUEST-SQL TO 1
               GO TO END-1300-ERROR-FIELDS
           END-IF.

           IF     SC-CODE-SECU     EQUAL SPACES
              AND SC-FIRSTNAME NOT EQUAL SPACES
              AND SC-LASTNAME  NOT EQUAL SPACES
              AND SCB-DAYS GREATER THAN 00
              AND SCB-DAYS LESS THAN 32
              AND SCB-MONTH GREATER THAN 00
              AND SCB-MONTH LESS THAN 13
              AND SCB-YEAR GREATER THAN 0999
              THEN

               SET WS-CODE-REQUEST-SQL TO 2
               GO TO END-1300-ERROR-FIELDS
           END-IF.

           IF     SC-CODE-SECU IS NUMERIC
              AND SC-FIRSTNAME NOT EQUAL SPACES
              AND SC-LASTNAME  NOT EQUAL SPACES
              AND SCB-DAYS GREATER THAN 00
              AND SCB-DAYS LESS THAN 32
              AND SCB-MONTH GREATER THAN 00
              AND SCB-MONTH LESS THAN 13
              AND SCB-YEAR GREATER THAN 0999
              THEN

               SET WS-CODE-REQUEST-SQL TO 3
               GO TO END-1300-ERROR-FIELDS
           END-IF.

           MOVE "Erreur de saisie sur l'un des champs de la recherche."
           TO WS-ERROR-MESSAGE.
           GO TO 1000-START-INITIALIZATION.
       END-1300-ERROR-FIELDS.
           EXIT.

      ******************************************************************
      *    [RD] Si la requête SQL du back n'a pas trouvé d'adhérent    *
      *    redirige vers le paragraphe qui affiche l'écran de recherche*
      *    avec le message d'erreur adéquat.                           *
      ****************************************************************** 
       2000-START-CUSTOMER-NOT-FOUND.
           IF WS-COUNT-CUSTOMER EQUAL 0 THEN
               MOVE "Aucun adherent trouve." TO WS-ERROR-MESSAGE
               GO TO 1000-START-INITIALIZATION
           END-IF.
       END-2000-CUSTOMER-NOT-FOUND.
           EXIT.

      ******************************************************************
      *    [RD] Si la requête SQL du back a trouvé plusieurs adhérents *
      *    redirige vers le paragraphe qui affiche l'écran de recherche*
      *    avec le message d'erreur adéquat.                           *
      ****************************************************************** 
       3000-START-CUSTOMER-SEVERAL-FOUND.
           IF WS-COUNT-CUSTOMER GREATER THAN 1 THEN
               MOVE "Plusieurs adherents trouves." TO WS-ERROR-MESSAGE
               GO TO 1000-START-INITIALIZATION
           END-IF.
       END-3000-CUSTOMER-SEVERAL-FOUND.
           EXIT. 
