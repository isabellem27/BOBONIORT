           01 SCREEN-REIMBOURSEMENT-CUSTOMER FOREGROUND-COLOR IS 2.
           05 BLANK SCREEN.

      ******************************************************************
      *    [SK] TITRE.                                                 *
      ******************************************************************
           05 FILLER PIC X(22) VALUE 'REMBOURSEMENT DE L ADHERENT' 
           LINE 6 COL 88 
           FOREGROUND-COLOR IS 2. 

      ******************************************************************
      *    [SK] CHAMPS DE SAISIS.                                      *
      ******************************************************************


      *    [SK] zone message d'erreur.
           05 FILLER PIC X(70) FROM WS-ERROR-MESSAGE 
           LINE 30 COL 45 AUTO 
           FOREGROUND-COLOR IS 8.


      *    [SK] Bouton retour au menu.
           05 FILLER PIC X(01) TO WS-MENU-RETURN LINE 34 COL 170 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 
           05 FILLER PIC X(14) VALUE 'Retour' LINE 34 COL 172 
           FOREGROUND-COLOR IS 2.

      ******************************************************************
      *    [al] DEFINITION DU ROUGE.                                   *
      ******************************************************************

      *    [SK] Bordure du haut pour le cadre.
           05 FILLER PIC X(88) VALUE ALL SPACES LINE 15 COL 56 
           BACKGROUND-COLOR IS 4.

=

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 16 COL 56 
           BACKGROUND-COLOR IS 4.        
           05 FILLER PIC X(02) VALUE ALL SPACE LINE 16 COL 142
           BACKGROUND-COLOR IS 4.   

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 17 COL 56 
           BACKGROUND-COLOR IS 4.
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 17 COL 142
           BACKGROUND-COLOR IS 4. 

           05 FILLER PIC X(02) VALUE  ALL SPACES LINE 18 COL 56 
           BACKGROUND-COLOR IS 4.        
           05 FILLER PIC X(02) VALUE ALL SPACES LINE 18 COL 142
           BACKGROUND-COLOR IS 4.
           05 FILLER PIC X(19) VALUE '- EN CONSTRUCTION -' COL 90
           FOREGROUND-COLOR IS 4.

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 19 COL 56 
           BACKGROUND-COLOR IS 4.        
           05 FILLER PIC X(02) VALUE ALL SPACE LINE 19 COL 142
           BACKGROUND-COLOR IS 4. 

           05 FILLER PIC X(02) VALUE ALL SPACES LINE 20 COL 56 
           BACKGROUND-COLOR IS 4.        
           05 FILLER PIC X(02) VALUE ALL SPACE LINE 20 COL 142
           BACKGROUND-COLOR IS 4. 

      *    [SK] Bordure du bas pour le cadre.
           05 FILLER PIC X(88) VALUE ALL SPACES LINE 21 COL 56 
           BACKGROUND-COLOR IS 4
           .
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
