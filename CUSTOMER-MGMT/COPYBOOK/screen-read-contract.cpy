       01  SCREEN-READ-CONTRACT FOREGROUND-COLOR IS 2.
           05 BLANK SCREEN.
           
      ******************************************************************
      *    [RD] DEFINITION DU CADRE.                                   *
      ******************************************************************
       COPY 'screen-border.cpy'.

      ******************************************************************
      *    [RD] TITRE.                                                 *
      ****************************************************************** 
           05 FILLER PIC X(18) VALUE 'LECTURE DU CONTRAT' 
           LINE 6 COL 89 
           FOREGROUND-COLOR IS 2.  

      *    [RD] Nom Prénom Numéro de sécu. 
           05 FILLER PIC X(80) FROM WS-CUSTOMER-NAME  
           LINE 11 COL 20
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 7. 

      ******************************************************************
      *    [RD] CHAMPS.                                                *
      ******************************************************************

      * [RD] - Parties Contrat 
           05 FILLER PIC X(07) VALUE 'Contrat'
           LINE 11 COL 70 
           FOREGROUND-COLOR IS 2. 

           05 FILLER PIC X(06) VALUE 'Numero'  
           LINE 12 COL 73 
           FOREGROUND-COLOR IS 2. 

           05 FILLER PIC X(10) FROM  WS-REIM-NUM 
           LINE 12 COL 118 
           FOREGROUND-COLOR IS 3. 

           05 FILLER PIC X(04) VALUE 'Type'  
           LINE 13 COL 73 
           FOREGROUND-COLOR IS 2. 

           05 FILLER PIC X(10) FROM  WS-REIM-TYPE 
           LINE 13 COL 118 
           FOREGROUND-COLOR IS 3. 

           05 FILLER PIC X(07) VALUE 'Montant'  
           LINE 14 COL 73 
           FOREGROUND-COLOR IS 2. 

           05 FILLER PIC Z(02)9 FROM  WS-COST 
           LINE 14 COL 118 
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(05) VALUE 'euros'
           LINE 14 COL 122
           FOREGROUND-COLOR IS 3.

      * [AL] - Parties Soins courants
           05 FILLER PIC X(14) VALUE 'Soins Courants'
           LINE 16 COL 70 
           FOREGROUND-COLOR IS 2. 

           05 FILLER PIC X(19) VALUE 'Honoraires medecins'  
           LINE 17 COL 73 
           FOREGROUND-COLOR IS 2. 

           05 FILLER PIC Z(02)9 FROM WS-DOCTOR
           LINE 17 COL 118 
           FOREGROUND-COLOR IS 3.
           
           05 FILLER PIC X(01) VALUE '%'
           LINE 17 COL 122
           FOREGROUND-COLOR IS 3.
                     
           05 FILLER PIC X(23) VALUE 'Reglements paramedicaux' 
           LINE 18 COL 73 
           FOREGROUND-COLOR IS 2. 

           05 FILLER PIC Z(02)9 FROM WS-PARMEDICAL
           LINE 18 COL 118 
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(01) VALUE '%'
           LINE 18 COL 122 
           FOREGROUND-COLOR IS 3.
        
      * [AL] - Hospitalisation (la fidélité est géré dans le back)        
           05 FILLER PIC X(15) VALUE 'Hospitalisation' 
           LINE 20 COL 70 
           FOREGROUND-COLOR IS 2. 

           05 FILLER PIC Z(02)9 FROM WS-HOSPITAL
           LINE 20 COL 118 
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(01) VALUE '%'
           LINE 20 COL 122 
           FOREGROUND-COLOR IS 3.

      * [AL] - Partie Optique 
           05 FILLER PIC X(07) VALUE 'Optique'
           LINE 22 COL 70 
           FOREGROUND-COLOR IS 2.  

           05 FILLER PIC X(14) VALUE 'Verres simples'  
           LINE 23 COL 73 
           FOREGROUND-COLOR IS 2. 

           05 FILLER PIC Z(02)9 FROM WS-S-GLASSES
           LINE 23 COL 118 
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(01) VALUE '%'
           LINE 23 COL 122 
           FOREGROUND-COLOR IS 3.
                    
           05 FILLER PIC X(18) VALUE 'Verres progressifs'  
           LINE 24 COL 73 
           FOREGROUND-COLOR IS 2. 

           05 FILLER PIC Z(02)9 FROM WS-P-GLASSES
           LINE 24 COL 118 
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(01) VALUE '%'
           LINE 24 COL 122 
           FOREGROUND-COLOR IS 3.

      * [AL] - Partie Dentaire 
           05 FILLER PIC X(08) VALUE 'Dentaire'
           LINE 26 COL 70 
           FOREGROUND-COLOR IS 2.  

           05 FILLER PIC X(20) VALUE 'Couronnes (molaires)' 
           LINE 27 COL 73 
           FOREGROUND-COLOR IS 2. 

           05 FILLER PIC Z(02)9 FROM WS-MOLAR
           LINE 27 COL 118 
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(01) VALUE '%'
           LINE 27 COL 122 
           FOREGROUND-COLOR IS 3.
                        
           05 FILLER PIC X(25) VALUE 'Couronnes (hors molaires)'  
           LINE 28 COL 73 
           FOREGROUND-COLOR IS 2. 

           05 FILLER PIC Z(02)9 FROM WS-NON-MOLAR
           LINE 28 COL 118 
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(01) VALUE '%'
           LINE 28 COL 122 
           FOREGROUND-COLOR IS 3.
           
           05 FILLER PIC X(10) VALUE 'Detartrage'
           LINE 29 COL 73 
           FOREGROUND-COLOR IS 2. 

           05 FILLER PIC Z(02)9 FROM WS-DESCALINGS
           LINE 29 COL 118 
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(01) VALUE '%'
           LINE 29 COL 122
           FOREGROUND-COLOR IS 3.
           
      * [RD] - Statut maritale     
           05 FILLER PIC X(19) VALUE 'En couple (oui/non)'
           LINE 31 COL 70 
           FOREGROUND-COLOR IS 2. 

           05 FILLER PIC X(03) FROM WS-CUS-COUPLE
           LINE 31 COL 118 
           FOREGROUND-COLOR IS 3.

      * [RD] - Nombre d'enfants 
           05 FILLER PIC X(16) VALUE "Nombre d'enfants"
           LINE 32 COL 70 
           FOREGROUND-COLOR IS 2.

           05 FILLER PIC Z(02)9 FROM WS-CUS-NBCHILDREN
           LINE 32 COL 118 
           FOREGROUND-COLOR IS 3.

      *    [RD] Zone de message d'erreur.    
           05 FILLER PIC X(46) FROM WS-ERROR-MESSAGE
           LINE 34 COL 70 
           FOREGROUND-COLOR IS 8.     

      * [RD] - Bouton Retour menu 
           05 FILLER PIC X(01) USING WS-MENU-RETURN  
           LINE 34 COL 170 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 

           05 FILLER PIC X(14) VALUE 'Retour'
           LINE 34 COL 172 
           FOREGROUND-COLOR IS 2.

      * [RD] - Bouton Modifier le contrat  
      *    05 FILLER PIC X(19) VALUE "Modifier le contrat" 
      *    LINE 34 COL 50 
      *    FOREGROUND-COLOR IS 2.

      *    05 FILLER PIC X(01) TO WS-MODIFY-CONTRACT
      *    LINE 34 COL 48 
      *    BACKGROUND-COLOR IS 2
      *    FOREGROUND-COLOR IS 0.
