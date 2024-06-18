      ******************************************************************
      * [AL] Ce programme gère les interactions utilisateur pour  
      * la saisie et la modification des données client.
      ******************************************************************              
       IDENTIFICATION DIVISION.
       PROGRAM-ID. acback.
       AUTHOR. Alex.       
      ******************************************************************       

       DATA DIVISION.

       WORKING-STORAGE SECTION.

       01 WS-CUS-UUID        PIC X(36).
   
       EXEC SQL BEGIN DECLARE SECTION END-EXEC.

       01 DBNAME PIC X(11) VALUE 'boboniortdb'.
       01 USERNAME PIC X(05) VALUE 'cobol'.
       01 PASSWD PIC X(10) VALUE 'cbl85'.
       EXEC SQL END DECLARE SECTION END-EXEC.

       EXEC SQL INCLUDE SQLCA END-EXEC.      

       LINKAGE SECTION.
       01  LK-CUSTOMER.
           03 LK-CUS-UUID        PIC X(36).
           03 LK-CUS-GENDER      PIC X(10).
           03 LK-CUS-LASTNAME    PIC X(20).
           03 LK-CUS-FIRSTNAME   PIC X(20).
           03 LK-CUS-ADRESS1     PIC X(50).
           03 LK-CUS-ADRESS2     PIC X(50).
           03 LK-CUS-ZIPCODE     PIC X(15).
           03 LK-CUS-TOWN	     PIC X(30).
           03 LK-CUS-COUNTRY     PIC X(20).
           03 LK-CUS-PHONE	     PIC X(10).
           03 LK-CUS-MAIL	     PIC X(50).
           03 LK-CUS-BIRTH-DATE.
               05 LK-YEAR        PIC X(04).
               05 LK-SEPARATOR1  PIC X(01).
               05 LK-MONTH       PIC X(02).
               05 LK-SEPARATOR2  PIC X(01).
               05 LK-DAY         PIC X(02).
           03 LK-CUS-DOCTOR	     PIC X(20).
           03 LK-CUS-CODE-SECU   PIC 9(15).
            
           03 LK-CUS-CODE-IBAN   PIC X(34).
           03 LK-CUS-NBCHILDREN  PIC 9(03).
           03 LK-CUS-COUPLE      PIC X(05).
           03 LK-CUS-CREATE-DATE PIC X(10).
           03 LK-CUS-UPDATE-DATE PIC X(08).
           03 LK-CUS-CLOSE-DATE  PIC X(10).
           03 LK-CUS-ACTIVE	     PIC X(01). 
       01  LK-ERROR-MESSAGE      PIC X(70). 
       01  LK-CODE-SQL            PIC 9(3).

      ******************************************************************       
       PROCEDURE DIVISION USING LK-CUSTOMER , LK-ERROR-MESSAGE
           LK-CODE-SQL.

      * [AL] Connexion à la base de données avec les identifiants 

       0000-START-MAIN.

           EXEC SQL

               CONNECT :USERNAME IDENTIFIED BY :PASSWD USING :DBNAME

           END-EXEC.

           MOVE LK-CUS-UUID TO WS-CUS-UUID.
           PERFORM 3000-ARCHIVE-CUSTOMER
              THRU END-3000-ARCHIVE-CUSTOMER.

       END-0000-MAIN.
           EXEC SQL COMMIT WORK END-EXEC.

           EXEC SQL DISCONNECT ALL END-EXEC.

           GOBACK.
      ******************************************************************
      *    [AL] Archive l'adhérent en mettant à jour CUSTOMER_ACTIVE   *
      *     En utilisant l'UUID comme clé                              *
      ******************************************************************
       3000-ARCHIVE-CUSTOMER.

           EXEC SQL

            INSERT INTO CUSTOMER_ARCHIVE (
              UUID_CUSTOMER,
              ARCHIVE_GENDER,
              ARCHIVE_LASTNAME,
              ARCHIVE_FIRSTNAME,
              ARCHIVE_ADRESS1,
              ARCHIVE_ADRESS2,
              ARCHIVE_ZIPCODE,
              ARCHIVE_TOWN,
              ARCHIVE_COUNTRY,
              ARCHIVE_PHONE,
              ARCHIVE_MAIL,
              ARCHIVE_BIRTH_DATE,
              ARCHIVE_DOCTOR,
              ARCHIVE_CODE_SECU,
              ARCHIVE_CODE_IBAN,
              ARCHIVE_NBCHILDREN,
              ARCHIVE_COUPLE,
              ARCHIVE_CREATE_DATE,
              ARCHIVE_UPDATE_DATE,
              ARCHIVE_CLOSE_DATE,
              ARCHIVE_ACTIVE
            )
            SELECT 
              UUID_CUSTOMER,
              CUSTOMER_GENDER,
              CUSTOMER_LASTNAME,
              CUSTOMER_FIRSTNAME,
              CUSTOMER_ADRESS1,
              CUSTOMER_ADRESS2,
              CUSTOMER_ZIPCODE,
              CUSTOMER_TOWN,
              CUSTOMER_COUNTRY,
              CUSTOMER_PHONE,
              CUSTOMER_MAIL,
              CUSTOMER_BIRTH_DATE,
              CUSTOMER_DOCTOR,
              CUSTOMER_CODE_SECU,
              CUSTOMER_CODE_IBAN,
              CUSTOMER_NBCHILDREN,
              CUSTOMER_COUPLE,
              CUSTOMER_CREATE_DATE,
              CUSTOMER_UPDATE_DATE,
              CUSTOMER_CLOSE_DATE,
              CUSTOMER_ACTIVE
            FROM CUSTOMER
            WHERE UUID_CUSTOMER = :WS-CUS-UUID
            
                       END-EXEC.


      ******************************************************************
      *    [AL] Supprime l'adhérent en mettant à jour CUSTOMER         *
      *     En utilisant l'UUID comme clé                              *
      ****************************************************************** 

               EXEC SQL
                   DELETE FROM CUSTOMER
                   WHERE UUID_CUSTOMER = :WS-CUS-UUID

               END-EXEC.

      ******************************************************************
      *    [AL] Gere le messeage d'erreur en fonction du code SQL      *
      ****************************************************************** 

      *     MOVE SQLCODE TO LK-ERROR-MESSAGE.
      *       IF SQLCODE = 0
      *           MOVE 'L''adhérent a ete archivé avec succès.' 
      *           TO LK-ERROR-MESSAGE
      *       ELSE
      *           MOVE 'Erreur lors de l''archivage de l''adhérent.' 
      *           TO LK-ERROR-MESSAGE
      *      END-IF.

       END-3000-ARCHIVE-CUSTOMER.

           EXIT.
           