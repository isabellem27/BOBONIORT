      ****************************************************************** 
      *
      ****************************************************************** 
       IDENTIFICATION DIVISION.
       PROGRAM-ID. rptbill.
       AUTHOR. Martial&Remi.

      ******************************************************************

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT F-OUTPUT ASSIGN TO WS-INVOICE-PATH
           ORGANIZATION IS LINE SEQUENTIAL 
           ACCESS MODE IS SEQUENTIAL.
           
      ******************************************************************

       DATA DIVISION.
       FILE SECTION.
       FD  F-OUTPUT
           RECORD CONTAINS 80 CHARACTERS
           RECORDING MODE IS F.
       01  R-OUTPUT PIC X(80).

       WORKING-STORAGE SECTION.
       01  WS-INVOICE-PATH.
           03 WS-INVOICE-FOLDER PIC X(20) VALUE './INVOICE-GENERATED/'.
           03 WS-INVOICE-FILE   PIC X(07) VALUE 'Facture'.
           03 WS-INVOICE-FORMAT PIC X(04) VALUE '.dat'.

       01  WS-INVOICE-DATE-START       PIC 9(08).
       01  WS-INVOICE-DATE-START-DAY   PIC X(02).
       01  WS-INVOICE-DATE-START-MONTH PIC X(02).
       01  WS-INVOICE-DATE-START-YEAR  PIC X(04).

       01  WS-REPORT.
           03 WS-R-SPACES-ALL        PIC X(80) VALUE SPACES.
           03 WS-R-SPACES-25         PIC X(25) VALUE ALL SPACES.
           03 WS-R-SPACES-30         PIC X(30) VALUE ALL SPACES.
           03 WS-R-DASH              PIC X(80) VALUE ALL '-'.
           03 WS-R-INVOICE-TITLE PIC X(26) 
           VALUE 'FACTURE MUTUELLE BOBONIORT'.
           03 WS-R-INSURANCE-NAME PIC X(18) 
           VALUE 'MUTUELLE BOBONIORT'.
           03 WS-R-INSURANCE-ADRESS-1 PIC X(16) 
           VALUE '12 rue des Bobos'.
           03 WS-R-INSURANCE-ADRESS-2 PIC X(22) 
           VALUE '75007 Boboland, France'.
           03 WS-R-INVOICE-NUM PIC X(21)
           VALUE 'Numéro de facture  :'.
           03 WS-R-INVOICE-DATE PIC X(20)
           VALUE 'Date de la facture :'.
           03 WS-R-CUS-INFO PIC X(29)
           VALUE 'Vos informations personnelles'.
           03 WS-R-CUS-NAME PIC X(28) 
           VALUE 'Nom complet                :'.
           03 WS-R-CUS-BIRTH-DATE PIC X(28) 
           VALUE 'Date de naissance          :'.
           03 WS-R-CUS-ADRESS PIC X(28) 
           VALUE 'Adresse                    :'.
           03 WS-R-CUS-CODE-SECU PIC X(31) 
           VALUE 'Numéro de sécurité sociale :'.
           03 WS-R-CUS-IBAN PIC X(28) 
           VALUE 'IBAN                       :'.
           03 WS-R-CUS-DETAILS-TITLE PIC X(24) 
           VALUE 'Détail des prestations'.
           03 WS-R-INFO-PAYMENT PIC X(24) 
           VALUE 'Informations de paiement'.
           03 WS-R-INFO-PAYMENT-MESSAGE PIC X(41) 
           VALUE 'Veuillez effectuer le paiement avant le :'.
           03 WS-R-INFO-PAYMENT-MESSAGE-MODE PIC X(29) 
           VALUE 'Modes de paiement acceptés :'.
           03 WS-R-INFO-PAYMENT-MODE-1 PIC X(19) 
           VALUE '- Virement bancaire'.
           03 WS-R-INFO-PAYMENT-MODE-2 PIC X(09) 
           VALUE '- Chèque'.
           03 WS-R-INFO-PAYMENT-MODE-3 PIC X(18) 
           VALUE '- Carte de crédit'.
           03 WS-R-MESSAGE-THANK PIC X(25) 
           VALUE 'Merci de votre confiance.'.
           03 WS-R-CONTACT-US PIC X(14)
           VALUE 'Nous contacter'. 
           03 WS-R-INSURANCE-MESSAGE-CONTACT-1 PIC X(45) 
           VALUE 'En cas de questions, veuillez contacter notre'.
           03 WS-R-INSURANCE-MESSAGE-CONTACT-2 PIC X(16)  
           VALUE 'service client :'.
           03 WS-R-INSURANCE-PHONE PIC X(31) 
           VALUE 'Téléphone : +33 1 23 45 67 89'.
           03 WS-R-INSURANCE-MAIL PIC X(32) 
           VALUE 'Email     : contact@boboniort.fr'.
           03 WS-R-INSURANCE-SLOGAN PIC X(30)                           
           VALUE 'Votre santé, notre priorité.'.
           03 WS-R-INSURANCE-URL PIC X(16) 
           VALUE 'www.boboniort.fr'.

             
OCESQL*EXEC SQL BEGIN DECLARE SECTION END-EXEC.
       01  DBNAME   PIC  X(11) VALUE 'boboniortb'.
       01  USERNAME PIC  X(05) VALUE 'cobol'.
       01  PASSWD   PIC  X(10) VALUE 'cbl85'.
OCESQL*EXEC SQL END DECLARE SECTION END-EXEC.
OCESQL*EXEC SQL INCLUDE SQLCA END-EXEC. 
OCESQL     copy "sqlca.cbl".

      * LINKAGE SECTION.
       01 LK-CUSTOMER.
           03 LK-CUS-UUID        PIC X(36).
           03 LK-CUS-GENDER      PIC X(10).
           03 LK-CUS-LASTNAME    PIC X(20) VALUE 'Dupont'.
           03 LK-CUS-FIRSTNAME   PIC X(20) VALUE 'Jean'.
           03 LK-CUS-ADRESS1	 PIC X(50) VALUE '1 rue du colol'.
           03 LK-CUS-ADRESS2	 PIC X(50).
           03 LK-CUS-ZIPCODE	 PIC X(15) VALUE '59000'.
           03 LK-CUS-TOWN	     PIC X(50) VALUE 'Lille'.
           03 LK-CUS-COUNTRY	 PIC X(20) VALUE 'France'.
           03 LK-CUS-PHONE	     PIC X(10).
           03 LK-CUS-MAIL	     PIC X(50).
           03 LK-CUS-BIRTH-DATE.
               05 LK-YEAR        PIC X(04) VALUE '1975'.
               05 LK-SEPARATOR1  PIC X(01).
               05 LK-MONTH       PIC X(02) VALUE '03'.
               05 LK-SEPARATOR2  PIC X(01).
               05 LK-DAY         PIC X(02) VALUE '01'.
           03 LK-CUS-DOCTOR	     PIC X(50).
           03 LK-CUS-CODE-SECU.
               05 LK-SECU-1      PIC X(01) VALUE '1'.
               05 LK-SECU-2      PIC X(02) VALUE '59'.
               05 LK-SECU-3      PIC X(02) VALUE '04'.
               05 LK-SECU-4      PIC X(02) VALUE '82'.
               05 LK-SECU-5      PIC X(03) VALUE '976'.
               05 LK-SECU-6      PIC X(03) VALUE '354'.
               05 LK-SECU-7      PIC X(02) VALUE '21'.
           03 LK-CUS-CODE-IBAN   PIC X(34) 
               VALUE 'FR7630006000011234567890189'.
           03 LK-CUS-NBCHILDREN  PIC 9(03).
           03 LK-CUS-COUPLE      PIC X(05).
           03 LK-CUS-CREATE-DATE PIC X(10).
           03 LK-CUS-UPDATE-DATE PIC X(10).
           03 LK-CUS-CLOSE-DATE  PIC X(10).
           03 LK-CUS-ACTIVE	     PIC X(01).

      ******************************************************************

OCESQL*
OCESQL 01  SQ0001.
OCESQL     02  FILLER PIC X(014) VALUE "DISCONNECT ALL".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
       PROCEDURE DIVISION.
       0000-START-MAIN.
OCESQL*    EXEC SQL
OCESQL*        CONNECT :USERNAME IDENTIFIED BY :PASSWD USING :DBNAME 
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLConnect" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE USERNAME
OCESQL          BY VALUE 5
OCESQL          BY REFERENCE PASSWD
OCESQL          BY VALUE 10
OCESQL          BY REFERENCE DBNAME
OCESQL          BY VALUE 11
OCESQL     END-CALL.

           PERFORM 1000-START-INITIALIZATION
              THRU END-1000-INITIALIZATION.
       
           PERFORM 1000-START-WRITE 
              THRU END-1000-WRITE.
       END-0000-MAIN.  
OCESQL*    EXEC SQL COMMIT WORK END-EXEC.
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLExec" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "COMMIT" & x"00"
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL.
OCESQL*    EXEC SQL DISCONNECT ALL END-EXEC.
OCESQL     CALL "OCESQLDisconnect" USING
OCESQL          BY REFERENCE SQLCA
OCESQL     END-CALL.
           GOBACK.

      ******************************************************************
      ****************************************************************** 
       1000-START-INITIALIZATION.
           ACCEPT WS-INVOICE-DATE-START FROM DATE YYYYMMDD.

           MOVE WS-INVOICE-DATE-START(1:4) 
           TO WS-INVOICE-DATE-START-YEAR.
           MOVE WS-INVOICE-DATE-START(5:2) 
           TO WS-INVOICE-DATE-START-MONTH.
           MOVE WS-INVOICE-DATE-START(7:2) 
           TO WS-INVOICE-DATE-START-DAY.
       END-1000-INITIALIZATION.
           EXIT.    
          
      ******************************************************************
      ******************************************************************    
       1000-START-WRITE.
           OPEN OUTPUT F-OUTPUT.

           WRITE R-OUTPUT FROM WS-R-DASH.

      *    [RD] Titre facture 
           INITIALIZE R-OUTPUT.
           STRING 
               WS-R-SPACES-25 SPACE SPACE WS-R-INVOICE-TITLE
               DELIMITED BY SIZE
               INTO R-OUTPUT
           END-STRING.
           WRITE R-OUTPUT.

           WRITE R-OUTPUT FROM WS-R-DASH. 

      *    [RD] BOBONIORT NAME 
           INITIALIZE R-OUTPUT.
           WRITE R-OUTPUT FROM WS-R-INSURANCE-NAME.

      *    [RD] BOBONIORT rue 
           INITIALIZE R-OUTPUT.
           WRITE R-OUTPUT FROM WS-R-INSURANCE-ADRESS-1. 

      *    [RD] BOBONIORT Code postal, Ville, Pays 
           INITIALIZE R-OUTPUT.
           WRITE R-OUTPUT FROM WS-R-INSURANCE-ADRESS-2.  

           WRITE R-OUTPUT FROM WS-R-DASH.
           WRITE R-OUTPUT FROM WS-R-SPACES-ALL.

      *    [RD] Numéro de facture 
           INITIALIZE R-OUTPUT.
           STRING 
               WS-R-INVOICE-NUM
               DELIMITED BY SIZE
               INTO R-OUTPUT
           END-STRING.
           WRITE R-OUTPUT.

      *    [RD] Date de la facture 
           INITIALIZE R-OUTPUT.
           STRING 
               WS-R-INVOICE-DATE SPACE 
               WS-INVOICE-DATE-START-DAY '/'
               WS-INVOICE-DATE-START-MONTH '/'
               WS-INVOICE-DATE-START-YEAR
               DELIMITED BY SIZE
               INTO R-OUTPUT
           END-STRING.
           WRITE R-OUTPUT.

           WRITE R-OUTPUT FROM WS-R-SPACES-ALL.
           WRITE R-OUTPUT FROM WS-R-DASH.

      *    [RD] Vos informations personnelles     
           WRITE R-OUTPUT FROM WS-R-CUS-INFO.
           WRITE R-OUTPUT FROM WS-R-DASH.

      *    [RD] Nom complet de l'adhérent 
           INITIALIZE R-OUTPUT.
           STRING 
               WS-R-CUS-NAME SPACE FUNCTION TRIM(LK-CUS-FIRSTNAME)
               SPACE FUNCTION TRIM(LK-CUS-LASTNAME)
               DELIMITED BY SIZE
               INTO R-OUTPUT
           END-STRING.
           WRITE R-OUTPUT.

      *    [RD] Date de naissance de l'adhérent 
           INITIALIZE R-OUTPUT.
           STRING 
               WS-R-CUS-BIRTH-DATE SPACE 
               LK-DAY '/' LK-MONTH '/' LK-YEAR
               DELIMITED BY SIZE
               INTO R-OUTPUT
           END-STRING.
           WRITE R-OUTPUT. 

      *    [RD] Adresse complète de l'adhérent 
           INITIALIZE R-OUTPUT.
           STRING 
               WS-R-CUS-ADRESS SPACE FUNCTION TRIM(LK-CUS-ADRESS1) ','
               SPACE FUNCTION TRIM(LK-CUS-ZIPCODE) SPACE
               FUNCTION TRIM(LK-CUS-TOWN) ',' SPACE
               FUNCTION TRIM(LK-CUS-COUNTRY)
               DELIMITED BY SIZE
               INTO R-OUTPUT
           END-STRING.
           WRITE R-OUTPUT.

      *    [RD] Numéro de sécurité sociale 
           INITIALIZE R-OUTPUT.
           STRING 
               WS-R-CUS-CODE-SECU SPACE 
               LK-CUS-CODE-SECU(1:1) SPACE
               LK-CUS-CODE-SECU(2:2) SPACE
               LK-CUS-CODE-SECU(4:2) SPACE
               LK-CUS-CODE-SECU(6:2) SPACE
               LK-CUS-CODE-SECU(8:3) SPACE
               LK-CUS-CODE-SECU(11:3) SPACE
               LK-CUS-CODE-SECU(14:2)
               DELIMITED BY SIZE
               INTO R-OUTPUT
           END-STRING.
           WRITE R-OUTPUT.

      *    [RD] IBAN
           INITIALIZE R-OUTPUT.
           STRING 
               WS-R-CUS-IBAN SPACE 
               LK-CUS-CODE-IBAN(1:4) SPACE
               LK-CUS-CODE-IBAN(5:4) SPACE
               LK-CUS-CODE-IBAN(9:4) SPACE
               LK-CUS-CODE-IBAN(13:4) SPACE
               LK-CUS-CODE-IBAN(17:4) SPACE
               LK-CUS-CODE-IBAN(21:4) SPACE
               LK-CUS-CODE-IBAN(25:4) SPACE 
               LK-CUS-CODE-IBAN(29:4) SPACE
               LK-CUS-CODE-IBAN(33:2)
               DELIMITED BY SIZE
               INTO R-OUTPUT
           END-STRING.
           WRITE R-OUTPUT. 

           WRITE R-OUTPUT FROM WS-R-SPACES-ALL.
           WRITE R-OUTPUT FROM WS-R-DASH.

      *    [RD] Détail des prestations 
           WRITE R-OUTPUT FROM WS-R-CUS-DETAILS-TITLE.

           WRITE R-OUTPUT FROM WS-R-DASH.
           WRITE R-OUTPUT FROM WS-R-SPACES-ALL.

           WRITE R-OUTPUT FROM WS-R-DASH.

      *    [RD] Informations de paiement
           INITIALIZE R-OUTPUT.
           WRITE R-OUTPUT FROM WS-R-INFO-PAYMENT.

           WRITE R-OUTPUT FROM WS-R-DASH.

      *    [RD] Informations de paiement message
           INITIALIZE R-OUTPUT.
           WRITE R-OUTPUT FROM WS-R-INFO-PAYMENT-MESSAGE.

           WRITE R-OUTPUT FROM WS-R-SPACES-ALL.

      *    [RD] Informations de paiement message
           INITIALIZE R-OUTPUT.
           WRITE R-OUTPUT FROM WS-R-INFO-PAYMENT-MESSAGE-MODE.   

      *    [RD] Informations de paiement mode 1
           INITIALIZE R-OUTPUT.
           WRITE R-OUTPUT FROM WS-R-INFO-PAYMENT-MODE-1. 

      *    [RD] Informations de paiement mode 2
           INITIALIZE R-OUTPUT.
           WRITE R-OUTPUT FROM WS-R-INFO-PAYMENT-MODE-2. 

      *    [RD] Informations de paiement mode 3
           INITIALIZE R-OUTPUT.
           WRITE R-OUTPUT FROM WS-R-INFO-PAYMENT-MODE-3.         

           WRITE R-OUTPUT FROM WS-R-SPACES-ALL.
           WRITE R-OUTPUT FROM WS-R-DASH.
           WRITE R-OUTPUT FROM WS-R-SPACES-ALL.

      *    [RD] Message de remerciement
           INITIALIZE R-OUTPUT.
           WRITE R-OUTPUT FROM WS-R-MESSAGE-THANK.

           WRITE R-OUTPUT FROM WS-R-SPACES-ALL.
           WRITE R-OUTPUT FROM WS-R-DASH.

      *    [RD] Nous contacter
           INITIALIZE R-OUTPUT.
           WRITE R-OUTPUT FROM WS-R-CONTACT-US. 

           WRITE R-OUTPUT FROM WS-R-DASH.

      *    [RD] Boboniort message de contact
           INITIALIZE R-OUTPUT.
           STRING 
               WS-R-INSURANCE-MESSAGE-CONTACT-1 SPACE
               WS-R-INSURANCE-MESSAGE-CONTACT-2
               DELIMITED BY SIZE
               INTO R-OUTPUT
           END-STRING.
           WRITE R-OUTPUT.

           WRITE R-OUTPUT FROM WS-R-SPACES-ALL.

      *    [RD] Boboniort téléphone
           INITIALIZE R-OUTPUT.
           WRITE R-OUTPUT FROM WS-R-INSURANCE-PHONE. 

      *    [RD] Boboniort mail
           INITIALIZE R-OUTPUT.
           WRITE R-OUTPUT FROM WS-R-INSURANCE-MAIL. 

           WRITE R-OUTPUT FROM WS-R-SPACES-ALL.
           WRITE R-OUTPUT FROM WS-R-DASH.

      *    [RD] BOBONIORT NAME
           INITIALIZE R-OUTPUT.
           STRING 
               WS-R-SPACES-30 WS-R-INSURANCE-NAME
               DELIMITED BY SIZE
               INTO R-OUTPUT
           END-STRING.
           WRITE R-OUTPUT.

      *    [RD] Boboniort slogan
           INITIALIZE R-OUTPUT.
           STRING 
               WS-R-SPACES-25 SPACE WS-R-INSURANCE-SLOGAN
               DELIMITED BY SIZE
               INTO R-OUTPUT
           END-STRING.
           WRITE R-OUTPUT. 

      *    [RD] URL de Boboniort 
           INITIALIZE R-OUTPUT.
           STRING 
               WS-R-SPACES-30 SPACE SPACE WS-R-INSURANCE-URL
               DELIMITED BY SIZE
               INTO R-OUTPUT
           END-STRING.
           WRITE R-OUTPUT.

           WRITE R-OUTPUT FROM WS-R-DASH.

           CLOSE F-OUTPUT.
       END-1000-WRITE.
           EXIT.
                                            