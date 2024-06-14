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
       01  WS-ERROR-MESSAGE     PIC X(140).
       01  WS-ERROR-MESSAGE-POS PIC 9(03).   
       01  WS-IS-ERROR          PIC X(01).   
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
           03 LK-CUS-TOWN	     PIC X(30).
           03 LK-CUS-COUNTRY	 PIC X(20).
           03 LK-CUS-PHONE	     PIC X(10).
           03 LK-CUS-MAIL	     PIC X(50).
           03 LK-CUS-BIRTH-DATE.
               05 LK-YEAR        PIC X(04).
               05 LK-SEPARATOR1  PIC X(01).
               05 LK-MONTH       PIC X(02).
               05 LK-SEPARATOR2  PIC X(01).
               05 LK-DAY         PIC X(02).
           03 LK-CUS-DOCTOR	     PIC X(20).
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
       COPY 'screen-update-customer.cpy'.

      ******************************************************************

       PROCEDURE DIVISION USING LK-CUSTOMER.

       0000-START-MAIN.
           INITIALIZE WS-ERROR-MESSAGE
                      WS-UPDATE-VALIDATION
                      WS-MENU-RETURN.

           PERFORM 1000-START-INITIALIZATION
              THRU END-1000-INITIALIZATION.
       END-0000-MAIN.
           GOBACK.

       1000-START-INITIALIZATION.
      *    [SK] Convertit le statut de couple en 't' ou 'f' pour 
      *    la base de donnees.. 
           IF LK-CUS-COUPLE EQUAL 't'
               MOVE 'oui' TO LK-CUS-COUPLE
           ELSE IF LK-CUS-COUPLE EQUAL 'f'
               MOVE 'non' TO LK-CUS-COUPLE
           END-IF.  

           ACCEPT SCREEN-UPDATE-CUSTOMER.

           PERFORM 1100-START-MENU-RETURN 
              THRU END-1100-MENU-RETURN.

           PERFORM 1200-START-UPDATE-VALIDATION
              THRU END-1200-UPDATE-VALIDATION.

           PERFORM 1300-START-ERROR-FIELDS 
             THRU END-1300-ERROR-FIELDS.  

           CALL
               'ucback'
               USING BY REFERENCE
               LK-CUSTOMER
           END-CALL.  

           CALL
               'menucust'
               USING BY REFERENCE
               LK-CUSTOMER
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
                   'menucust'
                   USING BY REFERENCE
                   LK-CUSTOMER
               END-CALL

           ELSE IF WS-MENU-RETURN NOT EQUAL 'O' 
               AND WS-MENU-RETURN NOT EQUAL SPACES THEN

               MOVE 'Veuillez entrer "O" pour retourner au menu.' 
               TO WS-ERROR-MESSAGE

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
               TO WS-ERROR-MESSAGE
            
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
           INITIALIZE WS-ERROR-MESSAGE.
           INITIALIZE WS-IS-ERROR.
           SET WS-ERROR-MESSAGE-POS TO 21.

           MOVE 'Champ obligatoire :' TO WS-ERROR-MESSAGE.

           IF LK-CUS-LASTNAME EQUAL SPACES THEN
               MOVE 'Nom' 
               TO WS-ERROR-MESSAGE(WS-ERROR-MESSAGE-POS:3)

               ADD 4 TO WS-ERROR-MESSAGE-POS

               MOVE 'Y' TO WS-IS-ERROR
           END-IF.

           IF LK-CUS-FIRSTNAME EQUAL SPACES THEN
               MOVE 'Prenom' 
               TO WS-ERROR-MESSAGE(WS-ERROR-MESSAGE-POS:6)

               ADD 7 TO WS-ERROR-MESSAGE-POS

               MOVE 'Y' TO WS-IS-ERROR
           END-IF.

           IF LK-CUS-GENDER EQUAL SPACES THEN
               MOVE 'Genre' 
               TO WS-ERROR-MESSAGE(WS-ERROR-MESSAGE-POS:5)

               ADD 6 TO WS-ERROR-MESSAGE-POS

               MOVE 'Y' TO WS-IS-ERROR
           END-IF.

           IF LK-CUS-ADRESS1 EQUAL SPACES THEN
               MOVE 'Adresse'
               TO WS-ERROR-MESSAGE(WS-ERROR-MESSAGE-POS:7)

               ADD 8 TO WS-ERROR-MESSAGE-POS

               MOVE 'Y' TO WS-IS-ERROR
           END-IF.

           IF LK-CUS-ZIPCODE EQUAL SPACES THEN
               MOVE 'Code postal' 
               TO WS-ERROR-MESSAGE(WS-ERROR-MESSAGE-POS:11)

               ADD 12 TO WS-ERROR-MESSAGE-POS

               MOVE 'Y' TO WS-IS-ERROR
           END-IF.

           IF LK-CUS-TOWN EQUAL SPACES THEN
               MOVE 'Ville' 
               TO WS-ERROR-MESSAGE(WS-ERROR-MESSAGE-POS:5)

               ADD 6 TO WS-ERROR-MESSAGE-POS

               MOVE 'Y' TO WS-IS-ERROR
           END-IF.

           IF LK-CUS-COUNTRY EQUAL SPACES THEN
               MOVE 'Pays' 
               TO WS-ERROR-MESSAGE(WS-ERROR-MESSAGE-POS:4)

               ADD 5 TO WS-ERROR-MESSAGE-POS

               MOVE 'Y' TO WS-IS-ERROR
           END-IF.

           IF LK-CUS-PHONE EQUAL '0000000000' 
           OR LK-CUS-PHONE IS NOT NUMERIC THEN
               MOVE 'Telephone'
               TO WS-ERROR-MESSAGE(WS-ERROR-MESSAGE-POS:19)

               ADD 10 TO WS-ERROR-MESSAGE-POS

               MOVE 'Y' TO WS-IS-ERROR
           END-IF.

           IF LK-CUS-MAIL EQUAL SPACES THEN
               MOVE 'Mail'
               TO WS-ERROR-MESSAGE(WS-ERROR-MESSAGE-POS:4)

               ADD 5 TO WS-ERROR-MESSAGE-POS

               MOVE 'Y' TO WS-IS-ERROR
           END-IF.

           IF LK-CUS-BIRTH-DATE EQUAL SPACES 
           OR LK-YEAR IS NOT NUMERIC 
           OR LK-MONTH IS NOT NUMERIC
           OR LK-DAY IS NOT NUMERIC THEN
               MOVE 'Date de naissance'
               TO WS-ERROR-MESSAGE(WS-ERROR-MESSAGE-POS:17)

               ADD 18 TO WS-ERROR-MESSAGE-POS

               MOVE 'Y' TO WS-IS-ERROR
           END-IF.

           IF LK-CUS-CODE-SECU EQUAL SPACES 
           OR LK-CUS-CODE-SECU IS NOT NUMERIC THEN
               MOVE 'Numero de securite sociale'
               TO WS-ERROR-MESSAGE(WS-ERROR-MESSAGE-POS:26)

               ADD 27 TO WS-ERROR-MESSAGE-POS

               MOVE 'Y' TO WS-IS-ERROR
           END-IF.

           IF LK-CUS-CODE-IBAN EQUAL SPACES THEN
               MOVE 'IBAN' 
               TO WS-ERROR-MESSAGE(WS-ERROR-MESSAGE-POS:4)

               ADD 5 TO WS-ERROR-MESSAGE-POS

               MOVE 'Y' TO WS-IS-ERROR
           END-IF.
           
           MOVE FUNCTION LOWER-CASE(LK-CUS-COUPLE) TO LK-CUS-COUPLE.
           IF LK-CUS-COUPLE NOT EQUAL 'oui' 
           AND LK-CUS-COUPLE NOT EQUAL 'non' THEN
               MOVE 'En couple'
               TO WS-ERROR-MESSAGE(WS-ERROR-MESSAGE-POS:9)

               ADD 10 TO WS-ERROR-MESSAGE-POS

               MOVE 'Y' TO WS-IS-ERROR
           END-IF.

           IF WS-IS-ERROR EQUAL 'Y' THEN
               GO TO 1000-START-INITIALIZATION
           END-IF.
       END-1300-ERROR-FIELDS.
           EXIT.    
