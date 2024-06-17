       01 SCREEN-FRAME FOREGROUND-COLOR IS 2.
           05 BLANK SCREEN.
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
           05 FILLER PIC X(18) VALUE  "LECTURE DU CONTRAT" 
           COL 89 
           FOREGROUND-COLOR IS 2.  

      ******************************************************************

           05 FILLER PIC X(10) FROM  WS-CONTRACT-TYPE 
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
           COL 118 
           FOREGROUND-COLOR IS 3.
           
           05 FILLER PIC X(2) VALUE ' %'
           COL 121 
           FOREGROUND-COLOR IS 3.
                     
           05 FILLER PIC X(23) VALUE 'Reglements paramedicaux' 
           LINE 15 COL 73 
           FOREGROUND-COLOR IS 2. 
           05 FILLER PIC X(3) FROM WS-PARMEDICAL
           COL 118 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(2) VALUE ' %'
           COL 121 
           FOREGROUND-COLOR IS 3.
        
      * [AL] - Hospitalisation (la fidélité est géré dans le bac)        
           05 FILLER PIC X(15) VALUE 'Hospitalisation' 
           LINE 17 COL 70 
           FOREGROUND-COLOR IS 2. 
           05 FILLER PIC X(3) FROM WS-HOSPITAL
           COL 118 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(2) VALUE ' %'
           COL 121 
           FOREGROUND-COLOR IS 3.
            

      * [AL] - Optique et valeurs dans les 3 types cts 
           05 FILLER PIC X(7) VALUE 'Optique'
           LINE 19 COL 70 
           FOREGROUND-COLOR IS 2.            
           05 FILLER PIC X(14) VALUE 'Verres simples'  
           LINE 20 COL 73 
           FOREGROUND-COLOR IS 2. 
           05 FILLER PIC X(3) FROM WS-S-GLASSES
           COL 118 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(2) VALUE ' %'
           COL 121 
           FOREGROUND-COLOR IS 3.
                    
           05 FILLER PIC X(18) VALUE 'Verres progressifs'  
           LINE 21 COL 73 
           FOREGROUND-COLOR IS 2. 
           05 FILLER PIC X(3) FROM WS-P-GLASSES
           COL 118 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(2) VALUE ' %'
           COL 121 
           FOREGROUND-COLOR IS 3.
        

      * [AL] - Dentaire et valeurs dans les 3 types cts 
           05 FILLER PIC X(8) VALUE 'Dentaire'
           LINE 23 COL 70 
           FOREGROUND-COLOR IS 2.            
           05 FILLER PIC X(20) VALUE 'Couronnes (molaires)' 
           LINE 24 COL 73 
           FOREGROUND-COLOR IS 2. 
           05 FILLER PIC X(3) FROM WS-MOLAR
           COL 118 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(2) VALUE ' %'
           COL 121 
           FOREGROUND-COLOR IS 3.
                        
           05 FILLER PIC X(25) VALUE 'Couronnes (hors molaires)'  
            LINE 25 COL 73 
           FOREGROUND-COLOR IS 2. 
           05 FILLER PIC X(3) FROM WS-NON-MOLAR
           COL 118 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(2) VALUE ' %'
           COL 121 
           FOREGROUND-COLOR IS 3.
           
           05 FILLER PIC X(10) VALUE 'Detartrage'
           LINE 26 COL 73 
           FOREGROUND-COLOR IS 2. 
           05 FILLER PIC X(3) FROM WS-DESCALINGS
           COL 118 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(2) VALUE ' %'
           COL 121 
           FOREGROUND-COLOR IS 3.
           
           05 FILLER PIC X(15) VALUE 'Statut maritale'
           LINE 28 COL 73 
           FOREGROUND-COLOR IS 2. 
           05 FILLER PIC X(3) FROM WS-CUS-COUPLE
           COL 118 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(16) VALUE "Nombre d'enfants"
           LINE 29 COL 73 
           FOREGROUND-COLOR IS 2.
           05 FILLER PIC X(3) FROM WS-CUS-NBCHILDREN
           COL 118 
           FOREGROUND-COLOR IS 3.
      ******************************************************************          

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
           05 FILLER PIC X(1) TO  SC-MENU-RETURN  
           COL 170 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 
           05 FILLER PIC X(14) VALUE  "Retour au Menu" 
           COL 172 
           FOREGROUND-COLOR IS 2.
           05 FILLER PIC X(19) VALUE  "Modifier le contrat" 
           COL 50 
           FOREGROUND-COLOR IS 2.
           05 FILLER PIC X(1) TO  SC-MODIFY-CONTRACT
           COL 48 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 

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


           


