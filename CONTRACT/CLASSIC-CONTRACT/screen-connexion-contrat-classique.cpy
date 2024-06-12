       01 SCREEN-CONTRAT-BASE FOREGROUND-COLOR IS 2.
           05 BLANK SCREEN.

      * [AL] - Nom des contrats type
           05 FILLER PIC X(6) VALUE  "ALLEGE" 
           LINE 11 COL 89 
           FOREGROUND-COLOR IS 2. 
           05 FILLER PIC X(6) VALUE  "MODERE" 
           LINE 11 COL 119 
           FOREGROUND-COLOR IS 2. 
           05 FILLER PIC X(10) VALUE  "EXCELLENCE" 
           LINE 11 COL 148 
           FOREGROUND-COLOR IS 2. 

      * [AL] - Parties Soins courants
           05 FILLER PIC X(14) VALUE 'Soins Courants'
           LINE 13 COL 35 
           FOREGROUND-COLOR IS 2.  
      * [AL] - Honoraires medecins para et valeurs dans les 3 types cts
           05 FILLER PIC X(19) VALUE 'Honoraires medecins'  
           LINE 14 COL 38 
           FOREGROUND-COLOR IS 2. 
           05 FILLER PIC X(5) VALUE '100 %'
           COL 90 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(5) VALUE '120 %'
           COL 120 
           FOREGROUND-COLOR IS 3.  
           05 FILLER PIC X(5) VALUE '240 %'
           COL 150 
           FOREGROUND-COLOR IS 3.               
           05 FILLER PIC X(23) VALUE 'Reglements paramedicaux' 
           LINE 15 COL 38 
           FOREGROUND-COLOR IS 2. 
           05 FILLER PIC X(5) VALUE '100 %'
           COL 90 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(5) VALUE '100 %'
           COL 120 
           FOREGROUND-COLOR IS 3.  
           05 FILLER PIC X(5) VALUE '150 %'
           COL 150 
           FOREGROUND-COLOR IS 3.      
      * [AL] - Hospitalisation (la fidélité est géré dans le bac)        
           05 FILLER PIC X(15) VALUE 'Hospitalisation' 
           LINE 17 COL 35 
           FOREGROUND-COLOR IS 2. 
           05 FILLER PIC X(5) VALUE '100 %'
           COL 90 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(5) VALUE '150 %'
           COL 120 
           FOREGROUND-COLOR IS 3.  
           05 FILLER PIC X(5) VALUE '280 %'
           COL 150 
           FOREGROUND-COLOR IS 3.                

      * [AL] - Optique et valeurs dans les 3 types cts 
           05 FILLER PIC X(7) VALUE 'Optique'
           LINE 19 COL 35 
           FOREGROUND-COLOR IS 2.            
           05 FILLER PIC X(14) VALUE 'Verres simples'  
           LINE 20 COL 38 
           FOREGROUND-COLOR IS 2. 
           05 FILLER PIC X(5) VALUE ' 30 %'
           COL 90 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(5) VALUE ' 60 %'
           COL 120 
           FOREGROUND-COLOR IS 3.  
           05 FILLER PIC X(5) VALUE ' 98 %'
           COL 150 
           FOREGROUND-COLOR IS 3.             
           05 FILLER PIC X(18) VALUE 'Verres progressifs'  
           LINE 21 COL 38 
           FOREGROUND-COLOR IS 2. 
           05 FILLER PIC X(5) VALUE ' 33 %'
           COL 90 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(5) VALUE ' 66 %'
           COL 120 
           FOREGROUND-COLOR IS 3.  
           05 FILLER PIC X(5) VALUE ' 98 %'
           COL 150 
           FOREGROUND-COLOR IS 3.   

      * [AL] - Dentaire et valeurs dans les 3 types cts 
           05 FILLER PIC X(8) VALUE 'Dentaire'
           LINE 23 COL 35 
           FOREGROUND-COLOR IS 2.            
           05 FILLER PIC X(20) VALUE 'Couronnes (molaires)' 
           LINE 24 COL 38 
           FOREGROUND-COLOR IS 2. 
           05 FILLER PIC X(5) VALUE ' 16 %'
           COL 90 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(5) VALUE ' 33 %'
           COL 120 
           FOREGROUND-COLOR IS 3.  
           05 FILLER PIC X(5) VALUE ' 80 %'
           COL 150 
           FOREGROUND-COLOR IS 3.               
           05 FILLER PIC X(25) VALUE 'Couronnes (hors molaires)'  
            LINE 25 COL 38 
           FOREGROUND-COLOR IS 2. 
           05 FILLER PIC X(5) VALUE '100 %'
           COL 90 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(5) VALUE '100 %'
           COL 120 
           FOREGROUND-COLOR IS 3.  
           05 FILLER PIC X(5) VALUE '100 %'
           COL 150 
           FOREGROUND-COLOR IS 3.          
           05 FILLER PIC X(10) VALUE 'Detartrage'
           LINE 26 COL 38 
           FOREGROUND-COLOR IS 2. 
           05 FILLER PIC X(5) VALUE '100 %'
           COL 90 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(5) VALUE '100 %'
           COL 120 
           FOREGROUND-COLOR IS 3.  
           05 FILLER PIC X(5) VALUE '100 %'
           COL 150 
           FOREGROUND-COLOR IS 3.            

      * [AL] - Montant des cotisations dans les 3 types cts 
           05 FILLER PIC X(14) VALUE 'Adulte -30 ans'
           LINE 28 COL 35 
           FOREGROUND-COLOR IS 2. 
           05 FILLER PIC X(8) VALUE '25 euros'
           COL 90 
           FOREGROUND-COLOR IS 2.
           05 FILLER PIC X(8) VALUE '35 euros'
           COL 120 
           FOREGROUND-COLOR IS 2.  
           05 FILLER PIC X(8) VALUE '45 euros'
           COL 150 
           FOREGROUND-COLOR IS 2.  
           05 FILLER PIC X(18) VALUE 'Adulte 30 a 65 ans'
           LINE 29 COL 35 
           FOREGROUND-COLOR IS 2. 
           05 FILLER PIC X(8) VALUE '20 euros'
           COL 90 
           FOREGROUND-COLOR IS 2.
           05 FILLER PIC X(8) VALUE '30 euros'
           COL 120 
           FOREGROUND-COLOR IS 2.  
           05 FILLER PIC X(8) VALUE '40 euros'
           COL 150 
           FOREGROUND-COLOR IS 2.  
           05 FILLER PIC X(14) VALUE 'Adulte +65 ans'
           LINE 30 COL 35 
           FOREGROUND-COLOR IS 2. 
           05 FILLER PIC X(8) VALUE '25 euros'
           COL 90 
           FOREGROUND-COLOR IS 2.
           05 FILLER PIC X(8) VALUE '35 euros'
           COL 120 
           FOREGROUND-COLOR IS 2.  
           05 FILLER PIC X(8) VALUE '50 euros'
           COL 150 
           FOREGROUND-COLOR IS 2.  

      * [AL] - boutons de des 3 types cts 
           05 PIC X USING  SC-BUTTON-ALLEGE
           LINE 32 COL 92 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0. 
           05 PIC X USING  SC-BUTTON-MODERE
           LINE 32 COL 122 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0. 
           05 PIC X USING  SC-BUTTON-EXCELLENCE
           LINE 32 COL 152 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0. 

           05 PIC X(45) from LK-ERROR-MESSAGE
           COL 35 
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 7. 

           

      * [AL] - boutons vers pages contrats spe 
           05 FILLER PIC X(18) VALUE 'CONTRAT SPECIFIQUE'
           LINE 34 COL 35
           FOREGROUND-COLOR IS 3. 
           05 PIC X USING  SC-BUTTON-CONTRACT-SPE
           COL 55 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0. 


      * [AL] - boutons de retour menu
           05 FILLER PIC X(1) TO  SC-BUTTON-MENU 
           LINE 34 COL 170 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 
           05 FILLER PIC X(6) VALUE  "Retour" 
           COL 172 
           FOREGROUND-COLOR IS 2.

      * [AL] - boutons de validation du ct et fer
           05 FILLER PIC X(1) TO  SC-BUTTON-VALIDATE 
           COL 107 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0. 
           05 FILLER PIC X(9) VALUE  "Confirmer" 
           COL 110 
           FOREGROUND-COLOR IS 3.

      * [AL] - cadre page
           05 FILLER PIC X(182) VALUE all " " LINE 4 COL 10 
           BACKGROUND-COLOR IS 2.
           05 FILLER PIC X(2) VALUE  "  " LINE 5 COL 10 
           BACKGROUND-COLOR IS 2.
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 6 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2.
           05 FILLER PIC X(19) VALUE  "CONTRATS CLASSIQUES" 
           COL 87 
           FOREGROUND-COLOR IS 2.            

           05 FILLER PIC X(2) VALUE  "  " LINE 7 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(182) VALUE all  "  " LINE 8 COL 10 
           BACKGROUND-COLOR IS 2.

           05 FILLER PIC X(2) VALUE  "  " LINE 9 COL 10 
           BACKGROUND-COLOR IS 2.         
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 10 COL 10 
           BACKGROUND-COLOR IS 2. 
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 11 COL 10 
           BACKGROUND-COLOR IS 2.                       
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 12 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2.            

           05 FILLER PIC X(2) VALUE  "  " LINE 13 COL 10 
           BACKGROUND-COLOR IS 2.                           
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 14 COL 10 
           BACKGROUND-COLOR IS 2.                    
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2.  

           05 FILLER PIC X(2) VALUE  "  " LINE 15 COL 10 
           BACKGROUND-COLOR IS 2.                  
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2.            

           05 FILLER PIC X(2) VALUE  "  " LINE 16 COL 10 
           BACKGROUND-COLOR IS 2.                
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2.  

           05 FILLER PIC X(2) VALUE  "  " LINE 17 COL 10 
           BACKGROUND-COLOR IS 2.      
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2.

           05 FILLER PIC X(2) VALUE  "  " LINE 18 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2.

           05 FILLER PIC X(2) VALUE  "  " LINE  19 COL 10 
           BACKGROUND-COLOR IS 2.         
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2.  

           05 FILLER PIC X(2) VALUE  "  " LINE 20 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2.            

           05 FILLER PIC X(2) VALUE  "  " LINE 21 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2.                     

           05 FILLER PIC X(2) VALUE  "  " LINE 22 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 23 COL 10 
           BACKGROUND-COLOR IS 2.         
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 24 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 25 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2.

           05 FILLER PIC X(2) VALUE  "  " LINE 26 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 27 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 28 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 29 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 30 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2.

           05 FILLER PIC X(2) VALUE  "  " LINE 21 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 22 COL 10 
           BACKGROUND-COLOR IS 2.         
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 23 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 24 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 25 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 26 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 27 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 28 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 29 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 30 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 31 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 32 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 33 COL 10 
           BACKGROUND-COLOR IS 2.      
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 34 COL 10 
           BACKGROUND-COLOR IS 2.      
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 


           05 FILLER PIC X(2) VALUE  "  " LINE 35 COL 10 
           BACKGROUND-COLOR IS 2.      
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 36 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(182) VALUE all  "  " LINE 37 COL 10 
           BACKGROUND-COLOR IS 2.

