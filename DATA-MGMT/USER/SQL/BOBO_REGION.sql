DROP TABLE BOBO_REGION;

CREATE TABLE BOBO_REGION (
    UUID_REGION         UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    REGION_NUM          NUMERIC(2) default 0,
    REGION_LABEL        VARCHAR(30) default 'N/A',
    REGION_CODEDEP      VARCHAR(2) default '00'
  
                );

INSERT INTO BOBO_REGION (REGION_NUM,REGION_LABEL , REGION_CODEDEP)
VALUES  (1,'Auvergne Rhône Alpes', '01'),
        (1,'Auvergne Rhône Alpes', '03'),
        (1,'Auvergne Rhône Alpes', '07'),
        (1,'Auvergne Rhône Alpes', '15'),
        (1,'Auvergne Rhône Alpes', '26'),
        (1,'Auvergne Rhône Alpes', '38'),
        (1,'Auvergne Rhône Alpes', '42'),
        (1,'Auvergne Rhône Alpes', '43'),
        (1,'Auvergne Rhône Alpes', '63'),
        (1,'Auvergne Rhône Alpes', '69'),
        (1,'Auvergne Rhône Alpes', '73'),
        (1,'Auvergne Rhône Alpes', '74'),
        (2,'Bourgogne Franche Comté', '21'),
        (2,'Bourgogne Franche Comté', '25'),
        (2,'Bourgogne Franche Comté', '39'),
        (2,'Bourgogne Franche Comté', '58'),
        (2,'Bourgogne Franche Comté', '70'),
        (2,'Bourgogne Franche Comté', '71'),
        (2,'Bourgogne Franche Comté', '89'),
        (2,'Bourgogne Franche Comté', '90'),
        (3,'Bretagne', '22'),
        (3,'Bretagne', '29'),
        (3,'Bretagne', '35'),
        (3,'Bretagne', '56'),
        (4,'Centre Val de Loire', '18'),
        (4,'Centre Val de Loire', '28'),
        (4,'Centre Val de Loire', '36'),
        (4,'Centre Val de Loire', '37'),
        (4,'Centre Val de Loire', '41'),
        (4,'Centre Val de Loire', '45'),
        (5,'Corse', '02'),
        (6,'Grand Est', '08'),
        (6,'Grand Est', '10'),
        (6,'Grand Est', '51'),
        (6,'Grand Est', '52'),
        (6,'Grand Est', '54'),
        (6,'Grand Est', '55'),
        (6,'Grand Est', '57'),
        (6,'Grand Est', '67'),
        (6,'Grand Est', '68'),
        (6,'Grand Est', '88'),
        (7,'Hauts de France', '02'),
        (7,'Hauts de France', '59'),
        (7,'Hauts de France', '60'),
        (7,'Hauts de France', '62'),
        (7,'Hauts de France', '80'),
        (8,'Ile de France', '75'),
        (8,'Ile de France', '77'),
        (8,'Ile de France', '78'),
        (8,'Ile de France', '91'),
        (8,'Ile de France', '92'),
        (8,'Ile de France', '93'),
        (8,'Ile de France', '94'),
        (8,'Ile de France', '95'),
        (9,'Normandie', '14'),
        (9,'Normandie', '27'),
        (9,'Normandie', '50'),
        (9,'Normandie', '61'),
        (9,'Normandie', '76'),
        (10,'Nouvelle Aquitaine', '16'),
        (10,'Nouvelle Aquitaine', '17'),
        (10,'Nouvelle Aquitaine', '19'),
        (10,'Nouvelle Aquitaine', '23'),
        (10,'Nouvelle Aquitaine', '24'),
        (10,'Nouvelle Aquitaine', '33'),
        (10,'Nouvelle Aquitaine', '40'),
        (10,'Nouvelle Aquitaine', '47'),
        (10,'Nouvelle Aquitaine', '64'),
        (10,'Nouvelle Aquitaine', '79'),
        (10,'Nouvelle Aquitaine', '86'),
        (10,'Nouvelle Aquitaine', '87'),
        (11,'Occitanie', '09'),
        (11,'Occitanie', '11'),
        (11,'Occitanie', '12'),
        (11,'Occitanie', '30'),
        (11,'Occitanie', '31'),
        (11,'Occitanie', '32'),
        (11,'Occitanie', '34'),
        (11,'Occitanie', '46'),
        (11,'Occitanie', '48'),
        (11,'Occitanie', '65'),
        (11,'Occitanie', '66'),
        (11,'Occitanie', '81'),
        (11,'Occitanie', '82'),
        (12,'Pays de la Loire', '44'),
        (12,'Pays de la Loire', '45'),
        (12,'Pays de la Loire', '53'),
        (12,'Pays de la Loire','72'),
        (12,'Pays de la Loire', '85'),
        (13,'Provence Alpes Cote d''azur', '04'),
        (13,'Provence Alpes Cote d''azur', '05'),
        (13,'Provence Alpes Cote d''azur', '06'),
        (13,'Provence Alpes Cote d''azur', '13'),
        (13,'Provence Alpes Cote d''azur', '83'),
        (13,'Provence Alpes Cote d''azur', '84'),
        (14,'Departements d''outre-mer', '97') 
;                