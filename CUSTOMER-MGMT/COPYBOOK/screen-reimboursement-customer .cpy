           01 SCREEN-ARCHIVE-CUSTOMER FOREGROUND-COLOR IS 2.
           05 BLANK SCREEN.

      ******************************************************************
      *    [SK] TITRE.                                                 *
      ******************************************************************
           05 FILLER PIC X(22) VALUE 'ARCHIVER UN ADHERENT' 
           LINE 6 COL 90 
           FOREGROUND-COLOR IS 2. 

      ******************************************************************
      *    [SK] CHAMPS DE SAISIS.                                      *
      ******************************************************************

      *    [SK] Champ de saisi pour le nom.     
           05 FILLER PIC X(03) VALUE 'Nom' LINE 13 COL 45. 
           05 FILLER PIC X(20) USING LK-CUS-LASTNAME
           LINE 14 COL 45 AUTO
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.

      *    [SK] Champ de saisi pour le prenom.
           05 FILLER PIC X(06) VALUE 'Prenom' LINE 15 COL 45. 
           05 FILLER PIC X(20) USING LK-CUS-FIRSTNAME 
           LINE 16 COL 45 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.
      **    [SK] Champ de saisi pour le Numero de securite sociale.
           05 FILLER PIC X(10) VALUE "Nume SECU " 
           LINE 13 COL 115.
           05 FILLER PIC X(01) VALUE ":" 
           LINE 13 COL 125 .
           05 FILLER PIC 9(1) USING LK-SECU-1 
            LINE 14 COL 116 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.
         
           05 FILLER PIC 9(2) USING LK-SECU-2 
            LINE 14 COL 117 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.
          
           05 FILLER PIC 9(2) USING LK-SECU-3 
            LINE 14 COL 119 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 
           
           05 FILLER PIC 9(2) USING LK-SECU-4 
            LINE 14 COL 122 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.
        
           05 FILLER PIC 9(3) USING LK-SECU-5 
            LINE 14 COL 125 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 
        
           05 FILLER PIC 9(3) USING LK-SECU-6 
            LINE 14 COL 129 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 
        
           05 FILLER PIC 9(2) USING LK-SECU-7 
           LINE 14 COL 133 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 

      *    [SK] zone message d'erreur.
           05 FILLER PIC X(70) FROM WS-ERROR-MESSAGE 
           LINE 30 COL 45 AUTO 
           FOREGROUND-COLOR IS 8.

           05 FILLER PIC X(50) FROM  WS-ARCHIVE-MESSAGE
           LINE 25 COL 45 AUTO 
           FOREGROUND-COLOR IS 8.
           
      *    [SK] Bouton  .
           05 FILLER PIC X(30) VALUE "Archiver l'adherent: (O/N)" 
           LINE 20 COL 65
           FOREGROUND-COLOR IS 2. 
           05 FILLER PIC X(01) TO WS-ACCEPT LINE 20 COL 100
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 

      *    [SK] Bouton retour au menu.
           05 FILLER PIC X(01) TO WS-SEARCH-VALIDATION LINE 34 COL 170 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 
           05 FILLER PIC X(14) VALUE 'Retour menu' LINE 34 COL 172 
           FOREGROUND-COLOR IS 2.

      ******************************************************************
      *    [SK] DEFINITION DU CADRE.                                   *
      ******************************************************************

      *    [SK] Bordure du haut pour le cadre.
           05 FILLER PIC X(182) VALUE ALL SPACES LINE 4 COL 10 
           BACKGROUND-COLOR IS 2.

      *    [SK] Bordure de séparation entre le HEADER et le BODY.
           05 FILLER PIC X(182) VALUE ALL SPACES LINE 8 COL 10 
           BACKGROUND-COLOR IS 2.

      *    [SK] Bordure du bas pour le cadre.
           05 FILLER PIC X(182) VALUE ALL SPACES LINE 37 COL 10 
           BACKGROUND-COLOR IS 2.

      *    [SK] Côté du cadre (Ligne 5 à 36).
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 5 COL 10 
           BACKGROUND-COLOR IS 2.
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 5 COL 190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(02) VALUE  ALL SPACES LINE 6 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 6 COL 190
           BACKGROUND-COLOR IS 2.

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 7 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(02) VALUE ALL SPACE LINE 7 COL 190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 9 COL 10 
           BACKGROUND-COLOR IS 2.         
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 9 COL 190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 10 COL 10 
           BACKGROUND-COLOR IS 2. 
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 10 COL 190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 11 COL 10 
           BACKGROUND-COLOR IS 2.                       
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 11 COL 190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 12 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 12 COL 190
           BACKGROUND-COLOR IS 2.            

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 13 COL 10 
           BACKGROUND-COLOR IS 2.                           
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 13 COL 190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 14 COL 10 
           BACKGROUND-COLOR IS 2.
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 14 COL 190 
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 15 COL 10 
           BACKGROUND-COLOR IS 2.                  
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 15 COL 190
           BACKGROUND-COLOR IS 2.

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 16 COL 10 
           BACKGROUND-COLOR IS 2.                
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 16 COL 190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 17 COL 10 
           BACKGROUND-COLOR IS 2.      
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 17 COL 190
           BACKGROUND-COLOR IS 2.

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 18 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 18 COL 190
           BACKGROUND-COLOR IS 2.

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 19 COL 10 
           BACKGROUND-COLOR IS 2.         
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 19 COL 190
           BACKGROUND-COLOR IS 2.  

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 20 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 20 COL 190
           BACKGROUND-COLOR IS 2.            

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 21 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 21 COL 190
           BACKGROUND-COLOR IS 2.                     

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 22 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 22 COL 190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 23 COL 10 
           BACKGROUND-COLOR IS 2.         
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 23 COL 190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 24 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 24 COL 190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 25 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 25 COL 190
           BACKGROUND-COLOR IS 2.

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 26 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 26 COL 190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 27 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 27 COL 190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 28 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 28 COL 190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 29 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 29 COL 190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 30 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 30 COL 190
           BACKGROUND-COLOR IS 2.

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 31 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 31 COL 190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 32 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 32 COL 190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 33 COL 10 
           BACKGROUND-COLOR IS 2. 
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 33 COL 190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 34 COL 10 
           BACKGROUND-COLOR IS 2.      
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 34 COL 190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 35 COL 10 
           BACKGROUND-COLOR IS 2.      
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 35 COL 190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 36 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 36 COL 190
           BACKGROUND-COLOR IS 2. 
