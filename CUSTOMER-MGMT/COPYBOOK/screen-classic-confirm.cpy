       01  SCREEN-CLASSIC-CONFIRM FOREGROUND-COLOR IS 2.
           05 BLANK SCREEN.         
      * [IM] - message de confirmation
           05 FILLER PIC X(35) 
           VALUE 'CONFIRMEZ-VOUS LE CHOIX DU CONTRAT '
           LINE 10 COL 88
           FOREGROUND-COLOR IS 2.  
           05 FILLER PIC X(10) FROM  WS-CONTRACT
           LINE 10 COL 123
           FOREGROUND-COLOR IS 7. 

      * [RD] - Zone de message d'erreur.
           05 FILLER PIC X(70) FROM WS-ERROR-MESSAGE2
           LINE 14 COL 88 
           FOREGROUND-COLOR IS 7. 

      * [IM] - boutons de confirmation
           05 FILLER PIC X(3) VALUE 'OUI'
           LINE 18 COL 90
           FOREGROUND-COLOR IS 3. 
           05 PIC X USING SC-BUTTON-OUI
           COL 95 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0. 

           05 FILLER PIC X(3) VALUE 'NON'
           LINE 18 COL 125
           FOREGROUND-COLOR IS 3. 
           05 PIC X USING SC-BUTTON-NON
           COL 130 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0. 

      * [IM] - cadre page de confirmation
           05 FILLER PIC X(51) VALUE all ' ' LINE 7 COL 85 
           BACKGROUND-COLOR IS 2.
           05 FILLER PIC X(01) VALUE  ' ' LINE 8 COL 85 
           BACKGROUND-COLOR IS 2.
           05 FILLER PIC X(01) VALUE  ' '  COL 135 
           BACKGROUND-COLOR IS 2.
           05 FILLER PIC X(01) VALUE  ' ' LINE 9 COL 85 
           BACKGROUND-COLOR IS 2.
           05 FILLER PIC X(01) VALUE  ' '  COL 135  
           BACKGROUND-COLOR IS 2.
           05 FILLER PIC X(01) VALUE  ' ' LINE 10 COL 85 
           BACKGROUND-COLOR IS 2.
           05 FILLER PIC X(01) VALUE  ' '  COL 135  
           BACKGROUND-COLOR IS 2.
           05 FILLER PIC X(01) VALUE  ' ' LINE 11 COL 85 
           BACKGROUND-COLOR IS 2.
           05 FILLER PIC X(01) VALUE  ' '  COL 135 
           BACKGROUND-COLOR IS 2.
           05 FILLER PIC X(01) VALUE  ' ' LINE 12 COL 85 
           BACKGROUND-COLOR IS 2.
           05 FILLER PIC X(01) VALUE  ' '  COL 135  
           BACKGROUND-COLOR IS 2.
           05 FILLER PIC X(01) VALUE  ' ' LINE 13 COL 85 
           BACKGROUND-COLOR IS 2.
           05 FILLER PIC X(01) VALUE  ' '  COL 135  
           BACKGROUND-COLOR IS 2.
           05 FILLER PIC X(01) VALUE  ' ' LINE 14 COL 85 
           BACKGROUND-COLOR IS 2.
           05 FILLER PIC X(01) VALUE  ' '  COL 135  
           BACKGROUND-COLOR IS 2.
           05 FILLER PIC X(01) VALUE  ' ' LINE 15 COL 85 
           BACKGROUND-COLOR IS 2.
           05 FILLER PIC X(01) VALUE  ' '  COL 135  
           BACKGROUND-COLOR IS 2.
           05 FILLER PIC X(01) VALUE  ' ' LINE 16 COL 85 
           BACKGROUND-COLOR IS 2.
           05 FILLER PIC X(01) VALUE  ' '  COL 135  
           BACKGROUND-COLOR IS 2.
           05 FILLER PIC X(01) VALUE  ' ' LINE 17 COL 85 
           BACKGROUND-COLOR IS 2.
           05 FILLER PIC X(01) VALUE  ' '  COL 135  
           BACKGROUND-COLOR IS 2.
           05 FILLER PIC X(01) VALUE  ' ' LINE 18 COL 85 
           BACKGROUND-COLOR IS 2.
           05 FILLER PIC X(01) VALUE  ' '  COL 135  
           BACKGROUND-COLOR IS 2.
           05 FILLER PIC X(01) VALUE  ' ' LINE 19 COL 85 
           BACKGROUND-COLOR IS 2.
           05 FILLER PIC X(01) VALUE  ' '  COL 135  
           BACKGROUND-COLOR IS 2.   
           05 FILLER PIC X(51) VALUE all ' ' LINE 20 COL 85 
           BACKGROUND-COLOR IS 2.

           


