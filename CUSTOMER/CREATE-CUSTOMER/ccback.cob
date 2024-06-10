
      ******************************************************************
      *    [MF] Le programme 'Create Adherent logic' ajoute un adhérent
      *    à la table customer
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ccback.
       AUTHOR.       Martial.
      ******************************************************************

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01  WS-MAIL-AROBASE             PIC 9 VALUE 0.
       01  WS-VALIDATION-STATUS        PIC X(01) VALUE 'Y'.

       01  WS-ADHERENT.
           05  WS-GENDER               PIC X(10).
           05  WS-LASTNAME             PIC X(20).
           05  WS-FIRSTNAME            PIC X(20).
           05  WS-ADRESS1              PIC X(50).
           05  WS-ADRESS2              PIC X(50).
           05  WS-ZIPCODE              PIC X(15).
           05  WS-TOWN                 PIC X(50).
           05  WS-COUNTRY              PIC X(20).
           05  WS-PHONE                PIC 9(20).
           05  WS-MAIL                 PIC X(50).
           05  WS-BIRTH-DATE           PIC X(10).
           05  WS-DOCTOR               PIC X(50).
           05  WS-CODE-SECU            PIC X(15).
           05  WS-CODE-IBAN            PIC X(34).
           05  WS-NBCHILDREN           PIC 9(03).
           05  WS-COUPLE               PIC X(05).
           05  WS-CREATE-DATE          PIC X(10).
           05  WS-UPDATE-DATE          PIC X(10).
           05  WS-CLOSE-DATE           PIC X(10).
           05  WS-ACTIVE               PIC X(01).

OCESQL*EXEC SQL BEGIN DECLARE SECTION END-EXEC.
       01  DBNAME   PIC  X(11) VALUE 'boboniortdb'.
       01  USERNAME PIC  X(05) VALUE 'cobol'.
       01  PASSWD   PIC  X(10) VALUE 'cbl85'.
OCESQL*EXEC SQL END DECLARE SECTION END-EXEC.
OCESQL*EXEC SQL INCLUDE SQLCA END-EXEC.
OCESQL     copy "sqlca.cbl".

OCESQL*
OCESQL 01  SQ0001.
OCESQL     02  FILLER PIC X(014) VALUE "DISCONNECT ALL".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
OCESQL 01  SQ0002.
OCESQL     02  FILLER PIC X(256) VALUE "INSERT INTO CUSTOMER ( CUSTOME"
OCESQL  &  "R_GENDER, CUSTOMER_LASTNAME, CUSTOMER_FIRSTNAME, CUSTOMER_"
OCESQL  &  "ADRESS1, CUSTOMER_ADRESS2, CUSTOMER_ZIPCODE, CUSTOMER_TOWN"
OCESQL  &  ", CUSTOMER_COUNTRY, CUSTOMER_PHONE, CUSTOMER_MAIL, CUSTOME"
OCESQL  &  "R_BIRTH_DATE, CUSTOMER_DOCTOR, CUSTOMER_CODE_SECU, C".
OCESQL     02  FILLER PIC X(218) VALUE "USTOMER_CODE_IBAN, CUSTOMER_NB"
OCESQL  &  "CHILDREN, CUSTOMER_COUPLE, CUSTOMER_CREATE_DATE, CUSTOMER_"
OCESQL  &  "UPDATE_DATE, CUSTOMER_CLOSE_DATE ) VALUES ( $1, $2, $3, $4"
OCESQL  &  ", $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $"
OCESQL  &  "17, $18, $19 )".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
       LINKAGE SECTION.
       01  LK-REQUEST-CODE      PIC 9(01).

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
           05  LK-BIRTH-DATE           PIC X(10).
           05  LK-DOCTOR               PIC X(50).
           05  LK-CODE-SECU            PIC X(15).
           05  LK-CODE-IBAN            PIC X(34).
           05  LK-NBCHILDREN           PIC 9(03).
           05  LK-COUPLE               PIC X(05).
           05  LK-CREATE-DATE          PIC X(10).
           05  LK-UPDATE-DATE          PIC X(10).
           05  LK-CLOSE-DATE           PIC X(10).
           05  LK-ACTIVE               PIC X(01) VALUE "0".
       01  LK-ERROR-MESSAGE            PIC X(100).

      ******************************************************************

       PROCEDURE DIVISION USING LK-REQUEST-CODE, LK-ADHERENT-INPUT, 
           LK-ERROR-MESSAGE.
       0000-START-MAIN.
OCESQL*    EXEC SQL
OCESQL*        CONNECT :USERNAME IDENTIFIED BY :PASSWD USING :DBNAME 
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLConnect" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE USERNAME
OCESQL          BY VALUE 5
OCESQL          BY REFERENCE PASSWD
OCESQL          BY VALUE 10
OCESQL          BY REFERENCE DBNAME
OCESQL          BY VALUE 11
OCESQL     END-CALL.

      *    [MF] Déplacement des données du linkage vers la
      *    working-storage

           MOVE LK-ADHERENT-INPUT TO WS-ADHERENT.

           PERFORM INITIALIZE-VALUES
           PERFORM VALIDATE-INPUT
           IF WS-VALIDATION-STATUS = 'Y'
               PERFORM INSERT-DATA-TO-DB
           ELSE
               DISPLAY 'Erreur: ' LK-ERROR-MESSAGE
           END-IF

OCESQL*    EXEC SQL COMMIT WORK END-EXEC.
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLExec" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "COMMIT" & x"00"
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL.
OCESQL*    EXEC SQL DISCONNECT ALL END-EXEC.
OCESQL     CALL "OCESQLDisconnect" USING
OCESQL          BY REFERENCE SQLCA
OCESQL     END-CALL.
           GOBACK.

       INITIALIZE-VALUES.
           MOVE SPACES TO LK-ERROR-MESSAGE.

      *    [MF] Vérification de la saisie de l'utilisateur

       VALIDATE-INPUT.

           INSPECT WS-MAIL TALLYING WS-MAIL-AROBASE
                           FOR ALL "@".

           IF WS-GENDER = SPACES
               MOVE 'Le genre est obligatoire.' TO LK-ERROR-MESSAGE
               MOVE 'N' TO WS-VALIDATION-STATUS
           END-IF
           IF LENGTH OF WS-GENDER > 10
               MOVE 'Le genre dépasse les 10 caractères.'
                   TO LK-ERROR-MESSAGE
               MOVE 'N' TO WS-VALIDATION-STATUS
           END-IF
           IF WS-LASTNAME = SPACES
               MOVE 'Le nom est obligatoire.' TO LK-ERROR-MESSAGE
               MOVE 'N' TO WS-VALIDATION-STATUS
           END-IF
           IF WS-FIRSTNAME = SPACES
               MOVE 'Le prénom est obligatoire.' TO LK-ERROR-MESSAGE
               MOVE 'N' TO WS-VALIDATION-STATUS
           END-IF
           IF LENGTH OF WS-LASTNAME > 20
               MOVE 'Le nom dépasse les 20 caractères.'
                   TO LK-ERROR-MESSAGE
               MOVE 'N' TO WS-VALIDATION-STATUS
           END-IF
           IF LENGTH OF WS-FIRSTNAME > 20
               MOVE 'Le prénom dépasse les 20 caractères.'
                   TO LK-ERROR-MESSAGE
               MOVE 'N' TO WS-VALIDATION-STATUS
           END-IF
           IF WS-ADRESS1 = SPACES
               MOVE 'L''adresse est obligatoire.' TO LK-ERROR-MESSAGE
               MOVE 'N' TO WS-VALIDATION-STATUS
           END-IF
           IF LENGTH OF WS-ADRESS1 > 50
               MOVE 'L''adresse dépasse les 50 caractères.'
                   TO LK-ERROR-MESSAGE
               MOVE 'N' TO WS-VALIDATION-STATUS
           END-IF
           IF LENGTH OF WS-ADRESS2 > 50
               MOVE 'La deuxième ligne d''adresse est trop longue'
                   TO LK-ERROR-MESSAGE
               MOVE 'N' TO WS-VALIDATION-STATUS
           END-IF
           IF WS-ZIPCODE = SPACES
               MOVE 'Le code postal est obligatoire.' 
               TO LK-ERROR-MESSAGE
               MOVE 'N' TO WS-VALIDATION-STATUS
           END-IF
           IF LENGTH OF WS-ZIPCODE > 15
               MOVE 'Le code postal dépasse les 15 caractères.'
                   TO LK-ERROR-MESSAGE
               MOVE 'N' TO WS-VALIDATION-STATUS
           END-IF
           IF WS-TOWN = SPACES
               MOVE 'La ville est obligatoire.' TO LK-ERROR-MESSAGE
               MOVE 'N' TO WS-VALIDATION-STATUS
           END-IF
           IF LENGTH OF WS-TOWN > 50
               MOVE 'La ville dépasse les 50 caractères.'
                   TO LK-ERROR-MESSAGE
               MOVE 'N' TO WS-VALIDATION-STATUS
           END-IF
           IF WS-COUNTRY = SPACES
               MOVE 'Le pays est obligatoire.' TO LK-ERROR-MESSAGE
               MOVE 'N' TO WS-VALIDATION-STATUS
           END-IF
           IF LENGTH OF WS-COUNTRY > 20
               MOVE 'Le pays dépasse les 20 caractères.'
                   TO LK-ERROR-MESSAGE
               MOVE 'N' TO WS-VALIDATION-STATUS
           END-IF
           IF WS-PHONE = SPACES
               MOVE 'Le numéro de téléphone est obligatoire.'
                   TO LK-ERROR-MESSAGE
               MOVE 'N' TO WS-VALIDATION-STATUS
           END-IF
           IF NOT FUNCTION NUMVAL(WS-PHONE) > 0
               MOVE 'Le numéro de téléphone doit être numérique.'
                   TO LK-ERROR-MESSAGE
               MOVE 'N' TO WS-VALIDATION-STATUS
           END-IF
           
           IF WS-MAIL-AROBASE < 1 OR WS-MAIL-AROBASE > 1
               MOVE 'Un unique arobase est demandé.' 
               TO LK-ERROR-MESSAGE
               MOVE 'N' TO WS-VALIDATION-STATUS
           END-IF
           IF WS-MAIL = SPACES
               MOVE 'L''email est obligatoire.' TO LK-ERROR-MESSAGE
               MOVE 'N' TO WS-VALIDATION-STATUS
           END-IF
           IF LENGTH OF WS-MAIL > 50
               MOVE 'L''email dépasse les 50 caractères.'
                TO LK-ERROR-MESSAGE
               MOVE 'N' TO WS-VALIDATION-STATUS
           END-IF
           IF WS-BIRTH-DATE = SPACES
               MOVE 'La date de naissance est obligatoire.'
                   TO LK-ERROR-MESSAGE
               MOVE 'N' TO WS-VALIDATION-STATUS
           END-IF
           IF LENGTH OF WS-BIRTH-DATE > 10
               MOVE 'La date de naissance dépasse les 10 caractères.'
                   TO LK-ERROR-MESSAGE
               MOVE 'N' TO WS-VALIDATION-STATUS
           END-IF
           IF WS-CODE-SECU = SPACES
               MOVE 'Le code de sécurité sociale est obligatoire.'
                   TO LK-ERROR-MESSAGE
               MOVE 'N' TO WS-VALIDATION-STATUS
           END-IF
           IF LENGTH OF WS-CODE-SECU > 15
               MOVE 'Le code de sécurité sociale est trop long.'
                   TO LK-ERROR-MESSAGE
               MOVE 'N' TO WS-VALIDATION-STATUS
           END-IF
           IF WS-CODE-IBAN = SPACES
               MOVE 'Le code IBAN est obligatoire.' TO LK-ERROR-MESSAGE
               MOVE 'N' TO WS-VALIDATION-STATUS
           END-IF
           IF LENGTH OF WS-CODE-IBAN > 34
               MOVE 'Le code IBAN dépasse les 34 caractères.' 
               TO LK-ERROR-MESSAGE
               MOVE 'N' TO WS-VALIDATION-STATUS
           END-IF.
             IF WS-NBCHILDREN > 99
               MOVE 'Le nombre d''enfants dépasse la limite.'
                TO LK-ERROR-MESSAGE
               MOVE 'N' TO WS-VALIDATION-STATUS
           END-IF
           IF WS-COUPLE NOT = 'OUI' AND WS-COUPLE NOT = 'NON'
               MOVE 'Le statut de couple doit être "OUI" ou "NON".'
                TO LK-ERROR-MESSAGE
               MOVE 'N' TO WS-VALIDATION-STATUS
           END-IF.

      *    [MF] Message de validation de création de l'adhérent, et
      *    stockage de la date de création.

           IF WS-VALIDATION-STATUS = "Y"
           MOVE "Enregistrement réussi" TO LK-ERROR-MESSAGE
           MOVE FUNCTION CURRENT-DATE TO WS-CREATE-DATE 
           END-IF.

      *    [MF] Si toute les saisies de l'utilisateur sont bonnes alors
      *    on insère les données dans la table CUSTOMER

       INSERT-DATA-TO-DB.
OCESQL*    EXEC SQL
OCESQL*        INSERT INTO CUSTOMER (
OCESQL*    CUSTOMER_GENDER, CUSTOMER_LASTNAME, 
OCESQL*    CUSTOMER_FIRSTNAME, CUSTOMER_ADRESS1, 
OCESQL*    CUSTOMER_ADRESS2, CUSTOMER_ZIPCODE, CUSTOMER_TOWN, 
OCESQL*    CUSTOMER_COUNTRY, CUSTOMER_PHONE, CUSTOMER_MAIL, 
OCESQL*    CUSTOMER_BIRTH_DATE, CUSTOMER_DOCTOR, CUSTOMER_CODE_SECU,
OCESQL*    CUSTOMER_CODE_IBAN, CUSTOMER_NBCHILDREN, CUSTOMER_COUPLE,
OCESQL*    CUSTOMER_CREATE_DATE, CUSTOMER_UPDATE_DATE, 
OCESQL*    CUSTOMER_CLOSE_DATE )
OCESQL*    VALUES ( :WS-GENDER, :WS-LASTNAME, 
OCESQL*      :WS-FIRSTNAME, :WS-ADRESS1, :WS-ADRESS2, 
OCESQL*      :WS-ZIPCODE, :WS-TOWN, :WS-COUNTRY, 
OCESQL*      :WS-PHONE, :WS-MAIL, :WS-BIRTH-DATE, 
OCESQL*      :WS-DOCTOR, :WS-CODE-SECU, :WS-CODE-IBAN,
OCESQL*      :WS-NBCHILDREN, :WS-COUPLE, 
OCESQL*      :WS-CREATE-DATE, :WS-UPDATE-DATE, :WS-CLOSE-DATE )
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-GENDER
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 20
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-LASTNAME
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 20
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-FIRSTNAME
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 50
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-ADRESS1
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 50
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-ADRESS2
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 15
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-ZIPCODE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 50
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-TOWN
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 20
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-COUNTRY
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 20
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-PHONE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 50
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-MAIL
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-BIRTH-DATE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 50
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-DOCTOR
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 15
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-CODE-SECU
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 34
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-CODE-IBAN
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-NBCHILDREN
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 5
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-COUPLE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-CREATE-DATE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-UPDATE-DATE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-CLOSE-DATE
OCESQL     END-CALL
OCESQL     CALL "OCESQLExecParams" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE SQ0002
OCESQL          BY VALUE 19
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL.



