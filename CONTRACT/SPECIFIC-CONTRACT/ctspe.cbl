

       IDENTIFICATION DIVISION.
       PROGRAM-ID. ctspe.
       AUTHOR. Alexandre.

      ******************************************************************       
       
       ENVIRONMENT DIVISION.

      ******************************************************************

       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01  SC-BUTTON.
           05 SC-BUTTON-CONTRACT-SPE       PIC X.               
           05 SC-BUTTON-MENU               PIC X.
           05 SC-BUTTON-CHOICE-VALIDATION  PIC X.           
           05 SC-ERROR-MESSAGE             PIC X(45).                     
       
       01  SC-VALUE.
           05 SC-VALUE-MEDIC-1                 PIC X.
           05 SC-VALUE-MEDIC-2                 PIC X.
           05 SC-VALUE-MEDIC-3                 PIC X. 
           05 SC-VALUE-PARAMEDIC-1             PIC X.
           05 SC-VALUE-PARAMEDIC-2             PIC X.
           05 SC-VALUE-PARAMEDIC-3             PIC X. 
           05 SC-VALUE-HOSPITAL-1              PIC X.
           05 SC-VALUE-HOSPITAL-2              PIC X.
           05 SC-VALUE-HOSPITAL-3              PIC X. 
           05 SC-VALUE-SIMPLE-GLASSES-1        PIC X.
           05 SC-VALUE-SIMPLE-GLASSES-2        PIC X.
           05 SC-VALUE-SIMPLE-GLASSES-3        PIC X. 
           05 SC-VALUE-PROGRESSIVE-GLASSES-1   PIC X.
           05 SC-VALUE-PROGRESSIVE-GLASSES-2   PIC X.
           05 SC-VALUE-PROGRESSIVE-GLASSES-3   PIC X.
           05 SC-VALUE-MOLAR-CORWS-1           PIC X.
           05 SC-VALUE-MOLAR-CORWS-2           PIC X.
           05 SC-VALUE-MOLAR-CORWS-3           PIC X.    
           05 SC-VALUE-NON-MOLAR-CORWS-1       PIC X.
           05 SC-VALUE-NON-MOLAR-CORWS-2       PIC X.
           05 SC-VALUE-NON-MOLAR-CORWS-3       PIC X.  
           05 SC-VALUE-DESCALINGS-1            PIC X.
           05 SC-VALUE-DESCALINGS-2            PIC X.
           05 SC-VALUE-DESCALINGS-3            PIC X.                           


       01  SC-CONTRACT-SPE-CALCUL              PIC X(03).                       

       SCREEN SECTION.
           COPY 'screen-connexion-contrat-specifique.cpy'.   

      ******************************************************************

       PROCEDURE DIVISION.
       
       0000-START-MAIN.

           ACCEPT SCREEN-CONTRAT-SPECIFIQUE.

       END-0000-MAIN.
           GOBACK.
      ******************************************************************       
       
