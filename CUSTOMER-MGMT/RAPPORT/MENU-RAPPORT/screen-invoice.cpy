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
           LINE 6 COL 86 
           FOREGROUND-COLOR IS 2. 

      ******************************************************************
      *    [MF] CHAMPS DE SAISIS.                                   *
      ******************************************************************

           05 FILLER PIC X(20) FROM WS-CUS-FIRSTNAME 
           LINE 14 COL 45
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 7. 
           05 FILLER PIC X(20) FROM WS-CUS-LASTNAME 
           LINE 15 COL 45
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 7.
            05 FILLER PIC X(17) VALUE 'Suivi de paiement' 
           LINE 15 COL 95 
           FOREGROUND-COLOR IS 2.
            05 FILLER PIC X(16) VALUE 'Montant initial' 
           LINE 18 COL 60 
           FOREGROUND-COLOR IS 2.
           05 FILLER PIC X(17) FROM DISPLAY-INVOICE-EXPECT 
           LINE 18 COL 97
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 7.
           05 FILLER PIC X(17) VALUE 'Montant effectue' 
           LINE 20 COL 60 
           FOREGROUND-COLOR IS 2.
           05 FILLER PIC X(17) FROM DISPLAY-INVOICE-INCOME 
           LINE 20 COL 97
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 7.
           05 FILLER PIC X(7) VALUE 'Restant' 
           LINE 22 COL 60 
           FOREGROUND-COLOR IS 2.
           05 FILLER PIC X(17) FROM DISPLAY-RESULT 
           LINE 22 COL 97
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 7.
       05 FILLER PIC X(28) VALUE 'Ajouter un paiement' 
           LINE 24 COL 60 
           FOREGROUND-COLOR IS 2.
           05 FILLER PIC 9(5).99 TO WS-PAID-INCOME-INPUT
           LINE 24 COL 97 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.
           05 FILLER PIC X(1) TO WS-PAID-INCOME-BUTTON
           LINE 24 COL 110  
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.
            05 FILLER PIC X(28) VALUE 'Accepter' 
           LINE 24 COL 112 
           FOREGROUND-COLOR IS 2.
           05 FILLER PIC X(70) FROM WS-ERROR-MESSAGE
           LINE 27 COL 50 
           FOREGROUND-COLOR IS 8.
          
         



           05 FILLER PIC X(11) VALUE 'Retour menu' 
           LINE 34 COL 172 
           FOREGROUND-COLOR IS 2.

           05 PIC X(01) USING WS-RETURN-CHOICE  
           LINE 34 COL 170 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.
           
           05 FILLER PIC X(15) VALUE 'Generer facture' 
           LINE 34 COL 20 
           FOREGROUND-COLOR IS 2.

           05 PIC X(01) USING WS-GENERATE-CHOICE  
           LINE 34 COL 18 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 