           01 SCREEN-INVOICE FOREGROUND-COLOR IS 2.
           05 BLANK SCREEN.

      ******************************************************************
      *    [MF] DEFINITION DU CADRE.                                   *
      ******************************************************************
       COPY 'screen-border.cpy'.

      ******************************************************************
      *    [MF] TITRE.                                              *
      ******************************************************************
           05 FILLER PIC X(20) VALUE  "MENU FACTURE" 
           LINE 6 COL 95 
           FOREGROUND-COLOR IS 2. 

      ******************************************************************
      *    [MF] CHAMPS DE SAISIS.                                   *
      ******************************************************************

      *    [RD] Nom Prénom Numéro de sécu. 
           05 FILLER PIC X(80) FROM WS-CUSTOMER-NAME  
           LINE 11 COL 20
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 7. 

            05 FILLER PIC X(17) VALUE 'Suivi de paiement' 
           LINE 15 COL 95 
           FOREGROUND-COLOR IS 2.

            05 FILLER PIC X(16) VALUE 'Montant initial' 
           LINE 18 COL 60 
           FOREGROUND-COLOR IS 2.

           05 FILLER PIC Z(05)9.99 FROM WS-INITIAL-AMOUNT 
           LINE 18 COL 97
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(17) VALUE 'Montant effectue' 
           LINE 20 COL 60 
           FOREGROUND-COLOR IS 2.

           05 FILLER PIC Z(05)9.99 FROM WS-MADE-AMOUNT 
           LINE 20 COL 97
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(15) VALUE 'Montant restant' 
           LINE 22 COL 60 
           FOREGROUND-COLOR IS 2.

           05 FILLER PIC Z(05)9.99 FROM WS-REMAINING-AMOUNT 
           LINE 22 COL 97
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 3.

       05 FILLER PIC X(28) VALUE 'Ajouter un paiement' 
           LINE 25 COL 60 
           FOREGROUND-COLOR IS 2.

           05 FILLER PIC 9(5).99 USING WS-PAYMENT-AMOUNT
           LINE 25 COL 98 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.

           05 FILLER PIC X(1) USING WS-ACCEPT-PAYMENT
           LINE 25 COL 110  
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.

            05 FILLER PIC X(28) VALUE 'Accepter' 
           LINE 25 COL 112 
           FOREGROUND-COLOR IS 2.

           05 FILLER PIC X(15) VALUE 'Generer facture' 
           LINE 27 COL 60 
           FOREGROUND-COLOR IS 2.

           05 PIC X(01) USING WS-GENERATED-INVOICE  
           LINE 27 COL 77 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 

           05 FILLER PIC X(70) FROM WS-ERROR-MESSAGE
           LINE 30 COL 60 
           FOREGROUND-COLOR IS 8.

           05 FILLER PIC X(11) VALUE 'Retour' 
           LINE 34 COL 172 
           FOREGROUND-COLOR IS 2.

           05 PIC X(01) USING WS-RETURN-MENU  
           LINE 34 COL 170 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.
           