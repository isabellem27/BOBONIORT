      ****************************************************************** 
      * Chargement d'un fichier client csv.                            *
      *    Programme précédent: menu des fonctionnalités annexes       *
      *                         (menudata.cbl)                         *
      *    Programme suivant : cfback.cbl puis menudata.cbl            *
      *    L'écran affiche le nom du fichier à charger                 *
      *                                                                *
      *    un bouton valider et un bouton retour au menu               *
      * Auteur: Isabelle                                               *     
      * Date de création : le 18/06/2024                               * 
      ****************************************************************** 
       IDENTIFICATION DIVISION.
       PROGRAM-ID. cffront RECURSIVE.
       AUTHOR. Isabelle.

      ******************************************************************
       ENVIRONMENT DIVISION.
      
      ******************************************************************
       DATA DIVISION.
       WORKING-STORAGE SECTION. 
       01  WS-BUTTONS-SCREEN.
           05 WS-VALIDATE          PIC X(01)                     .   
           05 WS-RETURN            PIC X(01)                     .
       01  SC-FILE              PIC X(100)                    .    
       01  SC-MESSAGE              PIC X(70)      VALUE SPACES   .                    
       
       01 WS-MESSAGE.
           05 WS-MESSAGE1          PIC X(31)
               VALUE 'ERREUR DE SAISIE, VEUILLEZ SELE'           .
           05 WS-MESSAGE2          PIC X(31)
               VALUE 'CTIONNER VOTRE CHOIX AVEC "O".'            .
       
       01 WS-SELECT-OPTION         PIC X(05)      VALUE 'FALSE'  .  
 
      ******************************************************************
       SCREEN SECTION.      
       COPY 'screen-charge-file.cpy'.   

      ******************************************************************
       PROCEDURE DIVISION.      
       0000-START-MAIN.
           MOVE 'C:\BOBONIORT\CHARGE-FILES\individus.csv' TO SC-FILE.
           PERFORM 1000-CONTROL-IMPUT-START 
           THRU END-1000-CONTROL-IMPUT.
       END-0000-MAIN.
           STOP RUN.
      *    GOBACK.

      ******************************************************************      
      *    SK- Boucle d'affichage de la gestion du menu en cas d'erreur   
      *    de saisie de l'utilisateur   
      ******************************************************************
       1000-CONTROL-IMPUT-START.
           INITIALIZE WS-BUTTONS-SCREEN SC-MESSAGE.
           PERFORM UNTIL WS-SELECT-OPTION = 'TRUE'               
              ACCEPT SCREEN-CHARGE-FILE 
              PERFORM 1100-CHECK-CHOICE-START 
              THRU END-1100-CHECK-CHOICE
           END-PERFORM.
       END-1000-CONTROL-IMPUT.
           EXIT.    

      ******************************************************************      
      *     SK - Vérifie la saisine utilisateur : 'O' dans l'input
      *     et appelle le programme correspondant.
      ******************************************************************
       1100-CHECK-CHOICE-START.      
            IF FUNCTION UPPER-CASE(WS-VALIDATE) 
            EQUAL 'O' THEN
               CALL 'cfback'      
            ELSE IF FUNCTION UPPER-CASE(WS-RETURN)
                 EQUAL 'O' THEN
                    CALL 'menudata'                   
                 ELSE  
                    PERFORM 9200-ERROR-MESSAGE-START 
                    THRU END-9200-ERROR-MESSAGE
            END-IF.          
       END-1100-CHECK-CHOICE.
           EXIT.   
      ******************************************************************     
      *                      GESTION DES ERREURS                       *
      ******************************************************************     
      ******************************************************************    
      *    [IM] - le 18-06-2024                                        *
      *    J'envoie un message si erreur de saisie et efface la saisie *
      ****************************************************************** 
       9200-ERROR-MESSAGE-START.
           INITIALIZE SC-MESSAGE.
           STRING
               'ERREUR DE SAISIE, VEUILLEZ SELECTIONNER VOTRE CHOIX'           
               SPACE 'AVEC "O"'
               DELIMITED BY SIZE
               INTO SC-MESSAGE
           END-STRING.        
       END-9200-ERROR-MESSAGE.
           EXIT.

      ******************************************************************       
       
