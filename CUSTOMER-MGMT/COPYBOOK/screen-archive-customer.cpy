           01 SCREEN-ARCHIVE-CUSTOMER FOREGROUND-COLOR IS 2.
           05 BLANK SCREEN.

      ******************************************************************
      *    [SK] DEFINITION DU CADRE.                                   *
      ******************************************************************
       COPY 'screen-border.cpy'. 

      ******************************************************************
      *    [SK] TITRE.                                                 *
      ******************************************************************
           05 FILLER PIC X(22) VALUE 'ARCHIVER UN ADHERENT' 
           LINE 6 COL 90 
           FOREGROUND-COLOR IS 2. 

      ******************************************************************
      *    [SK] CHAMPS DE SAISIS.                                      *
      ******************************************************************
        
      *    [AL] Message  .
           05 FILLER PIC X(33) 
           VALUE "Attention, vous etes sur le point" 
           LINE 20 COL 65
           FOREGROUND-COLOR IS 2.  

           05 FILLER PIC X(32) 
           VALUE "d'archiver les informations de :" 
           LINE 20 COL 99
           FOREGROUND-COLOR IS 2. 
    
           05 FILLER PIC X(41) FROM WS-CUS-NAME
           LINE 20 COL 133 
           FOREGROUND-COLOR IS 3.
           
      *    [SK-AL] Bouton  .
           05 FILLER PIC X(24) VALUE "Archiver l'adherent    :" 
           LINE 22 COL 65
           FOREGROUND-COLOR IS 2. 

           05 FILLER PIC X(01) TO WS-ACCEPT 
           LINE 22 COL 100
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 

      *    [SK-AL] zone message d'erreur.
           05 FILLER PIC X(35) FROM WS-ERROR-MESSAGE 
           LINE 25 COL 65 AUTO 
           FOREGROUND-COLOR IS 8.

      *    [SK-AL] Bouton retour au menu.
           05 FILLER PIC X(01) TO LK-RETURN-CHOICE 
           LINE 34 COL 170 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 

           05 FILLER PIC X(14) VALUE 'Retour' 
           LINE 34 COL 172 
           FOREGROUND-COLOR IS 2.
