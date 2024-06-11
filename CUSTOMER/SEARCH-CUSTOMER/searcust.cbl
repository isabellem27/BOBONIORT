      ******************************************************************
      *    [RD] Le programme appel le FRONT et le BACK qui permettent  *
      *    d'effectuer une recherche d'un adhérent.                    *
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. searcust.
       
      ******************************************************************

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  CUSTOMER-ACCEPT.
           05 CUS-FIRSTNAME     PIC X(20).
           05 CUS-LASTNAME      PIC X(20).
           05 CUS-BIRTHDATE.
               10 CUB-DAYS      PIC X(02).
               10 FILLER        PIC X(01) VALUE '-'.
               10 CUB-MONTH     PIC X(02).
               10 FILLER        PIC X(01) VALUE '-'.
               10 CUB-YEAR      PIC X(04).
           05 CUS-CODE-SECU. 
               10 CCS-SECU-1    PIC X(01).
               10 CCS-SECU-2    PIC X(02).
               10 CCS-SECU-3    PIC X(02).
               10 CCS-SECU-4    PIC X(02).
               10 CCS-SECU-5    PIC X(03).
               10 CCS-SECU-6    PIC X(03).
               10 CCS-SECU-7    PIC X(02).

       01  WS-MENU-RETURN       PIC X(01).
       01  WS-SEARCH-VALIDATION PIC X(01).
       01  WS-ERROR-MESSAGE     PIC X(70).
       01  WS-ERROR-CODE        PIC 9(01).

       01  CUSTOMER-RETURN.
           03 CUR-UUID        PIC X(36).
           03 CUR-GENDER      PIC X(10).
           03 CUR-LASTNAME    PIC X(20).
           03 CUR-FIRSTNAME   PIC X(20).
           03 CUR-ADRESS1	  PIC X(50).
           03 CUR-ADRESS2	  PIC X(50).
           03 CUR-ZIPCODE	  PIC X(15).
           03 CUR-TOWN	      PIC X(50).
           03 CUR-COUNTRY	  PIC X(20).
           03 CUR-PHONE	      PIC X(10).
           03 CUR-MAIL	      PIC X(50).
           03 CUR-BIRTH-DATE  PIC X(10).
           03 CUR-DOCTOR	  PIC X(50).
           03 CUR-CODE-SECU   PIC 9(15).
           03 CUR-CODE-IBAN   PIC X(34).
           03 CUR-NBCHILDREN  PIC 9(03).
           03 CUR-COUPLE      PIC X(05).
           03 CUR-CREATE-DATE PIC X(10).
           03 CUR-UPDATE-DATE PIC X(10).
           03 CUR-CLOSE-DATE  PIC X(10).
           03 CUR-ACTIVE	  PIC X(01).

      ******************************************************************

       PROCEDURE DIVISION.
       0000-START-MAIN.
      *    [RD] Appel du FRONT.
           CALL 
               'scfront'
               USING CUSTOMER-ACCEPT, WS-MENU-RETURN, 
               WS-SEARCH-VALIDATION, WS-ERROR-MESSAGE, WS-ERROR-CODE
           END-CALL.

      *    [RD] Si l'utilisateur a saisi "O" sur "Retour au menu" 
      *    redirigie vers le début de ce programme. 
      *    A CHANGER POUR REDIRIGER VERS LA GESTION D'ADHERENT.
           IF WS-MENU-RETURN EQUAL 'O'
               GO TO 0000-START-MAIN
           END-IF.
      
      *    [RD] Appel du BACK.
           CALL 
               'scback' 
               USING CUSTOMER-ACCEPT, WS-ERROR-CODE, CUSTOMER-RETURN
           END-CALL.

      *    [RD] Si le résultat de la requête SQL est NULL redirige vers 
      *    le début de ce programme avec le message d'erreur adéquat.
           IF CUSTOMER-RETURN EQUAL SPACES
               MOVE "AUCUN ADHERENT TROUVE." TO WS-ERROR-MESSAGE
               GO TO 0000-START-MAIN
           END-IF.

      *    [RD] Appel le MENU D'ADHERENT.
           CALL 'menucust' USING CUSTOMER-RETURN.
       END-0000-MAIN.
           GOBACK.
