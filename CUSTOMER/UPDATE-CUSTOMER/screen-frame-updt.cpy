       01  SCREEN-FRAME FOREGROUND-COLOR IS 2.
           05 BLANK SCREEN.

      ******************************************************************
      *    SK TITRE.                                                 *
      ******************************************************************
           05 FILLER PIC X(22) VALUE  "MODIFIER UN ADHERENT" 
           LINE 6 COL 86 
           FOREGROUND-COLOR IS 2. 
      ******************************************************************
      * [SK]  nom  du client qui sera modifié. 
           05 FILLER PIC X(03) VALUE 'Nom' LINE 10 COL 20. 
           05 FILLER PIC X(20) TO CUD-LASTNAME LINE 14 COL 45 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.

      *    [SK]  prénom du client qui sera modifié

           05 FILLER PIC X(06) VALUE 'Prenom' LINE 10 COL 30.

           05 FILLER PIC X(20) TO CUD-FIRSTNAME LINE 16 COL 45 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.


      ******************************************************************
      *    [SK] CHAMPS DE SAISIS.                                      *
      ******************************************************************

      *    [SK] Champ de saisi pour le nom.     
           05 FILLER PIC X(03) VALUE 'Nom' LINE 13 COL 45. 
           05 FILLER PIC X(20) TO CUD-LASTNAME LINE 14 COL 45 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.

      *    [SK] Champ de saisi pour le prenom.
           05 FILLER PIC X(06) VALUE 'Prenom' LINE 15 COL 45. 
           05 FILLER PIC X(20) TO CUD-FIRSTNAME LINE 16 COL 45 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 

      *    [SK] Champ de saisi pour le genre.     
           05 FILLER PIC X(05) VALUE 'Genre' LINE 17 COL 45. 
           05 FILLER PIC X(10) TO CUD-GENDER LINE 18 COL 45 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.           

      *    [SK] Champ de saisi pour la date de naissance.
           05 FILLER PIC X(31) VALUE 'Date de naissance (AAAA-MM-JJ)' 
           LINE 19 COL 45. 

           05 ZONE-BIRTHDATE.
      *    05 FILLER PIC X(04) TO CUB-YEAR
              10 CUB-YEAR PIC X(04) LINE 20 COL 45 AUTO 
              BACKGROUND-COLOR IS 2
              FOREGROUND-COLOR IS 0.
              
              10 FILLER PIC X(01) VALUE '-'
              LINE 20 COL 49 AUTO 
              FOREGROUND-COLOR IS 2.
   
              10 CUB-MONTH PIC X(2) LINE 20 COL 50 AUTO 
              BACKGROUND-COLOR IS 2
              FOREGROUND-COLOR IS 0.
   
              10 FILLER PIC X(01) VALUE '-'
              LINE 20 COL 52 AUTO 
              FOREGROUND-COLOR IS 2.
   
              10 CUB-DAYS PIC X(02) LINE 20 COL 53 AUTO 
              BACKGROUND-COLOR IS 2
              FOREGROUND-COLOR IS 0. 

      *    [SK] Champ de saisi pour le nombre d'enfants.
           05 FILLER PIC X(16) VALUE "Nombre d'enfants" 
           LINE 21 COL 45. 

           05 FILLER PIC X(03) TO CUD-NBCHILDREN LINE 22 COL 45 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.

      *    [SK] Champ de saisi pour le couple.
           05 FILLER PIC X(19) VALUE 'En couple (Oui/Non)' 
           LINE 23 COL 45. 


           05 FILLER PIC X(03) TO CUD-COUPLE LINE 24 COL 45 AUTO        
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.

      *    [SK] Champ de saisi pour le telephone.
           05 FILLER PIC X(09) VALUE 'Telephone' LINE 25 COL 45. 


           05 FILLER PIC X(10) TO CUD-PHONE LINE 26 COL 45 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.


      *    [SK] Champ de saisi pour l'IBAN.
           05 FILLER PIC X(04) VALUE 'IBAN' 
           LINE 27 COL 45. 

           05 FILLER PIC X(34) TO CUD-CODE-IBAN LINE 28 COL 45 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.   


      *    [SK] Champ de saisi pour le num de securite sociale.
           05 FILLER PIC X(27) VALUE 'Numero de securite sociale' 
           LINE 13 COL 108.

           05 ZONE-CODE-SECU.
      *    05 FILLER PIC X(01) TO CCS-SECU-1 LINE 14 COL 108 AUTO
                10 CCS-SECU-1 PIC X(01) LINE 14 COL 108
                BACKGROUND-COLOR IS 2
                FOREGROUND-COLOR IS 0.

      *    05 FILLER PIC X(02) TO CCS-SECU-2 LINE 14 COL 110 AUTO
                10 CCS-SECU-2 PIC X(02) LINE 14 COL 110
                BACKGROUND-COLOR IS 2
                FOREGROUND-COLOR IS 0.

      *    05 FILLER PIC X(02) TO CCS-SECU-3 LINE 14 COL 113 AUTO
                10 CCS-SECU-3 PIC X(02) LINE 14 COL 113
                BACKGROUND-COLOR IS 2
                FOREGROUND-COLOR IS 0.

      *    05 FILLER PIC X(02) TO CCS-SECU-4 LINE 14 COL 116 AUTO
                10 CCS-SECU-4 PIC X(02) LINE 14 COL 116
                BACKGROUND-COLOR IS 2
                FOREGROUND-COLOR IS 0.

      *    05 FILLER PIC X(03) TO CCS-SECU-5 LINE 14 COL 119 AUTO
                10 CCS-SECU-5 PIC X(03) LINE 14 COL 119
                BACKGROUND-COLOR IS 2
                FOREGROUND-COLOR IS 0.

      *    05 FILLER PIC X(03) TO CCS-SECU-6 LINE 14 COL 123 AUTO
                10 CCS-SECU-6 PIC X(03) LINE 14 COL 123
                BACKGROUND-COLOR IS 2
                FOREGROUND-COLOR IS 0. 

      *    05 FILLER PIC X(02) TO CCS-SECU-7 LINE 14 COL 127 AUTO
                10 CCS-SECU-7 PIC X(02) LINE 14 COL 127 AUTO
                BACKGROUND-COLOR IS 2
                FOREGROUND-COLOR IS 0.

           05 FILLER PIC X(01) VALUE '-'
           LINE 14 COL 109 AUTO 
           FOREGROUND-COLOR IS 2.

           05 FILLER PIC X(01) VALUE '-'
           LINE 14 COL 112 AUTO 
           FOREGROUND-COLOR IS 2. 

           05 FILLER PIC X(01) VALUE '-'
           LINE 14 COL 115 AUTO 
           FOREGROUND-COLOR IS 2.

           05 FILLER PIC X(01) VALUE '-'
           LINE 14 COL 118 AUTO 
           FOREGROUND-COLOR IS 2.

           05 FILLER PIC X(01) VALUE '-'
           LINE 14 COL 122 AUTO 
           FOREGROUND-COLOR IS 2.

           05 FILLER PIC X(01) VALUE '-'
           LINE 14 COL 126 AUTO 
           FOREGROUND-COLOR IS 2.

      *    [SK] Champ de saisi pour le docteur.
           05 FILLER PIC X(07) VALUE 'Docteur' 
           LINE 15 COL 108. 

           05 FILLER PIC X(50) TO CUD-DOCTOR LINE 16 COL 108 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.   

      *    [SK] Champ de saisi pour le mail.
           05 FILLER PIC X(04) VALUE 'Mail' LINE 17 COL 108. 


           05 FILLER PIC X(50) TO CUD-MAIL LINE 18 COL 108 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.  

      *    [SK] Champ de saisi pour l'adresse 1.
           05 FILLER PIC X(07) VALUE 'Adresse' LINE 19 COL 108. 

           05 FILLER PIC X(50) TO CUD-ADRESS1 LINE 20 COL 108 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 

      *    [SK] Champ de saisi pour l'adresse 2.
           05 FILLER PIC X(50) TO CUD-ADRESS2 LINE 21 COL 108 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 

      *    [SK] Champ de saisi pour la ville.
           05 FILLER PIC X(05) VALUE 'Ville' LINE 22 COL 108. 

           05 FILLER PIC X(50) TO CUD-TOWN LINE 23 COL 108 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.


      *    [SK] Champ de saisi pour le code postal.
           05 FILLER PIC X(11) VALUE 'Code postal' LINE 24 COL 108. 

           05 FILLER PIC X(15) TO CUD-ZIPCODE LINE 25 COL 108 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.

      *    [SK] Champ de saisi pour le pays.
           05 FILLER PIC X(04) VALUE 'Pays' LINE 26 COL 108. 

           05 FILLER PIC X(20) TO CUD-COUNTRY LINE 27 COL 108 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.



      *    [SK] zone message d'erreur.

           05 FILLER PIC X(70) FROM WS-ERROR-MESSAGE 
           LINE 29 COL 45 AUTO 
           FOREGROUND-COLOR IS 2.

      *    [SK] Bouton rechercher.
           05 FILLER PIC X(28) VALUE "Modification de l'adherent" 
           LINE 32 COL 45 
           FOREGROUND-COLOR IS 2. 
           05 FILLER PIC X(01) TO WS-SEARCH-VALIDATION LINE 32 COL 74
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 


      *    [SK] Bouton retour au menu.
           05 FILLER PIC X(01) TO WS-MENU-RETURN LINE 34 COL 170 
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

      *    [RD-AL] Bordure du bas pour le cadre.
           05 FILLER PIC X(182) VALUE ALL SPACES LINE 37 COL 10 
           BACKGROUND-COLOR IS 2.

      *    [RD-AL] Côté du cadre (Ligne 5 à XXX).
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
