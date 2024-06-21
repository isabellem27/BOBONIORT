       01  SCREEN-MENU-CONTRACT FOREGROUND-COLOR IS 2.
           05 BLANK SCREEN.

      ******************************************************************
      *    [RD] DEFINITION DU CADRE.                                   *
      ******************************************************************
       COPY 'screen-border.cpy'. 

      ******************************************************************
      *    [RD] TITRE.                                                 *
      ******************************************************************
           05 FILLER PIC X(07) VALUE 'CONTRAT' 
           LINE 6 COL 95   
           FOREGROUND-COLOR IS 2.    

      *    [RD] Nom Prénom Numéro de sécu. 
           05 FILLER PIC X(80) FROM WS-CUSTOMER  
           LINE 11 COL 20
           BACKGROUND-COLOR IS 0
           FOREGROUND-COLOR IS 7. 

      ******************************************************************
      *    [RD] CHAMPS DE SAISIS.                                      *
      ******************************************************************            
      *    [RD] Affectation. 
           05 FILLER PIC X(31) VALUE 'Affectation' 
           LINE 20 COL 70 
           FOREGROUND-COLOR IS 2. 

           05 FILLER PIC X(01) VALUE ':' 
           LINE 20 COL 100.

           05 PIC X(1) USING  WS-LINK-CHOICE  
           LINE 20 COL 132 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 

      *    [RD] Lecture. 
           05 FILLER PIC X(31) VALUE 'Lecture' 
           LINE 23 COL 70 
           FOREGROUND-COLOR IS 2. 

           05 FILLER PIC X(01) VALUE ':' 
           LINE 23 COL 100.   

           05 PIC X(01) USING  WS-READ-CHOICE  
           LINE 23 COL 132 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.

      *    [RD] Modification.
      *     05 FILLER PIC X(31) VALUE 'Modification' 
      *    LINE 26 COL 70 
      *    FOREGROUND-COLOR IS 2. 

      *    05 FILLER PIC X(01) VALUE ':' 
      *    LINE 26 COL 100.  

      *    05 PIC X(01) USING  WS-UPDATE-CHOICE  
      *    LINE 26 COL 132 
      *    BACKGROUND-COLOR IS 2
      *    FOREGROUND-COLOR IS 0. 

      *    [RD] Zone de message d'erreur.
           05 FILLER PIC X(70) FROM WS-ERROR-MESSAGE
           LINE 30 COL 70 
           FOREGROUND-COLOR IS 7.

      *    [RD] Retour. 
           05 FILLER PIC X(11) VALUE 'Retour' 
           LINE 34 COL 172 
           FOREGROUND-COLOR IS 2.

           05 PIC X(01) USING WS-RETURN-CHOICE  
           LINE 34 COL 170 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 
