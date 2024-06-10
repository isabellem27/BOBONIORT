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
       01  WS-MENU-RETURN       PIC X.
       01  WS-SEARCH-VALIDATION PIC X.
       01  WS-ERROR-MESSAGE     PIC X(70).

       01  CUSTOMER-DATA.
           05 CUSTOMER-CODE-SECU.
               10 CCS-SECU-1  PIC X.
               10 CCS-SECU-2  PIC X(2).
               10 CCS-SECU-3  PIC X(2).
               10 CCS-SECU-4  PIC X(2).
               10 CCS-SECU-5  PIC X(3).
               10 CCS-SECU-6  PIC X(3).
               10 CCS-SECU-7  PIC X(2).
           05 CUD-GENDER      PIC X(10).
           05 CUD-LASTNAME    PIC X(20).
           05 CUD-FIRSTNAME   PIC X(20).
           05 CUD-ADRESS1     PIC X(50).
           05 CUD-ADRESS2     PIC X(50).
           05 CUD-ZIPCODE     PIC X(15).
           05 CUD-TOWN	  PIC X(50).
           05 CUD-COUNTRY     PIC X(20).
           05 CUD-PHONE	  PIC X(10).
           05 CUD-MAIL	  PIC X(50).
           05 CUSTOMER-BIRTHDATE.
               10 CUB-DAYS    PIC X(2).
               10 FILLER      PIC X VALUE '-'.
               10 CUB-MONTH   PIC X(2).
               10 FILLER      PIC X VALUE '-'.
               10 CUB-YEAR    PIC X(4).
           05 CUD-DOCTOR      PIC X(50).
           05 CUD-CODE-SECU   PIC 9(10).
           05 CUD-CODE-IBAN   PIC X(34).
           05 CUD-NBCHILDREN  PIC 9(03).
           05 CUD-COUPLE      PIC X(05).
           05 CUD-CREATE-DATE PIC X(10).
           05 CUD-UPDATE-DATE PIC X(10).
           05 CUD-CLOSE-DATE  PIC X(10).
           05 CUD-ACTIVE      PIC X(01).

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
             05 LK-BIRTHDATE.
               10 LK-DAYS   PIC X(02).
               10 FILLER        PIC X(01) VALUE '-'.
               10 LK-MONTH  PIC X(02).
               10 FILLER        PIC X(01) VALUE '-'.
               10 LK-YEAR   PIC X(04).
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
       01  LK-MENU-RETURN       PIC X(01).
       01  LK-SEARCH-VALIDATION PIC X(01).
       01  LK-ERROR-MESSAGE     PIC X(70). 
       01  LK-CODE-REQUEST-SQL        PIC 9(01).

       SCREEN SECTION.
       COPY 'screen-frame.cpy'.

      ******************************************************************

       PROCEDURE DIVISION.
           ACCEPT SCREEN-FRAME.
           GOBACK.
       