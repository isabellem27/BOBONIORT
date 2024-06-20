      ******************************************************************
      *    [SK-RD] Ce programme affiche le formulaire de modification  *
      *    d'un adhérent et appel le sous-programme "ucback" qui       *
      *    effectue la modification dans la DB.                        *
      ****************************************************************** 

       IDENTIFICATION DIVISION.
       PROGRAM-ID. ucfront RECURSIVE.
       AUTHOR. Safaa.

      ******************************************************************

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-CUS-BIRTH-DATE.
           03 WS-CUB-DAY         PIC X(02).
           03 FILLER             PIC X(01) VALUE '-'.
           03 WS-CUB-MONTH       PIC X(02).
           03 FILLER             PIC X(01) VALUE '-'.
           03 WS-CUB-YEAR        PIC X(04).

       01  WS-ERROR-MESSAGE1     PIC X(140).
       01  WS-ERROR-MESSAGE2     PIC X(120).
       01  WS-ERROR-MESSAGE-POS  PIC 9(03).   
       01  WS-IS-ERROR           PIC X(01).   
       01  WS-UPDATE-VALIDATION  PIC X(01).
       01  WS-MENU-RETURN        PIC X(01).
       01  WS-COUNT-AROBASE      PIC 9(02).
       01  WS-COUNT-IBAN-SPACE   PIC 9(02).
       01  WS-LENGTH-IBAN        PIC 9(02).

       LINKAGE SECTION.
       01 LK-CUSTOMER.
           03 LK-CUS-UUID        PIC X(36).
           03 LK-CUS-GENDER      PIC X(10).
           03 LK-CUS-LASTNAME    PIC X(20).
           03 LK-CUS-FIRSTNAME   PIC X(20).
           03 LK-CUS-ADRESS1	 PIC X(50).
           03 LK-CUS-ADRESS2	 PIC X(50).
           03 LK-CUS-ZIPCODE	 PIC X(15).
           03 LK-CUS-TOWN	     PIC X(30).
           03 LK-CUS-COUNTRY	 PIC X(20).
           03 LK-CUS-PHONE	     PIC X(10).
           03 LK-CUS-MAIL	     PIC X(50).
           03 LK-CUS-BIRTH-DATE  PIC X(10).
           03 LK-CUS-DOCTOR	     PIC X(20).
           03 LK-CUS-CODE-SECU.
               05 LK-SECU-1      PIC X(01).
               05 LK-SECU-2      PIC X(02).
               05 LK-SECU-3      PIC X(02).
               05 LK-SECU-4      PIC X(02).
               05 LK-SECU-5      PIC X(03).
               05 LK-SECU-6      PIC X(03).
               05 LK-SECU-7      PIC X(02).
           03 LK-CUS-CODE-IBAN.
               05 LK-IBAN-1      PIC X(04).
               05 LK-IBAN-2      PIC X(04).
               05 LK-IBAN-3      PIC X(04).
               05 LK-IBAN-4      PIC X(04).
               05 LK-IBAN-5      PIC X(04).
               05 LK-IBAN-6      PIC X(04).
               05 LK-IBAN-7      PIC X(04).
               05 LK-IBAN-8      PIC X(04).
               05 LK-IBAN-9      PIC X(02).
           03 LK-CUS-NBCHILDREN  PIC 9(03).
           03 LK-CUS-COUPLE      PIC X(05).
           03 LK-CUS-CREATE-DATE PIC X(10).
           03 LK-CUS-UPDATE-DATE PIC X(10).
           03 LK-CUS-CLOSE-DATE  PIC X(10).
           03 LK-CUS-ACTIVE	     PIC X(01).

       SCREEN SECTION.
       COPY 'screen-update-customer.cpy'.

      ******************************************************************

       PROCEDURE DIVISION USING LK-CUSTOMER.

       0000-START-MAIN.
           INITIALIZE WS-ERROR-MESSAGE1
                      WS-ERROR-MESSAGE2 
                      WS-UPDATE-VALIDATION
                      WS-MENU-RETURN.

      *    [SK] Convertit le statut de couple en 'oui' ou 'non' pour 
      *         la screen section. 
           IF LK-CUS-COUPLE EQUAL 't'
               MOVE 'oui' TO LK-CUS-COUPLE
           ELSE IF LK-CUS-COUPLE EQUAL 'f'
               MOVE 'non' TO LK-CUS-COUPLE
           END-IF.

      *    [RD] Convertit la date au format JJ-MM-AAAA pour la screen
      *         section.      
           MOVE LK-CUS-BIRTH-DATE(1:4) TO WS-CUB-YEAR. 
           MOVE LK-CUS-BIRTH-DATE(6:2) TO WS-CUB-MONTH.  
           MOVE LK-CUS-BIRTH-DATE(9:2) TO WS-CUB-DAY.   

           PERFORM 1000-START-INITIALIZATION
              THRU END-1000-INITIALIZATION.
       END-0000-MAIN.
           GOBACK.

      ******************************************************************
      *    [RD] Affiche l'écran de la modification, appel les          *    
      *    paragraphes qui s'occupent de vérifier les saisis de        *
      *    l'utilisateur et appel les sous-programmes BACK et menu     *
      *    d'un adhérent.                                              *
      ******************************************************************
       1000-START-INITIALIZATION.

           ACCEPT SCREEN-UPDATE-CUSTOMER.

           PERFORM 1100-START-MENU-RETURN 
              THRU END-1100-MENU-RETURN.

           PERFORM 1200-START-UPDATE-VALIDATION
              THRU END-1200-UPDATE-VALIDATION.

           PERFORM 1300-START-ERROR-FIELDS 
             THRU END-1300-ERROR-FIELDS.  

      *    [RD] Convertit la date au format AAAA-MM-JJ pour la DB. 
           STRING 
               WS-CUB-YEAR '-' WS-CUB-MONTH '-' WS-CUB-DAY
               DELIMITED BY SIZE
               INTO LK-CUS-BIRTH-DATE
           END-STRING.

           CALL
               'ucback'
               USING BY REFERENCE
               LK-CUSTOMER
           END-CALL.  

           CALL
               'mcfront'
               USING BY REFERENCE
               LK-CUS-UUID
           END-CALL. 
       END-1000-INITIALIZATION.
           EXIT.

      ******************************************************************
      *    [SK-RD] Si l'utilisateur a saisi "O" sur "Retour au menu"   *
      *    redirige vers le menu d'un adhérent.                        *
      *    Si l'utilisateur a effectué une saisie incorrecte redirige  *
      *    vers le début de ce programme avec un message d'erreur.     *
      ******************************************************************
       1100-START-MENU-RETURN.
           MOVE FUNCTION UPPER-CASE(WS-MENU-RETURN) TO WS-MENU-RETURN.

           IF WS-MENU-RETURN EQUAL 'O' THEN
               CALL 
                   'mcfront'
                   USING BY REFERENCE
                   LK-CUSTOMER
               END-CALL

           ELSE IF WS-MENU-RETURN NOT EQUAL 'O' 
               AND WS-MENU-RETURN NOT EQUAL SPACES THEN

               MOVE 'Veuillez entrer "O" pour retourner au menu.' 
               TO WS-ERROR-MESSAGE1

               GO TO 1000-START-INITIALIZATION
           END-IF.
       END-1100-MENU-RETURN.
           EXIT. 

      ******************************************************************
      *    [SK] Si l'utilisateur n'a pas saisi "O" sur "Modifier"      *
      *    redirige vers le début de ce programme.                     *
      ******************************************************************
       1200-START-UPDATE-VALIDATION.
           MOVE FUNCTION UPPER-CASE(WS-UPDATE-VALIDATION)
           TO WS-UPDATE-VALIDATION.

           IF WS-UPDATE-VALIDATION NOT EQUAL 'O' THEN
               MOVE 'Veuillez entrer "O" pour modifier.' 
               TO WS-ERROR-MESSAGE1
            
               GO TO 1000-START-INITIALIZATION
           END-IF.
       END-1200-UPDATE-VALIDATION.
           EXIT.

      ******************************************************************     
      *    [SK-RD] Attribu un message d'erreur si l'un des champs du   *
      *    formulaire de modification n'est pas remplis correctement   *
      *    et redirige vers le début de ce programme.                  *
      ******************************************************************
       1300-START-ERROR-FIELDS.
           INITIALIZE WS-ERROR-MESSAGE1
                      WS-ERROR-MESSAGE2
                      WS-IS-ERROR
                      WS-COUNT-AROBASE
                      WS-COUNT-IBAN-SPACE
                      WS-LENGTH-IBAN      .

           SET WS-ERROR-MESSAGE-POS TO 20.

           MOVE 'Erreur de saisie :' TO WS-ERROR-MESSAGE1.

      *    [RD] Liste des conditions qui retourne un message d'erreur
      *         si la condition est true.

      *    [RD] Nom = vide 
           IF LK-CUS-LASTNAME EQUAL SPACES THEN
               MOVE 'Nom' 
               TO WS-ERROR-MESSAGE1(WS-ERROR-MESSAGE-POS:3)

               ADD 3 TO WS-ERROR-MESSAGE-POS

               MOVE 'Y' TO WS-IS-ERROR
           END-IF.

      *    [RD] Prénom = vide 
           IF LK-CUS-FIRSTNAME EQUAL SPACES THEN
               IF WS-ERROR-MESSAGE-POS LESS THAN 23 THEN
                   MOVE 'Prenom' 
                   TO WS-ERROR-MESSAGE1(WS-ERROR-MESSAGE-POS:6)

                   ADD 6 TO WS-ERROR-MESSAGE-POS
               ELSE 
                   MOVE ', Prenom' 
                   TO WS-ERROR-MESSAGE1(WS-ERROR-MESSAGE-POS:8)

                   ADD 8 TO WS-ERROR-MESSAGE-POS
               END-IF
                   MOVE 'Y' TO WS-IS-ERROR
           END-IF.

      *    [RD] Genre = vide  
           IF LK-CUS-GENDER EQUAL SPACES THEN
               IF WS-ERROR-MESSAGE-POS LESS THAN 23 THEN
                   MOVE 'Genre' 
                   TO WS-ERROR-MESSAGE1(WS-ERROR-MESSAGE-POS:5)
       
                   ADD 5 TO WS-ERROR-MESSAGE-POS
               ELSE 
                   MOVE ', Genre' 
                   TO WS-ERROR-MESSAGE1(WS-ERROR-MESSAGE-POS:7)

                   ADD 7 TO WS-ERROR-MESSAGE-POS
               END-IF
               MOVE 'Y' TO WS-IS-ERROR
           END-IF.

      *    [RD] Adresse 1 = vide 
           IF LK-CUS-ADRESS1 EQUAL SPACES THEN
               IF WS-ERROR-MESSAGE-POS LESS THAN 23 THEN
                   MOVE 'Adresse'
                   TO WS-ERROR-MESSAGE1(WS-ERROR-MESSAGE-POS:7)
       
                   ADD 7 TO WS-ERROR-MESSAGE-POS
               ELSE 
                   MOVE ', Adresse' 
                   TO WS-ERROR-MESSAGE1(WS-ERROR-MESSAGE-POS:9)

                   ADD 9 TO WS-ERROR-MESSAGE-POS
               END-IF
               MOVE 'Y' TO WS-IS-ERROR
           END-IF.

      *    [RD] Code postal = vide  
           IF LK-CUS-ZIPCODE EQUAL SPACES THEN
               IF WS-ERROR-MESSAGE-POS LESS THAN 23 THEN
                   MOVE 'Code postal' 
                   TO WS-ERROR-MESSAGE1(WS-ERROR-MESSAGE-POS:11)
       
                   ADD 11 TO WS-ERROR-MESSAGE-POS
               ELSE 
                   MOVE ', Code postal' 
                   TO WS-ERROR-MESSAGE1(WS-ERROR-MESSAGE-POS:13)

                   ADD 13 TO WS-ERROR-MESSAGE-POS
               END-IF
               MOVE 'Y' TO WS-IS-ERROR
           END-IF.

      *    [RD] Ville = vide
           IF LK-CUS-TOWN EQUAL SPACES THEN
               IF WS-ERROR-MESSAGE-POS LESS THAN 23 THEN
                   MOVE 'Ville' 
                   TO WS-ERROR-MESSAGE1(WS-ERROR-MESSAGE-POS:5)
       
                   ADD 5 TO WS-ERROR-MESSAGE-POS
               ELSE 
                   MOVE ', Ville' 
                   TO WS-ERROR-MESSAGE1(WS-ERROR-MESSAGE-POS:7)

                   ADD 7 TO WS-ERROR-MESSAGE-POS
               END-IF
               MOVE 'Y' TO WS-IS-ERROR
           END-IF.

      *    [RD] Pays = vide 
           IF LK-CUS-COUNTRY EQUAL SPACES THEN
               IF WS-ERROR-MESSAGE-POS LESS THAN 23 THEN
                   MOVE 'Pays' 
                   TO WS-ERROR-MESSAGE1(WS-ERROR-MESSAGE-POS:4)
       
                   ADD 4 TO WS-ERROR-MESSAGE-POS
               ELSE 
                   MOVE ', Pays' 
                   TO WS-ERROR-MESSAGE1(WS-ERROR-MESSAGE-POS:6)

                   ADD 6 TO WS-ERROR-MESSAGE-POS
               END-IF
               MOVE 'Y' TO WS-IS-ERROR
           END-IF.

      *    [RD] Téléphone != chiffre 
      *         OU contient que des zéros
           IF LK-CUS-PHONE EQUAL '0000000000' 
           OR LK-CUS-PHONE IS NOT NUMERIC THEN
               IF WS-ERROR-MESSAGE-POS LESS THAN 23 THEN
                   MOVE 'Telephone'
                   TO WS-ERROR-MESSAGE1(WS-ERROR-MESSAGE-POS:9)
       
                   ADD 9 TO WS-ERROR-MESSAGE-POS
               ELSE 
                   MOVE ', Telephone' 
                   TO WS-ERROR-MESSAGE1(WS-ERROR-MESSAGE-POS:11)

                   ADD 11 TO WS-ERROR-MESSAGE-POS
               END-IF
               MOVE 'Y' TO WS-IS-ERROR
           END-IF.

      *    [RD] Mail = vide
      *         OU nombre d'arobase dans le mail > 1
      *         OU < 1  
           INSPECT LK-CUS-MAIL TALLYING WS-COUNT-AROBASE FOR ALL '@'.
           
           IF LK-CUS-MAIL EQUAL SPACES 
           OR WS-COUNT-AROBASE GREATER THAN 1 
           OR WS-COUNT-AROBASE LESS THAN 1 THEN
               IF WS-ERROR-MESSAGE-POS LESS THAN 23 THEN
                   MOVE 'Mail'
                   TO WS-ERROR-MESSAGE1(WS-ERROR-MESSAGE-POS:4)
       
                   ADD 4 TO WS-ERROR-MESSAGE-POS
               ELSE 
                   MOVE ', Mail' 
                   TO WS-ERROR-MESSAGE1(WS-ERROR-MESSAGE-POS:6)

                   ADD 6 TO WS-ERROR-MESSAGE-POS
               END-IF
               MOVE 'Y' TO WS-IS-ERROR
           END-IF.

      *    [RD] Date de naissance != chiffre
      *         OU JOUR < 1 OU JOUR > 31
      *         OU MOIS < 1 OU MOIS > 12
      *         OU ANNEE < 1000
           IF WS-CUB-DAY   IS NOT NUMERIC 
           OR WS-CUB-MONTH IS NOT NUMERIC
           OR WS-CUB-YEAR  IS NOT NUMERIC 
           OR WS-CUB-DAY LESS THAN 01
           OR WS-CUB-DAY GREATER THAN 31
           OR WS-CUB-MONTH LESS THAN 01
           OR WS-CUB-MONTH GREATER THAN 12
           OR WS-CUB-YEAR LESS THAN 1000
           THEN
               IF WS-ERROR-MESSAGE-POS LESS THAN 23 THEN
                   MOVE 'Date de naissance'
                   TO WS-ERROR-MESSAGE1(WS-ERROR-MESSAGE-POS:17)
       
                   ADD 17 TO WS-ERROR-MESSAGE-POS
               ELSE 
                   MOVE ', Date de naissance' 
                   TO WS-ERROR-MESSAGE1(WS-ERROR-MESSAGE-POS:19)

                   ADD 19 TO WS-ERROR-MESSAGE-POS
               END-IF
               MOVE 'Y' TO WS-IS-ERROR
           END-IF.

      *    [RD] Code de sécu != chiffre 
           IF LK-CUS-CODE-SECU IS NOT NUMERIC THEN
               IF WS-ERROR-MESSAGE-POS LESS THAN 23 THEN
                   MOVE 'Numero de securite sociale'
                   TO WS-ERROR-MESSAGE1(WS-ERROR-MESSAGE-POS:26)
       
                   ADD 26 TO WS-ERROR-MESSAGE-POS
               ELSE 
                   MOVE ', Numero de securite sociale' 
                   TO WS-ERROR-MESSAGE1(WS-ERROR-MESSAGE-POS:28)

                   ADD 28 TO WS-ERROR-MESSAGE-POS
               END-IF
               MOVE 'Y' TO WS-IS-ERROR
           END-IF.

      *    [RD] IBAN 2 premières caractères != lettre
      *         OU reste de l'IBAN != chiffre 
      *         OU longueur de l'IBAN < 14
      *         OU dans l'IBAN il y a 1 ou plus d'espace
           INSPECT FUNCTION TRIM(LK-CUS-CODE-IBAN) 
           TALLYING WS-COUNT-IBAN-SPACE FOR ALL SPACE.

           MOVE LENGTH OF FUNCTION TRIM(LK-CUS-CODE-IBAN)
           TO WS-LENGTH-IBAN.

           IF LK-CUS-CODE-IBAN(1:2) IS NOT ALPHABETIC
           OR LK-CUS-CODE-IBAN(3:(WS-LENGTH-IBAN - 2)) IS NOT NUMERIC 
           OR WS-LENGTH-IBAN LESS THAN 14 
           OR WS-COUNT-IBAN-SPACE NOT EQUAL ZERO THEN
               IF WS-ERROR-MESSAGE-POS LESS THAN 14 THEN
                   MOVE 'IBAN' 
                   TO WS-ERROR-MESSAGE1(WS-ERROR-MESSAGE-POS:4)
       
                   ADD 4 TO WS-ERROR-MESSAGE-POS
               ELSE IF WS-ERROR-MESSAGE-POS GREATER THAN 136 THEN
                   MOVE 'IBAN'
                   TO WS-ERROR-MESSAGE2
               ELSE
                   MOVE ', IBAN' 
                   TO WS-ERROR-MESSAGE1(WS-ERROR-MESSAGE-POS:6)

                   ADD 6 TO WS-ERROR-MESSAGE-POS
               END-IF
               MOVE 'Y' TO WS-IS-ERROR
           END-IF.
           
      *    [RD] En couple != 'oui ET != 'non'
           MOVE FUNCTION LOWER-CASE(LK-CUS-COUPLE) TO LK-CUS-COUPLE.
           IF LK-CUS-COUPLE NOT EQUAL 'oui' 
           AND LK-CUS-COUPLE NOT EQUAL 'non' THEN
               
               IF WS-ERROR-MESSAGE-POS LESS THAN 23 THEN
                   MOVE 'En couple'
                   TO WS-ERROR-MESSAGE1(WS-ERROR-MESSAGE-POS:9)

                   ADD 9 TO WS-ERROR-MESSAGE-POS
               ELSE IF WS-ERROR-MESSAGE-POS GREATER THAN 132 
                  AND WS-ERROR-MESSAGE2 EQUAL SPACES THEN
                   MOVE 'En couple'
                   TO WS-ERROR-MESSAGE2
               ELSE IF WS-ERROR-MESSAGE-POS GREATER THAN 132 
                   AND WS-ERROR-MESSAGE2 NOT EQUAL SPACES THEN
                   MOVE ', En couple'
                   TO WS-ERROR-MESSAGE2(5:11)
               ELSE
                   MOVE ', En couple' 
                   TO WS-ERROR-MESSAGE1(WS-ERROR-MESSAGE-POS:11)

                   ADD 11 TO WS-ERROR-MESSAGE-POS
               END-IF
                   MOVE 'Y' TO WS-IS-ERROR
           END-IF.

           IF WS-IS-ERROR EQUAL 'Y' THEN
               GO TO 1000-START-INITIALIZATION
           END-IF.
       END-1300-ERROR-FIELDS.
           EXIT.    
