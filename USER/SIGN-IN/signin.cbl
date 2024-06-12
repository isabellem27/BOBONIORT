       IDENTIFICATION DIVISION.
       PROGRAM-ID. signin.

      ******************************************************************       
       
       ENVIRONMENT DIVISION.

      ******************************************************************

       DATA DIVISION.

       WORKING-STORAGE SECTION.

       01  WS-INPUT-DATAS.
           05 WS-INPUT-USER-ID        PIC X(08).
           05 WS-INPUT-USER-PASSWRD   PIC X(09).
           05 WS-ERROR-MESSAGE        PIC x(45). 
           05 WS-PASS-CHECK           PIC X(05) VALUE 'FALSE'.    

       01  SC-OPTIONS-START.
           05 SC-USER-NAME            PIC X(14).
           05 SC-PASS                 PIC X(14).
           05 SC-CONNECT              PIC X(01).    
           05 SC-ERROR-MESSAGE        PIC x(45).                     

       01  WS-SELECT-OPTION            PIC X(05) VALUE 'FALSE'.  
       01  WS-ERROR-MANAGEMENT         PIC x(45). 

       01  WS-MSG-ERROR-O     PIC X(35) 
           VALUE 'Veuillez entrer "O" pour confirmer.'.
       01  WS-MSG-VALIDATE    PIC X(19) 
           VALUE 'Connexion reussie !'.
       01  WS-MSG-ECHEC       PIC X(45) 
           VALUE 'Connexion echouee, verifier vos identifiants.'.
      ******************************************************************
       SCREEN SECTION.
           COPY 'screen-connexion.cpy'.   

       PROCEDURE DIVISION.

      ******************************************************************      
       0000-START-MAIN.

      *    AL - Boucle d'affichage de la gestion de la connection

           PERFORM UNTIL WS-SELECT-OPTION = 'TRUE'
 
               INITIALIZE 
               SC-USER-NAME
               SC-PASS

           ACCEPT SCREEN-CONNECTION
        

      *    YM -AL contrôle de la validation "O"      
           PERFORM 1200-START-VALIDATION 
                THRU 1200-END-VALIDATION

           MOVE WS-ERROR-MANAGEMENT TO SC-ERROR-MESSAGE

            END-PERFORM.
      *         CALL 'menuuser' 

       END-0000-MAIN.
           STOP RUN.       
   

      ******************************************************************
       1200-START-VALIDATION.
 
           MOVE FUNCTION UPPER-CASE (SC-CONNECT) TO SC-CONNECT.   

           
      *    AL - YM Double verification "o" et requete SQL validé
           IF SC-CONNECT EQUAL "O" 
               PERFORM 1000-START-CONTROL-INPUT 
                    THRU 1000-END-CONTROL-INPUT    
           ELSE   
               MOVE   WS-MSG-ERROR-O
                 TO   WS-ERROR-MANAGEMENT
           END-IF.

       1200-END-VALIDATION.
           EXIT.
      ******************************************************************
       1000-START-CONTROL-INPUT.

      *    AL- YM sauvegarde des saisies pour traitement
           MOVE SC-USER-NAME TO WS-INPUT-USER-ID.
           MOVE SC-PASS      TO WS-INPUT-USER-PASSWRD.

      *    AL - YM envoie des saisies en Back
           CALL 'siback'  USING BY REFERENCE WS-INPUT-DATAS.   

      *    Lecture du contrôle de la requette SQL
           IF  WS-PASS-CHECK       EQUAL 'TRUE' 
               MOVE WS-MSG-VALIDATE       TO WS-ERROR-MANAGEMENT
               MOVE 'TRUE'                TO WS-SELECT-OPTION      
             ELSE
               MOVE WS-MSG-ECHEC
               TO   WS-ERROR-MANAGEMENT
           END-IF.


       1000-END-CONTROL-INPUT.
           EXIT.  
      ******************************************************************

