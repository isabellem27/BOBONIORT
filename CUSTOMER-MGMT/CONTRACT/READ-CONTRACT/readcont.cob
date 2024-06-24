      ******************************************************************
      *    [RD] Ce programme récupère dans la DB le contrat qui est    *
      *    affecté à l'adhérent et affiche les informations du contrat *
      *    avec une SCREEN SECTION.                                    *
      *    Gère les erreurs dans le cas où l'adhérent n'a pas de       *
      *    contrat d'affecté ou au contraire si l'adhérent a plus d'un *
      *    contrat d'affecté.                                          *
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. readcont RECURSIVE.
       AUTHOR. Martial&Remi.

      ******************************************************************

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-ERROR-MESSAGE        PIC X(46).    
       01  WS-CUSTOMER-NAME        PIC X(45).
       01  WS-MENU-RETURN          PIC X(01).
      *01  WS-MODIFY-CONTRACT      PIC X(01).
       01  WS-COUNT-CUS-REIM       PIC 9(05).

       01  WS-CUS-REIMBURSEMENT.
           03 WS-REIM-NUM          PIC X(10).  
           03 WS-REIM-TYPE         PIC X(10).
           03 WS-CREATE-DATE.
               05 WS-CD-YEAR       PIC X(04).
               05 FILLER           PIC X(01).
               05 WS-CD-MONTH      PIC X(02).
               05 FILLER           PIC X(01).
               05 WS-CD-DAY        PIC X(02).
           03 WS-COST             PIC 9(03).      
           03 WS-DOCTOR           PIC X(03). 
           03 WS-PARMEDICAL       PIC X(03).      
           03 WS-HOSPITAL         PIC X(03). 
           03 WS-S-GLASSES        PIC X(03). 
           03 WS-P-GLASSES        PIC X(03). 
           03 WS-MOLAR            PIC X(03). 
           03 WS-NON-MOLAR        PIC X(03). 
           03 WS-DESCALINGS       PIC X(03).

       01  WS-CUSTOMER.
           03 WS-CUS-UUID          PIC X(36).
           03 WS-CUS-GENDER        PIC X(10).
           03 WS-CUS-LASTNAME      PIC X(20).
           03 WS-CUS-FIRSTNAME     PIC X(20).
           03 WS-CUS-ADRESS1       PIC X(50).
           03 WS-CUS-ADRESS2       PIC X(50).
           03 WS-CUS-ZIPCODE       PIC X(15).
           03 WS-CUS-TOWN          PIC X(30).
           03 WS-CUS-COUNTRY       PIC X(20).
           03 WS-CUS-PHONE	       PIC X(10).
           03 WS-CUS-MAIL	       PIC X(50).
           03 WS-CUS-BIRTH-DATE    PIC X(10).           
           03 WS-CUS-DOCTOR	       PIC X(20).
           03 WS-CUS-CODE-SECU     PIC 9(15).
           03 WS-CUS-CODE-IBAN     PIC X(34).
           03 WS-CUS-NBCHILDREN    PIC Z(02)9.
           03 WS-CUS-COUPLE        PIC X(05).
           03 WS-CUS-CREATE-DATE   PIC X(10).
           03 WS-CUS-UPDATE-DATE   PIC X(10).
           03 WS-CUS-CLOSE-DATE    PIC X(10).
           03 WS-CUS-ACTIVE	       PIC X(01).

OCESQL*EXEC SQL BEGIN DECLARE SECTION END-EXEC.
       01  DBNAME   PIC  X(11) VALUE 'boboniortdb'.
       01  USERNAME PIC  X(05) VALUE 'cobol'.
       01  PASSWD   PIC  X(10) VALUE 'cbl85'.
       
       01  SQL-CUS-REIMBURSEMENT.
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
OCESQL     02  FILLER PIC X(256) VALUE "SELECT REIMBURSEMENT_NUM, REIM"
OCESQL  &  "BURSEMENT_CREATE_DATE, REIMBURSEMENT_COST, REIMBURSEMENT_D"
OCESQL  &  "OCTOR, REIMBURSEMENT_PARMEDICAL, REIMBURSEMENT_HOSPITAL, R"
OCESQL  &  "EIMBURSEMENT_SINGLE_GLASSES, REIMBURSEMENT_PROGRESSIVE_GLA"
OCESQL  &  "SSES, REIMBURSEMENT_MOLAR_CROWNS, REIMBURSEMENT_NON_".
OCESQL     02  FILLER PIC X(091) VALUE "MOLAR_CROWNS, REIMBURSEMENT_DE"
OCESQL  &  "SCALINGS FROM CUSTOMER_REIMBURSEMENT WHERE UUID_CUSTOMER ="
OCESQL  &  " $1".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
       LINKAGE SECTION.
       01  LK-CUSTOMER.
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

       01  LK-ERROR-MESSAGE-MENU   PIC X(70).  
      
       SCREEN SECTION.
           COPY 'screen-read-contract.cpy'.
      
      ******************************************************************

       PROCEDURE DIVISION USING LK-CUSTOMER, LK-ERROR-MESSAGE-MENU. 

       0000-START-MAIN.
           INITIALIZE WS-ERROR-MESSAGE
                      WS-MENU-RETURN 
                      WS-COUNT-CUS-REIM .

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

           PERFORM 1000-PREPARE-SCREEN-START 
              THRU END-1000-PREPARE-SCREEN.

           PERFORM 2000-SELECT-CONTRACT 
              THRU END-2000-SELECT-CONTRACT.

           PERFORM 3000-START-FETCH 
              THRU END-3000-FETCH.

           PERFORM 4000-START-CONTRACT-TYPE
              THRU END-4000-CONTRACT-TYPE.

           PERFORM 5000-START-SCREEN
              THRU END-5000-SCREEN.
       0000-END-MAIN.  
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
      *    [RD] Déplace le Customer de la linkage vers celui de la WS  *
      *    et créer un STRING Nom Prénom NumSécu pour SCREEN SECTION.  *
      ******************************************************************
       1000-PREPARE-SCREEN-START.
           MOVE LK-CUSTOMER TO WS-CUSTOMER.

           STRING FUNCTION TRIM(WS-CUS-FIRSTNAME)
                  SPACE 
                  FUNCTION TRIM(WS-CUS-LASTNAME)
                  SPACE 
                  WS-CUS-CODE-SECU(1:1) '-' 
                  WS-CUS-CODE-SECU(2:2) '-'
                  WS-CUS-CODE-SECU(4:2) '-'
                  WS-CUS-CODE-SECU(6:2) '-'
                  WS-CUS-CODE-SECU(8:3) '-'
                  WS-CUS-CODE-SECU(11:3) '-'
                  WS-CUS-CODE-SECU(14:2)
           DELIMITED BY SIZE 
           INTO WS-CUSTOMER-NAME.  
       END-1000-PREPARE-SCREEN.
           EXIT.

      ******************************************************************
      *    [RD] Requête SQL pour récupérer le contrat de l'adhérent en *
      *    fonction de l'UUID de l'adhérent.                           *
      ****************************************************************** 
       2000-SELECT-CONTRACT.
OCESQL*    EXEC SQL
OCESQL*        DECLARE CRSUUID CURSOR FOR
OCESQL*        SELECT REIMBURSEMENT_NUM,
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
OCESQL*        FROM CUSTOMER_REIMBURSEMENT
OCESQL*        WHERE UUID_CUSTOMER = :WS-CUS-UUID
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 36
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-CUS-UUID
OCESQL     END-CALL
OCESQL     CALL "OCESQLCursorDeclareParams" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "readcont_CRSUUID" & x"00"
OCESQL          BY REFERENCE SQ0002
OCESQL          BY VALUE 1
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL.
       END-2000-SELECT-CONTRACT.
           EXIT.

      ******************************************************************
      *    [RD] Stock le résultat de la requête SQL dans les variables *
      *    du groupe SQL-CUS-REIMBURSEMENT puis appel le paragraphe    *
      *    HANDLE.                                                     *
      ******************************************************************     
       3000-START-FETCH.
OCESQL*    EXEC SQL  
OCESQL*        OPEN CRSUUID  
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLCursorOpen" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "readcont_CRSUUID" & x"00"
OCESQL     END-CALL.

           PERFORM UNTIL SQLCODE = 100
OCESQL*        EXEC SQL
OCESQL*            FETCH CRSUUID
OCESQL*            INTO :SQL-REIM-NUM, 
OCESQL*                 :SQL-CREATE-DATE, 
OCESQL*                 :SQL-COST,
OCESQL*                 :SQL-DOCTOR, 
OCESQL*                 :SQL-PARMEDICAL, 
OCESQL*                 :SQL-HOSPITAL, 
OCESQL*                 :SQL-S-GLASSES, 
OCESQL*                 :SQL-P-GLASSES, 
OCESQL*                 :SQL-MOLAR, 
OCESQL*                 :SQL-NON-MOLAR, 
OCESQL*                 :SQL-DESCALINGS
OCESQL*        END-EXEC
OCESQL     CALL "OCESQLStartSQL"
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
OCESQL     CALL "OCESQLCursorFetchOne" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "readcont_CRSUUID" & x"00"
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL

               EVALUATE SQLCODE
                   WHEN ZERO
                       PERFORM 3100-START-HANDLE THRU END-3100-HANDLE
                   WHEN 100
                       DISPLAY 'NO MORE ROWS IN CURSOR RESULT SET'
                   WHEN OTHER
                       DISPLAY 'ERROR FETCHING CURSOR CRSUUID:'
                       SPACE SQLCODE
               END-EVALUATE
           END-PERFORM.

OCESQL*    EXEC SQL  
OCESQL*        CLOSE CRSUUID   
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLCursorClose"  USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "readcont_CRSUUID" & x"00"
OCESQL     END-CALL
OCESQL    .
       END-3000-FETCH.
           EXIT.

      ******************************************************************
      *    [RD] Déplace les valeurs des variables SQL dans la WS.      *
      ****************************************************************** 
       3100-START-HANDLE.
           ADD 1 TO WS-COUNT-CUS-REIM.

           MOVE SQL-REIM-NUM    TO WS-REIM-NUM.
           MOVE SQL-CREATE-DATE TO WS-CREATE-DATE. 
           MOVE SQL-COST        TO WS-COST. 
           MOVE SQL-DOCTOR      TO WS-DOCTOR.     
           MOVE SQL-PARMEDICAL  TO WS-PARMEDICAL.
           MOVE SQL-HOSPITAL    TO WS-HOSPITAL.
           MOVE SQL-S-GLASSES   TO WS-S-GLASSES
           MOVE SQL-P-GLASSES   TO WS-P-GLASSES.
           MOVE SQL-MOLAR       TO WS-MOLAR.
           MOVE SQL-NON-MOLAR   TO WS-NON-MOLAR.
           MOVE SQL-DESCALINGS  TO WS-DESCALINGS.
       END-3100-HANDLE.
           EXIT.

      ******************************************************************
      *    [RD] Attribu le type de contrat à afficher pour la SCREEN   *
      *    SECTION en fonction des 3 premières lettres du numéro de    *
      *    contrat.                                                    *
      ****************************************************************** 
       4000-START-CONTRACT-TYPE. 
           IF WS-REIM-NUM(1:3) EQUAL 'ALL'
               MOVE 'Allege' TO WS-REIM-TYPE
           ELSE IF WS-REIM-NUM(1:3) EQUAL 'MOD'
               MOVE 'Modere' TO WS-REIM-TYPE
           ELSE IF WS-REIM-NUM(1:3) EQUAL 'EXC'
               MOVE 'Excellence' TO WS-REIM-TYPE
           ELSE IF WS-REIM-NUM(1:3) EQUAL 'SPE'
               MOVE 'Specifique' TO WS-REIM-TYPE  
           ELSE
               MOVE 'Inconnu' TO WS-REIM-TYPE  
           END-IF.
       END-4000-CONTRACT-TYPE.
           EXIT.

      ******************************************************************
      *    [RD] Appel la SCREEN SECTION et gestion des erreurs si      *
      *    l'adhérent n'a pas de contrat d'affecté ou si l'adhérent a  *
      *    plus d'un contrat d'affecté.                                *
      *    En cas d'erreur appel le sous programme 'menu contrat' avec *
      *    le message d'erreur adéquat.                                *
      ****************************************************************** 
       5000-START-SCREEN.
           IF WS-COUNT-CUS-REIM GREATER THAN 1 THEN
               MOVE 'Plusieurs contrats affectes pour cet adherent.' 
               TO LK-ERROR-MESSAGE-MENU

               CALL 
                   'menucont'
                   USING BY CONTENT
                   LK-CUSTOMER
               END-CALL
           ELSE IF WS-COUNT-CUS-REIM LESS THAN 1 THEN
               MOVE 'Aucun contrat affecte pour cet adherent.' 
               TO LK-ERROR-MESSAGE-MENU

               CALL 
                   'menucont'
                   USING BY CONTENT
                   LK-CUSTOMER
               END-CALL
           ELSE
               ACCEPT SCREEN-READ-CONTRACT
       
               PERFORM 5100-START-MENU-RETURN
                  THRU END-5100-MENU-RETURN
           END-IF.
       END-5000-SCREEN.
           EXIT.

      ******************************************************************
      *    [RD] Si l'utilisateur a saisi "O" sur "Retour au menu"      *
      *    redirige vers le menu contrat.                              *
      *    Si l'utilisateur a effectué une saisie incorrecte redirige  *
      *    vers le début de ce programme avec un message d'erreur.     *
      ******************************************************************
       5100-START-MENU-RETURN.
           INITIALIZE LK-ERROR-MESSAGE-MENU.
           MOVE FUNCTION UPPER-CASE(WS-MENU-RETURN) TO WS-MENU-RETURN.

           IF WS-MENU-RETURN EQUAL 'O' THEN
               CALL 
                   'menucont'
                   USING BY CONTENT
                   LK-CUSTOMER
               END-CALL
           ELSE
               MOVE 'Veuillez entrer "O" pour retourner au menu.' 
               TO WS-ERROR-MESSAGE

               GO TO 5000-START-SCREEN
           END-IF.
       END-5100-MENU-RETURN.
           EXIT. 
           EXIT. 
           EXIT. 
