****************************************************************** 
       IDENTIFICATION DIVISION.
       PROGRAM-ID. readcont.
       AUTHOR. Martial.
      ******************************************************************
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      

       LINKAGE SECTION.
       01 LK-CUSTOMER.
           03 LK-CUS-UUID          PIC X(36).
           03 LK-CUS-GENDER        PIC X(10).
           03 LK-CUS-LASTNAME      PIC X(20).
           03 LK-CUS-FIRSTNAME     PIC X(20).
           03 LK-CUS-ADRESS1       PIC X(50).
           03 LK-CUS-ADRESS2       PIC X(50).
           03 LK-CUS-ZIPCODE       PIC X(15).
           03 LK-CUS-TOWN          PIC X(30).
           03 LK-CUS-COUNTRY       PIC X(20).
           03 LK-CUS-PHONE	       PIC X(10).
           03 LK-CUS-MAIL	       PIC X(50).
           03 LK-CUS-BIRTH-DATE    PIC X(10).           
           03 LK-CUS-DOCTOR	       PIC X(20).
           03 LK-CUS-CODE-SECU     PIC 9(15).
           03 LK-CUS-CODE-IBAN     PIC X(34).
           03 LK-CUS-NBCHILDREN    PIC 9(03).
           03 LK-CUS-COUPLE        PIC X(05).
           03 LK-CUS-CREATE-DATE   PIC X(10).
           03 LK-CUS-UPDATE-DATE   PIC X(10).
           03 LK-CUS-CLOSE-DATE    PIC X(10).
           03 LK-CUS-ACTIVE	       PIC X(01).  
      ******************************************************************
       SCREEN SECTION.
           COPY 'READ-SCREEN.cpy'.
      
      ******************************************************************
       PROCEDURE DIVISION USING LK-CUSTOMER. 
       