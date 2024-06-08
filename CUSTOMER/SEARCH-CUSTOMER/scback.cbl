      ******************************************************************
      *    [RD] Le programme 'search logic' recherche dans la table    *
      *    'customer' un ou plusieurs adhérent en fonction des saisies *
      *    de l'utilisateur dans les différents champs de recherche.   *
      *    Les saisies de l'utilisateur correspondent à :              *
      *    - soit au code_secu.                                        *
      *    - soit au nom, prénom et date de naissance.                 *
      *    - soit au code_secu, nom, prénom et date de naissance.      *
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. scback.
       AUTHOR.       Rémi.

      ******************************************************************

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-CUSTOMER-ACCEPT.
           05 WS-CUS-FIRSTNAME PIC X(20).
           05 WS-CUS-LASTNAME  PIC X(20).
           05 WS-CUS-BIRTHDATE PIC X(10).
           05 WS-CUS-CODE-SECU PIC 9(15). 

       EXEC SQL BEGIN DECLARE SECTION END-EXEC.
       01  DBNAME   PIC  X(11) VALUE 'boboniortdb'.
       01  USERNAME PIC  X(05) VALUE 'cobol'.
       01  PASSWD   PIC  X(10) VALUE 'cbl85'.

       01  SQL-CUSTOMER.
           03 SQL-CUS-UUID        PIC X(36).
           03 SQL-CUS-LASTNAME    PIC X(20).
           03 SQL-CUS-FIRSTNAME   PIC X(20).
       EXEC SQL END DECLARE SECTION END-EXEC.
       EXEC SQL INCLUDE SQLCA END-EXEC.  

       LINKAGE SECTION.
       01  LK-CUSTOMER-ACCEPT.
           05 LK-CUS-FIRSTNAME     PIC X(20).
           05 LK-CUS-LASTNAME      PIC X(20).
           05 LK-CUS-BIRTHDATE     PIC X(10).
           05 LK-CUS-CODE-SECU     PIC 9(15).

       01  LK-CUSTOMER-RETURN.
           03 LK-CUR-UUID          PIC X(36).
           03 LK-CUR-LASTNAME      PIC X(20).
           03 LK-CUR-FIRSTNAME     PIC X(20).

       01  LK-REQUEST-CODE         PIC 9(01).

      ******************************************************************

       PROCEDURE DIVISION USING LK-CUSTOMER-ACCEPT, LK-REQUEST-CODE,
       LK-CUSTOMER-RETURN.
       
       0000-START-MAIN.
           EXEC SQL
               CONNECT :USERNAME IDENTIFIED BY :PASSWD USING :DBNAME 
           END-EXEC.

           PERFORM 1000-START-HANDLE-CUSTOMER-ACCEPT
              THRU END-1000-HANDLE-CUSTOMER-ACCEPT.
           
           PERFORM 2000-START-SQL-REQUEST 
              THRU END-2000-SQL-REQUEST.

           PERFORM 3000-START-FETCH-CURSOR 
              THRU END-3000-FETCH-CURSOR.
       END-0000-MAIN.
           EXEC SQL COMMIT WORK END-EXEC.
           EXEC SQL DISCONNECT ALL END-EXEC. 
           GOBACK.

      ******************************************************************
      *    [RD] Transfert les données de LK-CUSTOMER-ACCEPT vers       *
      *    WS-CUSTOMER-ACCEPT.                                         *
      ******************************************************************
       1000-START-HANDLE-CUSTOMER-ACCEPT.
           MOVE LK-CUSTOMER-ACCEPT TO WS-CUSTOMER-ACCEPT.
       END-1000-HANDLE-CUSTOMER-ACCEPT.
           EXIT.

      ******************************************************************
      *    [RD] Requêtes SQL qui retourne un ou plusieurs adhérents    * 
      *    qui ne sont pas archiver en fonction de la recherche        *
      *    effectuée par l'utilisateur.                                *
      ******************************************************************
       2000-START-SQL-REQUEST.
      *    Recherche en fonction du code_secu
           EXEC SQL
               DECLARE CRSCODESECU CURSOR FOR
               SELECT uuid_customer,
               customer_lastname, customer_firstname
               FROM customer
               WHERE customer_code_secu = :WS-CUS-CODE-SECU
               AND customer_active != 'A'
           END-EXEC.

      *    Recherche en fonction du lastname, firstname et birth_date
           EXEC SQL
               DECLARE CRSNAMEDATE CURSOR FOR
               SELECT uuid_customer, 
               customer_lastname, customer_firstname
               FROM customer
               WHERE customer_lastname = TRIM(:WS-CUS-LASTNAME)
               AND customer_firstname = TRIM(:WS-CUS-FIRSTNAME)
               AND customer_birth_date = :WS-CUS-BIRTHDATE
               AND customer_active != 'A'
           END-EXEC.

      *    Recherche en fonction du code_secu, lastname, firstname 
      *    et birth_date
           EXEC SQL
               DECLARE CRSALL CURSOR FOR
               SELECT uuid_customer, 
               customer_lastname, customer_firstname
               FROM customer
               WHERE customer_code_secu = :WS-CUS-CODE-SECU
               AND customer_lastname = TRIM(:WS-CUS-LASTNAME)
               AND customer_firstname = TRIM(:WS-CUS-FIRSTNAME)
               AND customer_birth_date = :WS-CUS-BIRTHDATE
               AND customer_active != 'A'
           END-EXEC.
       END-2000-SQL-REQUEST.
           EXIT.

      ******************************************************************
      *    [RD] Appel le paragraphe qui s'occupe de FETCH en fonction  *
      *    du numéro de LK-REQUEST-CODE.                               *
      ******************************************************************
       3000-START-FETCH-CURSOR.
           EVALUATE LK-REQUEST-CODE
               WHEN 1
                   PERFORM 3100-START-FETCH-CRSCODESECU
                      THRU END-3100-FETCH-CRSCODESECU
               WHEN 2
                   PERFORM 3200-START-FETCH-CRSNAMEDATE
                      THRU END-3200-FETCH-CRSNAMEDATE
               WHEN 3
                   PERFORM 3300-START-FETCH-CRSALL
                      THRU END-3300-FETCH-CRSALL
               WHEN OTHER
                  CONTINUE
           END-EVALUATE.
       END-3000-FETCH-CURSOR.
           EXIT.

      ******************************************************************
      *    [RD] Effectue le FECTH pour le CURSOR de code_secu.         *
      ******************************************************************
       3100-START-FETCH-CRSCODESECU.
           EXEC SQL  
               OPEN CRSCODESECU    
           END-EXEC.

           PERFORM UNTIL SQLCODE = 100
               EXEC SQL
                   FETCH CRSCODESECU
                   INTO :SQL-CUS-UUID, :SQL-CUS-LASTNAME, 
                        :SQL-CUS-FIRSTNAME
               END-EXEC

               EVALUATE SQLCODE
                   WHEN ZERO
                       PERFORM 4000-START-HANDLE THRU END-4000-HANDLE
                   WHEN 100
                       DISPLAY 'NO MORE ROWS IN CURSOR RESULT SET'
                   WHEN OTHER
                       DISPLAY 'ERROR FETCHING CURSOR CRSCODESECU :'
                       SPACE SQLCODE
               END-EVALUATE
           END-PERFORM.

           EXEC SQL  
               CLOSE CRSCODESECU    
           END-EXEC.
       END-3100-FETCH-CRSCODESECU.
           EXIT.

      ******************************************************************
      *    [RD] Effectue le FECTH pour le CURSOR de lastname,          *
      *    firstname et birth_date.                                    *
      ******************************************************************
       3200-START-FETCH-CRSNAMEDATE.
           EXEC SQL  
               OPEN CRSNAMEDATE    
           END-EXEC.
           PERFORM UNTIL SQLCODE = 100
               EXEC SQL
                   FETCH CRSNAMEDATE
                   INTO :SQL-CUS-UUID, :SQL-CUS-LASTNAME, 
                        :SQL-CUS-FIRSTNAME
               END-EXEC

               EVALUATE SQLCODE
                   WHEN ZERO
                       PERFORM 4000-START-HANDLE THRU END-4000-HANDLE
                   WHEN 100
                       DISPLAY 'NO MORE ROWS IN CURSOR RESULT SET'
                   WHEN OTHER
                       DISPLAY 'ERROR FETCHING CURSOR CRSNAMEDATE :'
                       SPACE SQLCODE
               END-EVALUATE
           END-PERFORM.

           EXEC SQL  
               CLOSE CRSNAMEDATE    
           END-EXEC.
       END-3200-FETCH-CRSNAMEDATE.
           EXIT.

      ******************************************************************
      *    [RD] Effectue le FECTH pour le CURSOR de code_secu,         *
      *    lastname, firstname et birth_date.                          *
      ******************************************************************
       3300-START-FETCH-CRSALL.
           EXEC SQL  
               OPEN CRSALL    
           END-EXEC.
           PERFORM UNTIL SQLCODE = 100
               EXEC SQL
                   FETCH CRSALL
                   INTO :SQL-CUS-UUID, :SQL-CUS-LASTNAME, 
                        :SQL-CUS-FIRSTNAME
               END-EXEC
               
               EVALUATE SQLCODE
                   WHEN ZERO
                       PERFORM 4000-START-HANDLE THRU END-4000-HANDLE
                   WHEN 100
                       DISPLAY 'NO MORE ROWS IN CURSOR RESULT SET'
                   WHEN OTHER
                       DISPLAY 'ERROR FETCHING CURSOR CRSALL :'
                       SPACE SQLCODE
               END-EVALUATE
           END-PERFORM.

           EXEC SQL  
               CLOSE CRSALL    
           END-EXEC.
       END-3300-FETCH-CRSALL.
           EXIT.

      ******************************************************************
      *    [RD] Stock le ou les résultats de la requête SQL dans la    * 
      *    TABLE customer.                                             *
      ******************************************************************
       4000-START-HANDLE.
           MOVE SQL-CUS-UUID      TO LK-CUR-UUID.
           MOVE SQL-CUS-LASTNAME  TO LK-CUR-LASTNAME.
           MOVE SQL-CUS-FIRSTNAME TO LK-CUR-FIRSTNAME.
       END-4000-HANDLE.
           EXIT.
