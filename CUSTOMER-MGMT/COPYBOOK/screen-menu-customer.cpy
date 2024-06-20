        01  SCREEN-MENU-CUSTOMER FOREGROUND-COLOR IS 2.
           05 BLANK SCREEN.

      ******************************************************************
      *    [RD-AL] DEFINITION DU CADRE.                                *
      ******************************************************************
       COPY 'screen-border.cpy'. 

      ******************************************************************
      *    [RD-AL] TITRE.                                              *
      ******************************************************************
           05 FILLER PIC X(18) VALUE 'MENU ADHERENT' 
           LINE 6 COL 90 
           FOREGROUND-COLOR IS 2. 

      ******************************************************************
      *    [RD-AL] CHAMPS DE SAISIS.                                   *
      ******************************************************************
      *    [RD-AL] Champ de saisi pour le nom.     
           05 FILLER PIC X(03) VALUE 'Nom' 
           LINE 13 COL 45. 

           05 FILLER PIC X(20) FROM WS-CUS-LASTNAME 
           LINE 14 COL 45 
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 3.

      *    [RD-AL] Champ de saisi pour le prenom.
           05 FILLER PIC X(06) VALUE 'Prenom' 
           LINE 15 COL 45. 
           
           05 FILLER PIC X(20) FROM WS-CUS-FIRSTNAME 
           LINE 16 COL 45 
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 3. 

      *    [RD-AL] Champ de saisi pour le genre.     
           05 FILLER PIC X(05) VALUE 'Genre' 
           LINE 17 COL 45. 

           05 FILLER PIC X(10) FROM WS-CUS-GENDER 
           LINE 18 COL 45 
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 3.           

      *    [RD-AL] Champ de saisi pour la date de naissance.
           05 FILLER PIC X(31) VALUE 'Date de naissance (JJ-MM-AAA)' 
           LINE 19 COL 45. 

           05 FILLER PIC X(02) FROM WS-CUB-DAY
           LINE 20 COL 45 
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 3. 

           05 FILLER PIC X(1) VALUE '-'
           LINE 20 COL 47 
           FOREGROUND-COLOR IS 2.

           05 FILLER PIC X(02) FROM WS-CUB-MONTH
           LINE 20 COL 48 
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(01) VALUE '-'
           LINE 20 COL 50 
           FOREGROUND-COLOR IS 2.

           05 FILLER PIC X(04) FROM WS-CUB-YEAR
           LINE 20 COL 51 
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 3.

      *    [RD-AL] Champ de saisi pour le nombre d'enfants.
           05 FILLER PIC X(16) VALUE "Nombre d'enfants" 
           LINE 21 COL 45. 

           05 FILLER PIC Z(02) FROM WS-CUS-NBCHILDREN 
           LINE 22 COL 45
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 3.

      *    [RD-AL] Champ de saisi pour le couple.
           05 FILLER PIC X(19) VALUE 'En couple (Oui/Non)' 
           LINE 23 COL 45. 

           05 FILLER PIC X(03) FROM WS-CUS-COUPLE 
           LINE 24 COL 45       
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 3.

      *    [RD-AL] Champ de saisi pour le telephone.
           05 FILLER PIC X(09) VALUE 'Telephone' 
           LINE 25 COL 45. 

           05 FILLER PIC X(02) FROM WS-CUS-PHONE(1:2) 
           LINE 26 COL 45 
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(01) VALUE '-'
           LINE 26 COL 47 
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(02) FROM WS-CUS-PHONE(3:2) 
           LINE 26 COL 48
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(01) VALUE '-'
           LINE 26 COL 50 
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(02) FROM WS-CUS-PHONE(5:2) 
           LINE 26 COL 51 
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(01) VALUE '-'
           LINE 26 COL 53 
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(02) FROM WS-CUS-PHONE(7:2) 
           LINE 26 COL 54 
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(01) VALUE '-'
           LINE 26 COL 56 
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(02) FROM WS-CUS-PHONE(9:2) 
           LINE 26 COL 57 
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 3.

      *    [RD-AL] Champ de saisi pour l'IBAN.
           05 FILLER PIC X(04) VALUE 'IBAN' 
           LINE 27 COL 45. 

           05 FILLER PIC X(04) FROM WS-CUS-CODE-IBAN(1:4) 
           LINE 28 COL 45
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 3.  

           05 FILLER PIC X(01) VALUE '-'
           LINE 28 COL 49 
           FOREGROUND-COLOR IS 3. 

           05 FILLER PIC X(04) FROM WS-CUS-CODE-IBAN(5:4) 
           LINE 28 COL 50 
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 3. 

           05 FILLER PIC X(01) VALUE '-'
           LINE 28 COL 54 
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(04) FROM WS-CUS-CODE-IBAN(9:4) 
           LINE 28 COL 55 
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(01) VALUE '-'
           LINE 28 COL 59 
           FOREGROUND-COLOR IS 3. 

           05 FILLER PIC X(04) FROM WS-CUS-CODE-IBAN(13:4) 
           LINE 28 COL 60 
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 3. 

           05 FILLER PIC X(01) VALUE '-'
           LINE 28 COL 64 
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(04) FROM WS-CUS-CODE-IBAN(17:4) 
           LINE 28 COL 65 
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 3. 

           05 FILLER PIC X(01) VALUE '-'
           LINE 28 COL 69 
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(04) FROM WS-CUS-CODE-IBAN(21:4) 
           LINE 28 COL 70 
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 3. 

           05 FILLER PIC X(01) VALUE '-'
           LINE 28 COL 74 
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(04) FROM WS-CUS-CODE-IBAN(25:4) 
           LINE 28 COL 75 
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 3. 

           05 FILLER PIC X(01) VALUE '-'
           LINE 28 COL 79 
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(04) FROM WS-CUS-CODE-IBAN(29:4) 
           LINE 28 COL 80 
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 3. 

           05 FILLER PIC X(01) VALUE '-'
           LINE 28 COL 84 
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(02) FROM WS-CUS-CODE-IBAN(33:2) 
           LINE 28 COL 85
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 3. 

      *    [RD-AL] Champ de saisi pour le num de seCUSite sociale.
           05 FILLER PIC X(27) VALUE 'Numero de securite sociale' 
           LINE 13 COL 108.

           05 FILLER PIC X(01) FROM WS-CCS-SECU-1 
           LINE 14 COL 108  
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(01) VALUE '-'
           LINE 14 COL 109  
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(02) FROM WS-CCS-SECU-2 
           LINE 14 COL 110 
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(01) VALUE '-'
           LINE 14 COL 112  
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(02) FROM WS-CCS-SECU-3 
           LINE 14 COL 113 
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 3. 

           05 FILLER PIC X(01) VALUE '-'
           LINE 14 COL 115  
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(02) FROM WS-CCS-SECU-4 
           LINE 14 COL 116 
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(01) VALUE '-'
           LINE 14 COL 118  
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(03) FROM WS-CCS-SECU-5 
           LINE 14 COL 119 
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 3. 

           05 FILLER PIC X(01) VALUE '-'
           LINE 14 COL 122  
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(03) FROM WS-CCS-SECU-6 
           LINE 14 COL 123  
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(01) VALUE '-'
           LINE 14 COL 126  
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(02) FROM WS-CCS-SECU-7 
           LINE 14 COL 127 
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 3.

      *    [RD-AL] Champ de saisi pour le docteur.
           05 FILLER PIC X(07) VALUE 'Docteur' 
           LINE 15 COL 108. 

           05 FILLER PIC X(20) FROM WS-CUS-DOCTOR 
           LINE 16 COL 108 
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 3.   

      *    [RD-AL] Champ de saisi pour le mail.
           05 FILLER PIC X(04) VALUE 'Mail' 
           LINE 17 COL 108. 

           05 FILLER PIC X(50) FROM WS-CUS-MAIL 
           LINE 18 COL 108 
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 3. 

      *    [RD-AL] Champ de saisi pour l'adresse 1.
           05 FILLER PIC X(07) VALUE 'Adresse' 
           LINE 19 COL 108. 

           05 FILLER PIC X(50) FROM WS-CUS-ADRESS1 
           LINE 20 COL 108 
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 3. 

      *    [RD-AL] Champ de saisi pour l'adresse 2.
           05 FILLER PIC X(50) FROM WS-CUS-ADRESS2 
           LINE 21 COL 108 
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 3. 

      *    [RD-AL] Champ de saisi pour la ville.
           05 FILLER PIC X(05) VALUE 'Ville' 
           LINE 22 COL 108. 

           05 FILLER PIC X(30) FROM WS-CUS-TOWN 
           LINE 23 COL 108 
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 3.

      *    [RD-AL] Champ de saisi pour le code postal.
           05 FILLER PIC X(11) VALUE 'Code postal' 
           LINE 24 COL 108. 

           05 FILLER PIC X(15) FROM WS-CUS-ZIPCODE 
           LINE 25 COL 108 
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 3.

      *    [RD-AL] Champ de saisi pour le pays.
           05 FILLER PIC X(04) VALUE 'Pays' 
           LINE 26 COL 108. 

           05 FILLER PIC X(20) FROM WS-CUS-COUNTRY 
           LINE 27 COL 108 
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 3.

      *    [RD-AL] zone message d'erreur.
           05 FILLER PIC X(70) FROM WS-ERROR-MESSAGE 
           LINE 30 COL 45 AUTO 
           FOREGROUND-COLOR IS 8.

      *    [RD-AL] Bouton modifier.
           05 FILLER PIC X(08) VALUE "Modifier" 
           LINE 34 COL 45 
           FOREGROUND-COLOR IS 2. 

           05 FILLER PIC X(01) USING WS-CUSTOMER-MODIF 
           LINE 34 COL 55
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 

      *    [RD-AL] Bouton archiver.
           05 FILLER PIC X(08) VALUE "Archiver" 
           LINE 34 COL 60 
           FOREGROUND-COLOR IS 2. 

           05 FILLER PIC X(01) USING WS-CUST-ARCHIVE 
           LINE 34 COL 70
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 

      *    [RD-AL] Bouton contrat.
           05 FILLER PIC X(08) VALUE "Contrat" 
           LINE 34 COL 75 
           FOREGROUND-COLOR IS 2. 

           05 FILLER PIC X(01) USING WS-CONTRACT-LIST 
           LINE 34 COL 85
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 

      *    [RD-AL] Bouton Remboursement.
           05 FILLER PIC X(13) VALUE "Remboursement" 
           LINE 34 COL 90 
           FOREGROUND-COLOR IS 2. 

           05 FILLER PIC X(01) USING WS-MENU-REMBOURSEMENT 
           LINE 34 COL 105
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 

      *    [RD-AL] Bouton Facture.
           05 FILLER PIC X(07) VALUE "Facture" 
           LINE 34 COL 110 
           FOREGROUND-COLOR IS 2. 

           05 FILLER PIC X(01) USING WS-MENU-FACTURE 
           LINE 34 COL 119
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 

      *    [RD-AL] Bouton retour au menu.
           05 FILLER PIC X(01) USING WS-MENU-RETURN 
           LINE 34 COL 170 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 

           05 FILLER PIC X(14) VALUE 'Retour menu' 
           LINE 34 COL 172 
           FOREGROUND-COLOR IS 2.
