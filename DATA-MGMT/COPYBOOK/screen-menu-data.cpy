       01 SCREEN-MENU-DATA FOREGROUND-COLOR IS  3.
           05 BLANK SCREEN.       

      * [IM] - Gestion des boutons 
           05 FILLER PIC X(40) 
           VALUE  'Statistiques de BoBoNiort           :'  
           LINE 20 COL 55 
           FOREGROUND-COLOR IS  3.  
           05 PIC X(1) USING  WS-STAT
           COL 132 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0.

           05 FILLER PIC X(40) 
           VALUE  'Charger un fichier client csv       :'
           LINE 23 COL 55 
           FOREGROUND-COLOR IS  3.  
           05 PIC X(1) USING  WS-FILE  
           COL 132 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0.
  
           05 FILLER PIC X(7) VALUE  "Valider" 
           LINE 34 COL 38 
           FOREGROUND-COLOR IS  3.
           05 PIC X(1) USING  WS-VALIDATE 
           COL 47 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0. 

           05 PIC X(1) USING  WS-EXIT 
           COL 170 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0. 
           05 FILLER PIC X(7) VALUE  "Quitter" 
           COL 172 
           FOREGROUND-COLOR IS  3.

      * [IM] - Affichage message gestion d'erreur                     
           05 PIC X(70) FROM SC-MESSAGE
           LINE 30 COL 38 
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 7. 
           
      * [IM] - Gestion du cadre et titre        
           05 FILLER PIC X(182) VALUE all ' ' LINE 4 COL 10 
           BACKGROUND-COLOR IS  3.
           05 FILLER PIC X(2) VALUE  '  ' LINE 5 COL 10 
           BACKGROUND-COLOR IS  3.
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS  3. 
           05 FILLER PIC X(2) VALUE  '  ' LINE 6 COL 10 
           BACKGROUND-COLOR IS  3.        
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS  3.
           05 FILLER PIC X(29) VALUE  'FONCTIONS ANNEXES' 
           COL 87 
           FOREGROUND-COLOR IS  3.            
           05 FILLER PIC X(2) VALUE  '  ' LINE 7 COL 10 
           BACKGROUND-COLOR IS  3.        
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS  3. 
           05 FILLER PIC X(182) VALUE all  '  ' LINE 8 COL 10 
           BACKGROUND-COLOR IS  3.
           05 FILLER PIC X(2) VALUE  '  ' LINE 9 COL 10 
           BACKGROUND-COLOR IS  3.         
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS  3. 
           05 FILLER PIC X(2) VALUE  '  ' LINE 10 COL 10 
           BACKGROUND-COLOR IS  3. 
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS  3. 
           05 FILLER PIC X(2) VALUE  '  ' LINE 11 COL 10 
           BACKGROUND-COLOR IS  3. 
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS  3. 
           05 FILLER PIC X(2) VALUE  '  ' LINE 12 COL 10 
           BACKGROUND-COLOR IS  3.        
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS  3.            
           05 FILLER PIC X(2) VALUE  '  ' LINE 13 COL 10 
           BACKGROUND-COLOR IS  3.                           
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS  3. 
           05 FILLER PIC X(2) VALUE  '  ' LINE 14 COL 10 
           BACKGROUND-COLOR IS  3.                    
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS  3.         
           05 FILLER PIC X(2) VALUE  '  ' LINE 15 COL 10 
           BACKGROUND-COLOR IS  3.        
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS  3. 
           05 FILLER PIC X(2) VALUE  '  ' LINE 16 COL 10 
           BACKGROUND-COLOR IS  3.                  
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS  3.
           05 FILLER PIC X(2) VALUE  '  ' LINE 17 COL 10 
           BACKGROUND-COLOR IS  3.       
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS  3.                     
           05 FILLER PIC X(2) VALUE  '  ' LINE 18 COL 10 
           BACKGROUND-COLOR IS  3.        
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS  3. 
           05 FILLER PIC X(2) VALUE  '  ' LINE 19 COL 10 
           BACKGROUND-COLOR IS  3.                  
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS  3.
           05 FILLER PIC X(2) VALUE  '  ' LINE 20 COL 10 
           BACKGROUND-COLOR IS  3.       
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS  3.
           05 FILLER PIC X(2) VALUE  '  ' LINE 21 COL 10 
           BACKGROUND-COLOR IS  3.        
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS  3.            
           05 FILLER PIC X(2) VALUE  '  ' LINE 22 COL 10 
           BACKGROUND-COLOR IS  3.       
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS  3.                     
           05 FILLER PIC X(2) VALUE  '  ' LINE 23 COL 10 
           BACKGROUND-COLOR IS  3. 
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS  3.                  
           05 FILLER PIC X(2) VALUE  '  ' LINE 24 COL 10 
           BACKGROUND-COLOR IS  3.        
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS  3.           
           05 FILLER PIC X(2) VALUE  '  ' LINE 25 COL 10 
           BACKGROUND-COLOR IS  3.       
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS  3.    
           05 FILLER PIC X(2) VALUE  '  ' LINE 26 COL 10 
           BACKGROUND-COLOR IS  3. 
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS  3. 
           5 FILLER PIC X(2) VALUE  '  ' LINE  27 COL 10 
           BACKGROUND-COLOR IS  3.        
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS  3. 
           05 FILLER PIC X(2) VALUE  '  ' LINE 28 COL 10 
           BACKGROUND-COLOR IS  3.        
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS  3. 
           05 FILLER PIC X(2) VALUE  '  ' LINE 29 COL 10 
           BACKGROUND-COLOR IS  3.        
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS  3.
           05 FILLER PIC X(2) VALUE  '  ' LINE 30 COL 10 
           BACKGROUND-COLOR IS  3.        
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS  3. 
           05 FILLER PIC X(2) VALUE  '  ' LINE 31 COL 10 
           BACKGROUND-COLOR IS  3.        
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS  3. 
           05 FILLER PIC X(2) VALUE  '  ' LINE 32 COL 10 
           BACKGROUND-COLOR IS  3.       
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS  3. 
           05 FILLER PIC X(2) VALUE  '  ' LINE 33 COL 10 
           BACKGROUND-COLOR IS  3.      
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS  3. 
           05 FILLER PIC X(2) VALUE  '  ' LINE 34 COL 10 
           BACKGROUND-COLOR IS  3.      
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS  3. 
           05 FILLER PIC X(2) VALUE  '  ' LINE 35 COL 10 
           BACKGROUND-COLOR IS  3.      
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS  3. 
           05 FILLER PIC X(2) VALUE  '  ' LINE 36 COL 10 
           BACKGROUND-COLOR IS  3.        
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS  3. 
           05 FILLER PIC X(182) VALUE all  '  ' LINE 37 COL 10 
           BACKGROUND-COLOR IS  3.

