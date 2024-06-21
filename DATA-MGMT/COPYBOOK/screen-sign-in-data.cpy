       01 SCREEN-SIGN-IN FOREGROUND-COLOR IS 3.
           05 BLANK SCREEN.

      ******************************************************************
      *    [AL-RD] CHAMPS DE SAISIS.                                   *
      ******************************************************************
      *    [AL-RD] Champ d'identification. 
           05 FILLER PIC X(15) VALUE  'IDENTIFIANT  :' 
           LINE 16 COL 125 
           FOREGROUND-COLOR IS 3.

           05 PIC X(14) USING  SI-USER-ID  
           LINE 16 COL 150 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0. 

      *    [AL-RD] Champ du mot de passe. 
           05 FILLER PIC X(15) VALUE  'MOT-DE-PASSE :' 
           LINE 18 COL 125
           FOREGROUND-COLOR IS 3.

           05 PIC X(14) USING SI-USER-PWD SECURE
           LINE 18 COL 150
           BACKGROUND-COLOR IS 3. 

      *    [AL-RD] Zone de message d'erreur. 
           05 PIC X(45) FROM SI-ERROR-MESSAGE
           LINE 24 COL 125 FOREGROUND-COLOR IS 7.

      *    [AL-RD] Bouton pour se connecter. 
           05 FILLER PIC X(12) VALUE 'Se connecter' 
           LINE 34 COL 172 
           FOREGROUND-COLOR IS 3.

           05 PIC X(01) USING SI-CONNECT  
           LINE 34 COL 170 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0. 

      ******************************************************************
      *    [AL-RD] DEFINITION DU LOGO.                                 *
      ******************************************************************
           05 FILLER PIC X(22) VALUE '8888888b.    8888888b.' 
           LINE 14 COL 35 
           FOREGROUND-COLOR IS 3.
           
           05 FILLER PIC X(13) VALUE '8888b    8888' 
           LINE 14 COL 61  
           FOREGROUND-COLOR IS 7.    

           05 FILLER PIC X(22) VALUE '888  "88b    888  "88b' 
           LINE 15 COL 36 
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(11) VALUE '8888b   888' 
           LINE 15 COL 62  
           FOREGROUND-COLOR IS 7.             

           05 FILLER PIC X(22) VALUE '888  .88P    888  .88P' 
           LINE 16 COL 36 
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(11) VALUE '88888b  888' 
           LINE 16 COL 62  
           FOREGROUND-COLOR IS 7.

           05 FILLER PIC X(22) VALUE '8888888K.    8888888K.' 
           LINE 17 COL 36 
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(11) VALUE '888Y88b 888' 
           LINE 17 COL 62  
           FOREGROUND-COLOR IS 7. 

           05 FILLER PIC X(23) VALUE '888  "Y88b   888  "Y88b' 
           LINE 18 COL 36 
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(11) VALUE '888 Y88b888' 
           LINE 18 COL 62 
           FOREGROUND-COLOR IS 7.  

           05 FILLER PIC X(23) VALUE '888    888   888    888' 
           LINE 19 COL 36 
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(11) VALUE '888  Y88888' 
           LINE 19 COL 62  
           FOREGROUND-COLOR IS 7.  

           05 FILLER PIC X(23) VALUE '888   d88P   888   d88P' 
           LINE 20 COL 36 
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(11) VALUE '888   Y8888' 
           LINE 20 COL 62  
           FOREGROUND-COLOR IS 7. 

           05 FILLER PIC X(23) VALUE '88888888P"   88888888P"' 
           LINE 21 COL 35 
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(13) VALUE '8888    Y8888'
           LINE 21 COL 61  
           FOREGROUND-COLOR IS 7.           

           05 FILLER PIC X(37) 
           VALUE 'BOBONIORT   -   DATA  MANAGEMENT' 
           LINE 24 COL 36 
           FOREGROUND-COLOR IS 7.

      ******************************************************************
      *    [AL-RD] DEFINITION DU CADRE.                                *
      ******************************************************************
      *    [AL-RD] Ligne du haut.    
           05 FILLER PIC X(182) VALUE ALL SPACES 
           LINE 4 COL 10 
           BACKGROUND-COLOR IS 3.

      *    [AL-RD] Côté du cadre.  
           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 5 COL 10 
           BACKGROUND-COLOR IS 3.

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 5 COL 190
           BACKGROUND-COLOR IS 3. 

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 6 COL 10 
           BACKGROUND-COLOR IS 3.

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 6 COL 190
           BACKGROUND-COLOR IS 3. 

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 7 COL 10 
           BACKGROUND-COLOR IS 3.

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 7 COL 190
           BACKGROUND-COLOR IS 3. 

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 8 COL 10 
           BACKGROUND-COLOR IS 3.

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 8 COL 190
           BACKGROUND-COLOR IS 3. 

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 9 COL 10 
           BACKGROUND-COLOR IS 3. 

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE  9 COL 190
           BACKGROUND-COLOR IS 3. 

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 10 COL 10 
           BACKGROUND-COLOR IS 3.

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 10 COL 190
           BACKGROUND-COLOR IS 3. 

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 11 COL 10 
           BACKGROUND-COLOR IS 3. 

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 11 COL 190
           BACKGROUND-COLOR IS 3. 

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 12 COL 10 
           BACKGROUND-COLOR IS 3.

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 12 COL 190
           BACKGROUND-COLOR IS 3.            

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 13 COL 10 
           BACKGROUND-COLOR IS 3.  

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 13 COL 190
           BACKGROUND-COLOR IS 3. 

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 14 COL 10 
           BACKGROUND-COLOR IS 3.

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 14 COL 190
           BACKGROUND-COLOR IS 3. 

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 15 COL 10 
           BACKGROUND-COLOR IS 3. 

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 15 COL 190
           BACKGROUND-COLOR IS 3.

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 16 COL 10 
           BACKGROUND-COLOR IS 3.    
                   
           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 16 COL 190
           BACKGROUND-COLOR IS 3. 

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 17 COL 10 
           BACKGROUND-COLOR IS 3.

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 17 COL 190
           BACKGROUND-COLOR IS 3.

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 18 COL 10 
           BACKGROUND-COLOR IS 3.

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 18 COL 190
           BACKGROUND-COLOR IS 3.

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 19 COL 10 
           BACKGROUND-COLOR IS 3.

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 19 COL 190
           BACKGROUND-COLOR IS 3. 

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 20 COL 10 
           BACKGROUND-COLOR IS 3.

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 20 COL 190
           BACKGROUND-COLOR IS 3. 

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 21 COL 10 
           BACKGROUND-COLOR IS 3.

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 21 COL 190
           BACKGROUND-COLOR IS 3. 

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 22 COL 10 
           BACKGROUND-COLOR IS 3.

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 22 COL 190
           BACKGROUND-COLOR IS 3. 

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 23 COL 10 
           BACKGROUND-COLOR IS 3.

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 23 COL 190
           BACKGROUND-COLOR IS 3. 

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 24 COL 10 
           BACKGROUND-COLOR IS 3.

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 24 COL 190
           BACKGROUND-COLOR IS 3. 

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 25 COL 10 
           BACKGROUND-COLOR IS 3.

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 25 COL 190
           BACKGROUND-COLOR IS 3. 

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 26 COL 10 
           BACKGROUND-COLOR IS 3.

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 26 COL 190
           BACKGROUND-COLOR IS 3. 

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 27 COL 10 
           BACKGROUND-COLOR IS 3.

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 27 COL 190
           BACKGROUND-COLOR IS 3. 

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 28 COL 10 
           BACKGROUND-COLOR IS 3.

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 28 COL 190
           BACKGROUND-COLOR IS 3. 

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 29 COL 10 
           BACKGROUND-COLOR IS 3.

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 29 COL 190
           BACKGROUND-COLOR IS 3. 

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 30 COL 10 
           BACKGROUND-COLOR IS 3.

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 30 COL 190
           BACKGROUND-COLOR IS 3.

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 31 COL 10 
           BACKGROUND-COLOR IS 3.

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 31 COL 190
           BACKGROUND-COLOR IS 3. 

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 32 COL 10 
           BACKGROUND-COLOR IS 3.

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 32 COL 190
           BACKGROUND-COLOR IS 3. 

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 33 COL 10 
           BACKGROUND-COLOR IS 3.

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 33 COL 190
           BACKGROUND-COLOR IS 3.  

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 34 COL 10 
           BACKGROUND-COLOR IS 3.

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 34 COL 190
           BACKGROUND-COLOR IS 3.

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 35 COL 10 
           BACKGROUND-COLOR IS 3.

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 35 COL 190
           BACKGROUND-COLOR IS 3. 

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 36 COL 10 
           BACKGROUND-COLOR IS 3.

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 36 COL 190
           BACKGROUND-COLOR IS 3. 

      *    [AL-RD] Ligne du bas.  
           05 FILLER PIC X(182) VALUE ALL SPACES 
           LINE 37 COL 10 
           BACKGROUND-COLOR IS 3.

      *    [AL-RD] Ligne du milieu.
           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 5 COL 99
           BACKGROUND-COLOR IS 3.

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 6 COL 99
           BACKGROUND-COLOR IS 3.   

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 7 COL 99
           BACKGROUND-COLOR IS 3.  

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 8 COL 99
           BACKGROUND-COLOR IS 3.  

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 9 COL 99
           BACKGROUND-COLOR IS 3. 
          
           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 10 COL 99
           BACKGROUND-COLOR IS 3.  

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 11 COL 99
           BACKGROUND-COLOR IS 3.      

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 12 COL 99
           BACKGROUND-COLOR IS 3.  

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 13 COL 99
           BACKGROUND-COLOR IS 3. 

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 14 COL 99
           BACKGROUND-COLOR IS 3.

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 15 COL 99
           BACKGROUND-COLOR IS 3.

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 16 COL 99
           BACKGROUND-COLOR IS 3.

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 17 COL 99
           BACKGROUND-COLOR IS 3. 

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 18 COL 99
           BACKGROUND-COLOR IS 3.

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 19 COL 99
           BACKGROUND-COLOR IS 3. 

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 20 COL 99
           BACKGROUND-COLOR IS 3. 

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 21 COL 99
           BACKGROUND-COLOR IS 3. 

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 22 COL 99
           BACKGROUND-COLOR IS 3.   

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 23 COL 99
           BACKGROUND-COLOR IS 3. 

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 24 COL 99
           BACKGROUND-COLOR IS 3. 

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 25 COL 99
           BACKGROUND-COLOR IS 3. 

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 26 COL 99
           BACKGROUND-COLOR IS 3. 

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 27 COL 99
           BACKGROUND-COLOR IS 3. 

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 28 COL 99
           BACKGROUND-COLOR IS 3. 

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 29 COL 99
           BACKGROUND-COLOR IS 3. 

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 30 COL 99
           BACKGROUND-COLOR IS 3.

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 31 COL 99
           BACKGROUND-COLOR IS 3. 

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 32 COL 99
           BACKGROUND-COLOR IS 3.  

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 33 COL 99
           BACKGROUND-COLOR IS 3. 

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 34 COL 99
           BACKGROUND-COLOR IS 3. 

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 35 COL 99
           BACKGROUND-COLOR IS 3. 

           05 FILLER PIC X(02) VALUE ALL SPACES 
           LINE 36 COL 99
           BACKGROUND-COLOR IS 3. 
