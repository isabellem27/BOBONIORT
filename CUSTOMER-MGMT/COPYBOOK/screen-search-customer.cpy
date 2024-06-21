       01  SCREEN-SEARCH-CUSTOMER FOREGROUND-COLOR IS 2.
           05 BLANK SCREEN.

      ******************************************************************
      *    [RD-MF] DEFINITION DU CADRE.                                *
      ******************************************************************
           COPY 'screen-border.cpy'.

      ******************************************************************
      *    [RD-MF] TITRE.                                              *
      ******************************************************************
           05 FILLER PIC X(18) VALUE  'RECHERCHE ADHERENT' 
           LINE 6 COL 91 
           FOREGROUND-COLOR IS 2.

      ******************************************************************
      *    [RD-MF] CHAMPS DE SAISIS.                                   *
      ******************************************************************
      *    [RD-MF] Champ de saisi pour le num de securite sociale.    
           05 FILLER PIC X(26) VALUE 'Numero de securite sociale' 
           LINE 16 COL 60.

           05 FILLER PIC X(01) VALUE ":" 
           LINE 16 COL 92.

           05 FILLER PIC X(01) USING SCCS-SECU-1 
           LINE 16 COL 114 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.

           05 FILLER PIC X(01) VALUE '-'
           LINE 16 COL 115 AUTO 
           FOREGROUND-COLOR IS 2.
         
           05 FILLER PIC X(02) USING SCCS-SECU-2 
           LINE 16 COL 116 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.

           05 FILLER PIC X(01) VALUE '-'
           LINE 16 COL 118 AUTO 
           FOREGROUND-COLOR IS 2.
          
           05 FILLER PIC X(02) USING SCCS-SECU-3 
           LINE 16 COL 119 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 

           05 FILLER PIC X(01) VALUE '-'
           LINE 16 COL 121 AUTO 
           FOREGROUND-COLOR IS 2.
           
           05 FILLER PIC X(02) USING SCCS-SECU-4 
           LINE 16 COL 122 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.

           05 FILLER PIC X(01) VALUE '-'
           LINE 16 COL 124 AUTO 
           FOREGROUND-COLOR IS 2.
        
           05 FILLER PIC X(03) USING SCCS-SECU-5 
           LINE 16 COL 125 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 

           05 FILLER PIC X(01) VALUE '-'
           LINE 16 COL 128 AUTO 
           FOREGROUND-COLOR IS 2.
        
           05 FILLER PIC X(03) USING SCCS-SECU-6 
           LINE 16 COL 129 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.

           05 FILLER PIC X(01) VALUE '-'
           LINE 16 COL 132 AUTO 
           FOREGROUND-COLOR IS 2. 
        
           05 FILLER PIC X(02) USING SCCS-SECU-7 
           LINE 16 COL 133 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.
           
      *    [RD-MF] Champ de saisi pour le prenom.
           05 FILLER PIC X(06) VALUE 'Prenom' 
           LINE 18 COL 60. 

           05 FILLER PIC X(01) VALUE ':' 
           LINE 18 COL 92.

           05 FILLER PIC X(20) USING SC-FIRSTNAME
           LINE 18 COL 115 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.

      *    [RD-MF] Champ de saisi pour le nom. 
           05 FILLER PIC X(03) VALUE 'Nom'
           LINE 20 COL 60. 

           05 FILLER PIC X(01) VALUE ':' 
           LINE 20 COL 92.

           05 FILLER PIC X(20) USING SC-LASTNAME
           LINE 20 COL 115 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.

      *    [RD-MF] Champ de saisi pour la date de naissance. 
           05 FILLER PIC X(30) VALUE 'Date de naissance (JJ-MM-AAAA)'
           LINE 22 COL 60. 

           05 FILLER PIC X(01) VALUE ':'
           LINE 22 COL 92.

           05 FILLER PIC X(02) USING SCB-DAYS
           LINE 22 COL 125 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 

           05 FILLER PIC X(01) VALUE '-'
           LINE 22 COL 127 AUTO 
           FOREGROUND-COLOR IS 2.

           05 FILLER PIC X(02) USING SCB-MONTH
           LINE 22 COL 128 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.

           05 FILLER PIC X(01) VALUE '-'
           LINE 22 COL 130 AUTO 
           FOREGROUND-COLOR IS 2.

           05 FILLER PIC X(04) USING SCB-YEAR
           LINE 22 COL 131 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.

      *    [RD-MF] Zone de message d'erreur.    
           05 FILLER PIC X(70) FROM WS-ERROR-MESSAGE
           LINE 25 COL 60 
           FOREGROUND-COLOR IS 8.

      *    [RD-MF] Bouton rechercher. 
           05 FILLER PIC X(10) VALUE 'Rechercher' 
           LINE 27 COL 60 
           FOREGROUND-COLOR IS 2. 

           05 FILLER PIC X(01) USING WS-SEARCH-VALIDATION
           LINE 27 COL 71
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 

      *    [RD-MF] Bouton retour au menu. 
           05 FILLER PIC X(11) VALUE 'Retour' 
           LINE 34 COL 172 
           FOREGROUND-COLOR IS 2.

           05 FILLER PIC X(1) USING WS-MENU-RETURN  
           LINE 34 COL 170 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 
