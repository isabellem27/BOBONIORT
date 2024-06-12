       01 SCREEN-CONTRAT-SPECIFIQUE FOREGROUND-COLOR IS 2.
           05 BLANK SCREEN.

      * [AL] - Nom des contrats type
           05 FILLER PIC X(18) VALUE  "CONTRAT SPECIFIQUE" 
           LINE 11 COL 85 
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

      * [AL] - VALEUR Honoraires medecins para 3 types cts
           05 PIC X USING  SC-VALUE-MEDIC-1
           COL 98 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0.
           05 PIC X USING  SC-VALUE-MEDIC-2
           COL 128 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0. 
           05 PIC X USING  SC-VALUE-MEDIC-3
            COL 158 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0. 

           05 FILLER PIC X(23) VALUE 'Reglements paramedicaux' 
           LINE 16 COL 38 
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

      * [AL] -  para 3 types cts
           05 PIC X USING  SC-VALUE-PARAMEDIC-1
           COL 98 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0.
           05 PIC X USING  SC-VALUE-PARAMEDIC-2
           COL 128 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0. 
           05 PIC X USING  SC-VALUE-PARAMEDIC-3
            COL 158 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0. 

      * [AL] - Hospitalisation (la fidélité est géré dans le bac)        
           05 FILLER PIC X(15) VALUE 'Hospitalisation' 
           LINE 18 COL 38 
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

      * [AL] - VALEUR hospitalisation para 3 types cts
           05 PIC X USING  SC-VALUE-HOSPITAL-1
           COL 98 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0.
           05 PIC X USING  SC-VALUE-HOSPITAL-2
           COL 128 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0. 
           05 PIC X USING  SC-VALUE-HOSPITAL-3
            COL 158 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0. 

      * [AL] - Optique et valeurs dans les 3 types cts            
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

      * [AL] - VALEUR optique para 3 types cts
           05 PIC X USING  SC-VALUE-SIMPLE-GLASSES-1
           COL 98 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0.
           05 PIC X USING  SC-VALUE-SIMPLE-GLASSES-2
           COL 128 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0. 
           05 PIC X USING  SC-VALUE-SIMPLE-GLASSES-3
            COL 158 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0. 

           05 FILLER PIC X(18) VALUE 'Verres progressifs'  
           LINE 22 COL 38 
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

      * [AL] - VALEUR verre spe para 3 types cts
           05 PIC X USING  SC-VALUE-PROGRESSIVE-GLASSES-1
           COL 98 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0.
           05 PIC X USING  SC-VALUE-PROGRESSIVE-GLASSES-2
           COL 128 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0. 
           05 PIC X USING  SC-VALUE-PROGRESSIVE-GLASSES-3
            COL 158 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0. 

      * [AL] - Dentaire et valeurs dans les 3 types cts            
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

      * [AL] - VALEUR molaire para 3 types cts
           05 PIC X USING  SC-VALUE-MOLAR-CORWS-1
           COL 98 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0.
           05 PIC X USING  SC-VALUE-MOLAR-CORWS-2
           COL 128 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0. 
           05 PIC X USING  SC-VALUE-MOLAR-CORWS-3
            COL 158 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0. 

           05 FILLER PIC X(25) VALUE 'Couronnes (hors molaires)'  
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

      * [AL] - VALEUR non molaire para 3 types cts
           05 PIC X USING  SC-VALUE-NON-MOLAR-CORWS-1
           COL 98 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0.
           05 PIC X USING  SC-VALUE-NON-MOLAR-CORWS-2
           COL 128 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0. 
           05 PIC X USING  SC-VALUE-NON-MOLAR-CORWS-3
            COL 158 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0. 

           05 FILLER PIC X(10) VALUE 'Detartrage'
           LINE 28 COL 38 
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
      * [AL] - VALEUR Honoraires medecins para 3 types cts
           05 PIC X USING  SC-VALUE-DESCALINGS-1
           COL 98 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0.
           05 PIC X USING  SC-VALUE-DESCALINGS-1
           COL 128 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0. 
           05 PIC X USING  SC-VALUE-DESCALINGS-1
            COL 158 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0. 

      * [AL] - Affichage valeur calculer 
           05 FILLER PIC X(20) VALUE "Valider mes choix :"
           LINE 30
           COL 85
           FOREGROUND-COLOR IS 3.        
           05 PIC X(1) USING SC-BUTTON-CHOICE-VALIDATION
           COL 107
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0.  

      * [AL] - Affichage valeur calculer 
           05 FILLER PIC X(20) VALUE "Montant du contrat :"
           LINE 30
           COL 127
           FOREGROUND-COLOR IS 3.        
           05 PIC X(3) FROM SC-CONTRACT-SPE-CALCUL
           COL 149
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0.  
           05 FILLER PIC X(5) VALUE "euros"
           COL 154
           FOREGROUND-COLOR IS 3.  

      * [AL] - boutons de creation contrats spe 
           05 FILLER PIC X(23) VALUE 'Validation du contrat :'
           LINE 34 COL 38
           FOREGROUND-COLOR IS 3. 
           05 PIC X USING  SC-BUTTON-CONTRACT-SPE
           COL 61 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0. 

      * [AL] - Affichage message gestion d'erreur          
           05 PIC X(45) from SC-ERROR-MESSAGE
           COL 80 
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 7. 


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
           05 FILLER PIC X(30) VALUE  "CREATION DU CONTRAT SPECIFIQUE" 
           COL 80 
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
           05 FILLER PIC X(1) TO  SC-BUTTON-MENU 
           COL 170 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 
           05 FILLER PIC X(6) VALUE  "Retour" 
           COL 172 
           FOREGROUND-COLOR IS 2.

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

