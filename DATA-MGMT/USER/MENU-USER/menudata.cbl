      ****************************************************************** 
      * Gestion du menu des fonctionnalités non liées à un adhérent.   *
      *    Programme précédent: écran de connexion de l'utilisateur    *
      *                         (sifront.cbl)                          *
      *    Programme suivant : dépend du choix de l'utilisateur        *
      *    Le menu affiche les options : Statistiques,                 *
      *                                  chargement d'un fichier csv,  *
      *                                                                *
      *    un bouton valider et un bouton sortir                       *
      * Auteur: Isabelle                                               *     
      * Date de création : le 18/06/2024                               * 
      ****************************************************************** 
       IDENTIFICATION DIVISION.
       PROGRAM-ID. menudata RECURSIVE.
       AUTHOR. Isabelle.

      ******************************************************************
       ENVIRONMENT DIVISION.
      
      ******************************************************************
       DATA DIVISION.
       WORKING-STORAGE SECTION. 
       01  WS-BUTTONS-MENU-DATA.
           05 WS-STAT              PIC X(01)                     .
           05 WS-FILE              PIC X(01)                     .   
           05 WS-VALIDATE          PIC X(01)                     .
           05 WS-EXIT              PIC X(01)                     .
       01  SC-MESSAGE              PIC X(70)                     .                     
       
       01 WS-MESSAGE.
           05 WS-MESSAGE1          PIC X(31)
               VALUE 'ERREUR DE SAISIE, VEUILLEZ SELE'           .
           05 WS-MESSAGE2          PIC X(31)
               VALUE 'CTIONNER VOTRE CHOIX AVEC "O".'            .
       
       01 WS-SELECT-OPTION         PIC X(05)      VALUE 'FALSE'  .  
 
      ******************************************************************
       SCREEN SECTION.      
       COPY 'screen-menu-data.cpy'.   

      ******************************************************************
       PROCEDURE DIVISION.      
       0000-START-MAIN.
           PERFORM 1000-CONTROL-IMPUT-START 
                    THRU END-1000-CONTROL-IMPUT.
       END-0000-MAIN.
           STOP RUN.

      ******************************************************************      
      *    SK- Boucle d'affichage de la gestion du menu en cas d'erreur   
      *    de saisie de l'utilisateur   
      ******************************************************************
       1000-CONTROL-IMPUT-START.
           INITIALIZE WS-BUTTONS-MENU-DATA SC-MESSAGE. 
           PERFORM UNTIL WS-SELECT-OPTION = 'TRUE'               
              ACCEPT SCREEN-MENU-DATA 
              PERFORM 1100-CHECK-CHOICE-START 
              THRU END-1100-CHECK-CHOICE
           END-PERFORM.
       END-1000-CONTROL-IMPUT.
           EXIT.    

      ******************************************************************      
      *     SK - Vérifie la saisine utilisateur : 'O' dans l'input
      *     et appelle le sous programme necessaire.
      ******************************************************************
       1100-CHECK-CHOICE-START.  
           IF FUNCTION UPPER-CASE(WS-EXIT) EQUAL 'O' THEN               
                 PERFORM END-0000-MAIN

   
      *     ELSE  IF FUNCTION UPPER-CASE(WS-VALIDATE) EQUAL 'O' THEN
           ELSE  IF FUNCTION UPPER-CASE(WS-STAT) EQUAL 'O' THEN            
                                
                          CALL 'stfront'      
                 ELSE  IF FUNCTION UPPER-CASE(WS-FILE) EQUAL 'O' THEN        
                             CALL 'cffront'                   
                       ELSE  
                           PERFORM 9200-ERROR-MESSAGE-START 
                                THRU END-9200-ERROR-MESSAGE
                 END-IF  
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
       
