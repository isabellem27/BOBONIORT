       IDENTIFICATION DIVISION.
       PROGRAM-ID. ctbase.
       AUTHOR. Alexandre.

      ******************************************************************       
       
       ENVIRONMENT DIVISION.

      ******************************************************************

       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01  SC-BUTTON.
           05 SC-BUTTON-ALLEGE            PIC X.
           05 SC-BUTTON-MODERE            PIC X.
           05 SC-BUTTON-EXCELLENCE        PIC X.  
           05 SC-BUTTON-CONTRACT-SPE      PIC X.
           05 SC-BUTTON-VALIDATE          PIC X.                          
           05 SC-BUTTON-MENU              PIC X.
           05 LK-ERROR-MESSAGE            PIC X(45).                     
       

       SCREEN SECTION.
           COPY 'screen-connexion-contrat-classique.cpy'.   

      ******************************************************************

       PROCEDURE DIVISION.
       
       0000-START-MAIN.

           ACCEPT SCREEN-CONTRAT-BASE.

       END-0000-MAIN.
           GOBACK.
      ******************************************************************       
       