       IDENTIFICATION DIVISION.
       PROGRAM-ID. creacust.
       AUTHOR.       Martial.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-REQUEST-CODE      PIC 9(01).
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
       01  WS-ERROR-MESSAGE            PIC X(100).
       
       PROCEDURE DIVISION.
       0000-START-MAIN.

           CALL
               'ccfront'
               USING WS-ADHERENT
           END-CALL.

           CALL
               'ccback'
               USING WS-ADHERENT
           END-CALL.
           
           GOBACK.