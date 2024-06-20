/* Chargement de la ville à partir de la table bobo_town */
BEGIN;
/* 37 codes postaux identiques entre les 2 tables */
UPDATE BOBO_CUSTOMER c
SET TOWN = r.TOWN 
FROM (SELECT t.TOWN, t.ZIPCODE, ROW_NUMBER() OVER (PARTITION BY t.ZIPCODE ORDER BY t.ZIPCODE) AS NB 
FROM BOBO_TOWN t) as r
WHERE c.ZIPCODE = r.ZIPCODE
AND r.NB = 1 AND C.TOWN IS NULL
;

/* 283 codes postaux identiques sur 4 caractères entre les 2 tables */
UPDATE BOBO_CUSTOMER c
SET TOWN = r.TOWN 
FROM (SELECT t.TOWN, t.ZIPCODE, ROW_NUMBER() OVER (PARTITION BY t.ZIPCODE ORDER BY t.TOWN) AS NB 
FROM BOBO_TOWN t) as r
WHERE SUBSTRING(c.ZIPCODE FROM 1 FOR 4) = SUBSTRING(r.ZIPCODE FROM 1 FOR 4)
AND r.NB = 1 AND C.TOWN IS NULL
;

/* 147 codes postaux identiques sur 3 caractères entre les 2 tables */
UPDATE BOBO_CUSTOMER c
SET TOWN = r.TOWN 
FROM (SELECT t.TOWN, t.ZIPCODE, ROW_NUMBER() OVER (PARTITION BY t.ZIPCODE ORDER BY t.TOWN) AS NB 
FROM BOBO_TOWN t) as r
WHERE SUBSTRING(c.ZIPCODE FROM 1 FOR 3) = SUBSTRING(r.ZIPCODE FROM 1 FOR 3)
AND r.NB = 1 AND C.TOWN IS NULL
;

/* 25 codes postaux identiques sur 2 caractères entre les 2 tables */
UPDATE BOBO_CUSTOMER c
SET TOWN = r.TOWN 
FROM (SELECT t.TOWN, t.ZIPCODE, ROW_NUMBER() OVER (PARTITION BY t.ZIPCODE ORDER BY t.TOWN) AS NB 
FROM BOBO_TOWN t) as r
WHERE SUBSTRING(c.ZIPCODE FROM 1 FOR 2) = SUBSTRING(r.ZIPCODE FROM 1 FOR 2)
AND r.NB = 1 AND C.TOWN IS NULL
;

/* 5 codes postaux identiques sur 1 caractère entre les 2 tables */
UPDATE BOBO_CUSTOMER c
SET TOWN = r.TOWN 
FROM (SELECT t.TOWN, t.ZIPCODE, ROW_NUMBER() OVER (PARTITION BY t.ZIPCODE ORDER BY t.TOWN) AS NB 
FROM BOBO_TOWN t) as r
WHERE SUBSTRING(c.ZIPCODE FROM 1 FOR 1) = SUBSTRING(r.ZIPCODE FROM 1 FOR 1)
AND r.NB = 1 AND C.TOWN IS NULL
;
COMMIT;

/* Reformatage de la date de naissance : jj/mm/AAAA devient AAAA-MM-JJ */
BEGIN;
UPDATE BOBO_CUSTOMER 
SET BIRTHDATE = SUBSTRING(BIRTHDATE FROM 7 FOR 4)||'-'||SUBSTRING(BIRTHDATE FROM 4 FOR 2)||'-'||SUBSTRING(BIRTHDATE FROM 1 FOR 2)
;
COMMIT;

/* Reformatage du numéro de téléphone : xx xx xx xx xx devient xxxxxxxxxx */
BEGIN;
UPDATE BOBO_CUSTOMER 
SET PHONE =  REPLACE (PHONE,' ', '')
;
COMMIT;


/* Reconstitution du code sécu des customers de la table bobo_customer */

/*=======================================================================*/
/* Vérification des données avant et pendant la création du code sécu.   */
/*=======================================================================*/
/*
select * from customer where 
customer_code_secu in (select  CAST(CASE WHEN gender = 'F' THEN 2 ELSE 1 END ||
            SUBSTRING(birthdate FROM 3 FOR 2) ||
            SUBSTRING(birthdate FROM 6 FOR 2) ||
            SUBSTRING(zipcode FROM 1 FOR 2) ||
            18524371 AS BIGINT)
from BOBO_CUSTOMER);

select * from bobo_customer where 
customer_code_secu in (select  CAST(CASE WHEN gender = 'F' THEN 2 ELSE 1 END ||
            SUBSTRING(birthdate FROM 3 FOR 2) ||
            SUBSTRING(birthdate FROM 6 FOR 2) ||
            SUBSTRING(zipcode FROM 1 FOR 2) ||
            18524371 AS BIGINT)
from BOBO_CUSTOMER);

select count(*) as nb, code_secu from bobo_customer 
group by code_secu
HAVING count(*) > 1;

/* Doublon détecté, recherche détail */
select * from bobo_customer 
WHERE CODE_SECU = 291067618524371
;
*/
/*=======================================================================*/

/* REGLE DE CALCUL:
    SI GENDER = F --> 2 SINON --> 1
    ANNEE DE NAISSANCE  --> SUBSTRING(BIRTHDATE FROM 3 FOR 2)
    MOIS DE NAISSANCE   --> SUBSTRING(BIRTHDATE FROM 6 FOR 2)
    DEPARTEMENT DE NAISSANCE --> On prend SUBSTRING(ZIPCODE FROM 1 FOR 2)
    Numéro séquentiel 1 sur 3 caractères à partir de 150 --> 185
    Numéro séquentiel 2 sur 3 caractères à partir de 0  --> 243
    Numéro séquentiel 3 sur 2 caractères à partir de 0  --> 71
    Si n'existe pas dans la table CUSTOMER  --> Mise à jour de bobo_customer
    Sinon boucle jusqu'à n'existe pas dans la table CUSTOMER
            Vérifie si NSEQ1 + 1 existe dans customer 
    Quand n'existe pas dans la table CUSTOMER  --> Mise à jour de bobo_customer 
 Pour simplifier la règle, les numéros séquentiels seront fixes après un contrôle
du contenu de la table Customer et l'unicité dans la table bobo_customer. */
BEGIN;    
    UPDATE bobo_customer c1 SET CODE_SECU = 
        (select CAST(CASE WHEN gender = 'F' THEN 2 ELSE 1 END ||
            SUBSTRING(birthdate FROM 3 FOR 2) ||
            SUBSTRING(birthdate FROM 6 FOR 2) ||
            SUBSTRING(zipcode FROM 1 FOR 2) ||
            18524371 AS BIGINT)
        FROM BOBO_CUSTOMER c2 
        WHERE c1.firstname = c2.firstname AND c1.lastname = c2.lastname)
;
/* il y a un doublon, modification d'un des 2 codes sécu. */
UPDATE bobo_customer c1 SET CODE_SECU = 
        (select CAST(CASE WHEN gender = 'F' THEN 2 ELSE 1 END ||
            SUBSTRING(birthdate FROM 3 FOR 2) ||
            SUBSTRING(birthdate FROM 6 FOR 2) ||
            SUBSTRING(zipcode FROM 1 FOR 2) ||
            18524472 AS BIGINT)
        FROM BOBO_CUSTOMER c2 
        WHERE c1.firstname = c2.firstname AND c1.lastname = c2.lastname)
WHERE TRIM(c1.firstname) = 'Neil' AND TRIM(c1.lastname) = 'Shaffer'
;
COMMIT;

/* CHARGEMENT DE LA TABLE CUSTOMER AVEC LES INFORMATIONS DE BOBO_CUSTOMER */
BEGIN;

INSERT INTO CUSTOMER (CUSTOMER_GENDER, CUSTOMER_LASTNAME, CUSTOMER_FIRSTNAME, CUSTOMER_ADRESS1, 
CUSTOMER_ZIPCODE, CUSTOMER_TOWN, CUSTOMER_COUNTRY, CUSTOMER_PHONE, CUSTOMER_MAIL, CUSTOMER_BIRTH_DATE,  
CUSTOMER_CODE_SECU, CUSTOMER_CODE_IBAN,CUSTOMER_NBCHILDREN,CUSTOMER_COUPLE, CUSTOMER_CREATE_DATE, 
 CUSTOMER_UPDATE_DATE, CUSTOMER_CLOSE_DATE, CUSTOMER_ACTIVE) 
SELECT  
    CASE 
        WHEN GENDER = 'M' THEN 'Homme'
        WHEN GENDER = 'F' THEN 'Femme'
        WHEN GENDER = 'X' THEN 'Autre'
        ELSE GENDER
    END as GENDER, LASTNAME, FIRSTNAME, ADRESS, ZIPCODE, TOWN, COUNTRY,TRIM(PHONE),
    EMAIL,CAST(BIRTHDATE AS DATE),CODE_SECU,IBAN,0,  CASE 
                                        WHEN TRIM(MARITAL) = 'Married' THEN True
                                        WHEN TRIM(MARITAL) = 'Single' THEN False
                                        WHEN TRIM(MARITAL) = 'Divorced' THEN False
                                        ELSE False
                                       END as MARITAL,
    CURRENT_DATE,'0001-01-01','0001-01-01','1'
FROM BOBO_CUSTOMER
;

COMMIT;