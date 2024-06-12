
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
      
       01  WS-ADHERENT.
           05  WS-GENDER               PIC X(10).
           05  WS-LASTNAME             PIC X(20).
           05  WS-FIRSTNAME            PIC X(20).
           05  WS-ADRESS1              PIC X(50).
           05  WS-ADRESS2              PIC X(50).
           05  WS-ZIPCODE              PIC X(15).
           05  WS-TOWN                 PIC X(50).
           05  WS-COUNTRY              PIC X(20).
           05  WS-PHONE                PIC X(20).
           05  WS-MAIL                 PIC X(50).
           05 WS-BIRTH-DATE            PIC X(8).
           05 WS-CODE-SECU             PIC X(15).
           05  WS-DOCTOR               PIC X(50).
           05  WS-CODE-IBAN            PIC X(34).
           05  WS-NBCHILDREN           PIC X(02).
           05  WS-COUPLE               PIC X(05).
           05  WS-CREATE-DATE          PIC X(10).
           05  WS-UPDATE-DATE          PIC X(10).
           05  WS-CLOSE-DATE           PIC X(10).
           05  WS-ACTIVE               PIC X(01) VALUE "0".

       EXEC SQL BEGIN DECLARE SECTION END-EXEC.
       01  DBNAME   PIC  X(11) VALUE 'boboniortdb'.
       01  USERNAME PIC  X(05) VALUE 'cobol'.
       01  PASSWD   PIC  X(10) VALUE 'cbl85'.
       EXEC SQL END DECLARE SECTION END-EXEC.
       EXEC SQL INCLUDE SQLCA END-EXEC.

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
           05 LK-BIRTHDATE             PIC X(8).
           05 LK-CUSTOMER-CODE-SECU    PIC X(15).
           05  LK-DOCTOR               PIC X(50).
           05  LK-CODE-IBAN            PIC X(34).
           05  LK-NBCHILDREN           PIC X(02).
           05  LK-COUPLE               PIC X(05).
           05  LK-CREATE-DATE          PIC X(10).
           05  LK-UPDATE-DATE          PIC X(10).
           05  LK-CLOSE-DATE           PIC X(10).
           05  LK-ACTIVE               PIC X(01) VALUE "0".
     
       01  LK-VALIDATION-STATUS        PIC X(01).
       

       
       

    

       SCREEN SECTION.

      ******************************************************************

       PROCEDURE DIVISION USING LK-ADHERENT-INPUT,
       LK-VALIDATION-STATUS  .
       0000-START-MAIN.
           
           
           EXEC SQL
               CONNECT :USERNAME IDENTIFIED BY :PASSWD USING :DBNAME 
           END-EXEC.
           
           
      *    [MF] Déplacement des données du linkage vers la
      *    working-storage

           MOVE LK-ADHERENT-INPUT TO WS-ADHERENT.

           IF WS-COUPLE = "OUI"
               MOVE "TRUE" TO WS-COUPLE
           ELSE
               MOVE "FALSE" TO WS-COUPLE
           END-IF.
         

           IF LK-VALIDATION-STATUS = 'Y'
          
               PERFORM INSERT-DATA-TO-DB  
               
           END-IF.

           EXEC SQL COMMIT WORK END-EXEC.
           EXEC SQL DISCONNECT ALL END-EXEC.
           GOBACK.



      *    [MF] Si toute les saisies de l'utilisateur sont bonnes alors
      *    on insère les données dans la table CUSTOMER

       INSERT-DATA-TO-DB.
            EXEC SQL
               INSERT INTO CUSTOMER (
           CUSTOMER_GENDER, CUSTOMER_LASTNAME, 
           CUSTOMER_FIRSTNAME, CUSTOMER_ADRESS1, 
           CUSTOMER_ADRESS2, CUSTOMER_ZIPCODE, CUSTOMER_TOWN, 
           CUSTOMER_COUNTRY, CUSTOMER_PHONE, CUSTOMER_MAIL, 
            CUSTOMER_DOCTOR, CUSTOMER_CODE_SECU,
           CUSTOMER_CODE_IBAN, CUSTOMER_NBCHILDREN, CUSTOMER_COUPLE,
            CUSTOMER_CREATE_DATE, CUSTOMER_UPDATE_DATE 
            
           )
           VALUES ( :WS-GENDER, :WS-LASTNAME, 
             :WS-FIRSTNAME, :WS-ADRESS1, :WS-ADRESS2, 
             :WS-ZIPCODE, :WS-TOWN, :WS-COUNTRY, 
             :WS-PHONE, :WS-MAIL, 
             :WS-DOCTOR, :WS-CODE-SECU, :WS-CODE-IBAN,
             :WS-NBCHILDREN, :WS-COUPLE, :WS-CREATE-DATE,
             :WS-UPDATE-DATE
              )
           END-EXEC.

           EXIT.