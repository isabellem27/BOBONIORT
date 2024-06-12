      ****************************************************************** 
      * Gestion du menu pour gérer les contrats client.                *
      *    Programme précédent: menu menu adhérent (menucust.cbl)      *
      *    Programme suivant : dépend du choix de l'utilisateur        *
      *    Le menu affiche le nom, prénom, numéro de sécu de l'adhérent*
      *    les options : affectation, lecture, modification            *
      *    un bouton valider et un bouton retour                       *
      * Auteur: Isabelle                                               *     
      * Date de création : le 11/06/2024                               *
      ****************************************************************** 
       IDENTIFICATION DIVISION.
       PROGRAM-ID. menucont.
       AUTHOR. Isabelle.
      ******************************************************************
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *    gestion des erreurs de saisie
       01 WS-SELECT-OPTION      PIC X(05)   VALUE 'FALSE'     . 
       01 WS-MESSAGE.
           05 WS-MESSAGE1       PIC X(31)
               VALUE 'ERREUR DE SAISIE, VEUILLEZ SELE'        .
           05 WS-MESSAGE2       PIC X(31)
               VALUE 'CTIONNER VOTRE CHOIX AVEC "O".'         .
           05 WS-MESSAGE3       PIC X(45)
               VALUE 'Y COMPRIS POUR VALIDER OU RETOURNER AU MENU.'.    
       01  WS-CUSTOMER          PIC X(45)   VALUE SPACE       .
          
      *    gestion de la saisie
       01  WS-LINK-CHOICE       PIC X(01)   VALUE SPACE       .
       01  WS-READ-CHOICE       PIC X(01)   VALUE SPACE       .
       01  WS-UPDATE-CHOICE     PIC X(01)   VALUE SPACE       .
       01  WS-VALIDE-CHOICE     PIC X(01)   VALUE SPACE       .
       01  WS-RETURN-CHOICE     PIC X(01)   VALUE SPACE       .

      * LINKAGE SECTION.
       01  LK-CUSTOMER.
           05 LK-FIRSTNAME      PIC X(14)                     .
           05 FILLER            PIC X(01)   VALUE SPACE       .
           05 LK-LASTNAME       PIC X(14)                     . 
           05 FILLER            PIC X(01)   VALUE SPACE       .
           05 LK-SECU           PIC X(15)                     .    
      ******************************************************************
       SCREEN SECTION.
           COPY MENU-CONTRACT-SCREEN.CPY
      
      ******************************************************************
       PROCEDURE DIVISION.
      *    USING LK-CUSTOMER. 
      ****************************************************************** 
      * [IM]- le 06-06-2024                                            *
      *    Le paragraphe affiche la screen, contrôle la saisie et      *
      *    appelle le programme correspondant au choix de l'utilisateur*
      ****************************************************************** 
       0000-START-MAIN.          
           PERFORM 1000-SCREEN-LOOP-START THRU END-1000-SCREEN-LOOP.
       END-0000-MAIN.
      *    EXIT PROGRAM.
           STOP RUN.    

      ******************************************************************    
      *    [IM] - le 05-06-2024                                        *
      *    Pour permettre de boucler sur l'affichage en cas d'erreur   *
      *    de saisie de l'utilisateur                                  *
      ****************************************************************** 
       1000-SCREEN-LOOP-START.  
           MOVE 'Jean' TO LK-FIRSTNAME.
           MOVE 'Guarette' TO LK-LASTNAME .
           MOVE '106786227618713' TO LK-SECU .

           PERFORM 1100-PREPARE-SCREEN-START 
                    THRU END-1100-PREPARE-SCREEN.
      

           PERFORM UNTIL WS-SELECT-OPTION = 'TRUE'            
              ACCEPT MENU-CONTRACT-SCREEN  
              PERFORM 3000-WITCH-CHOICE-START
                    THRU END-3000-WITCH-CHOICE
           END-PERFORM.          
       END-1000-SCREEN-LOOP. 
           EXIT.   

      ******************************************************************    
      *    [IM] - le 12-06-2024                                        *
      *    Pour meilleure ergonomie je retire les espaces              *
      ******************************************************************
       1100-PREPARE-SCREEN-START.
           STRING FUNCTION TRIM (LK-FIRSTNAME)
                  SPACE 
                  FUNCTION TRIM (LK-LASTNAME)
                  SPACE 
                  LK-SECU 
           DELIMITED BY SIZE 
           INTO WS-CUSTOMER.  
       END-1100-PREPARE-SCREEN.
           EXIT.

      ******************************************************************    
      *    [IM] - le 11-06-2024                                        *
      *    Je vérifie la saisie                                        *
      ******************************************************************
       3000-WITCH-CHOICE-START.
           IF FUNCTION UPPER-CASE(WS-RETURN-CHOICE)
           EQUAL 'O' THEN
               CALL 'menucust' USING CONTENT LK-CUSTOMER
           ELSE         
              IF FUNCTION UPPER-CASE(WS-VALIDE-CHOICE) 
              EQUAL 'O' THEN
                 IF FUNCTION UPPER-CASE(WS-LINK-CHOICE)
                 EQUAL 'O' THEN
                       CALL 'creacont' USING CONTENT LK-CUSTOMER
                    ELSE IF FUNCTION UPPER-CASE(WS-READ-CHOICE)
                    EQUAL 'O' THEN
                          CALL 'readcont' USING CONTENT LK-CUSTOMER
                       ELSE IF FUNCTION UPPER-CASE(WS-UPDATE-CHOICE)
                       EQUAL 'O' THEN
                             CALL 'updacont' USING CONTENT LK-CUSTOMER 
                          ELSE  
                             PERFORM 9200-ERROR-MESSAGE-START 
                             THRU END-9200-ERROR-MESSAGE
                          END-IF   
              ELSE  
                 PERFORM 9200-ERROR-MESSAGE-START 
                       THRU END-9200-ERROR-MESSAGE
              END-IF    
           END-IF.
       END-3000-WITCH-CHOICE.
           EXIT.

      ******************************************************************    
      *    [IM] - le 06-06-2024                                        *
      *    J'envoie un message si erreur de saisie et efface la saisie *
      ****************************************************************** 
       9200-ERROR-MESSAGE-START. 
            DISPLAY WS-MESSAGE
            LINE 30 COL 50 FOREGROUND-COLOR IS 7.
            INITIALIZE 
                 WS-LINK-CHOICE
                 WS-READ-CHOICE
                 WS-UPDATE-CHOICE
                 WS-VALIDE-CHOICE
                 WS-RETURN-CHOICE .                      
       END-9200-ERROR-MESSAGE.
           EXIT.

      

