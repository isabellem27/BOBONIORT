       01  SCREEN-SPECIFIC-CONTRACT FOREGROUND-COLOR IS 2.
           05 BLANK SCREEN.

      * [AL] - Nom des contrats type
           05 FILLER PIC X(18) VALUE  'CONTRAT SPECIFIQUE' 
           LINE 11 COL 90 
           FOREGROUND-COLOR IS 2. 


      * [AL] - Honoraires medecins para et % médecin
           05 FILLER PIC X(19) VALUE 'Honoraires medecins'  
           LINE 14 COL 38 
           FOREGROUND-COLOR IS 2. 
           05 FILLER PIC X(3) FROM WS-ALLEGE-DOCTOR
           COL 90 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(2) VALUE ' %'
           COL 93 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(3) FROM WS-MODERE-DOCTOR
           COL 120
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(2) VALUE ' %'
           COL 123
           FOREGROUND-COLOR IS 3.  
           05 FILLER PIC X(3) FROM WS-EXCELL-DOCTOR
           COL 150
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(2) VALUE ' %'
           COL 153
           FOREGROUND-COLOR IS 3. 

      * [AL] - Boutons medecin
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

      * [IM] - % paramédical
           05 FILLER PIC X(23) VALUE 'Reglements paramedicaux' 
           LINE 16 COL 38 
           FOREGROUND-COLOR IS 2. 
           05 FILLER PIC X(3) FROM WS-ALLEGE-PARMEDICAL
           COL 90 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(2) VALUE ' %'
           COL 93 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(3) FROM WS-MODERE-PARMEDICAL
           COL 120
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(2) VALUE ' %'
           COL 123
           FOREGROUND-COLOR IS 3.  
           05 FILLER PIC X(3) FROM WS-EXCELL-PARMEDICAL
           COL 150
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(2) VALUE ' %'
           COL 153
           FOREGROUND-COLOR IS 3.   

      * [AL] -  Boutons paramédical
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

      * [AL] - % Hospitalisation (la fidélité est géré dans le bac)        
           05 FILLER PIC X(15) VALUE 'Hospitalisation' 
           LINE 18 COL 38 
           FOREGROUND-COLOR IS 2. 
           05 FILLER PIC X(3) FROM WS-ALLEGE-HOSPITAL
           COL 90 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(2) VALUE ' %'
           COL 93 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(3) FROM WS-MODERE-HOSPITAL
           COL 120
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(2) VALUE ' %'
           COL 123
           FOREGROUND-COLOR IS 3.  
           05 FILLER PIC X(3) FROM WS-EXCELL-HOSPITAL
           COL 150
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(2) VALUE ' %'
           COL 153
           FOREGROUND-COLOR IS 3.            

      * [AL] - Boutons hospitalisation 
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

      * [AL] - Optique et % verres simples            
           05 FILLER PIC X(14) VALUE 'Verres simples'  
           LINE 20 COL 38 
           FOREGROUND-COLOR IS 2. 
           05 FILLER PIC X(3) FROM WS-ALLEGE-S-GLASSES
           COL 90 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(2) VALUE ' %'
           COL 93 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(3) FROM WS-MODERE-S-GLASSES
           COL 120
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(2) VALUE ' %'
           COL 123
           FOREGROUND-COLOR IS 3.  
           05 FILLER PIC X(3) FROM WS-EXCELL-S-GLASSES
           COL 150
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(2) VALUE ' %'
           COL 153
           FOREGROUND-COLOR IS 3.        

      * [AL] - Boutons verres simples
           05 PIC X USING  SC-VALUE-S-GLASSES-1
           COL 98 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0.
           05 PIC X USING  SC-VALUE-S-GLASSES-2
           COL 128 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0. 
           05 PIC X USING  SC-VALUE-S-GLASSES-3
            COL 158 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0. 

      * [IM] - % verres progressifs
           05 FILLER PIC X(18) VALUE 'Verres progressifs'  
           LINE 22 COL 38 
           FOREGROUND-COLOR IS 2. 
           05 FILLER PIC X(3) FROM WS-ALLEGE-P-GLASSES
           COL 90 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(2) VALUE ' %'
           COL 93 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(3) FROM WS-MODERE-P-GLASSES
           COL 120
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(2) VALUE ' %'
           COL 123
           FOREGROUND-COLOR IS 3.  
           05 FILLER PIC X(3) FROM WS-EXCELL-P-GLASSES
           COL 150
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(2) VALUE ' %'
           COL 153
           FOREGROUND-COLOR IS 3.  

      * [AL] - Boutons verres progressifs
           05 PIC X USING  SC-VALUE-P-GLASSES-1
           COL 98 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0.
           05 PIC X USING  SC-VALUE-P-GLASSES-2
           COL 128 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0. 
           05 PIC X USING  SC-VALUE-P-GLASSES-3
            COL 158 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0. 

      * [AL] - Dentaire et % molaires           
           05 FILLER PIC X(20) VALUE 'Couronnes (molaires)' 
           LINE 24 COL 38 
           FOREGROUND-COLOR IS 2. 
           05 FILLER PIC X(3) FROM WS-ALLEGE-MOLAR
           COL 90 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(2) VALUE ' %'
           COL 93 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(3) FROM WS-MODERE-MOLAR
           COL 120
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(2) VALUE ' %'
           COL 123
           FOREGROUND-COLOR IS 3.  
           05 FILLER PIC X(3) FROM WS-EXCELL-MOLAR
           COL 150
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(2) VALUE ' %'
           COL 153
           FOREGROUND-COLOR IS 3. 

      * [AL] - Boutons molaire 
           05 PIC X USING  SC-VALUE-MOLAR-1
           COL 98 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0.
           05 PIC X USING  SC-VALUE-MOLAR-2
           COL 128 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0. 
           05 PIC X USING  SC-VALUE-MOLAR-3
            COL 158 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0. 

      * [IM] - % hors molaire
           05 FILLER PIC X(25) VALUE 'Couronnes (hors molaires)'  
            LINE 26 COL 38 
           FOREGROUND-COLOR IS 2. 
           05 FILLER PIC X(3) FROM WS-ALLEGE-NON-MOLAR
           COL 90 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(2) VALUE ' %'
           COL 93 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(3) FROM WS-MODERE-NON-MOLAR
           COL 120
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(2) VALUE ' %'
           COL 123
           FOREGROUND-COLOR IS 3.  
           05 FILLER PIC X(3) FROM WS-EXCELL-NON-MOLAR
           COL 150
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(2) VALUE ' %'
           COL 153
           FOREGROUND-COLOR IS 3. 

      * [AL] - boutons non molaire
           05 PIC X USING  SC-VALUE-NON-MOLAR-1
           COL 98 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0.
           05 PIC X USING  SC-VALUE-NON-MOLAR-2
           COL 128 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0. 
           05 PIC X USING  SC-VALUE-NON-MOLAR-3
            COL 158 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0. 

      * [IM] - % détartrage
           05 FILLER PIC X(10) VALUE 'Detartrage'
           LINE 28 COL 38 
           FOREGROUND-COLOR IS 2. 
           05 FILLER PIC X(3) FROM WS-ALLEGE-DESCALINGS
           COL 90 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(2) VALUE ' %'
           COL 93 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(3) FROM WS-MODERE-DESCALINGS
           COL 120
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(2) VALUE ' %'
           COL 123
           FOREGROUND-COLOR IS 3.  
           05 FILLER PIC X(3) FROM WS-EXCELL-DESCALINGS
           COL 150
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(2) VALUE ' %'
           COL 153
           FOREGROUND-COLOR IS 3.              
      * [AL] - Boutons détartrage           
           05 PIC X USING  SC-VALUE-DESCALINGS-1
           COL 98 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0.
           05 PIC X USING  SC-VALUE-DESCALINGS-2
           COL 128 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0. 
           05 PIC X USING  SC-VALUE-DESCALINGS-3
            COL 158 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0. 

      * [AL] - Affichage coût contrat
           05 FILLER PIC X(20) VALUE 'Montant du contrat :'
           LINE 30
           COL 127
           FOREGROUND-COLOR IS 3.        
           05 PIC X(3) FROM SC-CONTRACT-COST
           COL 149
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0.  
           05 FILLER PIC X(5) VALUE 'euros'
           COL 154
           FOREGROUND-COLOR IS 3.  

      * [AL] - Gestion des boutons 
           05 FILLER PIC X(20) VALUE 'Valider mes choix :'
           LINE 30 COL 85
           FOREGROUND-COLOR IS 3.        
           05 PIC X(1) USING SC-BUTTON-CHOICE-VALIDATE
           COL 105
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0.  
           05 FILLER PIC X(23) VALUE 'Validation du contrat :'
           LINE 34 COL 38
           FOREGROUND-COLOR IS 3. 
           05 PIC X USING  SC-BUTTON-CONT-VALIDATE
           COL 62 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0. 
           05 FILLER PIC X(1) USING  SC-BUTTON-RETURN 
           COL 170 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 
           05 FILLER PIC X(11) VALUE  'Retour' 
           COL 172 
           FOREGROUND-COLOR IS 2.

      * [AL] - Affichage message gestion d'erreur    
                 
           05 PIC X(70) FROM SC-MESSAGE
           LINE 32 COL 38 
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 7. 

      * [AL] - cadre page
           05 FILLER PIC X(182) VALUE all ' ' LINE 4 COL 10 
           BACKGROUND-COLOR IS 2.
           05 FILLER PIC X(2) VALUE  '  ' LINE 5 COL 10 
           BACKGROUND-COLOR IS 2.
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  '  ' LINE 6 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 2.
           05 FILLER PIC X(30) VALUE  'CREATION DU CONTRAT SPECIFIQUE' 
           COL 85 
           FOREGROUND-COLOR IS 2.            

           05 FILLER PIC X(2) VALUE  '  ' LINE 7 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(182) VALUE all  '  ' LINE 8 COL 10 
           BACKGROUND-COLOR IS 2.

           05 FILLER PIC X(2) VALUE  '  ' LINE 9 COL 10 
           BACKGROUND-COLOR IS 2.         
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  '  ' LINE 10 COL 10 
           BACKGROUND-COLOR IS 2. 
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 2. 
                      
           05 FILLER PIC X(2) VALUE  '  ' LINE 11 COL 10 
           BACKGROUND-COLOR IS 2.                       
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 2. 
           05 FILLER PIC X(60) FROM WS-CUSTOMER  
           COL 20
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 7. 

           05 FILLER PIC X(2) VALUE  '  ' LINE 12 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 2.            

           05 FILLER PIC X(2) VALUE  '  ' LINE 13 COL 10 
           BACKGROUND-COLOR IS 2.                           
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  '  ' LINE 14 COL 10 
           BACKGROUND-COLOR IS 2.                    
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 2.  

           05 FILLER PIC X(2) VALUE  '  ' LINE 15 COL 10 
           BACKGROUND-COLOR IS 2.                  
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 2.            

           05 FILLER PIC X(2) VALUE  '  ' LINE 16 COL 10 
           BACKGROUND-COLOR IS 2.                
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 2.  

           05 FILLER PIC X(2) VALUE  '  ' LINE 17 COL 10 
           BACKGROUND-COLOR IS 2.      
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 2.

           05 FILLER PIC X(2) VALUE  '  ' LINE 18 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 2.

           05 FILLER PIC X(2) VALUE  '  ' LINE  19 COL 10 
           BACKGROUND-COLOR IS 2.         
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 2.  

           05 FILLER PIC X(2) VALUE  '  ' LINE 20 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 2.            

           05 FILLER PIC X(2) VALUE  '  ' LINE 21 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 2.                     

           05 FILLER PIC X(2) VALUE  '  ' LINE 22 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  '  ' LINE 23 COL 10 
           BACKGROUND-COLOR IS 2.         
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  '  ' LINE 24 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  '  ' LINE 25 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 2.

           05 FILLER PIC X(2) VALUE  '  ' LINE 26 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  '  ' LINE 27 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  '  ' LINE 28 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  '  ' LINE 29 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  '  ' LINE 30 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 2.

           05 FILLER PIC X(2) VALUE  '  ' LINE 21 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  '  ' LINE 22 COL 10 
           BACKGROUND-COLOR IS 2.         
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  '  ' LINE 23 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  '  ' LINE 24 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  '  ' LINE 25 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  '  ' LINE 26 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  '  ' LINE 27 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  '  ' LINE 28 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  '  ' LINE 29 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  '  ' LINE 30 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  '  ' LINE 31 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  '  ' LINE 32 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  '  ' LINE 33 COL 10 
           BACKGROUND-COLOR IS 2.      
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  '  ' LINE 34 COL 10 
           BACKGROUND-COLOR IS 2.      
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 2. 


           05 FILLER PIC X(2) VALUE  '  ' LINE 35 COL 10 
           BACKGROUND-COLOR IS 2.      
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  '  ' LINE 36 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(182) VALUE all  '  ' LINE 37 COL 10 
           BACKGROUND-COLOR IS 2.

