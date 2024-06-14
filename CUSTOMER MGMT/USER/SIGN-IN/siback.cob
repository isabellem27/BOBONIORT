      ******************************************************************
      *    [YM-AL] Ce programme gère la validation de la saisie des    *
      *    champs :                                                    *
      *    - Identifiant                                               * 
      *    - Mot de passe                                              * 
      ****************************************************************** 
       IDENTIFICATION DIVISION.
       PROGRAM-ID. siback.
       AUTHOR.       Yves.

      ******************************************************************

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-USER-ID  PIC X(08).
       01  WS-USER-PWD PIC X(09).

OCESQL*EXEC SQL BEGIN DECLARE SECTION END-EXEC.
       01  DBNAME          PIC X(11) VALUE 'boboniortdb'.   
       01  USERNAME        PIC X(05) VALUE 'cobol'.
       01  PASSWRD         PIC X(05) VALUE 'cbl85'.
      
       01  SQL-USER.    
           03 SQL-USER-ID  PIC X(10).
           03 SQL-USER-PWD PIC X(30).       
OCESQL*EXEC SQL END DECLARE SECTION END-EXEC.
OCESQL*EXEC SQL INCLUDE SQLCA END-EXEC.
OCESQL     copy "sqlca.cbl".
           
OCESQL*
OCESQL 01  SQ0001.
OCESQL     02  FILLER PIC X(014) VALUE "DISCONNECT ALL".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
OCESQL 01  SQ0002.
OCESQL     02  FILLER PIC X(125) VALUE "SELECT user_identification, us"
OCESQL  &  "er_password FROM user_tab WHERE user_identification = trim"
OCESQL  &  "( $1 ) AND user_password = trim( $2 )".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
       LINKAGE SECTION.
           01 LK-USER-ID   PIC X(08).
           01 LK-USER-PWD  PIC X(09).
           01 LK-PWD-CHECK PIC X(05) VALUE 'FALSE'.

      ******************************************************************
       PROCEDURE DIVISION USING LK-USER-ID, LK-USER-PWD, LK-PWD-CHECK.
       
       0000-MAIN-START.
OCESQL*    EXEC SQL
OCESQL*       CONNECT :USERNAME IDENTIFIED BY :PASSWRD USING :DBNAME
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLConnect" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE USERNAME
OCESQL          BY VALUE 5
OCESQL          BY REFERENCE PASSWRD
OCESQL          BY VALUE 5
OCESQL          BY REFERENCE DBNAME
OCESQL          BY VALUE 11
OCESQL     END-CALL.

           MOVE LK-USER-ID  TO WS-USER-ID.
           MOVE LK-USER-PWD TO WS-USER-PWD.

           IF SQLCODE NOT EQUAL ZERO 
               PERFORM 1000-START-ERROR-RTN THRU END-1000-ERROR-RTN
           ELSE
               PERFORM 2000-START-SQL-REQUEST THRU END-2000-SQL-REQUEST
           END-IF.
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
OCESQL*          EXEC SQL
OCESQL*              ROLLBACK
OCESQL*          END-EXEC
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLExec" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "ROLLBACK" & x"00"
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL
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

OCESQL*    EXEC SQL
OCESQL*        DECLARE CRUSER CURSOR FOR
OCESQL*        SELECT user_identification, user_password
OCESQL*        FROM user_tab
OCESQL*        WHERE user_identification = trim(:WS-USER-ID)
OCESQL*        AND user_password = trim(:WS-USER-PWD)
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 8
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-USER-ID
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 9
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-USER-PWD
OCESQL     END-CALL
OCESQL     CALL "OCESQLCursorDeclareParams" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "siback_CRUSER" & x"00"
OCESQL          BY REFERENCE SQ0002
OCESQL          BY VALUE 2
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL.
           
OCESQL*    EXEC SQL
OCESQL*       OPEN CRUSER
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLCursorOpen" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "siback_CRUSER" & x"00"
OCESQL     END-CALL.

OCESQL*    EXEC SQL
OCESQL*       FETCH CRUSER INTO :SQL-USER-ID, :SQL-USER-PWD
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-USER-ID
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 30
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-USER-PWD
OCESQL     END-CALL
OCESQL     CALL "OCESQLCursorFetchOne" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "siback_CRUSER" & x"00"
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL.

           IF SQLCODE EQUAL ZERO
               MOVE 'TRUE' TO LK-PWD-CHECK
           END-IF.

OCESQL*    EXEC SQL
OCESQL*       CLOSE CRUSER
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLCursorClose"  USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "siback_CRUSER" & x"00"
OCESQL     END-CALL
OCESQL    .
       END-2000-SQL-REQUEST.
           EXIT.



