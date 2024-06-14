      ******************************************************************

      *    [SK] Ce programme gere les interactions utilisateur pour  

      *       la saisie et la Modification des donnees client.

      ****************************************************************** 

       IDENTIFICATION DIVISION.
       PROGRAM-ID. ucfront RECURSIVE.
       AUTHOR. Safaa.

      ******************************************************************

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-ERROR-MESSAGE     PIC X(70).
       01  WS-UPDATE-VALIDATION PIC X(01).
       01  WS-MENU-RETURN       PIC X(01).
       01  WS-MAIL-AROBASE      PIC 9(01) VALUE 0.

       LINKAGE SECTION.
       01 LK-CUSTOMER.
           03 LK-CUS-UUID        PIC X(36).
           03 LK-CUS-GENDER      PIC X(10).
           03 LK-CUS-LASTNAME    PIC X(20).
           03 LK-CUS-FIRSTNAME   PIC X(20).
           03 LK-CUS-ADRESS1	 PIC X(50).
           03 LK-CUS-ADRESS2	 PIC X(50).
           03 LK-CUS-ZIPCODE	 PIC X(15).
           03 LK-CUS-TOWN	     PIC X(50).
           03 LK-CUS-COUNTRY	 PIC X(20).
           03 LK-CUS-PHONE	     PIC X(10).
           03 LK-CUS-MAIL	     PIC X(50).
           03 LK-CUS-BIRTH-DATE.
               05 LK-YEAR        PIC X(04).
               05 LK-SEPARATOR1  PIC X(01).
               05 LK-MONTH       PIC X(02).
               05 LK-SEPARATOR2  PIC X(01).
               05 LK-DAY         PIC X(02).
           03 LK-CUS-DOCTOR	     PIC X(50).
           03 LK-CUS-CODE-SECU.
               05 LK-SECU-1      PIC X(01).
               05 LK-SECU-2      PIC X(02).
               05 LK-SECU-3      PIC X(02).
               05 LK-SECU-4      PIC X(02).
               05 LK-SECU-5      PIC X(03).
               05 LK-SECU-6      PIC X(03).
               05 LK-SECU-7      PIC X(02).
           03 LK-CUS-CODE-IBAN   PIC X(34).
           03 LK-CUS-NBCHILDREN  PIC 9(03).
           03 LK-CUS-COUPLE      PIC X(05).
           03 LK-CUS-CREATE-DATE PIC X(10).
           03 LK-CUS-UPDATE-DATE PIC X(10).
           03 LK-CUS-CLOSE-DATE  PIC X(10).
           03 LK-CUS-ACTIVE	     PIC X(01).

       SCREEN SECTION.
       COPY 'screen-frame-update.cpy'.

      ******************************************************************

       PROCEDURE DIVISION USING LK-CUSTOMER.

       0000-START-MAIN.
      *  SK] Convertit le statut de couple en 't' ou 'f' pour 
      *la base de donnees 

           IF LK-CUS-COUPLE EQUAL 't'
               MOVE 'OUI' TO LK-CUS-COUPLE
           ELSE IF LK-CUS-COUPLE EQUAL 'f'
               MOVE 'NON' TO LK-CUS-COUPLE
           END-IF.  

           ACCEPT SCREEN-FRAME-UPDATE.


           PERFORM 1000-START-MENU-RETURN 
              THRU END-1000-MENU-RETURN.

           PERFORM 2000-START-UPDATE-VALIDATION
              THRU END-2000-UPDATE-VALIDATION.

           PERFORM 3000-START-ERROR-FIELDS 
             THRU END-3000-ERROR-FIELDS.  

           CALL
               'ucback'
               USING BY REFERENCE
               LK-CUSTOMER
           END-CALL.  
       END-0000-MAIN.
           GOBACK.

      * ****************************************************************
      * [SK] Contrôle des saisies sur l'ecran et interaction utilisateur
      ******************************************************************

       1000-START-MENU-RETURN.

      * Verifie si l'utilisateur souhaite retourner au menu principal
 
           IF WS-MENU-RETURN EQUAL 'O'
               GO TO END-0000-MAIN
           END-IF.
      * Valide la saisie de l'option de retour
           IF WS-MENU-RETURN NOT EQUAL 'O' 
            AND WS-MENU-RETURN NOT EQUAL SPACES 
               MOVE 'ERREUR DE SAISIE, "O" POUR RETOURNER AU MENU' 
               TO WS-ERROR-MESSAGE

               GO TO 0000-START-MAIN
           END-IF.
       END-1000-MENU-RETURN.
           EXIT. 

      ******************************************************************
      * [SK] Verifie si l'utilisateur confirme la mise à jour
      ******************************************************************
       2000-START-UPDATE-VALIDATION.
       
           IF WS-UPDATE-VALIDATION  NOT EQUAL 'O'
               MOVE 'ERREUR DE SAISIE, "O" POUR EFFECTUER LA RECHERCHE' 
               TO WS-ERROR-MESSAGE
            
               GO TO 0000-START-MAIN
           END-IF.
       END-2000-UPDATE-VALIDATION.
           EXIT.

      ******************************************************************     
      *  [SK] Verifie et valide les champs obligatoires et les formats
      ******************************************************************
       3000-START-ERROR-FIELDS.
           IF LK-CUS-GENDER = SPACES
               MOVE 'Le genre est obligatoire.' TO WS-ERROR-MESSAGE
               MOVE 'N' TO WS-UPDATE-VALIDATION
               GO TO 0000-START-MAIN
           END-IF.

           IF LENGTH OF LK-CUS-GENDER > 10
               MOVE 'Le genre depasse les 10 caracteres.'
                   TO WS-ERROR-MESSAGE
               MOVE 'N' TO WS-UPDATE-VALIDATION
               GO TO 0000-START-MAIN
           END-IF.

           IF LK-CUS-LASTNAME = SPACES
               MOVE 'Le nom est obligatoire.' TO WS-ERROR-MESSAGE
               MOVE 'N' TO WS-UPDATE-VALIDATION
               GO TO 0000-START-MAIN
           END-IF.

           IF LK-CUS-FIRSTNAME = SPACES
               MOVE 'Le prenom est obligatoire.' TO WS-ERROR-MESSAGE
               MOVE 'N' TO WS-UPDATE-VALIDATION
               GO TO 0000-START-MAIN
           END-IF.

           IF LENGTH OF LK-CUS-LASTNAME > 20
               MOVE 'Le nom depasse les 20 caracteres.'
                   TO WS-ERROR-MESSAGE
               MOVE 'N' TO WS-UPDATE-VALIDATION
               GO TO 0000-START-MAIN
           END-IF.

           IF LENGTH OF LK-CUS-FIRSTNAME > 20
               MOVE 'Le prenom depasse les 20 caracteres.'
                   TO WS-ERROR-MESSAGE
               MOVE 'N' TO WS-UPDATE-VALIDATION
               GO TO 0000-START-MAIN
           END-IF.

           IF LK-CUS-ADRESS1 = SPACES
               MOVE 'L''adresse est obligatoire.' TO WS-ERROR-MESSAGE
               MOVE 'N' TO WS-UPDATE-VALIDATION
               GO TO 0000-START-MAIN
           END-IF.

           IF LENGTH OF LK-CUS-ADRESS1 > 50
               MOVE 'L''adresse depasse les 50 caracteres.'
                   TO WS-ERROR-MESSAGE
               MOVE 'N' TO WS-UPDATE-VALIDATION
               GO TO 0000-START-MAIN
           END-IF.

           IF LENGTH OF LK-CUS-ADRESS2 > 50
               MOVE 'La deuxieme ligne d''adresse est trop longue'
                   TO WS-ERROR-MESSAGE
               MOVE 'N' TO WS-UPDATE-VALIDATION
               GO TO 0000-START-MAIN
           END-IF.

           IF LK-CUS-ZIPCODE = SPACES
               MOVE 'Le code postal est obligatoire.' 
               TO WS-ERROR-MESSAGE
               MOVE 'N' TO WS-UPDATE-VALIDATION
               GO TO 0000-START-MAIN
           END-IF.

           IF LENGTH OF LK-CUS-ZIPCODE > 15
               MOVE 'Le code postal depasse les 15 caracteres.'
                   TO WS-ERROR-MESSAGE
               MOVE 'N' TO WS-UPDATE-VALIDATION
           END-IF.

           IF LK-CUS-TOWN = SPACES
               MOVE 'La ville est obligatoire.' TO WS-ERROR-MESSAGE
               MOVE 'N' TO WS-UPDATE-VALIDATION
               GO TO 0000-START-MAIN
           END-IF.

           IF LENGTH OF LK-CUS-TOWN > 50
               MOVE 'La ville depasse les 50 caracteres.'
                   TO WS-ERROR-MESSAGE
               MOVE 'N' TO WS-UPDATE-VALIDATION
                ACCEPT SCREEN-FRAME-UPDATE
                GO TO 0000-START-MAIN
           END-IF.

           IF LK-CUS-COUNTRY = SPACES
               MOVE 'Le pays est obligatoire.' TO WS-ERROR-MESSAGE
               MOVE 'N' TO WS-UPDATE-VALIDATION
               GO TO 0000-START-MAIN
           END-IF.

           IF LENGTH OF LK-CUS-COUNTRY > 20
               MOVE 'Le pays depasse les 20 caracteres.'
                   TO WS-ERROR-MESSAGE
               MOVE 'N' TO WS-UPDATE-VALIDATION
               GO TO 0000-START-MAIN
           END-IF.

           IF LK-CUS-PHONE = SPACES
               MOVE 'Le numero de telephone est obligatoire.'
                   TO WS-ERROR-MESSAGE
               MOVE 'N' TO WS-UPDATE-VALIDATION
               GO TO 0000-START-MAIN
           END-IF.

           IF NOT FUNCTION NUMVAL(LK-CUS-PHONE) > 0
               MOVE 'Le numero de telephone doit être numerique.'
                   TO WS-ERROR-MESSAGE
               MOVE 'N' TO WS-UPDATE-VALIDATION
               GO TO 0000-START-MAIN
           END-IF.

           IF LK-CUS-MAIL = SPACES
               MOVE 'L''email est obligatoire.' TO WS-ERROR-MESSAGE
               MOVE 'N' TO WS-UPDATE-VALIDATION
               GO TO 0000-START-MAIN
           END-IF.

           IF LENGTH OF LK-CUS-MAIL > 50
               MOVE 'L''email depasse les 50 caracteres.'
                TO WS-ERROR-MESSAGE
               MOVE 'N' TO WS-UPDATE-VALIDATION
               GO TO 0000-START-MAIN
           END-IF.

           IF LK-CUS-BIRTH-DATE = SPACES
               MOVE 'La date de naissance est obligatoire.'
                   TO WS-ERROR-MESSAGE
               MOVE 'N' TO WS-UPDATE-VALIDATION
               GO TO 0000-START-MAIN
           END-IF.

           IF LENGTH OF LK-CUS-BIRTH-DATE > 10
               MOVE 'La date de naissance depasse les 10 caracteres.'
                   TO WS-ERROR-MESSAGE
               MOVE 'N' TO WS-UPDATE-VALIDATION
               GO TO 0000-START-MAIN
           END-IF.

           IF LK-CUS-CODE-SECU = SPACES
               MOVE 'Le code de securite sociale est obligatoire.'
                   TO WS-ERROR-MESSAGE
               MOVE 'N' TO WS-UPDATE-VALIDATION
               GO TO 0000-START-MAIN
           END-IF

           IF LENGTH OF LK-CUS-CODE-SECU > 15
               MOVE 'Le code de securite sociale est trop long.'
                   TO WS-ERROR-MESSAGE
               MOVE 'N' TO WS-UPDATE-VALIDATION
               GO TO 0000-START-MAIN
           END-IF.

           IF LK-CUS-CODE-IBAN = SPACES
               MOVE 'Le code IBAN est obligatoire.' TO WS-ERROR-MESSAGE
               MOVE 'N' TO WS-UPDATE-VALIDATION
               GO TO 0000-START-MAIN
           END-IF.

           IF LENGTH OF LK-CUS-CODE-IBAN > 34
               MOVE 'Le code IBAN depasse les 34 caracteres.' 
               TO WS-ERROR-MESSAGE
               MOVE 'N' TO WS-UPDATE-VALIDATION
               GO TO 0000-START-MAIN
           END-IF.

             IF LK-CUS-NBCHILDREN > 99
               MOVE 'Le nombre d''enfants depasse la limite.'
                TO WS-ERROR-MESSAGE
               MOVE 'N' TO WS-UPDATE-VALIDATION
               GO TO 0000-START-MAIN
           END-IF.

           IF LK-CUS-COUPLE NOT = 'OUI' AND LK-CUS-COUPLE NOT = 'NON'
               MOVE 'Le statut de couple doit etre "OUI" ou "NON".'
                TO WS-ERROR-MESSAGE
               MOVE 'N' TO WS-UPDATE-VALIDATION
               GO TO 0000-START-MAIN
           END-IF.

      *     Message de validation de creation de l'adherent, et
      *     stockage de la date de creation.

           IF WS-UPDATE-VALIDATION = "Y"
           MOVE "Modification reussi" TO WS-ERROR-MESSAGE
           MOVE FUNCTION CURRENT-DATE TO LK-CUS-CREATE-DATE
           END-IF.

         
       END-3000-ERROR-FIELDS.
           EXIT.    
