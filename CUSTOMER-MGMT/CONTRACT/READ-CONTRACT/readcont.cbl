****************************************************************** 
       IDENTIFICATION DIVISION.
       PROGRAM-ID. readcont.
       AUTHOR. Martial.
      ******************************************************************
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  SC-MENU-RETURN          PIC X.
       01  SC-MODIFY-CONTRACT      PIC X.
       01  WS-CONTRACT-TYPE              PIC X(20)     .
       01  W--NUM           PIC 9(01)   VALUE 0           .  
       01  WS-DOCTOR        PIC Z(02)9  VALUE 0           . 
       01  WS-PARMEDICAL    PIC Z(02)9  VALUE 0           .      
       01  WS-HOSPITAL      PIC Z(02)9  VALUE 0           . 
       01  WS-S-GLASSES     PIC Z(02)9  VALUE 0           . 
       01  WS-P-GLASSES     PIC Z(02)9  VALUE 0           . 
       01  WS-MOLAR         PIC Z(02)9  VALUE 0           . 
       01  WS-NON-MOLAR     PIC Z(02)9  VALUE 0           . 
       01  WS-DESCALINGS    PIC Z(02)9  VALUE 0           .
       
       01  WS-CURRENT-DATE          PIC 9(8).   
       01  WS-CURRENT-YEAR          PIC 9(4).
       01  WS-CURRENT-MONTH         PIC 9(2).
       01  WS-CURRENT-DAY           PIC 9(2). 

       01  WS-BIRTH-YEAR            PIC 9(4).
       01  WS-BIRTH-MONTH           PIC 9(2).
       01  WS-BIRTH-DAY             PIC 9(2).

       01  WS-CALCULATED-AGE        PIC 9(3).

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
           03 WS-CUS-NBCHILDREN    PIC 9(03).
           03 WS-CUS-COUPLE        PIC X(05).
           03 WS-CUS-CREATE-DATE   PIC X(10).
           03 WS-CUS-UPDATE-DATE   PIC X(10).
           03 WS-CUS-CLOSE-DATE    PIC X(10).
           03 WS-CUS-ACTIVE	       PIC X(01).

           EXEC SQL BEGIN DECLARE SECTION END-EXEC.
       01  DBNAME   PIC  X(11) VALUE 'boboniortb'.
       01  USERNAME PIC  X(05) VALUE 'cobol'.
       01  PASSWD   PIC  X(10) VALUE 'cbl85'.

       01  SQL-CUS-UUID        PIC X(36).
       EXEC SQL END DECLARE SECTION END-EXEC.
       EXEC SQL INCLUDE SQLCA END-EXEC.

       LINKAGE SECTION.
       01 LK-CUSTOMER.
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
      ******************************************************************
       SCREEN SECTION.
           COPY 'READ-SCREEN.cpy'.
      
      ******************************************************************
       PROCEDURE DIVISION. 
           ACCEPT SCREEN-FRAME.


       0000-START-MAIN.
           EXEC SQL
               CONNECT :USERNAME IDENTIFIED BY :PASSWD USING :DBNAME 
           END-EXEC.
        
           MOVE LK-CUSTOMER TO WS-CUSTOMER.
           PERFORM CALCULATE-AGE.
           PERFORM DETERMINE-CONTRACT-TYPE.
          
       

       0000-END-MAIN.  
             
           EXEC SQL COMMIT WORK END-EXEC.
           EXEC SQL DISCONNECT ALL END-EXEC.
           
           GOBACK.

       CALCULATE-AGE.
           MOVE FUNCTION CURRENT-DATE (1:4) TO WS-CURRENT-YEAR.
           MOVE FUNCTION CURRENT-DATE (5:2) TO WS-CURRENT-MONTH.
           MOVE FUNCTION CURRENT-DATE (7:2) TO WS-CURRENT-DAY.

           MOVE WS-CUS-BIRTH-DATE (1:4) TO WS-BIRTH-YEAR.
           MOVE WS-CUS-BIRTH-DATE (6:2) TO WS-BIRTH-MONTH.
           MOVE WS-CUS-BIRTH-DATE (8:2) TO WS-BIRTH-DAY.

           COMPUTE WS-CALCULATED-AGE = WS-CURRENT-YEAR - WS-BIRTH-YEAR

           IF (WS-CURRENT-MONTH < WS-BIRTH-MONTH) OR
              (WS-CURRENT-MONTH = WS-BIRTH-MONTH AND WS-CURRENT-DAY <
               WS-BIRTH-DAY)
               SUBTRACT 1 FROM WS-CALCULATED-AGE
           END-IF.

       DETERMINE-CONTRACT-TYPE.
           EXEC SQL
               SELECT CLASSIC_REIMBURSEMENT_LABEL
               INTO :WS-CONTRACT-TYPE
               FROM CLASSIC_REIMBURSEMENT
               WHERE CLASSIC_REIMBURSEMENT_NUMBER = (
                   SELECT CLASSIC_REIMBURSEMENT_NUMBER
                   FROM COST_CONDITION
                   WHERE (COST_CONDITION_AGEMIN 
                   <= :WS-CALCULATED-AGE
                         AND (COST-CONDITION_AGEMAX 
                         >= :WS-CALCULATED-AGE
                          OR COST_CONDITION_AGEMAX = 0))
                     AND (COST_CONDITION_COUPLE = :WS-CUS-COUPLE)
                     AND (COST_CONDITION_TYPE = '1' AND 
                     :WS-CUS-NBCHILDREN > 0)
                     OR (COST_CONDITION_TYPE = '2' AND 
                     :WS-CUS-NBCHILDREN = 0)
                     LIMIT 1
               )
           END-EXEC.
            EXEC SQL
               SELECT CLASSIC_REIMBURSEMENT_DOCTOR,
                      CLASSIC_REIMBURSEMENT_PARMEDICAL,
                      CLASSIC_REIMBURSEMENT_HOSPITAL,
                      CLASSIC_REIMBURSEMENT_SINGLE_GLASSES,
                      CLASSIC_REIMBURSEMENT_PROGRESSIVE_GLASSES,
                      CLASSIC_REIMBURSEMENT_MOLAR_CROWNS,
                      CLASSIC_REIMBURSEMENT_NON_MOLAR_CROWNS,
                      CLASSIC_REIMBURSEMENT_DESCALINGS
               INTO :WS-DOCTOR,
                    :WS-PARMEDICAL,
                    :WS-HOSPITAL,
                    :WS-S-GLASSES,
                    :WS-P-GLASSES,
                    :WS-MOLAR,
                    :WS-NON-MOLAR,
                    :WS-DESCALINGS
               FROM CLASSIC_REIMBURSEMENT
               WHERE CLASSIC_REIMBURSEMENT_LABEL = :WS-CONTRACT-TYPE
           END-EXEC.
