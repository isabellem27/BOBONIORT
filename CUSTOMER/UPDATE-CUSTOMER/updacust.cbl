       IDENTIFICATION DIVISION.
       PROGRAM-ID. updacust.
       AUTHOR.safaa.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01  WS-MENU-RETURN              PIC X(01).
       
       LINKAGE SECTION.

       01  LK-ADHERENT-INPUT.
           05  LK-UUID                 PIC X(36).
           05  LK-GENDER               PIC X(10).
           05  LK-LASTNAME             PIC X(20).
           05  LK-FIRSTNAME            PIC X(20).
           05  LK-ADRESS1              PIC X(50).
           05  LK-ADRESS2              PIC X(50).
           05  LK-ZIPCODE              PIC X(15).
           05  LK-TOWN                 PIC X(50).
           05  LK-COUNTRY              PIC X(20).
           05  LK-PHONE                PIC X(10).
           05  LK-MAIL                 PIC X(50).
           05  LK-BIRTH-DATE           PIC X(10).
           05  LK-DOCTOR               PIC X(50).
           05  LK-CODE-SECU            PIC X(15).
           05  LK-CODE-IBAN            PIC X(34).
           05  LK-NBCHILDREN          PIC 9(03).
           05  LK-COUPLE               PIC X(05).
           05  LK-CREATE-DATE          PIC X(10).
           05  LK-UPDATE-DATE          PIC X(10).
           05  LK-CLOSE-DATE           PIC X(10).
           05  LK-ACTIVE               PIC X(01) VALUE '0'.

       01  LK-ERROR-MESSAGE     PIC X(70). 
       01  LK-VALIDATION-STATUS PIC X VALUE "Y". 
       
       PROCEDURE DIVISION USING LK-ADHERENT-INPUT.
       0000-START-MAIN.

           CALL
               'ucfront'
               USING LK-ADHERENT-INPUT
           END-CALL.
          
      *     IF LK-MENU-RETURN EQUAL 'O'
      *         GO TO 0000-START-MAIN
      *     END-IF.
      
           CALL
               'ucback'
               USING LK-ADHERENT-INPUT,LK-ERROR-MESSAGE,
               LK-VALIDATION-STATUS

           END-CALL.
           
           GOBACK.
           