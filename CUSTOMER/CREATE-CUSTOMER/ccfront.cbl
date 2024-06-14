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
           05  LK-PHONE                PIC X(20).
           05  LK-MAIL                 PIC X(50).
           05 LK-BIRTHDATE.
               10 LK-YEAR              PIC X(04).
               10 LK-MONTH             PIC X(02).
               10 LK-DAY               PIC X(02).
           05 LK-CUSTOMER-CODE-SECU.
               10 LK-SECU-1            PIC X.
               10 LK-SECU-2            PIC X(2).
               10 LK-SECU-3            PIC X(2).
               10 LK-SECU-4            PIC X(2).
               10 LK-SECU-5            PIC X(3).
               10 LK-SECU-6            PIC X(3).
               10 LK-SECU-7            PIC X(2).
           05  LK-DOCTOR               PIC X(50).
           05  LK-CODE-IBAN            PIC X(34).
           05  LK-NBCHILDREN           PIC X(02).
           05  LK-COUPLE               PIC X(05).
           05  LK-CREATE-DATE          PIC X(10).
           05  LK-UPDATE-DATE          PIC X(10).
           05  LK-CLOSE-DATE           PIC X(10).
           05  LK-ACTIVE               PIC X(01) VALUE "0".

       01  LK-MENU-RETURN              PIC X(01).
       01  LK-ADD-VALIDATION           PIC X(01).
       01  LK-ERROR-MESSAGE            PIC X(70). 
       01  LK-VALIDATION-STATUS        PIC X VALUE "Y".


       SCREEN SECTION.
       COPY 'screen-add-customer.cpy'.

      ******************************************************************

       PROCEDURE DIVISION USING LK-ADHERENT-INPUT, LK-MENU-RETURN, 
       LK-VALIDATION-STATUS, LK-ERROR-MESSAGE, LK-ADD-VALIDATION.
          
     
       0000-START-MAIN.
           ACCEPT SCREEN-ADD-CUSTOMER.
           
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
            AND LK-MENU-RETURN NOT EQUAL SPACES 

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
      *    [MF] Si une des vérifications n'est pas valable alors cela
      *    redirige vers le MAIN
      ******************************************************************

       3000-START-ERROR-FIELDS.
           

           MOVE FUNCTION UPPER-CASE(LK-COUPLE) TO LK-COUPLE.
            
         
           IF LK-LASTNAME = SPACES
               MOVE 'Le nom est obligatoire.' TO LK-ERROR-MESSAGE
               MOVE 'N' TO LK-VALIDATION-STATUS
               GO TO 0000-START-MAIN
           END-IF
           IF LK-FIRSTNAME = SPACES
               MOVE 'Le prenom est obligatoire.' TO LK-ERROR-MESSAGE
               MOVE 'N' TO LK-VALIDATION-STATUS
               GO TO 0000-START-MAIN
           END-IF
          
           IF LK-GENDER = SPACES
               MOVE 'Le genre est obligatoire.' TO LK-ERROR-MESSAGE
               MOVE 'N' TO LK-VALIDATION-STATUS
               GO TO 0000-START-MAIN
           END-IF
           IF LK-BIRTHDATE = SPACES
               MOVE 'La date de naissance est obligatoire.'
                   TO LK-ERROR-MESSAGE
               MOVE 'N' TO LK-VALIDATION-STATUS
               GO TO 0000-START-MAIN
           END-IF
          
         
           IF LK-COUPLE NOT = 'OUI' AND LK-COUPLE NOT = 'NON'
               MOVE 'Le statut de couple doit etre "OUI" ou "NON".'
                TO LK-ERROR-MESSAGE
               MOVE 'N' TO LK-VALIDATION-STATUS
               GO TO 0000-START-MAIN
           END-IF.

          

            IF LK-PHONE = SPACES
               MOVE "Le numero de telephone est obligatoire."
                   TO LK-ERROR-MESSAGE
               MOVE 'N' TO LK-VALIDATION-STATUS
               GO TO 0000-START-MAIN
           END-IF
           
           IF LENGTH OF LK-PHONE < 10
               MOVE "Le numero de téléphone n'est pas complet." 
               TO LK-ERROR-MESSAGE
               MOVE 'N' TO LK-VALIDATION-STATUS
               GO TO 0000-START-MAIN
           END-IF

           IF LK-CODE-IBAN = SPACES
               MOVE 'Le code IBAN est obligatoire.' TO LK-ERROR-MESSAGE
               MOVE 'N' TO LK-VALIDATION-STATUS
               GO TO 0000-START-MAIN
           END-IF

           IF LK-CUSTOMER-CODE-SECU = SPACES
               MOVE 'Le code de securite sociale est obligatoire.'
                   TO LK-ERROR-MESSAGE
               MOVE 'N' TO LK-VALIDATION-STATUS
               GO TO 0000-START-MAIN
           END-IF

            IF LENGTH OF LK-CUSTOMER-CODE-SECU < 15
               MOVE 'Le code de securite sociale est trop court'
                   TO LK-ERROR-MESSAGE
               MOVE 'N' TO LK-VALIDATION-STATUS
               GO TO 0000-START-MAIN
           END-IF

           IF LK-DOCTOR = SPACES
               MOVE 'Le nom du docteur est obligatoire.'
                   TO LK-ERROR-MESSAGE
               MOVE 'N' TO LK-VALIDATION-STATUS
               GO TO 0000-START-MAIN
           END-IF

           
           IF LK-MAIL = SPACES
               MOVE 'L''email est obligatoire.' TO LK-ERROR-MESSAGE
               MOVE 'N' TO LK-VALIDATION-STATUS
               GO TO 0000-START-MAIN
           END-IF

           IF LK-ADRESS1 = SPACES
               MOVE 'L''adresse est obligatoire.' TO LK-ERROR-MESSAGE
               MOVE 'N' TO LK-VALIDATION-STATUS
               GO TO 0000-START-MAIN
           END-IF
          
            IF LK-TOWN = SPACES
               MOVE 'La ville est obligatoire.' TO LK-ERROR-MESSAGE
               MOVE 'N' TO LK-VALIDATION-STATUS
               GO TO 0000-START-MAIN
           END-IF
         
           IF LK-ZIPCODE = SPACES
               MOVE 'Le code postal est obligatoire.' 
               TO LK-ERROR-MESSAGE
               MOVE 'N' TO LK-VALIDATION-STATUS
               GO TO 0000-START-MAIN
           END-IF
          
       
          
           IF LK-COUNTRY = SPACES
               MOVE 'Le pays est obligatoire.' TO LK-ERROR-MESSAGE
               MOVE 'N' TO LK-VALIDATION-STATUS
               GO TO 0000-START-MAIN
           END-IF
          
                                                                  
           
           MOVE 'Y' TO LK-VALIDATION-STATUS.
           IF LK-VALIDATION-STATUS = "Y"
           MOVE "Enregistrement reussi" TO LK-ERROR-MESSAGE
           ACCEPT LK-CREATE-DATE FROM DATE YYYYMMDD
           ACCEPT LK-UPDATE-DATE FROM DATE YYYYMMDD
           END-IF.
       END-3000-ERROR-FIELDS.
           EXIT.

       