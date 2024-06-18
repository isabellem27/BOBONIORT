       01  SCREEN-READ-CONTRACT FOREGROUND-COLOR IS 2.
           05 BLANK SCREEN.
           
      ******************************************************************
      *    [RD] DEFINITION DU CADRE.                                   *
      ******************************************************************
       COPY 'screen-border.cpy'.

      ******************************************************************
      *    [RD] TITRE.                                                 *
      ****************************************************************** 
           05 FILLER PIC X(18) VALUE  "LECTURE DU CONTRAT" 
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

           05 FILLER PIC X(10) FROM  WS-REIM-NUM 
           LINE 11 COL 118 
           FOREGROUND-COLOR IS 2. 

      * [AL] - Parties Soins courants
           05 FILLER PIC X(14) VALUE 'Soins Courants'
           LINE 13 COL 70 
           FOREGROUND-COLOR IS 2. 

      * [AL] - Honoraires medecins para et valeurs dans les 3 types cts
           05 FILLER PIC X(19) VALUE 'Honoraires medecins'  
           LINE 14 COL 73 
           FOREGROUND-COLOR IS 2. 

           05 FILLER PIC X(3) FROM WS-DOCTOR
           LINE 14 COL 118 
           FOREGROUND-COLOR IS 3.
           
           05 FILLER PIC X(2) VALUE ' %'
           LINE 14 COL 121 
           FOREGROUND-COLOR IS 3.
                     
           05 FILLER PIC X(23) VALUE 'Reglements paramedicaux' 
           LINE 15 COL 73 
           FOREGROUND-COLOR IS 2. 

           05 FILLER PIC X(3) FROM WS-PARMEDICAL
           LINE 15 COL 118 
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(2) VALUE ' %'
           LINE 15 COL 121 
           FOREGROUND-COLOR IS 3.
        
      * [AL] - Hospitalisation (la fidélité est géré dans le bac)        
           05 FILLER PIC X(15) VALUE 'Hospitalisation' 
           LINE 17 COL 70 
           FOREGROUND-COLOR IS 2. 

           05 FILLER PIC X(3) FROM WS-HOSPITAL
           LINE 17 COL 118 
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(2) VALUE ' %'
           LINE 17 COL 121 
           FOREGROUND-COLOR IS 3.

      * [AL] - Optique et valeurs dans les 3 types cts 
           05 FILLER PIC X(7) VALUE 'Optique'
           LINE 19 COL 70 
           FOREGROUND-COLOR IS 2.  

           05 FILLER PIC X(14) VALUE 'Verres simples'  
           LINE 20 COL 73 
           FOREGROUND-COLOR IS 2. 

           05 FILLER PIC X(3) FROM WS-S-GLASSES
           LINE 20 COL 118 
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(2) VALUE ' %'
           LINE 20 COL 121 
           FOREGROUND-COLOR IS 3.
                    
           05 FILLER PIC X(18) VALUE 'Verres progressifs'  
           LINE 21 COL 73 
           FOREGROUND-COLOR IS 2. 

           05 FILLER PIC X(3) FROM WS-P-GLASSES
           LINE 21 COL 118 
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(2) VALUE ' %'
           LINE 21 COL 121 
           FOREGROUND-COLOR IS 3.

      * [AL] - Dentaire et valeurs dans les 3 types cts 
           05 FILLER PIC X(8) VALUE 'Dentaire'
           LINE 23 COL 70 
           FOREGROUND-COLOR IS 2.  

           05 FILLER PIC X(20) VALUE 'Couronnes (molaires)' 
           LINE 24 COL 73 
           FOREGROUND-COLOR IS 2. 

           05 FILLER PIC X(3) FROM WS-MOLAR
           LINE 24 COL 118 
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(2) VALUE ' %'
           LINE 24 COL 121 
           FOREGROUND-COLOR IS 3.
                        
           05 FILLER PIC X(25) VALUE 'Couronnes (hors molaires)'  
           LINE 25 COL 73 
           FOREGROUND-COLOR IS 2. 

           05 FILLER PIC X(3) FROM WS-NON-MOLAR
           LINE 25 COL 118 
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(2) VALUE ' %'
           LINE 25 COL 121 
           FOREGROUND-COLOR IS 3.
           
           05 FILLER PIC X(10) VALUE 'Detartrage'
           LINE 26 COL 73 
           FOREGROUND-COLOR IS 2. 

           05 FILLER PIC X(3) FROM WS-DESCALINGS
           LINE 26 COL 118 
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(2) VALUE ' %'
           LINE 26 COL 121 
           FOREGROUND-COLOR IS 3.
           
           05 FILLER PIC X(15) VALUE 'Statut maritale'
           LINE 28 COL 73 
           FOREGROUND-COLOR IS 2. 

           05 FILLER PIC X(03) FROM WS-CUS-COUPLE
           LINE 28 COL 118 
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(16) VALUE "Nombre d'enfants"
           LINE 29 COL 73 
           FOREGROUND-COLOR IS 2.

           05 FILLER PIC X(3) FROM WS-CUS-NBCHILDREN
           LINE 29 COL 118 
           FOREGROUND-COLOR IS 3.

           05 FILLER PIC X(1) TO  SC-MENU-RETURN  
           LINE 34 COL 170 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 

           05 FILLER PIC X(14) VALUE  "Retour menu" 
           LINE 34 COL 172 
           FOREGROUND-COLOR IS 2.

           05 FILLER PIC X(19) VALUE  "Modifier le contrat" 
           LINE 34 COL 50 
           FOREGROUND-COLOR IS 2.

           05 FILLER PIC X(1) TO  SC-MODIFY-CONTRACT
           LINE 34 COL 48 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.
