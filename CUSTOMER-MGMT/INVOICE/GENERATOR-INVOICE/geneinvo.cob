      ****************************************************************** 
      *    [MF-RD] Ce programme génère un fichier '.dat' qui est       *
      *    la facture pour un adhérent.                                *
      *    La facture contient divers informations sur la mutuelle     *
      *    Boboniort, sur l'adhérent, sur les prestations. Ainsi que   *
      *    des informations sur la facture comme sa date de création,  *
      *    le coût mensuel, le montant total à payer et la date        *
      *    d'écheance.                                                 *
      ****************************************************************** 
       IDENTIFICATION DIVISION.
       PROGRAM-ID. geneinvo.
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
           03 WS-INVOICE-FOLDER PIC X(28) 
           VALUE './INVOICE/INVOICE-GENERATED/'.
           03 WS-INVOICE-FILE   PIC X(11).
           03 WS-INVOICE-FORMAT PIC X(04) VALUE '.dat'.

       01  WS-CUS-UUID                 PIC X(36).
       01  WS-INVOICE-NUM              PIC 9(08).
       01  WS-INVOICE-DATE             PIC 9(08).
       01  WS-INVOICE-DATE-DAY         PIC 9(02).
       01  WS-INVOICE-DATE-START-MONTH PIC 9(02).
       01  WS-INVOICE-DATE-END-MONTH   PIC 9(02).
       01  WS-INVOICE-DATE-YEAR        PIC 9(04).
       01  WS-TOTAL-AMOUNT             PIC 9(05)V9(02).
       01  WS-Z-TOTAL-AMOUNT           PIC Z(09)9.99.
       01  WS-INVOICE-EXPECT           PIC 9(05)V9(02).

       01  WS-CUS-REIMBURSEMENT.
           03 WS-REIM-UUID             PIC X(36).
           03 WS-REIM-NUM              PIC X(10).
           03 WS-CREATE-DATE           PIC X(10).
           03 WS-COST                  PIC ZZ9.
           03 WS-DOCTOR                PIC ZZ9.
           03 WS-PARMEDICAL            PIC ZZ9.
           03 WS-HOSPITAL              PIC ZZ9.
           03 WS-S-GLASSES             PIC ZZ9.
           03 WS-P-GLASSES             PIC ZZ9.
           03 WS-MOLAR                 PIC ZZ9.   
           03 WS-NON-MOLAR             PIC ZZ9.
           03 WS-DESCALINGS            PIC ZZ9.

       01  WS-REIM-TYPE                PIC X(15).

       01  WS-REPORT.
           03 WS-R-SPACES-ALL          PIC X(80) VALUE SPACES.
           03 WS-R-SPACES-25           PIC X(25) VALUE ALL SPACES.
           03 WS-R-SPACES-30           PIC X(30) VALUE ALL SPACES.
           03 WS-R-DASH                PIC X(80) VALUE ALL '-'.
           03 WS-R-INVOICE-TITLE       PIC X(26) 
           VALUE 'FACTURE MUTUELLE BOBONIORT'.
           03 WS-R-INSURANCE-NAME      PIC X(18) 
           VALUE 'MUTUELLE BOBONIORT'.
           03 WS-R-INSURANCE-ADRESS-1  PIC X(16) 
           VALUE '12 rue des Bobos'.
           03 WS-R-INSURANCE-ADRESS-2  PIC X(22) 
           VALUE '75007 Boboland, France'.
           03 WS-R-INVOICE-NUM         PIC X(21)
           VALUE 'Numéro de facture  :'.
           03 WS-R-INVOICE-DATE        PIC X(20)
           VALUE 'Date de la facture :'.
           03 WS-R-CUS-INFO            PIC X(25)
           VALUE 'Informations personnelles'.
           03 WS-R-CUS-NAME            PIC X(28) 
           VALUE 'Nom complet                :'.
           03 WS-R-CUS-BIRTH-DATE      PIC X(28) 
           VALUE 'Date de naissance          :'.
           03 WS-R-CUS-ADRESS          PIC X(28) 
           VALUE 'Adresse                    :'.
           03 WS-R-CUS-TOWN            PIC X(28) 
           VALUE 'Ville                      :'.
           03 WS-R-CUS-COUNTRY         PIC X(28) 
           VALUE 'Pays                       :'.
           03 WS-R-CUS-CODE-SECU       PIC X(31) 
           VALUE 'Numéro de sécurité sociale :'.
           03 WS-R-CUS-IBAN            PIC X(28) 
           VALUE 'IBAN                       :'.
           03 WS-R-CUS-DETAILS-TITLE   PIC X(29) 
           VALUE 'Informations de votre contrat'.
           03 WS-R-REIM-NUM            PIC X(20) 
           VALUE 'Numéro de contrat :'.
           03 WS-R-REIM-TYPE           PIC X(19) 
           VALUE 'Type de contrat   :'.
           03 WS-R-ROUTINE-CARE        PIC X(16) 
           VALUE 'Soins courants :'.
           03 WS-R-MEDICAL-FEES        PIC X(28) 
           VALUE '- Honoraires médecins      '.
           03 WS-R-PARAMEDICAL-REGULATIONS PIC X(29) 
           VALUE '- Réglements paramédicaux  '.
           03 WS-R-HOSPITALIZATION     PIC X(27) 
           VALUE 'Hospitalisation :          '.
           03 WS-R-OPTICS              PIC X(09) 
           VALUE 'Optique :'.
           03 WS-R-SINGLE-LENSES       PIC X(27) 
           VALUE '- Verres simples           '.
           03 WS-R-PROGRESSIVE-LENSES  PIC X(27) 
           VALUE '- Verres progressifs       '.
           03 WS-R-DENTAL              PIC X(10) 
           VALUE 'Dentaire :'.
           03 WS-R-MOLAR-CROWNS        PIC X(27) 
           VALUE '- Couronnes (molaires)     '.
           03 WS-R-NON-MOLAR-CROWNS    PIC X(27) 
           VALUE '- Couronnes (hors molaires)'.
           03 WS-R-SCALING             PIC X(28) 
           VALUE '- Détartrage               '.
           03 WS-R-MONTHLY-COST PIC X(15) 
           VALUE 'Coût mensuel :'.
           03 WS-R-TOTAL-AMOUNT PIC X(16) 
           VALUE 'Total à payer :'.
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
       01  DBNAME             PIC  X(11) VALUE 'boboniortdb'.
       01  USERNAME           PIC  X(05) VALUE 'cobol'.
       01  PASSWD             PIC  X(10) VALUE 'cbl85'.

       01  SQL-CUS-REIMBURSEMENT.
           03 SQL-REIM-UUID   PIC X(36).
           03 SQL-REIM-NUM    PIC X(10).
           03 SQL-CREATE-DATE PIC X(10).
           03 SQL-COST        PIC 9(03).
           03 SQL-DOCTOR      PIC 9(03).
           03 SQL-PARMEDICAL  PIC 9(03).
           03 SQL-HOSPITAL    PIC 9(03).
           03 SQL-S-GLASSES   PIC 9(03).
           03 SQL-P-GLASSES   PIC 9(03).
           03 SQL-MOLAR       PIC 9(03).   
           03 SQL-NON-MOLAR   PIC 9(03).
           03 SQL-DESCALINGS  PIC 9(03).
OCESQL*EXEC SQL END DECLARE SECTION END-EXEC.
OCESQL*EXEC SQL INCLUDE SQLCA END-EXEC. 
OCESQL     copy "sqlca.cbl".

OCESQL*
OCESQL 01  SQ0001.
OCESQL     02  FILLER PIC X(014) VALUE "DISCONNECT ALL".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
OCESQL 01  SQ0002.
OCESQL     02  FILLER PIC X(256) VALUE "SELECT UUID_CUSTOMER_REIMBOURS"
OCESQL  &  "EMENT, REIMBURSEMENT_NUM, REIMBURSEMENT_CREATE_DATE, REIMB"
OCESQL  &  "URSEMENT_COST, REIMBURSEMENT_DOCTOR, REIMBURSEMENT_PARMEDI"
OCESQL  &  "CAL, REIMBURSEMENT_HOSPITAL, REIMBURSEMENT_SINGLE_GLASSES,"
OCESQL  &  " REIMBURSEMENT_PROGRESSIVE_GLASSES, REIMBURSEMENT_MO".
OCESQL     02  FILLER PIC X(129) VALUE "LAR_CROWNS, REIMBURSEMENT_NON_"
OCESQL  &  "MOLAR_CROWNS, REIMBURSEMENT_DESCALINGS FROM CUSTOMER_REIMB"
OCESQL  &  "URSEMENT WHERE UUID_CUSTOMER = $1 LIMIT 1".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
OCESQL 01  SQ0003.
OCESQL     02  FILLER PIC X(170) VALUE "INSERT INTO INVOICE ( UUID_CUS"
OCESQL  &  "TOMER_REIMBOURSEMENT, UUID_CUSTOMER, INVOICE_NUMBER, INVOI"
OCESQL  &  "CE_INCOME, INVOICE_EXPECT, INVOICE_CREATE_DATE ) VALUES ( "
OCESQL  &  "$1, $2, $3, $4, $5, $6 )".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
       LINKAGE SECTION.
       01 LK-CUSTOMER.
           03 LK-CUS-UUID        PIC X(36).
           03 LK-CUS-GENDER      PIC X(10).
           03 LK-CUS-LASTNAME    PIC X(20).
           03 LK-CUS-FIRSTNAME   PIC X(20).
           03 LK-CUS-ADRESS1	 PIC X(50).
           03 LK-CUS-ADRESS2	 PIC X(50).
           03 LK-CUS-ZIPCODE	 PIC X(15).
           03 LK-CUS-TOWN	     PIC X(30).
           03 LK-CUS-COUNTRY	 PIC X(20).
           03 LK-CUS-PHONE	     PIC X(10).
           03 LK-CUS-MAIL	     PIC X(50).
           03 LK-CUS-BIRTH-DATE.
               05 LK-YEAR        PIC X(04).
               05 LK-SEPARATOR1  PIC X(01).
               05 LK-MONTH       PIC X(02).
               05 LK-SEPARATOR2  PIC X(01).
               05 LK-DAY         PIC X(02).
           03 LK-CUS-DOCTOR	     PIC X(20).
           03 LK-CUS-CODE-SECU.
               05 LK-SECU-1      PIC X(01).
               05 LK-SECU-2      PIC X(02).
               05 LK-SECU-3      PIC X(02).
               05 LK-SECU-4      PIC X(02).
               05 LK-SECU-5      PIC X(03).
               05 LK-SECU-6      PIC X(03).
               05 LK-SECU-7      PIC X(02).
           03 LK-CUS-CODE-IBAN   PIC X(34).
           03 LK-CUS-NBCHILDREN  PIC 9(03).
           03 LK-CUS-COUPLE      PIC X(05).
           03 LK-CUS-CREATE-DATE PIC X(10).
           03 LK-CUS-UPDATE-DATE PIC X(10).
           03 LK-CUS-CLOSE-DATE  PIC X(10).
           03 LK-CUS-ACTIVE	     PIC X(01).

       01  LK-INVOICE-INCOME       PIC 9(05)V9(02).
       01  LK-INVOICE-EXPECT       PIC 9(05)V9(02).

      ******************************************************************

       PROCEDURE DIVISION USING LK-CUSTOMER, LK-INVOICE-INCOME, 
       LK-INVOICE-EXPECT.  

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

           PERFORM 2000-START-SELECT-CONTRACT 
              THRU END-2000-SELECT-CONTRACT.

           PERFORM 3000-START-HANDLE-REIMBURSEMENT 
              THRU 3000-END-HANDLE-REIMBURSEMENT.  

           PERFORM 4000-START-INSERT-INVOICE 
              THRU END-4000-INSERT-INVOICE.    
       
           PERFORM 5000-START-WRITE 
              THRU END-5000-WRITE.
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
      *    [RD] Initialise les différentes variables utilisées dans ce *
      *    programme.                                                  *
      ****************************************************************** 
       1000-START-INITIALIZATION.
      *    [RD] Génére le numéro de facture par rapport au temps
      *    TIME = HHMMSSSS (HEURE / Minute / SECONDE)
           ACCEPT WS-INVOICE-NUM FROM TIME.

      *    [RD] Initialise le nom du fichier généré.
           STRING
               FUNCTION UPPER-CASE(LK-CUS-FIRSTNAME(1:1)) 
               FUNCTION UPPER-CASE(LK-CUS-LASTNAME(1:1)) 
               '-'
               WS-INVOICE-NUM
               DELIMITED BY SIZE
               INTO WS-INVOICE-FILE
           END-STRING.

      *    [RD] Initialise la date de création de la facture.
           ACCEPT WS-INVOICE-DATE FROM DATE YYYYMMDD.

           MOVE WS-INVOICE-DATE(1:4) 
           TO WS-INVOICE-DATE-YEAR.
           MOVE WS-INVOICE-DATE(5:2) 
           TO WS-INVOICE-DATE-START-MONTH.
           MOVE WS-INVOICE-DATE(7:2) 
           TO WS-INVOICE-DATE-DAY.

      *    [RD] Calcul le mois d'écheance à partir du mois de la 
      *         création de la facture. 
           MOVE WS-INVOICE-DATE-START-MONTH 
           TO WS-INVOICE-DATE-END-MONTH.

           ADD 2 TO WS-INVOICE-DATE-END-MONTH.
           
           IF WS-INVOICE-DATE-END-MONTH GREATER THAN 12 THEN
               SUBTRACT 12 FROM WS-INVOICE-DATE-END-MONTH
           END-IF.

      *    [RD] Déplace LK-INVOICE vers WS. 
           MOVE LK-INVOICE-INCOME TO WS-TOTAL-AMOUNT.
           MOVE LK-INVOICE-INCOME TO WS-Z-TOTAL-AMOUNT.
           MOVE LK-INVOICE-EXPECT TO WS-INVOICE-EXPECT.

      *    [RD] Déplace l'UUID de LK vers celui de la WS. 
           MOVE LK-CUS-UUID TO WS-CUS-UUID.
       END-1000-INITIALIZATION.
           EXIT.    

      ******************************************************************
      *    [RD] Requête SQL pour récupérer le contrat de l'adhérent en *
      *    fonction de l'UUID de l'adhérent.                           *
      ****************************************************************** 
       2000-START-SELECT-CONTRACT.
OCESQL*    EXEC SQL
OCESQL*        SELECT UUID_CUSTOMER_REIMBOURSEMENT,
OCESQL*               REIMBURSEMENT_NUM,
OCESQL*               REIMBURSEMENT_CREATE_DATE,
OCESQL*               REIMBURSEMENT_COST,
OCESQL*               REIMBURSEMENT_DOCTOR,
OCESQL*               REIMBURSEMENT_PARMEDICAL,
OCESQL*               REIMBURSEMENT_HOSPITAL,
OCESQL*               REIMBURSEMENT_SINGLE_GLASSES,
OCESQL*               REIMBURSEMENT_PROGRESSIVE_GLASSES,
OCESQL*               REIMBURSEMENT_MOLAR_CROWNS,
OCESQL*               REIMBURSEMENT_NON_MOLAR_CROWNS,
OCESQL*               REIMBURSEMENT_DESCALINGS
OCESQL*        INTO :SQL-REIM-UUID,
OCESQL*             :SQL-REIM-NUM, 
OCESQL*             :SQL-CREATE-DATE, 
OCESQL*             :SQL-COST,
OCESQL*             :SQL-DOCTOR, 
OCESQL*             :SQL-PARMEDICAL, 
OCESQL*             :SQL-HOSPITAL, 
OCESQL*             :SQL-S-GLASSES, 
OCESQL*             :SQL-P-GLASSES, 
OCESQL*             :SQL-MOLAR, 
OCESQL*             :SQL-NON-MOLAR, 
OCESQL*             :SQL-DESCALINGS
OCESQL*        FROM CUSTOMER_REIMBURSEMENT
OCESQL*    WHERE UUID_CUSTOMER = :WS-CUS-UUID
OCESQL*    LIMIT 1
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 36
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-REIM-UUID
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-REIM-NUM
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CREATE-DATE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-COST
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-DOCTOR
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-PARMEDICAL
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-HOSPITAL
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-S-GLASSES
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-P-GLASSES
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-MOLAR
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-NON-MOLAR
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-DESCALINGS
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 36
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-CUS-UUID
OCESQL     END-CALL
OCESQL     CALL "OCESQLExecSelectIntoOne" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE SQ0002
OCESQL          BY VALUE 1
OCESQL          BY VALUE 12
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL.
       END-2000-SELECT-CONTRACT.
           EXIT.

      ******************************************************************
      *    [RD] Initialise les données qui concernent les informations *
      *    du contrat de l'adhérent pour l'écriture de la factue.      *
      ****************************************************************** 
       3000-START-HANDLE-REIMBURSEMENT.
           MOVE SQL-REIM-UUID   TO WS-REIM-UUID   . 
           MOVE SQL-REIM-NUM    TO WS-REIM-NUM    . 
           MOVE SQL-CREATE-DATE TO WS-CREATE-DATE .
           MOVE SQL-COST        TO WS-COST        .
           MOVE SQL-DOCTOR      TO WS-DOCTOR      .
           MOVE SQL-PARMEDICAL  TO WS-PARMEDICAL  .
           MOVE SQL-HOSPITAL    TO WS-HOSPITAL    .
           MOVE SQL-S-GLASSES   TO WS-S-GLASSES   .
           MOVE SQL-P-GLASSES   TO WS-P-GLASSES   .
           MOVE SQL-MOLAR       TO WS-MOLAR       .
           MOVE SQL-NON-MOLAR   TO WS-NON-MOLAR   .
           MOVE SQL-DESCALINGS  TO WS-DESCALINGS  .

           IF WS-REIM-NUM(1:3) EQUAL 'ALL'
               MOVE 'Allégé' TO WS-REIM-TYPE
           ELSE IF WS-REIM-NUM(1:3) EQUAL 'MOD'
               MOVE 'Modéré' TO WS-REIM-TYPE
           ELSE IF WS-REIM-NUM(1:3) EQUAL 'EXC'
               MOVE 'Excellence' TO WS-REIM-TYPE
           ELSE IF WS-REIM-NUM(1:3) EQUAL 'SPE'
               MOVE 'Spécifique' TO WS-REIM-TYPE  
           ELSE
               MOVE 'Inconnu' TO WS-REIM-TYPE  
           END-IF.
       3000-END-HANDLE-REIMBURSEMENT.
           EXIT.   

      ******************************************************************
      *    [RD] Insert dans la table INVOICE.                          *
      ****************************************************************** 
       4000-START-INSERT-INVOICE.
OCESQL*    EXEC SQL
OCESQL*        INSERT INTO INVOICE (
OCESQL*            UUID_CUSTOMER_REIMBOURSEMENT,
OCESQL*            UUID_CUSTOMER,               
OCESQL*            INVOICE_NUMBER,              
OCESQL*            INVOICE_INCOME,              
OCESQL*            INVOICE_EXPECT,
OCESQL*            INVOICE_CREATE_DATE              
OCESQL*        )
OCESQL*        VALUES ( 
OCESQL*            :WS-REIM-UUID, 
OCESQL*            :WS-CUS-UUID, 
OCESQL*            :WS-INVOICE-NUM, 
OCESQL*            :WS-TOTAL-AMOUNT, 
OCESQL*            :WS-INVOICE-EXPECT,
OCESQL*            :WS-CREATE-DATE
OCESQL*       )
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 36
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-REIM-UUID
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 36
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-CUS-UUID
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 8
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-INVOICE-NUM
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 7
OCESQL          BY VALUE -2
OCESQL          BY REFERENCE WS-TOTAL-AMOUNT
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 7
OCESQL          BY VALUE -2
OCESQL          BY REFERENCE WS-INVOICE-EXPECT
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-CREATE-DATE
OCESQL     END-CALL
OCESQL     CALL "OCESQLExecParams" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE SQ0003
OCESQL          BY VALUE 6
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL.
       END-4000-INSERT-INVOICE.
           EXIT. 
          
      ******************************************************************
      *    [RD] Ecris le rapport généré.                               *
      ******************************************************************    
       5000-START-WRITE.
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
               WS-R-INVOICE-NUM SPACE WS-INVOICE-NUM
               DELIMITED BY SIZE
               INTO R-OUTPUT
           END-STRING.
           WRITE R-OUTPUT.

      *    [RD] Date de la facture 
           INITIALIZE R-OUTPUT.
           STRING 
               WS-R-INVOICE-DATE SPACE 
               WS-INVOICE-DATE-DAY '/'
               WS-INVOICE-DATE-START-MONTH '/'
               WS-INVOICE-DATE-YEAR
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

      *    [RD] Adresse
           INITIALIZE R-OUTPUT.
           STRING 
               WS-R-CUS-ADRESS SPACE 
               FUNCTION TRIM(LK-CUS-ADRESS1)
               DELIMITED BY SIZE
               INTO R-OUTPUT
           END-STRING.
           WRITE R-OUTPUT.

      *    [RD] Code postal Ville 
           INITIALIZE R-OUTPUT.
           STRING 
               WS-R-CUS-TOWN SPACE
               FUNCTION TRIM(LK-CUS-ZIPCODE) SPACE
               FUNCTION TRIM(LK-CUS-TOWN)
               DELIMITED BY SIZE
               INTO R-OUTPUT
           END-STRING.
           WRITE R-OUTPUT.  

      *    [RD] Pays 
           INITIALIZE R-OUTPUT.
           STRING 
               WS-R-CUS-COUNTRY SPACE 
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

      *    [RD] Informations contrat 
           WRITE R-OUTPUT FROM WS-R-CUS-DETAILS-TITLE.

           WRITE R-OUTPUT FROM WS-R-DASH.

      *    [RD] Numéro de contrat
           INITIALIZE R-OUTPUT.
           STRING 
               WS-R-REIM-NUM SPACE
               WS-REIM-NUM
               DELIMITED BY SIZE
               INTO R-OUTPUT
           END-STRING.
           WRITE R-OUTPUT.    

      *    [RD] Type de contrat
           INITIALIZE R-OUTPUT.
           STRING 
               WS-R-REIM-TYPE SPACE
               WS-REIM-TYPE
               DELIMITED BY SIZE
               INTO R-OUTPUT
           END-STRING.
           WRITE R-OUTPUT.     

           WRITE R-OUTPUT FROM WS-R-SPACES-ALL.          

      *    [RD] Soins courants
           INITIALIZE R-OUTPUT.
           STRING 
               WS-R-ROUTINE-CARE
               DELIMITED BY SIZE
               INTO R-OUTPUT
           END-STRING.
           WRITE R-OUTPUT. 

      *    [RD] Honoraires médecins
           INITIALIZE R-OUTPUT.
           STRING 
               WS-R-MEDICAL-FEES SPACE 
               WS-DOCTOR SPACE '%'
               DELIMITED BY SIZE
               INTO R-OUTPUT
           END-STRING.
           WRITE R-OUTPUT. 

      *    [RD] Réglements paramédicaux
           INITIALIZE R-OUTPUT.
           STRING 
               WS-R-PARAMEDICAL-REGULATIONS SPACE 
               WS-PARMEDICAL SPACE '%'
               DELIMITED BY SIZE
               INTO R-OUTPUT
           END-STRING.
           WRITE R-OUTPUT. 

           WRITE R-OUTPUT FROM WS-R-SPACES-ALL.

      *    [RD] Hospitalisation
           INITIALIZE R-OUTPUT.
           STRING 
               WS-R-HOSPITALIZATION SPACE 
               WS-HOSPITAL SPACE '%'
               DELIMITED BY SIZE
               INTO R-OUTPUT
           END-STRING.
           WRITE R-OUTPUT. 

           WRITE R-OUTPUT FROM WS-R-SPACES-ALL.

      *    [RD] Optique
           INITIALIZE R-OUTPUT.
           STRING 
               WS-R-OPTICS
               DELIMITED BY SIZE
               INTO R-OUTPUT
           END-STRING.
           WRITE R-OUTPUT. 

      *    [RD] Verres simples
           INITIALIZE R-OUTPUT.
           STRING 
               WS-R-SINGLE-LENSES SPACE 
               WS-S-GLASSES SPACE '%'
               DELIMITED BY SIZE
               INTO R-OUTPUT
           END-STRING.
           WRITE R-OUTPUT. 

      *    [RD] Verres progressifs
           INITIALIZE R-OUTPUT.
           STRING 
               WS-R-PROGRESSIVE-LENSES SPACE 
               WS-P-GLASSES SPACE '%'
               DELIMITED BY SIZE
               INTO R-OUTPUT
           END-STRING.
           WRITE R-OUTPUT. 

           WRITE R-OUTPUT FROM WS-R-SPACES-ALL.

      *    [RD] Dentaire
           INITIALIZE R-OUTPUT.
           STRING 
               WS-R-DENTAL
               DELIMITED BY SIZE
               INTO R-OUTPUT
           END-STRING.
           WRITE R-OUTPUT. 

      *    [RD] Couronnes (molaires)
           INITIALIZE R-OUTPUT.
           STRING 
               WS-R-MOLAR-CROWNS SPACE 
               WS-MOLAR SPACE '%'
               DELIMITED BY SIZE
               INTO R-OUTPUT
           END-STRING.
           WRITE R-OUTPUT. 

      *    [RD] Couronnes (hors molaires)
           INITIALIZE R-OUTPUT.
           STRING 
               WS-R-NON-MOLAR-CROWNS SPACE 
               WS-NON-MOLAR SPACE '%'
               DELIMITED BY SIZE
               INTO R-OUTPUT
           END-STRING.
           WRITE R-OUTPUT. 

      *    [RD] Détartrage
           INITIALIZE R-OUTPUT.
           STRING 
               WS-R-SCALING SPACE 
               WS-DESCALINGS SPACE '%'
               DELIMITED BY SIZE
               INTO R-OUTPUT
           END-STRING.
           WRITE R-OUTPUT.   

           WRITE R-OUTPUT FROM WS-R-SPACES-ALL.

      *    [RD] Coût mensuel
           INITIALIZE R-OUTPUT.
           STRING 
               WS-R-MONTHLY-COST SPACE 
               FUNCTION TRIM(WS-COST) SPACE 'euros'
               DELIMITED BY SIZE
               INTO R-OUTPUT
           END-STRING.
           WRITE R-OUTPUT.          

           WRITE R-OUTPUT FROM WS-R-SPACES-ALL.

           WRITE R-OUTPUT FROM WS-R-DASH.

      *    [RD] Total à payer
           INITIALIZE R-OUTPUT.
           STRING 
               WS-R-TOTAL-AMOUNT SPACE 
               FUNCTION TRIM(WS-Z-TOTAL-AMOUNT) SPACE 'euros'
               DELIMITED BY SIZE
               INTO R-OUTPUT
           END-STRING.
           WRITE R-OUTPUT. 

           WRITE R-OUTPUT FROM WS-R-DASH.
           WRITE R-OUTPUT FROM WS-R-SPACES-ALL.
           WRITE R-OUTPUT FROM WS-R-DASH.

      *    [RD] Informations de paiement
           INITIALIZE R-OUTPUT.
           WRITE R-OUTPUT FROM WS-R-INFO-PAYMENT.

           WRITE R-OUTPUT FROM WS-R-DASH.

      *    [RD] Informations de paiement message
           INITIALIZE R-OUTPUT.
           STRING 
               WS-R-INFO-PAYMENT-MESSAGE SPACE
               WS-INVOICE-DATE-DAY '/'
               WS-INVOICE-DATE-END-MONTH '/'
               WS-INVOICE-DATE-YEAR
               DELIMITED BY SIZE
               INTO R-OUTPUT
           END-STRING.
           WRITE R-OUTPUT.

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
       END-5000-WRITE.
           EXIT.
                                            