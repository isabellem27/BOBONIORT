       01  STAT-DATA-SCREEN FOREGROUND-COLOR IS 3.
           05 BLANK SCREEN.

      *    Affichage des libellés et zone d'affichage des calculs
      * Bloc Statistiques client
           05 FILLER PIC X(20) VALUE 'Statistiques client'
           LINE 9 COL 15 
           FOREGROUND-COLOR IS 3. 
      * Répartition géographique    
           05 FILLER PIC X(06) VALUE 'Region'           
           LINE 11 COL 50 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(05) VALUE '  01'           
           COL 58 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(05) VALUE '  02'           
           COL 64 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(05) VALUE '  03'           
           COL 70 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(05) VALUE '  04'           
           COL 76 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(05) VALUE '  05'           
           COL 82 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(05) VALUE '  06'           
           COL 88 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(05) VALUE '  07'           
           COL 94 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(05) VALUE '  08'           
           COL 100 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(05) VALUE '  09'           
           COL 106 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(05) VALUE '  10'           
           COL 112 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(05) VALUE '  11'           
           COL 118 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(05) VALUE '  12'           
           COL 124 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(05) VALUE '  13'           
           COL 130 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(05) VALUE '  14'           
           COL 136 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(20) VALUE '   Num/Region'           
           LINE 13 COL 152 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(25) VALUE '01/Auvergne Rhone ALpes'           
           LINE 14 COL 152 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(30) VALUE '02/Bourgogne Franche Comte'           
           LINE 15 COL 152 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(20) VALUE '03/Bretagne'           
           LINE 16 COL 152 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(22) VALUE '04/Centre Val de Loire'           
           LINE 17 COL 152
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(20) VALUE '05/Corse'           
           LINE 18 COL 152 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(20) VALUE '06/Grand Est'           
           LINE 19 COL 152 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(20) VALUE '07/Hauts de France'           
           LINE 20 COL 152 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(20) VALUE '08/Ile de France'           
           LINE 21 COL 152 
           FOREGROUND-COLOR IS 3. 
           05 FILLER PIC X(20) VALUE '09/Normandie'           
           LINE 22 COL 152 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(22) VALUE '10/Nouvelle Aquitaine'           
           LINE 23 COL 152 
           FOREGROUND-COLOR IS 3.  
           05 FILLER PIC X(20) VALUE '11/Occitanie'           
           LINE 24 COL 152 
           FOREGROUND-COLOR IS 3. 
           05 FILLER PIC X(20) VALUE '12/Pays de la loire'           
           LINE 25 COL 152 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(30) VALUE '13/Provence Alpes Cote d''azur'           
           LINE 26 COL 152 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(28) VALUE '14/Departements d''outre-mer'           
           LINE 27 COL 152 
           FOREGROUND-COLOR IS 3.                               
      *    Ligne du tableau et zones d'affichage des calculs 
           05 FILLER PIC X(30) VALUE 'Repartition geographique'
           LINE 12 COL 20 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(05) FROM SC-STAT-REG01           
           COL 59 
           FOREGROUND-COLOR IS 7.
           05 FILLER PIC X(05) FROM SC-STAT-REG02           
           COL 65 
           FOREGROUND-COLOR IS 7.
           05 FILLER PIC X(05) FROM SC-STAT-REG03           
           COL 71 
           FOREGROUND-COLOR IS 7.
           05 FILLER PIC X(05) FROM SC-STAT-REG04           
           COL 77 
           FOREGROUND-COLOR IS 7.
           05 FILLER PIC X(05) FROM SC-STAT-REG05           
           COL 83 
           FOREGROUND-COLOR IS 7.
           05 FILLER PIC X(05) FROM SC-STAT-REG06           
           COL 89 
           FOREGROUND-COLOR IS 7.
           05 FILLER PIC X(05) FROM SC-STAT-REG07           
           COL 95 
           FOREGROUND-COLOR IS 7.
           05 FILLER PIC X(05) FROM SC-STAT-REG08           
           COL 101 
           FOREGROUND-COLOR IS 7.
           05 FILLER PIC X(05) FROM SC-STAT-REG09           
           COL 107 
           FOREGROUND-COLOR IS 7.
           05 FILLER PIC X(05) VALUE '1'           
           COL 113 
           FOREGROUND-COLOR IS 7.
           05 FILLER PIC X(05) VALUE '1'           
           COL 119 
           FOREGROUND-COLOR IS 7.
           05 FILLER PIC X(05) VALUE '1'           
           COL 125
           FOREGROUND-COLOR IS 7.
           05 FILLER PIC X(05) VALUE '1'           
           COL 131 
           FOREGROUND-COLOR IS 7.
           05 FILLER PIC X(05) FROM SC-STAT-REG14           
           COL 137 
           FOREGROUND-COLOR IS 7.
      * Taux d'activité
           05 FILLER PIC X(20) VALUE 'Taux d''activite'
           LINE 14 COL 20 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(11) VALUE '  Genre'
           COL 40 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(06) VALUE 'Homme'
           COL 48 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(06) VALUE 'Femme'
           COL 55 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(06) VALUE 'Autre'
           COL 62 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(11) VALUE 'Couple'
           LINE 15 COL 41 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(05) FROM SC-ACT-C-HOMME
           COL 48 
           FOREGROUND-COLOR IS 7.
           05 FILLER PIC X(01) VALUE '%'
           COL 53 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(05) FROM SC-ACT-C-FEMME
           COL 55 
           FOREGROUND-COLOR IS 7.
           05 FILLER PIC X(01) VALUE '%'
           COL 60 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(05) FROM SC-ACT-C-AUTRE
           COL 62 
           FOREGROUND-COLOR IS 7. 
           05 FILLER PIC X(01) VALUE '%'
           COL 67 
           FOREGROUND-COLOR IS 3.          
           05 FILLER PIC X(11) VALUE 'Celibataire'
           LINE 16 COL 36 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(05) FROM SC-ACT-S-HOMME
           COL 48 
           FOREGROUND-COLOR IS 7.
           05 FILLER PIC X(01) VALUE '%'
           COL 53 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(05) FROM SC-ACT-S-FEMME
           COL 55 
           FOREGROUND-COLOR IS 7.
           05 FILLER PIC X(01) VALUE '%'
           COL 60 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(05) FROM SC-ACT-S-AUTRE
           COL 62 
           FOREGROUND-COLOR IS 7. 
           05 FILLER PIC X(01) VALUE '%'
           COL 67 
           FOREGROUND-COLOR IS 3.                  
      * Répartition Par age et genre libellés
           05 FILLER PIC X(30) VALUE 'Repartition par age et genre'
           LINE 14 COL 70 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(05) VALUE '%'
           LINE 15 COL 76 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(05) VALUE 'NB'
           COL 80 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(05) VALUE 'AGE'
           COL 84 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(60) VALUE 
           '  <30 ans 30-39 ans 40-49 ans 50-59 ans 60-69 ans 70 et +'          
           COL 88 
           FOREGROUND-COLOR IS 3.
      * Répartition Par age et genre lignes et zone d'affichage des calculs     
           05 FILLER PIC X(05) VALUE 'Homme'
           LINE 16 COL 84 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(05) FROM SC-H-TOT-POURCENT
           COL 73 
           FOREGROUND-COLOR IS 7. 
           05 FILLER PIC X(05) FROM SC-H-TOT-NB
           COL 79 
           FOREGROUND-COLOR IS 7. 
           05 FILLER PIC X(05) FROM SC-H-30-NB  
           COL 91 
           FOREGROUND-COLOR IS 7.  
           05 FILLER PIC X(05) FROM SC-H-30-39-NB  
           COL 100 
           FOREGROUND-COLOR IS 7. 
           05 FILLER PIC X(05) FROM SC-H-40-49-NB  
           COL 110 
           FOREGROUND-COLOR IS 7.              
           05 FILLER PIC X(05) FROM SC-H-50-59-NB  
           COL 120 
           FOREGROUND-COLOR IS 7. 
           05 FILLER PIC X(05) FROM SC-H-60-69-NB  
           COL 130 
           FOREGROUND-COLOR IS 7.  
           05 FILLER PIC X(05) FROM SC-H-70-NB  
           COL 140 
           FOREGROUND-COLOR IS 7. 
           05 FILLER PIC X(05) VALUE 'Femme'
           LINE 17 COL 84 
           FOREGROUND-COLOR IS 3. 
           05 FILLER PIC X(05) FROM SC-F-TOT-POURCENT
           COL 73 
           FOREGROUND-COLOR IS 7. 
           05 FILLER PIC X(05) FROM SC-F-TOT-NB
           COL 79 
           FOREGROUND-COLOR IS 7.  
           05 FILLER PIC X(05) FROM SC-F-30-NB  
           COL 91 
           FOREGROUND-COLOR IS 7.  
           05 FILLER PIC X(05) FROM SC-F-30-39-NB  
           COL 100 
           FOREGROUND-COLOR IS 7. 
           05 FILLER PIC X(05) FROM SC-F-40-49-NB  
           COL 110 
           FOREGROUND-COLOR IS 7.              
           05 FILLER PIC X(05) FROM SC-F-50-59-NB  
           COL 120 
           FOREGROUND-COLOR IS 7. 
           05 FILLER PIC X(05) FROM SC-F-60-69-NB  
           COL 130 
           FOREGROUND-COLOR IS 7.  
           05 FILLER PIC X(05) FROM SC-F-70-NB  
           COL 140 
           FOREGROUND-COLOR IS 7.                              
           05 FILLER PIC X(05) VALUE 'Autre'
           LINE 18 COL 84 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(05) FROM SC-X-TOT-POURCENT
           COL 73 
           FOREGROUND-COLOR IS 7. 
           05 FILLER PIC X(05) FROM SC-X-TOT-NB
           COL 79 
           FOREGROUND-COLOR IS 7. 
           05 FILLER PIC X(05) FROM SC-X-30-NB  
           COL 91 
           FOREGROUND-COLOR IS 7.  
           05 FILLER PIC X(05) FROM SC-X-30-39-NB  
           COL 100 
           FOREGROUND-COLOR IS 7. 
           05 FILLER PIC X(05) FROM SC-X-40-49-NB  
           COL 110 
           FOREGROUND-COLOR IS 7.              
           05 FILLER PIC X(05) FROM SC-X-50-59-NB  
           COL 120 
           FOREGROUND-COLOR IS 7. 
           05 FILLER PIC X(05) FROM SC-X-60-69-NB  
           COL 130 
           FOREGROUND-COLOR IS 7.  
           05 FILLER PIC X(05) FROM SC-X-70-NB  
           COL 140 
           FOREGROUND-COLOR IS 7.                       
           05 FILLER PIC X(05) VALUE 'TOTAL'
           LINE 19 COL 73 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(05) FROM SC-TOT-NB
           COL 79 
           FOREGROUND-COLOR IS 7.
           05 FILLER PIC X(05) VALUE '%'
           COL 86 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(05) FROM SC-TOT-30-NB  
           COL 91 
           FOREGROUND-COLOR IS 7.  
           05 FILLER PIC X(05) FROM SC-TOT-30-39-NB  
           COL 100 
           FOREGROUND-COLOR IS 7. 
           05 FILLER PIC X(05) FROM SC-TOT-40-49-NB  
           COL 110 
           FOREGROUND-COLOR IS 7.              
           05 FILLER PIC X(05) FROM SC-TOT-50-59-NB  
           COL 120 
           FOREGROUND-COLOR IS 7. 
           05 FILLER PIC X(05) FROM SC-TOT-60-69-NB  
           COL 130 
           FOREGROUND-COLOR IS 7.  
           05 FILLER PIC X(05) FROM SC-TOT-70-NB  
           COL 140 
           FOREGROUND-COLOR IS 7. 
           

      * Bloc Statistiques d'activité
      *    Entêtes et libellés fixes
           05 FILLER PIC X(25) VALUE 'Statistiques activite'
           LINE 21 COL 15 
           FOREGROUND-COLOR IS 3. 
           05 FILLER PIC X(30) VALUE 'Remboursement par categorie'
           LINE 23 COL 20 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(15) VALUE 'Montant '           
           LINE 23 COL 53 
           FOREGROUND-COLOR IS 3. 
           05 FILLER PIC X(8) VALUE '%'           
           COL 69 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(15) VALUE 'Montant moyen'           
           COL 75 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(20) VALUE '% par tranche d''age'           
           COL 90
           FOREGROUND-COLOR IS 3.  
           05 FILLER PIC X(12) VALUE '  total'           
           LINE 24 COL 52 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(12) VALUE '  par client'           
           COL 75 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(60) VALUE 
           '  <30 ans 30-39 ans 40-49 ans 50-59 ans 60-69 ans 70 et +'          
           COL 88 
           FOREGROUND-COLOR IS 3.     
      *    Lignes du tableau et zones d'affichage des calculs          
           05 FILLER PIC X(14) VALUE 'Soins Courants'
           LINE 24 COL 22 
           FOREGROUND-COLOR IS 3.  
           05 FILLER PIC X(19) VALUE 'Honoraire medecin'  
           LINE 25 COL 27 
           FOREGROUND-COLOR IS 3.
           05 FILLER PIC X(08) VALUE '  255.00'  
           COL 54 
           FOREGROUND-COLOR IS 7.   
           05 FILLER PIC X(05) VALUE ' 1.49'  
           COL 67 
           FOREGROUND-COLOR IS 7.   
           05 FILLER PIC X(08) VALUE '  31.80'  
           COL 78 
           FOREGROUND-COLOR IS 7. 
           05 FILLER PIC X(05) VALUE '10.98'  
           COL 90 
           FOREGROUND-COLOR IS 7.  
           05 FILLER PIC X(05) VALUE '13.73'  
           COL 100 
           FOREGROUND-COLOR IS 7. 
           05 FILLER PIC X(05) VALUE '15.65'  
           COL 110 
           FOREGROUND-COLOR IS 7.              
           05 FILLER PIC X(05) VALUE '17.65'  
           COL 120 
           FOREGROUND-COLOR IS 7. 
           05 FILLER PIC X(05) VALUE ' 0.00'  
           COL 130 
           FOREGROUND-COLOR IS 7.  
           05 FILLER PIC X(05) VALUE ' 0.00'
           COL 140 
           FOREGROUND-COLOR IS 7.                                               
           05 FILLER PIC X(23) VALUE 'Paramedical' 
           LINE 26 COL 27 
           FOREGROUND-COLOR IS 3.  
           05 FILLER PIC X(08) VALUE '  196.00'  
           COL 54 
           FOREGROUND-COLOR IS 7.   
           05 FILLER PIC X(05) VALUE ' 1.15' 
           COL 67 
           FOREGROUND-COLOR IS 7.   
           05 FILLER PIC X(08) VALUE '  24.50'  
           COL 78 
           FOREGROUND-COLOR IS 7. 
           05 FILLER PIC X(05) VALUE '10.20'  
           COL 90 
           FOREGROUND-COLOR IS 7.  
           05 FILLER PIC X(05) VALUE '12.76'  
           COL 100 
           FOREGROUND-COLOR IS 7. 
           05 FILLER PIC X(05) VALUE '15.31'  
           COL 110 
           FOREGROUND-COLOR IS 7.              
           05 FILLER PIC X(05) VALUE '17.86'  
           COL 120 
           FOREGROUND-COLOR IS 7. 
           05 FILLER PIC X(05)  VALUE ' 0.00'  
           COL 130 
           FOREGROUND-COLOR IS 7.  
           05 FILLER PIC X(05) VALUE ' 0.00'  
           COL 140 
           FOREGROUND-COLOR IS 7.               
           05 FILLER PIC X(15) VALUE 'Hospitalisation' 
           LINE 27 COL 27 
           FOREGROUND-COLOR IS 3. 
           05 FILLER PIC X(08) VALUE '12000.00'  
           COL 54 
           FOREGROUND-COLOR IS 7.   
           05 FILLER PIC X(05) VALUE '70.34' 
           COL 67 
           FOREGROUND-COLOR IS 7.   
           05 FILLER PIC X(08) VALUE '1500.00'  
           COL 78 
           FOREGROUND-COLOR IS 7. 
           05 FILLER PIC X(05) VALUE ' 7.50'  
           COL 90 
           FOREGROUND-COLOR IS 7.  
           05 FILLER PIC X(05) VALUE ' 8.33'  
           COL 100 
           FOREGROUND-COLOR IS 7. 
           05 FILLER PIC X(05) VALUE ' 9.17'  
           COL 110 
           FOREGROUND-COLOR IS 7.              
           05 FILLER PIC X(05) VALUE '10.00'  
           COL 120 
           FOREGROUND-COLOR IS 7. 
           05 FILLER PIC X(05) VALUE ' 0.00'  
           COL 130 
           FOREGROUND-COLOR IS 7.  
           05 FILLER PIC X(05) VALUE ' 0.00'   
           COL 140 
           FOREGROUND-COLOR IS 7.           
           05 FILLER PIC X(7) VALUE 'Optique'
           LINE 28 COL 22 
           FOREGROUND-COLOR IS 3.            
           05 FILLER PIC X(14) VALUE 'Verres simples'  
           LINE 29 COL 27 
           FOREGROUND-COLOR IS 3.               
           05 FILLER PIC X(08) VALUE '  784.00'  
           COL 54 
           FOREGROUND-COLOR IS 7.   
           05 FILLER PIC X(05) VALUE ' 4.60'  
           COL 67 
           FOREGROUND-COLOR IS 7.   
           05 FILLER PIC X(08) VALUE '  98.00'  
           COL 78 
           FOREGROUND-COLOR IS 7. 
           05 FILLER PIC X(05) VALUE ' 6.38'  
           COL 90 
           FOREGROUND-COLOR IS 7.  
           05 FILLER PIC X(05) VALUE ' 7.02' 
           COL 100 
           FOREGROUND-COLOR IS 7. 
           05 FILLER PIC X(05) VALUE ' 7.65'  
           COL 110 
           FOREGROUND-COLOR IS 7.              
           05 FILLER PIC X(05) VALUE ' 8.29'  
           COL 120 
           FOREGROUND-COLOR IS 7. 
           05 FILLER PIC X(05) VALUE ' 0.00'  
           COL 130 
           FOREGROUND-COLOR IS 7.  
           05 FILLER PIC X(05) VALUE ' 0.00'  
           COL 140 
           FOREGROUND-COLOR IS 7.
           05 FILLER PIC X(18) VALUE 'Verres progressifs'  
           LINE 30 COL 27 
           FOREGROUND-COLOR IS 3.  
           05 FILLER PIC X(08) VALUE ' 1584.00'  
           COL 54 
           FOREGROUND-COLOR IS 7.   
           05 FILLER PIC X(05) VALUE ' 9.29'  
           COL 67 
           FOREGROUND-COLOR IS 7.   
           05 FILLER PIC X(08) VALUE ' 198.00'  
           COL 78 
           FOREGROUND-COLOR IS 7. 
           05 FILLER PIC X(05) VALUE ' 5.68'  
           COL 90 
           FOREGROUND-COLOR IS 7.  
           05 FILLER PIC X(05) VALUE ' 6.00'  
           COL 100 
           FOREGROUND-COLOR IS 7. 
           05 FILLER PIC X(05)  VALUE ' 6.31'  
           COL 110 
           FOREGROUND-COLOR IS 7.              
           05 FILLER PIC X(05) VALUE ' 6.36'  
           COL 120 
           FOREGROUND-COLOR IS 7. 
           05 FILLER PIC X(05) VALUE ' 0.00' 
           COL 130 
           FOREGROUND-COLOR IS 7.  
           05 FILLER PIC X(05) VALUE ' 0.00' 
           COL 140 
           FOREGROUND-COLOR IS 7.
           05 FILLER PIC X(8) VALUE 'Dentaire'
           LINE 31 COL 22 
           FOREGROUND-COLOR IS 3.            
           05 FILLER PIC X(20) VALUE 'Couronnes (molaires)' 
           LINE 32 COL 27 
           FOREGROUND-COLOR IS 3.           
           05 FILLER PIC X(08) VALUE '  640.00'  
           COL 54 
           FOREGROUND-COLOR IS 7.   
           05 FILLER PIC X(05) VALUE ' 3.75'  
           COL 67 
           FOREGROUND-COLOR IS 7.   
           05 FILLER PIC X(08) VALUE '  27.50' 
           COL 78 
           FOREGROUND-COLOR IS 7. 
           05 FILLER PIC X(05) VALUE ' 3.13'  
           COL 90 
           FOREGROUND-COLOR IS 7.  
           05 FILLER PIC X(05) VALUE ' 3.91'  
           COL 100 
           FOREGROUND-COLOR IS 7. 
           05 FILLER PIC X(05) VALUE ' 4.69' 
           COL 110 
           FOREGROUND-COLOR IS 7.              
           05 FILLER PIC X(05) VALUE ' 5.47'  
           COL 120 
           FOREGROUND-COLOR IS 7. 
           05 FILLER PIC X(05) VALUE ' 0.00'  
           COL 130 
           FOREGROUND-COLOR IS 7.  
           05 FILLER PIC X(05) VALUE ' 0.00'
           COL 140 
           FOREGROUND-COLOR IS 7.
           05 FILLER PIC X(25) VALUE 'Couronnes (hors molaires)'  
            LINE 33 COL 27 
           FOREGROUND-COLOR IS 3.  
           05 FILLER PIC X(08) VALUE '  800.00'  
           COL 54 
           FOREGROUND-COLOR IS 7.   
           05 FILLER PIC X(05) VALUE ' 4.69'  
           COL 67 
           FOREGROUND-COLOR IS 7.   
           05 FILLER PIC X(08) VALUE ' 100.00'
           COL 78 
           FOREGROUND-COLOR IS 7. 
           05 FILLER PIC X(05) VALUE ' 5.00' 
           COL 90 
           FOREGROUND-COLOR IS 7.  
           05 FILLER PIC X(05) VALUE ' 5.63'  
           COL 100 
           FOREGROUND-COLOR IS 7. 
           05 FILLER PIC X(05) VALUE ' 6.25' 
           COL 110 
           FOREGROUND-COLOR IS 7.              
           05 FILLER PIC X(05) VALUE ' 6.88'  
           COL 120 
           FOREGROUND-COLOR IS 7. 
           05 FILLER PIC X(05) VALUE ' 0.00'  
           COL 130 
           FOREGROUND-COLOR IS 7.  
           05 FILLER PIC X(05) VALUE ' 0.00' 
           COL 140 
           FOREGROUND-COLOR IS 7.
           05 FILLER PIC X(10) VALUE 'Detartrage'
           LINE 34 COL 27 
           FOREGROUND-COLOR IS 3.             
           05 FILLER PIC X(08) VALUE '  800.00' 
           COL 54 
           FOREGROUND-COLOR IS 7.   
           05 FILLER PIC X(05) VALUE ' 4.69' 
           COL 67 
           FOREGROUND-COLOR IS 7.   
           05 FILLER PIC X(08) VALUE '  35.71'  
           COL 78 
           FOREGROUND-COLOR IS 7. 
           05 FILLER PIC X(05) VALUE ' 5.00'  
           COL 90 
           FOREGROUND-COLOR IS 7.  
           05 FILLER PIC X(05) VALUE ' 5.63' 
           COL 100 
           FOREGROUND-COLOR IS 7. 
           05 FILLER PIC X(05) VALUE ' 6.25'  
           COL 110 
           FOREGROUND-COLOR IS 7.              
           05 FILLER PIC X(05) VALUE ' 6.88'  
           COL 120 
           FOREGROUND-COLOR IS 7. 
           05 FILLER PIC X(05) VALUE ' 0.00' 
           COL 130 
           FOREGROUND-COLOR IS 7.  
           05 FILLER PIC X(05) VALUE ' 0.00'  
           COL 140 
           FOREGROUND-COLOR IS 7.

      *  bouton de retour menu
           05 FILLER PIC X(1) USING SC-RETURN 
           LINE 35 COL 170 
           BACKGROUND-COLOR IS 3
           FOREGROUND-COLOR IS 0. 
           05 FILLER PIC X(6) VALUE  'Retour' 
           COL 172 
           FOREGROUND-COLOR IS 3.     

      * [AL] - cadre et titre de la page
           05 FILLER PIC X(182) VALUE all ' ' LINE 4 COL 10 
           BACKGROUND-COLOR IS 3.
           05 FILLER PIC X(2) VALUE  '  ' LINE 5 COL 10 
           BACKGROUND-COLOR IS 3.
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 3. 

           05 FILLER PIC X(2) VALUE  '  ' LINE 6 COL 10 
           BACKGROUND-COLOR IS 3.        
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 3.
           05 FILLER PIC X(25) VALUE  'STATISTIQUES DE BOBONIORT' 
           COL 80 
           FOREGROUND-COLOR IS 3.            
           05 FILLER PIC X(2) VALUE  '  ' LINE 7 COL 10 
           BACKGROUND-COLOR IS 3.        
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 3. 
           05 FILLER PIC X(182) VALUE all  '  ' LINE 8 COL 10 
           BACKGROUND-COLOR IS 3.
           05 FILLER PIC X(2) VALUE  '  ' LINE 9 COL 10 
           BACKGROUND-COLOR IS 3.         
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 3. 
           05 FILLER PIC X(2) VALUE  '  ' LINE 10 COL 10 
           BACKGROUND-COLOR IS 3. 
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 3. 
           05 FILLER PIC X(2) VALUE  '  ' LINE 11 COL 10 
           BACKGROUND-COLOR IS 3.                       
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 3. 
           05 FILLER PIC X(2) VALUE  '  ' LINE 12 COL 10 
           BACKGROUND-COLOR IS 3.        
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 3.            
           05 FILLER PIC X(2) VALUE  '  ' LINE 13 COL 10 
           BACKGROUND-COLOR IS 3.                           
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 3. 
           05 FILLER PIC X(2) VALUE  '  ' LINE 14 COL 10 
           BACKGROUND-COLOR IS 3.                    
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 3.  
           05 FILLER PIC X(2) VALUE  '  ' LINE 15 COL 10 
           BACKGROUND-COLOR IS 3.                  
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 3.            
           05 FILLER PIC X(2) VALUE  '  ' LINE 16 COL 10 
           BACKGROUND-COLOR IS 3.                
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 3.  
           05 FILLER PIC X(2) VALUE  '  ' LINE 17 COL 10 
           BACKGROUND-COLOR IS 3.      
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 3.
           05 FILLER PIC X(2) VALUE  '  ' LINE 18 COL 10 
           BACKGROUND-COLOR IS 3.       
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 3.
           05 FILLER PIC X(2) VALUE  '  ' LINE  19 COL 10 
           BACKGROUND-COLOR IS 3.         
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 3.  
           05 FILLER PIC X(2) VALUE  '  ' LINE 20 COL 10 
           BACKGROUND-COLOR IS 3.        
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 3.            
           05 FILLER PIC X(2) VALUE  '  ' LINE 21 COL 10 
           BACKGROUND-COLOR IS 3.       
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 3.                     
           05 FILLER PIC X(2) VALUE  '  ' LINE 22 COL 10 
           BACKGROUND-COLOR IS 3.        
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 3. 
           05 FILLER PIC X(2) VALUE  '  ' LINE 23 COL 10 
           BACKGROUND-COLOR IS 3.         
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 3. 
           05 FILLER PIC X(2) VALUE  '  ' LINE 24 COL 10 
           BACKGROUND-COLOR IS 3.        
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 3. 
           05 FILLER PIC X(2) VALUE  '  ' LINE 25 COL 10 
           BACKGROUND-COLOR IS 3.        
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 3.
           05 FILLER PIC X(2) VALUE  '  ' LINE 26 COL 10 
           BACKGROUND-COLOR IS 3.        
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 3. 
           05 FILLER PIC X(2) VALUE  '  ' LINE 27 COL 10 
           BACKGROUND-COLOR IS 3.       
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 3. 
           05 FILLER PIC X(2) VALUE  '  ' LINE 28 COL 10 
           BACKGROUND-COLOR IS 3.       
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 3. 
           05 FILLER PIC X(2) VALUE  '  ' LINE 29 COL 10 
           BACKGROUND-COLOR IS 3.        
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 3. 
           05 FILLER PIC X(2) VALUE  '  ' LINE 30 COL 10 
           BACKGROUND-COLOR IS 3.       
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 3.
           05 FILLER PIC X(2) VALUE  '  ' LINE 21 COL 10 
           BACKGROUND-COLOR IS 3.       
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 3. 
           05 FILLER PIC X(2) VALUE  '  ' LINE 22 COL 10 
           BACKGROUND-COLOR IS 3.         
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 3. 
           05 FILLER PIC X(2) VALUE  '  ' LINE 23 COL 10 
           BACKGROUND-COLOR IS 3.       
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 3. 
           05 FILLER PIC X(2) VALUE  '  ' LINE 24 COL 10 
           BACKGROUND-COLOR IS 3.       
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 3. 
           05 FILLER PIC X(2) VALUE  '  ' LINE 25 COL 10 
           BACKGROUND-COLOR IS 3.        
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 3. 
           05 FILLER PIC X(2) VALUE  '  ' LINE 26 COL 10 
           BACKGROUND-COLOR IS 3.       
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 3. 
           05 FILLER PIC X(2) VALUE  '  ' LINE 27 COL 10 
           BACKGROUND-COLOR IS 3.       
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 3. 
           05 FILLER PIC X(2) VALUE  '  ' LINE 28 COL 10 
           BACKGROUND-COLOR IS 3.       
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 3. 
           05 FILLER PIC X(2) VALUE  '  ' LINE 29 COL 10 
           BACKGROUND-COLOR IS 3.       
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 3. 
           05 FILLER PIC X(2) VALUE  '  ' LINE 30 COL 10 
           BACKGROUND-COLOR IS 3.        
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 3. 
           05 FILLER PIC X(2) VALUE  '  ' LINE 31 COL 10 
           BACKGROUND-COLOR IS 3.        
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 3. 
           05 FILLER PIC X(2) VALUE  '  ' LINE 32 COL 10 
           BACKGROUND-COLOR IS 3.       
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 3. 
           05 FILLER PIC X(2) VALUE  '  ' LINE 33 COL 10 
           BACKGROUND-COLOR IS 3.      
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 3. 
           05 FILLER PIC X(2) VALUE  '  ' LINE 34 COL 10 
           BACKGROUND-COLOR IS 3.      
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 3. 
           05 FILLER PIC X(2) VALUE  '  ' LINE 35 COL 10 
           BACKGROUND-COLOR IS 3.      
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 3. 
           05 FILLER PIC X(2) VALUE  '  ' LINE 36 COL 10 
           BACKGROUND-COLOR IS 3.        
           05 FILLER PIC X(2) VALUE  '  ' COL  190
           BACKGROUND-COLOR IS 3. 
           05 FILLER PIC X(182) VALUE all  '  ' LINE 37 COL 10 
           BACKGROUND-COLOR IS 3.
