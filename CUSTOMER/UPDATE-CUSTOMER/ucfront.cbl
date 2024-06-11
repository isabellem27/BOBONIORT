      ******************************************************************
      *    [SK] Ce programme gère les interactions utilisateur pour  
      *        la saisie et la Modification des données client.
      *
      ****************************************************************** 
       
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ucfront.
       AUTHOR. Safaa.

      ******************************************************************

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-MENU-RETURN       PIC X.
       01  WS-SEARCH-VALIDATION PIC X.
       01  WS-ERROR-MESSAGE     PIC X(70).
       01  WS-MESSAGE           PIC X(31) 
           VALUE 'ERREUR DE SAISIE'.
           
      * [SK] Structure des données client
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
           05 CUD-TOWN	      PIC X(50).
           05 CUD-COUNTRY     PIC X(20).
           05 CUD-PHONE	      PIC X(10).
           05 CUD-MAIL	      PIC X(50).
           05 CUSTOMER-BIRTHDATE.
               10 CUB-DAYS    PIC X(2).
               10 FILLER      PIC X VALUE '-'.
               10 CUB-MONTH   PIC X(2).
               10 FILLER      PIC X VALUE '-'.
               10 CUB-YEAR    PIC X(4).
           05 CUD-DOCTOR      PIC X(50).
           05 CUD-CODE-IBAN   PIC X(34).
           05 CUD-NBCHILDREN  PIC 9(03).
           05 CUD-COUPLE      PIC X(05).
           05 CUD-CREATE-DATE PIC X(10).
           05 CUD-UPDATE-DATE PIC X(10).
           05 CUD-CLOSE-DATE  PIC X(10).
           05 CUD-ACTIVE      PIC X(01).

       SCREEN SECTION.
      * [SK]  Intégration de l'interface utilisateur à partir d'un 
      *    fichier externe
      
       COPY 'screen-frame-updt.cpy'.
      ******************************************************************
      *    [SK] déclaration des variables reçues à d'autres programmes

      ******************************************************************

      * LINKAGE SECTION.
      * 01  LK-REQUEST-CODE      PIC 9(01).

      * 01  LK-ADHERENT-INPUT.
      *     05  LK-UUID                 PIC X(36).
      *     05  LK-GENDER               PIC X(10).
      *     05  LK-LASTNAME             PIC X(50).
      *     05  LK-FIRSTNAME            PIC X(50).
      *     05  LK-ADRESS1              PIC X(50).
      *     05  LK-ADRESS2              PIC X(50).
      *     05  LK-ZIPCODE              PIC X(15).
      *     05  LK-TOWN                 PIC X(50).
      *     05  LK-COUNTRY              PIC X(20).
      *     05  LK-PHONE                PIC X(20).
      *     05  LK-MAIL                 PIC X(50).
      *     05  LK-BIRTH-DATE           PIC X(10).
      *     05  LK-DOCTOR               PIC X(50).
      *     05  LK-CODE-SECU            PIC X(15).
      *     05  LK-CODE-IBAN            PIC X(34).
      *     05  LK-NB-CHILDREN          PIC 9(03).
      *     05  LK-COUPLE               PIC X(05).
      *     05  LK-CREATE-DATE          PIC X(10).
      *     05  LK-UPDATE-DATE          PIC X(10).
      *     05  LK-CLOSE-DATE           PIC X(10).
      *     05  LK-ACTIVE               PIC X(01).
      
      * 01  LK-ERROR-MESSAGE            PIC X(45).

      * ----------------------------------------------------------------

       
       PROCEDURE DIVISION .
      *    USING 
       
       0000-START-MAIN.

           PERFORM 1100-ALIM-ZONE-NON-MODIF
           THRU 1100-FIN-ALIM-ZONE-NON-MODIF.
           PERFORM 1000-START-CONTROL-IMPUT 
           THRU 1000-END-CONTROL-IMPUT.
           
        
       END-0000-MAIN.
           STOP RUN.
      *    GOBACK.
      * ****************************************************************
      * [SK] Contrôle des saisies sur l'écran et interaction utilisateur
      ******************************************************************
       1000-START-CONTROL-IMPUT.
          
            ACCEPT SCREEN-FRAME.

       1000-END-CONTROL-IMPUT.
         
           EXIT.   

           
      * ****************************************************************
      * [SK] Alimentation des données initiales pour les tests
      ****************************************************************** 
       1100-ALIM-ZONE-NON-MODIF.

      *     MOVE LK-BIRTH-DATE  TO CUSTOMER-BIRTHDATE.
      *     MOVE LK-CODE-SECU   TO CUSTOMER-CODE-SECU.
      *    TEST
           MOVE '1987-01-01'      TO CUSTOMER-BIRTHDATE
                                     ZONE-BIRTHDATE.

           MOVE '123456789101234' TO CUSTOMER-CODE-SECU
                                     ZONE-CODE-SECU.

      *    [SK] FIN TEST : A ENLEVER UNE FOIS TEST BON. 
      *     MOVE LK-CREATE-DATE TO CUD-CREATE-DATE.
      *     MOVE LK-UPDATE-DATE TO CUD-UPDATE-DATE.

       1100-FIN-ALIM-ZONE-NON-MODIF.
           EXIT.
      ******************************************************************     
    
      