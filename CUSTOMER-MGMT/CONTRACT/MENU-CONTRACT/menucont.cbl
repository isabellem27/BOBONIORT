      ****************************************************************** 
      * Gestion du menu pour gérer les contrats client.                *
      *    Programme précédent: menu menu adhérent (menucust.cbl)      *
      *    Programme suivant : dépend du choix de l'utilisateur        *
      *    Le menu affiche le nom, prénom, numéro de sécu de l'adhérent*
      *    les options : affectation, lecture, modification            *
      *    un bouton valider et un bouton retour                       *
      * Auteur: Isabelle                                               *     
      * Date de création : le 11/06/2024                               *
      *                                                                *
      *    [IM] - le 11/06/2024 - Modification pour intégrer le        *       
      *                        LK-CUSTOMER complet                     *      
      ****************************************************************** 
       IDENTIFICATION DIVISION.
       PROGRAM-ID. menucont RECURSIVE.
       AUTHOR. Isabelle.
      ******************************************************************
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *    gestion des erreurs de saisie
       01 WS-SELECT-OPTION         PIC X(05) VALUE 'FALSE'. 
       01 WS-ERROR-MESSAGE         PIC X(70).    
       01  WS-CUSTOMER             PIC X(45).
          
      *    gestion de la saisie
       01  WS-LINK-CHOICE          PIC X(01).
       01  WS-READ-CHOICE          PIC X(01).
       01  WS-UPDATE-CHOICE        PIC X(01).
       01  WS-RETURN-CHOICE        PIC X(01).

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
           COPY 'screen-menu-contract.cpy'.
      
      ******************************************************************
       PROCEDURE DIVISION USING LK-CUSTOMER. 
      ****************************************************************** 
      * [IM]- le 06-06-2024                                            *
      *    Le paragraphe affiche la screen, contrôle la saisie et      *
      *    appelle le programme correspondant au choix de l'utilisateur*
      ****************************************************************** 
       0000-START-MAIN.          
           PERFORM 1000-SCREEN-LOOP-START THRU END-1000-SCREEN-LOOP.
       END-0000-MAIN.
           GOBACK.    

      ******************************************************************    
      *    [IM] - le 05-06-2024                                        *
      *    Pour permettre de boucler sur l'affichage en cas d'erreur   *
      *    de saisie de l'utilisateur                                  *
      ****************************************************************** 
       1000-SCREEN-LOOP-START.  
           INITIALIZE WS-SELECT-OPTION
                      WS-LINK-CHOICE  
                      WS-READ-CHOICE  
                      WS-UPDATE-CHOICE
                      WS-RETURN-CHOICE .

           PERFORM 1100-PREPARE-SCREEN-START 
                    THRU END-1100-PREPARE-SCREEN.
      
           PERFORM UNTIL WS-SELECT-OPTION = 'TRUE'            
              ACCEPT screen-menu-contract  
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
           STRING FUNCTION TRIM (LK-CUS-FIRSTNAME)
                  SPACE 
                  FUNCTION TRIM (LK-CUS-LASTNAME)
                  SPACE 
                  LK-CUS-CODE-SECU(1:1) '-' 
                  LK-CUS-CODE-SECU(2:2) '-'
                  LK-CUS-CODE-SECU(4:2) '-'
                  LK-CUS-CODE-SECU(6:2) '-'
                  LK-CUS-CODE-SECU(8:3) '-'
                  LK-CUS-CODE-SECU(11:3) '-'
                  LK-CUS-CODE-SECU(14:2) 
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
               INITIALIZE WS-ERROR-MESSAGE
               CALL 'mcfront' USING CONTENT LK-CUS-UUID

           ELSE IF FUNCTION UPPER-CASE(WS-LINK-CHOICE)
                   EQUAL 'O' THEN         
               CALL 
                   'clascont' 
                   USING BY REFERENCE 
                   LK-CUSTOMER, WS-ERROR-MESSAGE
               END-CALL

           ELSE IF FUNCTION UPPER-CASE(WS-READ-CHOICE)
                   EQUAL 'O' THEN
               CALL 
                   'readcont' 
                   USING BY REFERENCE 
                   LK-CUSTOMER, WS-ERROR-MESSAGE
               END-CALL

      *    ELSE IF FUNCTION UPPER-CASE(WS-UPDATE-CHOICE)
      *            EQUAL 'O' THEN
      *        CALL 'updacont' USING CONTENT LK-CUSTOMER

           ELSE  
               PERFORM 9200-ERROR-MESSAGE-START 
                  THRU END-9200-ERROR-MESSAGE
           END-IF.
       END-3000-WITCH-CHOICE.
           EXIT.

      ******************************************************************    
      *    [IM] - le 06-06-2024                                        *
      *    J'envoie un message si erreur de saisie et efface la saisie *
      ****************************************************************** 
       9200-ERROR-MESSAGE-START. 
            INITIALIZE 
                 WS-LINK-CHOICE
                 WS-READ-CHOICE
                 WS-UPDATE-CHOICE
                 WS-RETURN-CHOICE .  

           MOVE 'Veuillez entrer "O" pour confirmer.' 
           TO WS-ERROR-MESSAGE.                    
       END-9200-ERROR-MESSAGE.
           EXIT.

      

