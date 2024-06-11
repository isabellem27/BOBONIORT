       IDENTIFICATION DIVISION.
       PROGRAM-ID. creacust.
       AUTHOR.       Martial.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-REQUEST-CODE             PIC 9(01).
       01  WS-MENU-RETURN              PIC X(01).
       01  WS-VALIDATION-STATUS        PIC X(01).
       01  WS-ADHERENT-INPUT.
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
           05 WS-BIRTHDATE.
               10 WS-DAYS              PIC X(02).
               10 WS-MONTH             PIC X(02).
               10 WS-YEAR              PIC X(04).
           05 WS-CUSTOMER-CODE-SECU.
               10 WS-SECU-1            PIC X.
               10 WS-SECU-2            PIC X(2).
               10 WS-SECU-3            PIC X(2).
               10 WS-SECU-4            PIC X(2).
               10 WS-SECU-5            PIC X(3).
               10 WS-SECU-6            PIC X(3).
               10 WS-SECU-7            PIC X(2).
           05  WS-DOCTOR               PIC X(50).
           05  WS-CODE-IBAN            PIC X(34).
           05  WS-NBCHILDREN           PIC 9(03).
           05  WS-COUPLE               PIC X(05).
           05  WS-CREATE-DATE          PIC X(10).
           05  WS-UPDATE-DATE          PIC X(10).
           05  WS-CLOSE-DATE           PIC X(10).
           05  LK-ACTIVE               PIC X(01) VALUE "0".
       01  WS-ERROR-MESSAGE            PIC X(100).
       
       PROCEDURE DIVISION.
       0000-START-MAIN.

           CALL
               'ccfront'
               USING WS-ADHERENT-INPUT, WS-MENU-RETURN,
                  WS-VALIDATION-STATUS, WS-ERROR-MESSAGE  
           END-CALL.
          
           IF WS-MENU-RETURN EQUAL 'O'
               GO TO 0000-START-MAIN
           END-IF.
      
           CALL
               'ccback'
               USING WS-ADHERENT-INPUT, WS-VALIDATION-STATUS 
           END-CALL.
           
           GOBACK.
