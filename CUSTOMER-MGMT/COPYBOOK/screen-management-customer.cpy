       01  SCREEN-MANAGEMENT-CUSTOMER FOREGROUND-COLOR IS 2.
           05 BLANK SCREEN.

      ******************************************************************
      *    [IM-RD] DEFINITION DU CADRE.                                *
      ******************************************************************
       COPY 'screen-border.cpy'.

      ******************************************************************
      *    [IM-RD] TITRE.                                              *
      ******************************************************************
           05 FILLER PIC X(31) VALUE 'RECHERCHER OU CREER UN ADHERENT' 
           LINE 6 COL 86 
           FOREGROUND-COLOR IS 2. 

      ******************************************************************
      *    [IM-RD] CHAMPS DE SAISIS.                                   *
      ******************************************************************
      *    [IM-RD] Bouton de recherche d'un adhérent. 
           05 FILLER PIC X(31) VALUE 'Rechercher un adherent' 
           LINE 20 COL 70 
           FOREGROUND-COLOR IS 2.

           05 FILLER PIC X(01) VALUE ":" 
           LINE 20 COL 100.

           05 PIC X(1) USING  WS-SEARCH-CHOICE  
           LINE 20 COL 132
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.

      *    [IM-RD] Bouton de création d'un adhérent.  
           05 FILLER PIC X(17) VALUE 'Creer un adherent' 
           LINE 23 COL 70 
           FOREGROUND-COLOR IS 2.

           05 FILLER PIC X(01) VALUE ":" 
           LINE 23 COL 100.

           05 PIC X(01) USING  WS-CREATE-CHOICE  
           LINE 23 COL 132
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 

      *    [IM-RD] Bouton de retour au menu. 
           05 FILLER PIC X(11) VALUE 'Deconnexion' 
           LINE 34 COL 172 
           FOREGROUND-COLOR IS 2.

           05 PIC X(01) USING  LK-RETURN-CHOICE  
           LINE 34 COL 170
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 

      *    [IM-RD] Zone de message d'erreur.
           05 FILLER PIC X(70) FROM WS-SCREEN-ERROR 
           LINE 29 COL 70 
           FOREGROUND-COLOR IS 8.
