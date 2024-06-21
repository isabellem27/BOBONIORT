           01 SCREEN-UPDATE-CUSTOMER FOREGROUND-COLOR IS 2.
           05 BLANK SCREEN.

      ******************************************************************
      *    [SK] DEFINITION DU CADRE.                                   *
      ******************************************************************
       COPY 'screen-border.cpy'.

      ******************************************************************
      *    [SK] TITRE.                                              *
      ******************************************************************
           05 FILLER PIC X(20) VALUE  "MODIFIER UN ADHERENT" 
           LINE 6 COL 95 
           FOREGROUND-COLOR IS 2. 

      ******************************************************************
      *    [SK] CHAMPS DE SAISIS.                                   *
      ******************************************************************

      *    [SK] Champ de saisi pour le nom.     
           05 FILLER PIC X(03) VALUE 'Nom' 
           LINE 13 COL 45. 

           05 FILLER PIC X(20) USING LK-CUS-LASTNAME 
           LINE 14 COL 45 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.

      *    [SK] Champ de saisi pour le prenom.
           05 FILLER PIC X(06) VALUE 'Prenom' 
           LINE 15 COL 45. 

           05 FILLER PIC X(20) USING LK-CUS-FIRSTNAME 
           LINE 16 COL 45 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 

      *    [SK] Champ de saisi pour le genre.     
           05 FILLER PIC X(05) VALUE 'Genre' 
           LINE 17 COL 45. 

           05 FILLER PIC X(10) USING LK-CUS-GENDER 
           LINE 18 COL 45 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.           

      *    [SK] Champ de saisi pour la date de naissance.
           05 FILLER PIC X(31) VALUE 'Date de naissance (JJ-MM-AAAA)' 
           LINE 19 COL 45. 

           05 FILLER PIC X(02) USING WS-CUB-DAY
           LINE 20 COL 45 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.
           
           05 FILLER PIC X(01) VALUE '-'
           LINE 20 COL 47 AUTO 
           FOREGROUND-COLOR IS 2.

           05 FILLER PIC X(02) USING WS-CUB-MONTH
           LINE 20 COL 48 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.

           05 FILLER PIC X(01) VALUE '-'
           LINE 20 COL 50 AUTO 
           FOREGROUND-COLOR IS 2.

           05 FILLER PIC X(04) USING WS-CUB-YEAR
           LINE 20 COL 51 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 

      *    [SK] Champ de saisi pour le nombre d'enfants.
           05 FILLER PIC X(31) VALUE "Nombre d'enfants (0 par defaut)" 
           LINE 21 COL 45. 

           05 FILLER PIC X(03) USING LK-CUS-NBCHILDREN 
           LINE 22 COL 45 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.

      *    [SK] Champ de saisi pour le couple.
           05 FILLER PIC X(19) VALUE 'En couple (oui/non)' 
           LINE 23 COL 45. 

           05 FILLER PIC X(03) USING LK-CUS-COUPLE 
           LINE 24 COL 45 AUTO        
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.

      *    [SK] Champ de saisi pour le telephone.
           05 FILLER PIC X(09) VALUE 'Telephone' 
           LINE 25 COL 45. 

           05 FILLER PIC X(02) USING LK-CUS-PHONE(1:2) 
           LINE 26 COL 45 AUTO
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.

           05 FILLER PIC X(01) VALUE '-'
           LINE 26 COL 47 
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(02) USING LK-CUS-PHONE(3:2) 
           LINE 26 COL 48 AUTO
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.

           05 FILLER PIC X(01) VALUE '-'
           LINE 26 COL 50 
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(02) USING LK-CUS-PHONE(5:2) 
           LINE 26 COL 51 AUTO
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.

           05 FILLER PIC X(01) VALUE '-'
           LINE 26 COL 53 
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(02) USING LK-CUS-PHONE(7:2) 
           LINE 26 COL 54 AUTO
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.

           05 FILLER PIC X(01) VALUE '-'
           LINE 26 COL 56 
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(02) USING LK-CUS-PHONE(9:2) 
           LINE 26 COL 57 AUTO
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.

      *    [SK] Champ de saisi pour l'IBAN.
           05 FILLER PIC X(04) VALUE 'IBAN' 
           LINE 27 COL 45. 

           05 FILLER PIC X(04) USING LK-IBAN-1 
           LINE 28 COL 45 AUTO
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.  

           05 FILLER PIC X(01) VALUE '-'
           LINE 28 COL 49 
           FOREGROUND-COLOR IS 3. 

           05 FILLER PIC X(04) USING LK-IBAN-2
           LINE 28 COL 50 AUTO
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 

           05 FILLER PIC X(01) VALUE '-'
           LINE 28 COL 54 
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(04) USING LK-IBAN-3
           LINE 28 COL 55 AUTO
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.

           05 FILLER PIC X(01) VALUE '-'
           LINE 28 COL 59 
           FOREGROUND-COLOR IS 3. 

           05 FILLER PIC X(04) USING LK-IBAN-4 
           LINE 28 COL 60 AUTO
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 

           05 FILLER PIC X(01) VALUE '-'
           LINE 28 COL 64 
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(04) USING LK-IBAN-5
           LINE 28 COL 65 AUTO
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 

           05 FILLER PIC X(01) VALUE '-'
           LINE 28 COL 69 
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(04) USING LK-IBAN-6
           LINE 28 COL 70 AUTO
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 

           05 FILLER PIC X(01) VALUE '-'
           LINE 28 COL 74 
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(04) USING LK-IBAN-7
           LINE 28 COL 75 AUTO
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 

           05 FILLER PIC X(01) VALUE '-'
           LINE 28 COL 79 
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(04) USING LK-IBAN-8
           LINE 28 COL 80 AUTO
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 

           05 FILLER PIC X(01) VALUE '-'
           LINE 28 COL 84 
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(02) USING LK-IBAN-9
           LINE 28 COL 85 AUTO
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.    

      *    [SK] Champ de saisi pour le num de securite sociale.
           05 FILLER PIC X(27) VALUE 'Numero de securite sociale' 
           LINE 13 COL 108.

           05 FILLER PIC X(01) USING LK-SECU-1 
           LINE 14 COL 108 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.

           05 FILLER PIC X(01) VALUE '-'
           LINE 14 COL 109 AUTO 
           FOREGROUND-COLOR IS 2.

           05 FILLER PIC X(02) USING LK-SECU-2 
           LINE 14 COL 110 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.

           05 FILLER PIC X(01) VALUE '-'
           LINE 14 COL 112 AUTO 
           FOREGROUND-COLOR IS 2.

           05 FILLER PIC X(02) USING LK-SECU-3 
           LINE 14 COL 113 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 

           05 FILLER PIC X(01) VALUE '-'
           LINE 14 COL 115 AUTO 
           FOREGROUND-COLOR IS 2.

           05 FILLER PIC X(02) USING LK-SECU-4 
           LINE 14 COL 116 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.

           05 FILLER PIC X(01) VALUE '-'
           LINE 14 COL 118 AUTO 
           FOREGROUND-COLOR IS 2.

           05 FILLER PIC X(03) USING LK-SECU-5 
           LINE 14 COL 119 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 

           05 FILLER PIC X(01) VALUE '-'
           LINE 14 COL 122 AUTO 
           FOREGROUND-COLOR IS 2.

           05 FILLER PIC X(03) USING LK-SECU-6 
           LINE 14 COL 123 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 

           05 FILLER PIC X(01) VALUE '-'
           LINE 14 COL 126 AUTO 
           FOREGROUND-COLOR IS 2.

           05 FILLER PIC X(02) USING LK-SECU-7 
           LINE 14 COL 127 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 

      *    [SK] Champ de saisi pour le docteur.
           05 FILLER PIC X(07) VALUE 'Docteur' 
           LINE 15 COL 108. 

           05 FILLER PIC X(20) USING LK-CUS-DOCTOR 
           LINE 16 COL 108 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.   

      *    [SK] Champ de saisi pour le mail.
           05 FILLER PIC X(04) VALUE 'Mail' 
           LINE 17 COL 108. 

           05 FILLER PIC X(50) USING LK-CUS-MAIL 
           LINE 18 COL 108 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.  

      *    [SK] Champ de saisi pour l'adresse 1.
           05 FILLER PIC X(07) VALUE 'Adresse' 
           LINE 19 COL 108. 

           05 FILLER PIC X(50) USING LK-CUS-ADRESS1 
           LINE 20 COL 108 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 

      *    [SK] Champ de saisi pour l'adresse 2.
           05 FILLER PIC X(50) USING LK-CUS-ADRESS2 
           LINE 21 COL 108 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 

      *    [SK] Champ de saisi pour la ville.
           05 FILLER PIC X(05) VALUE 'Ville' 
           LINE 22 COL 108. 

           05 FILLER PIC X(30) USING LK-CUS-TOWN 
           LINE 23 COL 108 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.

      *    [SK] Champ de saisi pour le code postal.
           05 FILLER PIC X(15) VALUE 'Code postal' 
           LINE 24 COL 108. 

           05 FILLER PIC X(15) USING LK-CUS-ZIPCODE 
           LINE 25 COL 108 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.

      *    [SK] Champ de saisi pour le pays.
           05 FILLER PIC X(04) VALUE 'Pays' 
           LINE 26 COL 108. 

           05 FILLER PIC X(20) USING LK-CUS-COUNTRY 
           LINE 27 COL 108 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.

      *    [SK] zone message d'erreur.
           05 FILLER PIC X(140) FROM WS-ERROR-MESSAGE1 
           LINE 31 COL 45 
           FOREGROUND-COLOR IS 8.

           05 FILLER PIC X(120) FROM WS-ERROR-MESSAGE2 
           LINE 32 COL 64 
           FOREGROUND-COLOR IS 8.

      *    [SK] Bouton rechercher.
           05 FILLER PIC X(08) VALUE "Modifier" 
           LINE 34 COL 45 
           FOREGROUND-COLOR IS 2. 

           05 FILLER PIC X(01) USING WS-UPDATE-VALIDATION 
           LINE 34 COL 55
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 

      *    [SK] Bouton retour au menu.
           05 FILLER PIC X(01) USING WS-MENU-RETURN 
           LINE 34 COL 170 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 

           05 FILLER PIC X(14) VALUE 'Retour' 
           LINE 34 COL 172 
           FOREGROUND-COLOR IS 2.
