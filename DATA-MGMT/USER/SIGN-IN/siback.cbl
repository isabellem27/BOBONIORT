      ******************************************************************
      *    [YM-AL] Ce programme gère la validation de la saisie des    *
      *    champs :                                                    *
      *    - Identifiant                                               * 
      *    - Mot de passe                                              * 
      ****************************************************************** 
       IDENTIFICATION DIVISION.
       PROGRAM-ID. siback.
       AUTHOR. Alexandre.

      ******************************************************************

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-USER-ID  PIC X(08).
       01  WS-USER-PWD PIC X(09).

       EXEC SQL BEGIN DECLARE SECTION END-EXEC.
       01  DBNAME          PIC X(11) VALUE 'boboniortdb'.   
       01  USERNAME        PIC X(05) VALUE 'cobol'.
       01  PASSWRD         PIC X(05) VALUE 'cbl85'.
      
       01  SQL-USER.    
           03 SQL-USER-ID  PIC X(10).
           03 SQL-USER-PWD PIC X(30).       
       EXEC SQL END DECLARE SECTION END-EXEC.
       EXEC SQL INCLUDE SQLCA END-EXEC.
           
       LINKAGE SECTION.
           01 LK-USER-ID   PIC X(08).
           01 LK-USER-PWD  PIC X(09).
           01 LK-PWD-CHECK PIC X(05) VALUE 'FALSE'.

      ******************************************************************
       PROCEDURE DIVISION USING LK-USER-ID, LK-USER-PWD, LK-PWD-CHECK.
       
       0000-MAIN-START.
           EXEC SQL
              CONNECT :USERNAME IDENTIFIED BY :PASSWRD USING :DBNAME
           END-EXEC.

           MOVE LK-USER-ID  TO WS-USER-ID.
           MOVE LK-USER-PWD TO WS-USER-PWD.

           IF SQLCODE NOT EQUAL ZERO 
               PERFORM 1000-START-ERROR-RTN THRU END-1000-ERROR-RTN
           ELSE
               PERFORM 2000-START-SQL-REQUEST THRU END-2000-SQL-REQUEST
           END-IF.
       END-0000-MAIN.
           EXEC SQL COMMIT WORK END-EXEC.
           EXEC SQL DISCONNECT ALL END-EXEC.  
           GOBACK.

      ******************************************************************
      *    [YM] Bloc de gestion des erreurs pour une valeur de SQLCODE *
      *    différente de 0.                                            *
      ******************************************************************
       1000-START-ERROR-RTN.
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
      *    [RD] Effectue une requête SQL qui récupère les informations *
      *    d'un utilisateur si l'identifiant et le mot de passe        *
      *    saisis à partir de la SCREEN SECTION sont corrects.         * 
      *    S'ils sont corrects, attribu 'TRUE' à la LK-PWD-CHECK.      *        
      ******************************************************************
       2000-START-SQL-REQUEST.

           EXEC SQL
               DECLARE CRUSER CURSOR FOR
               SELECT user_identification, user_password
               FROM user_tab
               WHERE user_identification = trim(:WS-USER-ID)
               AND user_password = trim(:WS-USER-PWD)
           END-EXEC.
           
           EXEC SQL
              OPEN CRUSER
           END-EXEC.

           EXEC SQL
              FETCH CRUSER INTO :SQL-USER-ID, :SQL-USER-PWD
           END-EXEC.

           IF SQLCODE EQUAL ZERO
               MOVE 'TRUE' TO LK-PWD-CHECK
           END-IF.

           EXEC SQL
              CLOSE CRUSER
           END-EXEC.
       END-2000-SQL-REQUEST.
           EXIT.

