      ******************************************************************
      *    [SK-AL] Le programme affiche la SCREEN SECTION pour la      *
      *    archifage d'un adhérent                                     *
      ****************************************************************** 
       IDENTIFICATION DIVISION.
       PROGRAM-ID. acfront RECURSIVE.
       AUTHOR.  safaa&Alex.
      ******************************************************************
       DATA DIVISION.

       WORKING-STORAGE SECTION.

      * [SK-AL] Variables de travail pour accepter les entrées 
      * utilisateur et gérer l'archivage.

       01  WS-CUS-NAME           PIC X(41).  
       01  WS-ACCEPT             PIC X(01).
       01  WS-CUS-UUID           PIC X(36).
       01  WS-SELECT-OPTION      PIC X(05). 

       01  LK-RETURN-CHOICE      PIC X(01)   VALUE SPACE.
       01  WS-ERROR-MESSAGE      PIC X(35).

      * [SK-AL] Messages affichés à l'utilisateur pour confirmation 
      * et succès de l'archivage./

       01  WS-ARCHIVE-MESSAGE      PIC X(35)
           VALUE 'Veuillez entrer "O" pour confirmer.'.
       01  WS-ARCHIVE-SUCCES      PIC X(18)
           VALUE 'Archivage reussi.' .


OCESQL*EXEC SQL BEGIN DECLARE SECTION END-EXEC.

      * [SK-AL] Informations de connexion à la base de données.

       01  DBNAME   PIC  X(11) VALUE 'boboniortdb'.
       01  USERNAME PIC  X(05) VALUE 'cobol'.
       01  PASSWD   PIC  X(10) VALUE 'cbl85'.
OCESQL*EXEC SQL END DECLARE SECTION END-EXEC.
OCESQL*EXEC SQL INCLUDE SQLCA END-EXEC.   
OCESQL     copy "sqlca.cbl".
           
OCESQL*
OCESQL 01  SQ0001.
OCESQL     02  FILLER PIC X(256) VALUE "INSERT INTO CUSTOMER_ARCHIVE ("
OCESQL  &  " ARCHIVE_GENDER, ARCHIVE_LASTNAME, ARCHIVE_FIRSTNAME, ARCH"
OCESQL  &  "IVE_ADRESS1, ARCHIVE_ADRESS2, ARCHIVE_ZIPCODE, ARCHIVE_TOW"
OCESQL  &  "N, ARCHIVE_COUNTRY, ARCHIVE_PHONE, ARCHIVE_MAIL, ARCHIVE_B"
OCESQL  &  "IRTH_DATE, ARCHIVE_DOCTOR, ARCHIVE_CODE_SECU, ARCHIV".
OCESQL     02  FILLER PIC X(256) VALUE "E_CODE_IBAN, ARCHIVE_NBCHILDRE"
OCESQL  &  "N, ARCHIVE_COUPLE, ARCHIVE_CREATE_DATE, ARCHIVE_UPDATE_DAT"
OCESQL  &  "E, ARCHIVE_CLOSE_DATE, ARCHIVE_ACTIVE ) SELECT CUSTOMER_GE"
OCESQL  &  "NDER, CUSTOMER_LASTNAME, CUSTOMER_FIRSTNAME, CUSTOMER_ADRE"
OCESQL  &  "SS1, CUSTOMER_ADRESS2, CUSTOMER_ZIPCODE, CUSTOMER_TO".
OCESQL     02  FILLER PIC X(256) VALUE "WN, CUSTOMER_COUNTRY, CUSTOMER"
OCESQL  &  "_PHONE, CUSTOMER_MAIL, CUSTOMER_BIRTH_DATE, CUSTOMER_DOCTO"
OCESQL  &  "R, CUSTOMER_CODE_SECU, CUSTOMER_CODE_IBAN, CUSTOMER_NBCHIL"
OCESQL  &  "DREN, CUSTOMER_COUPLE, CUSTOMER_CREATE_DATE, CUSTOMER_UPDA"
OCESQL  &  "TE_DATE, CUSTOMER_CLOSE_DATE, CUSTOMER_ACTIVE FROM C".
OCESQL     02  FILLER PIC X(032) VALUE "USTOMER WHERE UUID_CUSTOMER = "
OCESQL  &  "$1".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
OCESQL 01  SQ0002.
OCESQL     02  FILLER PIC X(045) VALUE "DELETE FROM CUSTOMER WHERE UUI"
OCESQL  &  "D_CUSTOMER = $1".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
OCESQL 01  SQ0003.
OCESQL     02  FILLER PIC X(014) VALUE "DISCONNECT ALL".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
       LINKAGE SECTION.

      * [SK-AL] Structure de données pour les informations client.

       01  LK-CUSTOMER.
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
           03 LK-CUS-CODE-IBAN   PIC X(34).
           03 LK-CUS-NBCHILDREN  PIC 9(03).
           03 LK-CUS-COUPLE      PIC X(05).
           03 LK-CUS-CREATE-DATE PIC X(10).
           03 LK-CUS-UPDATE-DATE PIC X(10).
           03 LK-CUS-CLOSE-DATE  PIC X(10).
           03 LK-CUS-ACTIVE	     PIC X(01).

      ******************************************************************
       SCREEN SECTION.

      * [SK-AL] Inclusion de la section d'écran pour l'archivage du client.

           COPY 'screen-archive-customer.cpy'.

      ******************************************************************
       PROCEDURE DIVISION USING LK-CUSTOMER.

       0000-START-MAIN.          
           PERFORM 1000-SCREEN-LOOP-START THRU END-1000-SCREEN-LOOP.
       END-0000-MAIN.
           GOBACK. 
      ******************************************************************     
      * [SK-AL] Boucle principale pour afficher l'écran jusqu'à ce qu'une 
      * option valide soit sélectionnée.
      ****************************************************************** 
       1000-SCREEN-LOOP-START. 
           INITIALIZE WS-ACCEPT
                      LK-RETURN-CHOICE .
           MOVE 'FALSE' TO WS-SELECT-OPTION.

      * [SK-AL] Initialisation de la variable d'option de sélection.

           STRING 
               FUNCTION TRIM(LK-CUS-FIRSTNAME) SPACE 
               FUNCTION TRIM(LK-CUS-LASTNAME)
               DELIMITED BY SIZE
               INTO WS-CUS-NAME
           END-STRING.

           PERFORM UNTIL WS-SELECT-OPTION EQUAL 'TRUE' 
               ACCEPT SCREEN-ARCHIVE-CUSTOMER

               PERFORM 3000-WITCH-CHOICE-START
                  THRU END-3000-WITCH-CHOICE
           END-PERFORM.          
       END-1000-SCREEN-LOOP. 
           EXIT.   

      ******************************************************************     
      * [SK-AL] Vérification de l'option choisie par l'utilisateur.
      ******************************************************************      
       3000-WITCH-CHOICE-START.
           IF FUNCTION UPPER-CASE(WS-ACCEPT) EQUAL 'O' THEN

               PERFORM 3210-SQL-START
                  THRU END-3210-SQL
           
           ELSE IF FUNCTION UPPER-CASE(LK-RETURN-CHOICE) EQUAL 'O' THEN
               MOVE 'TRUE' TO WS-SELECT-OPTION 
               CALL 'manacust' USING LK-CUS-UUID

           ELSE  
               MOVE WS-ARCHIVE-MESSAGE TO WS-ERROR-MESSAGE
       
           END-IF.
       END-3000-WITCH-CHOICE.
           EXIT. 

      ******************************************************************    
      *  [SK-AL]Insertion des informations du client dans la table 
      *  d'archivage et Suppression des informations du client 
      *  de la table principale.
      ******************************************************************
       3210-SQL-START.
OCESQL* EXEC SQL
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

           MOVE LK-CUS-UUID TO WS-CUS-UUID.

OCESQL*    EXEC SQL
OCESQL*        INSERT INTO CUSTOMER_ARCHIVE (
OCESQL*          ARCHIVE_GENDER,
OCESQL*          ARCHIVE_LASTNAME,
OCESQL*          ARCHIVE_FIRSTNAME,
OCESQL*          ARCHIVE_ADRESS1,
OCESQL*          ARCHIVE_ADRESS2,
OCESQL*          ARCHIVE_ZIPCODE,
OCESQL*          ARCHIVE_TOWN,
OCESQL*          ARCHIVE_COUNTRY,
OCESQL*          ARCHIVE_PHONE,
OCESQL*          ARCHIVE_MAIL,
OCESQL*          ARCHIVE_BIRTH_DATE,
OCESQL*          ARCHIVE_DOCTOR,
OCESQL*          ARCHIVE_CODE_SECU,
OCESQL*          ARCHIVE_CODE_IBAN,
OCESQL*          ARCHIVE_NBCHILDREN,
OCESQL*          ARCHIVE_COUPLE,
OCESQL*          ARCHIVE_CREATE_DATE,
OCESQL*          ARCHIVE_UPDATE_DATE,
OCESQL*          ARCHIVE_CLOSE_DATE,
OCESQL*          ARCHIVE_ACTIVE
OCESQL*        )
OCESQL*        SELECT 
OCESQL*          CUSTOMER_GENDER,
OCESQL*          CUSTOMER_LASTNAME,
OCESQL*          CUSTOMER_FIRSTNAME,
OCESQL*          CUSTOMER_ADRESS1,
OCESQL*          CUSTOMER_ADRESS2,
OCESQL*          CUSTOMER_ZIPCODE,
OCESQL*          CUSTOMER_TOWN,
OCESQL*          CUSTOMER_COUNTRY,
OCESQL*          CUSTOMER_PHONE,
OCESQL*          CUSTOMER_MAIL,
OCESQL*          CUSTOMER_BIRTH_DATE,
OCESQL*          CUSTOMER_DOCTOR,
OCESQL*          CUSTOMER_CODE_SECU,
OCESQL*          CUSTOMER_CODE_IBAN,
OCESQL*          CUSTOMER_NBCHILDREN,
OCESQL*          CUSTOMER_COUPLE,
OCESQL*          CUSTOMER_CREATE_DATE,
OCESQL*          CUSTOMER_UPDATE_DATE,
OCESQL*          CUSTOMER_CLOSE_DATE,
OCESQL*          CUSTOMER_ACTIVE
OCESQL*        FROM CUSTOMER
OCESQL*        WHERE UUID_CUSTOMER = :WS-CUS-UUID
OCESQL*        END-EXEC.
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 36
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-CUS-UUID
OCESQL     END-CALL
OCESQL     CALL "OCESQLExecParams" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE SQ0001
OCESQL          BY VALUE 1
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL.

OCESQL*    EXEC SQL
OCESQL*        DELETE FROM CUSTOMER
OCESQL*        WHERE UUID_CUSTOMER = :WS-CUS-UUID
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 36
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-CUS-UUID
OCESQL     END-CALL
OCESQL     CALL "OCESQLExecParams" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE SQ0002
OCESQL          BY VALUE 1
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL.

      ******************************************************************
      * [SK-AL] Affichage du message de succès.
           INITIALIZE WS-ERROR-MESSAGE.
           INITIALIZE WS-ARCHIVE-MESSAGE.
           INITIALIZE WS-ACCEPT.

           MOVE WS-ARCHIVE-SUCCES TO WS-ERROR-MESSAGE.
      * [SK-AL] Validation des transactions et déconnexion 
      *     de la base de données.

           INITIALIZE WS-ACCEPT
                      LK-RETURN-CHOICE .

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
       END-3210-SQL.
           EXIT.
           
       
       
       
