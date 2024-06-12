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
       01  CUSTOMER.
           05 CUS-FIRSTNAME     PIC X(20).
           05 CUS-LASTNAME      PIC X(20).
           05 CUS-BIRTHDATE.
               10 CUB-DAYS      PIC X(02).
               10 FILLER        PIC X(01) VALUE '-'.
               10 CUB-MONTH     PIC X(02).
               10 FILLER        PIC X(01) VALUE '-'.
               10 CUB-YEAR      PIC X(04).
           05 CUS-CODE-SECU. 
               10 CCS-SECU-1    PIC X(01).
               10 CCS-SECU-2    PIC X(02).
               10 CCS-SECU-3    PIC X(02).
               10 CCS-SECU-4    PIC X(02).
               10 CCS-SECU-5    PIC X(03).
               10 CCS-SECU-6    PIC X(03).
               10 CCS-SECU-7    PIC X(02).

       01  WS-MENU-RETURN       PIC X(01).
       01  WS-SEARCH-VALIDATION PIC X(01).
       01  WS-ERROR-MESSAGE     PIC X(70).
       01  WS-CODE-REQUEST-SQL  PIC 9(01).

       SCREEN SECTION.
       COPY 'screen-search-customer.cpy'.

      ******************************************************************

       PROCEDURE DIVISION.
           
       0000-START-MAIN.
           ACCEPT SCREEN-SEARCH-CUSTOMER.
           
           PERFORM 1000-START-MENU-RETURN 
              THRU END-1000-MENU-RETURN.
           PERFORM 2000-START-SEARCH-VALIDATION
              THRU END-2000-SEARCH-VALIDATION.
           PERFORM 3000-START-ERROR-FIELDS 
              THRU END-3000-ERROR-FIELDS.

      *    [RD] Si l'utilisateur a saisi "O" sur "Retour au menu" 
      *    redirigie vers le début de ce programme. 
      *    A CHANGER POUR REDIRIGER VERS LA GESTION D'ADHERENT.
      *    IF WS-MENU-RETURN EQUAL 'O' THEN
      *        GO TO 0000-START-MAIN
      *    END-IF.
      
      *    [RD] Appel du BACK.
           CALL 
               'scback' 
               USING CUSTOMER, WS-CODE-REQUEST-SQL
           END-CALL.

      *    [RD] Si le résultat de la requête SQL est NULL redirige vers 
      *    le début de ce programme avec le message d'erreur adéquat.
           IF CUS-LASTNAME EQUAL SPACES THEN
               MOVE "AUCUN ADHERENT TROUVE." TO WS-ERROR-MESSAGE
               GO TO 0000-START-MAIN
           END-IF.

      *    [RD] Appel le MENU D'ADHERENT.
           CALL 'menucust' USING CUSTOMER.
       END-0000-MAIN. 
           GOBACK.

      ******************************************************************
      *    [RD] Si l'utilisateur a saisi "O" sur "Retour au menu"      *
      *    redirige vers la fin de ce programme.                       *
      *    Si l'utilisateur a effectué une saisie incorrecte redirige  *
      *    vers le début de ce programme avec un message d'erreur.     *
      ******************************************************************
       1000-START-MENU-RETURN.
           MOVE FUNCTION UPPER-CASE(WS-MENU-RETURN) TO WS-MENU-RETURN.

           IF WS-MENU-RETURN EQUAL 'O' THEN
               CALL 
                   'manacust'
               END-CALL
           END-IF.

           IF WS-MENU-RETURN NOT EQUAL 'O' 
              AND WS-MENU-RETURN NOT EQUAL SPACES THEN

               MOVE 'Veuillez entrer "O" pour retourner au menu.' 
               TO WS-ERROR-MESSAGE

               GO TO 0000-START-MAIN
           END-IF.
       END-1000-MENU-RETURN.
           EXIT.

      ******************************************************************
      *    [RD] Si l'utilisateur n'a pas saisi "O" sur "Rechercher"    *
      *    redirige vers le début de ce programme.                     *
      ******************************************************************
       2000-START-SEARCH-VALIDATION.
           MOVE FUNCTION UPPER-CASE(WS-SEARCH-VALIDATION) 
           TO WS-SEARCH-VALIDATION.

           IF WS-SEARCH-VALIDATION NOT EQUAL 'O' THEN
               MOVE 'Veuillez entrer "O" pour rechercher.' 
               TO WS-ERROR-MESSAGE

               GO TO 0000-START-MAIN
           END-IF.
       END-2000-SEARCH-VALIDATION.
           EXIT.

      ******************************************************************
      *    [RD] En fonction des champs remplis, attribu un chiffre à   *
      *    LK-CODE-REQUEST-SQL qui va servir à déterminer quelle       *
      *    requête SQL effectuer.                                      *
      *    Si aucune des conditions n'est remplies redirige vers le    *
      *    début de ce programme avec le message d'erreur adéquat.     *
      ******************************************************************
       3000-START-ERROR-FIELDS.
           IF CUS-CODE-SECU NOT EQUAL SPACES
              AND CUS-FIRSTNAME EQUAL SPACES
              AND CUS-LASTNAME  EQUAL SPACES
              AND CUB-DAYS EQUAL SPACES
              AND CUB-MONTH EQUAL SPACES
              AND CUB-YEAR EQUAL SPACES
      
               SET WS-CODE-REQUEST-SQL TO 1
               GO TO END-3000-ERROR-FIELDS
           END-IF.

           IF CUS-CODE-SECU EQUAL SPACES
              AND CUS-FIRSTNAME NOT EQUAL SPACES
              AND CUS-LASTNAME  NOT EQUAL SPACES
              AND CUB-DAYS NOT EQUAL SPACES
              AND CUB-MONTH NOT EQUAL SPACES
              AND CUB-YEAR NOT EQUAL SPACES

               SET WS-CODE-REQUEST-SQL TO 2
               GO TO END-3000-ERROR-FIELDS
           END-IF.

           IF CUS-CODE-SECU NOT EQUAL SPACES
              AND CUS-FIRSTNAME NOT EQUAL SPACES
              AND CUS-LASTNAME  NOT EQUAL SPACES
              AND CUB-DAYS NOT EQUAL SPACES
              AND CUB-MONTH NOT EQUAL SPACES
              AND CUB-YEAR NOT EQUAL SPACES

               SET WS-CODE-REQUEST-SQL TO 3
               GO TO END-3000-ERROR-FIELDS
           END-IF.

           MOVE "Erreur de saisie sur l'un des champs de la recherche."
           TO WS-ERROR-MESSAGE.
           GO TO 0000-START-MAIN.
       END-3000-ERROR-FIELDS.
           EXIT.
