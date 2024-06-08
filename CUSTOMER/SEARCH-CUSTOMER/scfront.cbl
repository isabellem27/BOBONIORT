      ******************************************************************
      *    [MF-RD] Le programme affiche la SCREEN SECTION pour la      *
      *    recherche d'un adhérent et s'occupe des éventuels erreurs   *
      *    de saisi en affichant de nouveau la SCREEN SECTION avec le  *
      *    message d'erreur adéquat.                                   *
      ****************************************************************** 
       
       IDENTIFICATION DIVISION.
       PROGRAM-ID. scfront.
       AUTHOR.     Martial.

      ******************************************************************

       DATA DIVISION.
       LINKAGE SECTION.
       01  LK-CUSTOMER.
           05 LK-CUS-FIRSTNAME  PIC X(20).
           05 LK-CUS-LASTNAME   PIC X(20).
           05 LK-CUS-BIRTHDATE.
               10 LK-CUB-DAYS   PIC X(02).
               10 FILLER        PIC X(01) VALUE '-'.
               10 LK-CUB-MONTH  PIC X(02).
               10 FILLER        PIC X(01) VALUE '-'.
               10 LK-CUB-YEAR   PIC X(04).
           05 LK-CUS-CODE-SECU. 
               10 LK-CCS-SECU-1 PIC X.
               10 LK-CCS-SECU-2 PIC X(02).
               10 LK-CCS-SECU-3 PIC X(02).
               10 LK-CCS-SECU-4 PIC X(02).
               10 LK-CCS-SECU-5 PIC X(03).
               10 LK-CCS-SECU-6 PIC X(03).
               10 LK-CCS-SECU-7 PIC X(02).

       01  LK-MENU-RETURN       PIC X(01).
       01  LK-SEARCH-VALIDATION PIC X(01).
       01  LK-ERROR-MESSAGE     PIC X(70). 
       01  LK-CODE-REQUEST-SQL        PIC 9(01).

       SCREEN SECTION.
       COPY 'screen-frame.cpy'.

      ******************************************************************

       PROCEDURE DIVISION USING LK-CUSTOMER, LK-MENU-RETURN, 
       LK-SEARCH-VALIDATION, LK-ERROR-MESSAGE, LK-CODE-REQUEST-SQL.
           
       0000-START-MAIN.
           ACCEPT SCREEN-FRAME.
           
           PERFORM 1000-START-MENU-RETURN 
              THRU END-1000-MENU-RETURN.
           PERFORM 2000-START-SEARCH-VALIDATION
              THRU END-2000-SEARCH-VALIDATION.
           PERFORM 3000-START-ERROR-FIELDS 
              THRU END-3000-ERROR-FIELDS.
       END-0000-MAIN. 
           GOBACK.

      ******************************************************************
      *    [RD] Si l'utilisateur a saisi "O" sur "Retour au menu"      *
      *    redirige vers la fin de ce programme.                       *
      *    Si l'utilisateur a effectué une saisie incorrecte redirige  *
      *    vers le début de ce programme avec un message d'erreur.     *
      ******************************************************************
       1000-START-MENU-RETURN.
           IF LK-MENU-RETURN EQUAL 'O'
               GO TO END-0000-MAIN
           END-IF.

           IF LK-MENU-RETURN NOT EQUAL 'O' 
              AND LK-MENU-RETURN NOT EQUAL SPACES 

               MOVE 'ERREUR DE SAISIE, "O" POUR RETOURNER AU MENU' 
               TO LK-ERROR-MESSAGE

               GO TO 0000-START-MAIN
           END-IF.
       END-1000-MENU-RETURN.
           EXIT.

      ******************************************************************
      *    [RD] Si l'utilisateur n'a pas saisi "O" sur "Rechercher"    *
      *    redirige vers le début de ce programme.                     *
      ******************************************************************
       2000-START-SEARCH-VALIDATION.
           IF LK-SEARCH-VALIDATION NOT EQUAL 'O'
               MOVE 'ERREUR DE SAISIE, "O" POUR EFFECTUER LA RECHERCHE' 
               TO LK-ERROR-MESSAGE

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
           IF LK-CUS-CODE-SECU NOT EQUAL SPACES
              AND LK-CUS-FIRSTNAME EQUAL SPACES
              AND LK-CUS-LASTNAME  EQUAL SPACES
              AND LK-CUB-DAYS EQUAL SPACES
              AND LK-CUB-MONTH EQUAL SPACES
              AND LK-CUB-YEAR EQUAL SPACES
      
               SET LK-CODE-REQUEST-SQL TO 1
               GO TO END-3000-ERROR-FIELDS
           END-IF.

           IF LK-CUS-CODE-SECU EQUAL SPACES
              AND LK-CUS-FIRSTNAME NOT EQUAL SPACES
              AND LK-CUS-LASTNAME  NOT EQUAL SPACES
              AND LK-CUB-DAYS NOT EQUAL SPACES
              AND LK-CUB-MONTH NOT EQUAL SPACES
              AND LK-CUB-YEAR NOT EQUAL SPACES

               SET LK-CODE-REQUEST-SQL TO 2
               GO TO END-3000-ERROR-FIELDS
           END-IF.

           IF LK-CUS-CODE-SECU NOT EQUAL SPACES
              AND LK-CUS-FIRSTNAME NOT EQUAL SPACES
              AND LK-CUS-LASTNAME  NOT EQUAL SPACES
              AND LK-CUB-DAYS NOT EQUAL SPACES
              AND LK-CUB-MONTH NOT EQUAL SPACES
              AND LK-CUB-YEAR NOT EQUAL SPACES

               SET LK-CODE-REQUEST-SQL TO 3
               GO TO END-3000-ERROR-FIELDS
           END-IF.

           MOVE 'ERREUR DE SAISIE SUR LES CHAMPS DE RECHERCHE.'
           TO LK-ERROR-MESSAGE.
           GO TO 0000-START-MAIN.
       END-3000-ERROR-FIELDS.
           EXIT.
