      ******************************************************************
      *    [RD] Le programme est une SCREEN SECTION pour la création   *
      *    d'un adhérent, affiche un formulaire de création.           *
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ccfront.
       AUTHOR.        Rémi.

      ******************************************************************

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-MAIL-AROBASE             PIC 9 VALUE 0.
       

           LINKAGE SECTION.
   
       01  LK-ADHERENT-INPUT.
           05  LK-GENDER               PIC X(10).
           05  LK-LASTNAME             PIC X(20).
           05  LK-FIRSTNAME            PIC X(20).
           05  LK-ADRESS1              PIC X(50).
           05  LK-ADRESS2              PIC X(50).
           05  LK-ZIPCODE              PIC X(15).
           05  LK-TOWN                 PIC X(50).
           05  LK-COUNTRY              PIC X(20).
           05  LK-PHONE                PIC 9(20).
           05  LK-MAIL                 PIC X(50).
           05 LK-BIRTHDATE.
               10 LK-DAYS   PIC X(02).
               10 LK-MONTH  PIC X(02).
               10 LK-YEAR   PIC X(04).
           05 LK-CUSTOMER-CODE-SECU.
               10 LK-SECU-1  PIC X.
               10 LK-SECU-2  PIC X(2).
               10 LK-SECU-3  PIC X(2).
               10 LK-SECU-4  PIC X(2).
               10 LK-SECU-5  PIC X(3).
               10 LK-SECU-6  PIC X(3).
               10 LK-SECU-7  PIC X(2).
           05  LK-DOCTOR               PIC X(50).
           05  LK-CODE-IBAN            PIC X(34).
           05  LK-NBCHILDREN           PIC 9(03).
           05  LK-COUPLE               PIC X(05).
           05  LK-CREATE-DATE          PIC X(10).
           05  LK-UPDATE-DATE          PIC X(10).
           05  LK-CLOSE-DATE           PIC X(10).
           05  LK-ACTIVE               PIC X(01) VALUE "0".

       01  LK-MENU-RETURN       PIC X(01).
       01  LK-ADD-VALIDATION PIC X(01).
       01  LK-ERROR-MESSAGE     PIC X(70). 
       01  LK-CODE-REQUEST-SQL        PIC 9(01).
       01  LK-VALIDATION-STATUS PIC X VALUE "Y".


       SCREEN SECTION.
       COPY 'screen-frame.cpy'.

      ******************************************************************

       PROCEDURE DIVISION USING LK-ADHERENT-INPUT, LK-MENU-RETURN, 
       LK-VALIDATION-STATUS, LK-ERROR-MESSAGE.
          
     
       0000-START-MAIN.
           ACCEPT SCREEN-FRAME.
           
           PERFORM 1000-START-MENU-RETURN 
              THRU END-1000-MENU-RETURN.
           PERFORM 2000-START-ADD-VALIDATION
              THRU END-2000-ADD-VALIDATION.
           PERFORM 3000-START-ERROR-FIELDS 
              THRU END-3000-ERROR-FIELDS.
       END-0000-MAIN. 
           GOBACK.
   
      ******************************************************************
      *    [MF] Si l'utilisateur a saisi "O" sur "Retour au menu"      *
      *    redirige vers la fin de ce programme.                       *
      *    Si l'utilisateur a effectué une saisie incorrecte redirige  *
      *    vers le début de ce programme avec un message d'erreur.     *
      ******************************************************************

        1000-START-MENU-RETURN.
           IF LK-MENU-RETURN EQUAL 'O'
               GO TO END-0000-MAIN
           END-IF.

           IF LK-MENU-RETURN NOT EQUAL 'O' 

               MOVE 'ERREUR DE SAISIE, "O" POUR RETOURNER AU MENU' 
               TO LK-ERROR-MESSAGE

               GO TO 0000-START-MAIN
           END-IF.
       END-1000-MENU-RETURN.
           EXIT.

      ******************************************************************
      *    [MF] Si l'utilisateur n'a pas saisi "O" sur "Creation"    *
      *    redirige vers le début de ce programme.                     *
      ******************************************************************

       2000-START-ADD-VALIDATION.
           IF LK-ADD-VALIDATION NOT EQUAL 'O'
               MOVE 'ERREUR DE SAISIE, "O" POUR EFFECTUER LA RECHERCHE' 
               TO LK-ERROR-MESSAGE

               GO TO 0000-START-MAIN
           END-IF.
       END-2000-ADD-VALIDATION.
           EXIT.

      ******************************************************************
      *    [MF] En fonction des champs remplis, attribu un chiffre à   *
      *    LK-CODE-REQUEST-SQL qui va servir à déterminer quelle       *
      *    requête SQL effectuer.                                      *
      *    Si aucune des conditions n'est remplies redirige vers le    *
      *    début de ce programme avec le message d'erreur adéquat.     *
      ******************************************************************

       3000-START-ERROR-FIELDS.
            INSPECT LK-MAIL TALLYING WS-MAIL-AROBASE
                           FOR ALL "@".

           IF LK-GENDER = SPACES
               MOVE 'Le genre est obligatoire.' TO LK-ERROR-MESSAGE
               MOVE 'N' TO LK-VALIDATION-STATUS
               GO TO 0000-START-MAIN
           END-IF
           IF LENGTH OF LK-GENDER > 10
               MOVE 'Le genre dépasse les 10 caractères.'
                   TO LK-ERROR-MESSAGE
               MOVE 'N' TO LK-VALIDATION-STATUS
               GO TO 0000-START-MAIN
           END-IF
           IF LK-LASTNAME = SPACES
               MOVE 'Le nom est obligatoire.' TO LK-ERROR-MESSAGE
               MOVE 'N' TO LK-VALIDATION-STATUS
               GO TO 0000-START-MAIN
           END-IF
           IF LK-FIRSTNAME = SPACES
               MOVE 'Le prénom est obligatoire.' TO LK-ERROR-MESSAGE
               MOVE 'N' TO LK-VALIDATION-STATUS
               GO TO 0000-START-MAIN
           END-IF
           IF LENGTH OF LK-LASTNAME > 20
               MOVE 'Le nom dépasse les 20 caractères.'
                   TO LK-ERROR-MESSAGE
               MOVE 'N' TO LK-VALIDATION-STATUS
               GO TO 0000-START-MAIN
           END-IF
           IF LENGTH OF LK-FIRSTNAME > 20
               MOVE 'Le prénom dépasse les 20 caractères.'
                   TO LK-ERROR-MESSAGE
               MOVE 'N' TO LK-VALIDATION-STATUS
               GO TO 0000-START-MAIN
           END-IF
           IF LK-ADRESS1 = SPACES
               MOVE 'L''adresse est obligatoire.' TO LK-ERROR-MESSAGE
               MOVE 'N' TO LK-VALIDATION-STATUS
               GO TO 0000-START-MAIN
           END-IF
           IF LENGTH OF LK-ADRESS1 > 50
               MOVE 'L''adresse dépasse les 50 caractères.'
                   TO LK-ERROR-MESSAGE
               MOVE 'N' TO LK-VALIDATION-STATUS
               GO TO 0000-START-MAIN
           END-IF
           IF LENGTH OF LK-ADRESS2 > 50
               MOVE 'La deuxième ligne d''adresse est trop longue'
                   TO LK-ERROR-MESSAGE
               MOVE 'N' TO LK-VALIDATION-STATUS
               GO TO 0000-START-MAIN
           END-IF
           IF LK-ZIPCODE = SPACES
               MOVE 'Le code postal est obligatoire.' 
               TO LK-ERROR-MESSAGE
               MOVE 'N' TO LK-VALIDATION-STATUS
               GO TO 0000-START-MAIN
           END-IF
           IF LENGTH OF LK-ZIPCODE > 15
               MOVE 'Le code postal dépasse les 15 caractères.'
                   TO LK-ERROR-MESSAGE
               MOVE 'N' TO LK-VALIDATION-STATUS
               GO TO 0000-START-MAIN
           END-IF
           IF LK-TOWN = SPACES
               MOVE 'La ville est obligatoire.' TO LK-ERROR-MESSAGE
               MOVE 'N' TO LK-VALIDATION-STATUS
               GO TO 0000-START-MAIN
           END-IF
           IF LENGTH OF LK-TOWN > 50
               MOVE 'La ville dépasse les 50 caractères.'
                   TO LK-ERROR-MESSAGE
               MOVE 'N' TO LK-VALIDATION-STATUS
               GO TO 0000-START-MAIN
           END-IF
           IF LK-COUNTRY = SPACES
               MOVE 'Le pays est obligatoire.' TO LK-ERROR-MESSAGE
               MOVE 'N' TO LK-VALIDATION-STATUS
               GO TO 0000-START-MAIN
           END-IF
           IF LENGTH OF LK-COUNTRY > 20
               MOVE 'Le pays dépasse les 20 caractères.'
                   TO LK-ERROR-MESSAGE
               MOVE 'N' TO LK-VALIDATION-STATUS
               GO TO 0000-START-MAIN
           END-IF
           IF LK-PHONE = SPACES
               MOVE 'Le numéro de téléphone est obligatoire.'
                   TO LK-ERROR-MESSAGE
               MOVE 'N' TO LK-VALIDATION-STATUS
               GO TO 0000-START-MAIN
           END-IF
           IF NOT FUNCTION NUMVAL(LK-PHONE) > 0
               MOVE 'Le numéro de téléphone doit être numérique.'
                   TO LK-ERROR-MESSAGE
               MOVE 'N' TO LK-VALIDATION-STATUS
               GO TO 0000-START-MAIN
           END-IF
           
           IF WS-MAIL-AROBASE < 1 OR WS-MAIL-AROBASE > 1
               MOVE 'Un unique arobase est demandé.' 
               TO LK-ERROR-MESSAGE
               MOVE 'N' TO LK-VALIDATION-STATUS
               GO TO 0000-START-MAIN
           END-IF
           IF LK-MAIL = SPACES
               MOVE 'L''email est obligatoire.' TO LK-ERROR-MESSAGE
               MOVE 'N' TO LK-VALIDATION-STATUS
               GO TO 0000-START-MAIN
           END-IF
           IF LENGTH OF LK-MAIL > 50
               MOVE 'L''email dépasse les 50 caractères.'
                TO LK-ERROR-MESSAGE
               MOVE 'N' TO LK-VALIDATION-STATUS
               GO TO 0000-START-MAIN
           END-IF
           IF LK-BIRTHDATE = SPACES
               MOVE 'La date de naissance est obligatoire.'
                   TO LK-ERROR-MESSAGE
               MOVE 'N' TO LK-VALIDATION-STATUS
               GO TO 0000-START-MAIN
           END-IF
           IF LENGTH OF LK-BIRTHDATE > 10
               MOVE 'La date de naissance dépasse les 10 caractères.'
                   TO LK-ERROR-MESSAGE
               MOVE 'N' TO LK-VALIDATION-STATUS
               GO TO 0000-START-MAIN
           END-IF
           IF LK-CUSTOMER-CODE-SECU = SPACES
               MOVE 'Le code de sécurité sociale est obligatoire.'
                   TO LK-ERROR-MESSAGE
               MOVE 'N' TO LK-VALIDATION-STATUS
               GO TO 0000-START-MAIN
           END-IF
           IF LENGTH OF LK-CUSTOMER-CODE-SECU > 15
               MOVE 'Le code de sécurité sociale est trop long.'
                   TO LK-ERROR-MESSAGE
               MOVE 'N' TO LK-VALIDATION-STATUS
               GO TO 0000-START-MAIN
           END-IF
           IF LK-CODE-IBAN = SPACES
               MOVE 'Le code IBAN est obligatoire.' TO LK-ERROR-MESSAGE
               MOVE 'N' TO LK-VALIDATION-STATUS
               GO TO 0000-START-MAIN
           END-IF
           IF LENGTH OF LK-CODE-IBAN > 34
               MOVE 'Le code IBAN dépasse les 34 caractères.' 
               TO LK-ERROR-MESSAGE
               MOVE 'N' TO LK-VALIDATION-STATUS
               GO TO 0000-START-MAIN
           END-IF.
             IF LK-NBCHILDREN > 99
               MOVE 'Le nombre d''enfants dépasse la limite.'
                TO LK-ERROR-MESSAGE
               MOVE 'N' TO LK-VALIDATION-STATUS
               GO TO 0000-START-MAIN
           END-IF
           IF LK-COUPLE NOT = 'OUI' AND LK-COUPLE NOT = 'NON'
               MOVE 'Le statut de couple doit être "OUI" ou "NON".'
                TO LK-ERROR-MESSAGE
               MOVE 'N' TO LK-VALIDATION-STATUS
               GO TO 0000-START-MAIN
           END-IF.
           
           MOVE 'Y' TO LK-VALIDATION-STATUS.
           IF LK-VALIDATION-STATUS = "Y"
           MOVE "Enregistrement réussi" TO LK-ERROR-MESSAGE
           MOVE FUNCTION CURRENT-DATE TO LK-CREATE-DATE 
           END-IF.
       END-3000-ERROR-FIELDS.
           EXIT.
