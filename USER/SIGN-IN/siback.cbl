      ******************************************************************
      *    Ce programme gère la validation de la saisine des champs:
      *    - code utilisateur
      *    - mot de passe
      ****************************************************************** 
       IDENTIFICATION DIVISION.
       PROGRAM-ID. siback.
       AUTHOR. Yves.
      ******************************************************************
       DATA DIVISION.
       

       WORKING-STORAGE SECTION.

       01  WS-INPUT-DATAS.
           05 WS-INPUT-USER-ID      PIC X(08).
           05 WS-INPUT-USER-PASSWRD PIC X(09).
           05 WS-ERROR-MESSAGE      PIC x(45).  
           05 WS-PASS-CHECK         PIC X(05) VALUE 'FALSE'.

           EXEC SQL BEGIN DECLARE SECTION END-EXEC.
       01  DBNAME               PIC X(11) VALUE 'boboniortdb'.   
       01  USERNAME             PIC X(05) VALUE 'cobol'.
       01  PASSWRD              PIC X(05) VALUE 'cbl85'.
  
       01  SQL-USER.
           03 SQL-USER-ID       PIC X(10).
           03 SQL-USER-PWD      PIC X(30).       

           EXEC SQL END DECLARE SECTION END-EXEC.
           EXEC SQL INCLUDE SQLCA END-EXEC.
           
       LINKAGE SECTION.
       
       01  LK-INPUT-DATAS.
           05 LK-INPUT-USER-ID      PIC X(08).
           05 LK-INPUT-USER-PASSWRD PIC X(09).
           05 LK-ERROR-MESSAGE      PIC x(45).  
           05 LK-PASS-CHECK         PIC X(05) VALUE 'FALSE'.

      ******************************************************************
       PROCEDURE DIVISION USING LK-INPUT-DATAS.
       
       0000-MAIN-START.

           MOVE LK-INPUT-DATAS TO WS-INPUT-DATAS.

           EXEC SQL
              CONNECT :USERNAME IDENTIFIED BY :PASSWRD USING :DBNAME
           END-EXEC.

           IF SQLCODE NOT = ZERO 
               PERFORM 1000-START-ERROR-RTN THRU END-1000-ERROR-RTN
           ELSE
            PERFORM 2001-START-SQL-REQUEST
               THRU END-2001-SQL-REQUEST
           END-IF.

       END-0000-MAIN.
           EXEC SQL COMMIT WORK END-EXEC.
           EXEC SQL DISCONNECT ALL END-EXEC.  
           GOBACK.
      ******************************************************************
      *    Bloc de gestion des erreurs
      ******************************************************************
       1000-START-ERROR-RTN.
      *     DISPLAY "*** SQL ERROR ***".
      *     DISPLAY "SQLCODE: " SQLCODE SPACE.
           EVALUATE SQLCODE
              WHEN  +100
                 DISPLAY "Record not found"
              WHEN  -01
                 DISPLAY "Connection failed"
              WHEN  -20
                 DISPLAY "Internal error"
              WHEN  -30
                 DISPLAY "PostgreSQL error"
                 DISPLAY "ERRCODE:" SPACE SQLSTATE
                 DISPLAY SQLERRMC
                 EXEC SQL
                     ROLLBACK
                 END-EXEC
              WHEN  OTHER
                 DISPLAY "Undefined error"
                 DISPLAY "ERRCODE:" SPACE SQLSTATE
                 DISPLAY SQLERRMC
           END-EVALUATE.
       END-1000-ERROR-RTN.
           EXIT.

      ******************************************************************
      *    Requêtes SQL
      ******************************************************************
       2001-START-SQL-REQUEST.

      *    Récupère les informations d'un usser selon l'id saisie
           EXEC SQL
            DECLARE CRUSER CURSOR FOR
            SELECT user_identification, user_password
            FROM user_tab
            WHERE user_identification = trim(:WS-INPUT-USER-ID)
           END-EXEC.
           
           EXEC SQL
              OPEN CRUSER
           END-EXEC.

           EXEC SQL
              FETCH CRUSER INTO :SQL-USER-ID, :SQL-USER-PWD
           END-EXEC.

           IF SQLCODE = ZERO THEN
               PERFORM 3000-TEST-PWD-START
                  THRU END-3000-TEST-PWD
           END-IF.

           MOVE WS-PASS-CHECK TO LK-PASS-CHECK.
           EXEC SQL
              CLOSE CRUSER
           END-EXEC.

       END-2001-SQL-REQUEST.
           EXIT.

      ******************************************************************
       3000-TEST-PWD-START.

           IF SQL-USER-PWD =
               FUNCTION TRIM(WS-INPUT-USER-PASSWRD) THEN
                 MOVE 'TRUE' TO WS-PASS-CHECK
           END-IF.
       END-3000-TEST-PWD.
           EXIT.

      ******************************************************************
