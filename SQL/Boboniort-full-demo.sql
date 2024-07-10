DROP TABLE USER_TAB;

DROP TABLE CUSTOMER;

DROP TABLE CUSTOMER_ARCHIVE;

DROP TABLE COST_CONDITION;

DROP TABLE CLASSIC_REIMBURSEMENT;

DROP TABLE CUSTOMER_REIMBURSEMENT;

DROP TABLE CUSTOMER_REIMBURSEMENT_ARCHIVE;

DROP TABLE INVOICE;

DROP TABLE BOBO_CUSTOMER;

/* Création de la nouvelle structure de tables */
CREATE TABLE
    USER_TAB (
        UUID_USER UUID DEFAULT gen_random_uuid () PRIMARY KEY,
        USER_IDENTIFICATION VARCHAR(14) NOT NULL,
        USER_PASSWORD VARCHAR(14) NOT NULL
    );

CREATE TABLE
    CUSTOMER (
        UUID_CUSTOMER UUID DEFAULT gen_random_uuid () PRIMARY KEY,
        CUSTOMER_GENDER VARCHAR(10) DEFAULT 'N/A',
        CUSTOMER_LASTNAME VARCHAR(20) DEFAULT 'N/A',
        CUSTOMER_FIRSTNAME VARCHAR(20) DEFAULT 'N/A',
        CUSTOMER_ADRESS1 VARCHAR(50) DEFAULT 'N/A',
        CUSTOMER_ADRESS2 VARCHAR(50) DEFAULT 'N/A',
        CUSTOMER_ZIPCODE VARCHAR(15) DEFAULT 'N/A',
        CUSTOMER_TOWN VARCHAR(30) DEFAULT 'N/A',
        CUSTOMER_COUNTRY VARCHAR(20) DEFAULT 'N/A',
        CUSTOMER_PHONE VARCHAR(10) DEFAULT 'N/A',
        CUSTOMER_MAIL VARCHAR(50) DEFAULT 'N/A',
        CUSTOMER_BIRTH_DATE DATE DEFAULT '0001-01-01',
        CUSTOMER_DOCTOR VARCHAR(20) DEFAULT 'N/A',
        CUSTOMER_CODE_SECU BIGINT DEFAULT 0,
        CUSTOMER_CODE_IBAN VARCHAR(34) DEFAULT 'N/A',
        CUSTOMER_NBCHILDREN INTEGER DEFAULT 0,
        CUSTOMER_COUPLE BOOLEAN,
        CUSTOMER_CREATE_DATE DATE DEFAULT '0001-01-01',
        CUSTOMER_UPDATE_DATE DATE DEFAULT '0001-01-01',
        CUSTOMER_CLOSE_DATE DATE DEFAULT '0001-01-01',
        CUSTOMER_ACTIVE VARCHAR(1) DEFAULT '1'
    );

CREATE TABLE
    CUSTOMER_ARCHIVE (
        UUID_CUSTOMER_ARCHIVE UUID DEFAULT gen_random_uuid () PRIMARY KEY,
        ARCHIVE_GENDER VARCHAR(10) DEFAULT 'N/A',
        ARCHIVE_LASTNAME VARCHAR(20) DEFAULT 'N/A',
        ARCHIVE_FIRSTNAME VARCHAR(20) DEFAULT 'N/A',
        ARCHIVE_ADRESS1 VARCHAR(50) DEFAULT 'N/A',
        ARCHIVE_ADRESS2 VARCHAR(50) DEFAULT 'N/A',
        ARCHIVE_ZIPCODE VARCHAR(15) DEFAULT 'N/A',
        ARCHIVE_TOWN VARCHAR(30) DEFAULT 'N/A',
        ARCHIVE_COUNTRY VARCHAR(20) DEFAULT 'N/A',
        ARCHIVE_PHONE VARCHAR(10) DEFAULT 'N/A',
        ARCHIVE_MAIL VARCHAR(50) DEFAULT 'N/A',
        ARCHIVE_BIRTH_DATE DATE DEFAULT '0001-01-01',
        ARCHIVE_DOCTOR VARCHAR(20) DEFAULT 'N/A',
        ARCHIVE_CODE_SECU BIGINT DEFAULT 0,
        ARCHIVE_CODE_IBAN VARCHAR(34) DEFAULT 'N/A',
        ARCHIVE_NBCHILDREN INTEGER DEFAULT 0,
        ARCHIVE_COUPLE BOOLEAN,
        ARCHIVE_CREATE_DATE DATE DEFAULT '0001-01-01',
        ARCHIVE_UPDATE_DATE DATE DEFAULT '0001-01-01',
        ARCHIVE_CLOSE_DATE DATE DEFAULT '0001-01-01',
        ARCHIVE_ACTIVE VARCHAR(1) DEFAULT '1'
    );

INSERT INTO
    USER_TAB (USER_IDENTIFICATION, USER_PASSWORD)
VALUES
    ('UtilLECT', 'Lecture01'),
    ('a', 'a'),
    ('UtilMAJ', 'Majour01');

INSERT INTO
    CUSTOMER (
        CUSTOMER_GENDER,
        CUSTOMER_LASTNAME,
        CUSTOMER_FIRSTNAME,
        CUSTOMER_ADRESS1,
        CUSTOMER_ADRESS2,
        CUSTOMER_ZIPCODE,
        CUSTOMER_TOWN,
        CUSTOMER_COUNTRY,
        CUSTOMER_PHONE,
        CUSTOMER_MAIL,
        CUSTOMER_BIRTH_DATE,
        CUSTOMER_DOCTOR,
        CUSTOMER_CODE_SECU,
        CUSTOMER_CODE_IBAN,
        CUSTOMER_NBCHILDREN,
        CUSTOMER_COUPLE,
        CUSTOMER_CREATE_DATE,
        CUSTOMER_UPDATE_DATE,
        CUSTOMER_CLOSE_DATE,
        CUSTOMER_ACTIVE
    )
VALUES
    (
        'Homme',
        'Dupont',
        'Jean',
        '12 Rue des Lilas',
        'Apt 45',
        '75015',
        'Paris',
        'France',
        '0612345678',
        'jean.dupont@email.fr',
        '1975-03-01',
        'Dr. Moreau',
        175039089400273,
        'FR7630006000011234567890189',
        2,
        TRUE,
        '2020-01-01',
        '2020-01-02',
        NULL,
        '1'
    ),
    (
        'Femme',
        'Martin',
        'Elise',
        '98 Avenue de la Republique',
        'Batiment B',
        '69007',
        'Lyon',
        'France',
        '0623456789',
        'elise.martin@email.fr',
        '1982-07-16',
        'Dr. Lefevre',
        292073958501345,
        'FR7630014000567891011234568',
        3,
        FALSE,
        '2020-02-01',
        NULL,
        NULL,
        '0'
    ),
    (
        'Femme',
        'Leroy',
        'Marie',
        '25 Rue de la Liberte',
        'App 101',
        '67000',
        'Strasbourg',
        'France',
        '0678901234',
        'marie.leroy@email.fr',
        '1989-11-11',
        'Dr. Renault',
        185074321900456,
        'FR7610093000000123456789001',
        1,
        FALSE,
        '2021-05-20',
        '2021-05-21',
        NULL,
        '1'
    ),
    (
        'Homme',
        'Bernard',
        'Jacques',
        '99 Avenue des Peupliers',
        '',
        '33000',
        'Bordeaux',
        'France',
        '0687654321',
        'jacques.bernard@email.fr',
        '1970-02-15',
        'Dr. Dupont',
        274039087654321,
        'FR7620017000011234567890234',
        3,
        TRUE,
        '2021-06-01',
        NULL,
        NULL,
        '1'
    ),
    (
        'Femme',
        'Chevalier',
        'Claire',
        '10 Rue du Port',
        'Etage 3',
        '44000',
        'Nantes',
        'France',
        '0691234567',
        'claire.chevalier@email.fr',
        '1990-05-25',
        'Dr. Besson',
        196085478312547,
        'FR7640041000010123456789345',
        0,
        TRUE,
        '2019-07-15',
        '2020-01-10',
        NULL,
        '0'
    ),
    (
        'Homme',
        'Petit',
        'Emile',
        '77 Boulevard des Etoiles',
        '',
        '75017',
        'Paris',
        'France',
        '0609876543',
        'emile.petit@email.fr',
        '1985-08-19',
        'Dr. Mercier',
        204075839456789,
        'FR7630056001200123456789456',
        2,
        FALSE,
        '2021-02-22',
        '2021-03-15',
        NULL,
        'A'
    ),
    (
        'Femme',
        'Girard',
        'Sophie',
        '32 Avenue des Champs',
        'Batiment C',
        '06000',
        'Nice',
        'France',
        '0678654321',
        'sophie.girard@email.fr',
        '1980-12-01',
        'Dr. Dupuis',
        195063475290876,
        'FR7650027002330123456789567',
        1,
        FALSE,
        '2018-11-05',
        '2019-05-07',
        NULL,
        '1'
    ),
    (
        'Homme',
        'Moreau',
        'Louis',
        '5 Rue de la Republique',
        'Appartement 202',
        '34000',
        'Montpellier',
        'France',
        '0612345678',
        'louis.moreau@email.fr',
        '1995-02-15',
        'Dr. Lemoine',
        215079876543210,
        'FR7660038003440123456789678',
        3,
        TRUE,
        '2017-06-30',
        '2018-07-15',
        NULL,
        '1'
    ),
    (
        'Femme',
        'Lefebvre',
        'Anne',
        '21 Rue Victor Hugo',
        'Maison',
        '59000',
        'Lille',
        'France',
        '0687654321',
        'anne.lefebvre@email.fr',
        '1978-07-30',
        'Dr. Fontaine',
        183072543210987,
        'FR7670049004550123456789789',
        0,
        FALSE,
        '2022-05-01',
        NULL,
        NULL,
        '1'
    ),
    (
        'Homme',
        'Rousseau',
        'David',
        '83 Rue des Jardins',
        'Lotissement Les Fleurs',
        '13090',
        'Aix-en-Provence',
        'France',
        '0654321987',
        'david.rousseau@email.fr',
        '1983-03-12',
        'Dr. Blanc',
        273049876512345,
        'FR7680050005660123456789890',
        2,
        TRUE,
        '2020-10-25',
        '2021-02-11',
        NULL,
        'A'
    );

CREATE TABLE
    CLASSIC_REIMBURSEMENT (
        CLASSIC_REIMBURSEMENT_NUMBER serial primary key,
        CLASSIC_REIMBURSEMENT_LABEL VARCHAR(12) default 'N/A',
        CLASSIC_REIMBURSEMENT_DOCTOR numeric(3) default 0,
        CLASSIC_REIMBURSEMENT_PARMEDICAL numeric(3) default 0,
        CLASSIC_REIMBURSEMENT_HOSPITAL numeric(3) default 0,
        CLASSIC_REIMBURSEMENT_SINGLE_GLASSES numeric(3) default 0,
        CLASSIC_REIMBURSEMENT_PROGRESSIVE_GLASSES numeric(3) default 0,
        CLASSIC_REIMBURSEMENT_MOLAR_CROWNS numeric(3) default 0,
        CLASSIC_REIMBURSEMENT_NON_MOLAR_CROWNS numeric(3) default 0,
        CLASSIC_REIMBURSEMENT_DESCALINGS numeric(3) default 0
    );

INSERT INTO
    CLASSIC_REIMBURSEMENT (
        CLASSIC_REIMBURSEMENT_LABEL,
        CLASSIC_REIMBURSEMENT_DOCTOR,
        CLASSIC_REIMBURSEMENT_PARMEDICAL,
        CLASSIC_REIMBURSEMENT_HOSPITAL,
        CLASSIC_REIMBURSEMENT_SINGLE_GLASSES,
        CLASSIC_REIMBURSEMENT_PROGRESSIVE_GLASSES,
        CLASSIC_REIMBURSEMENT_MOLAR_CROWNS,
        CLASSIC_REIMBURSEMENT_NON_MOLAR_CROWNS,
        CLASSIC_REIMBURSEMENT_DESCALINGS
    )
VALUES
    ('ALLEGE', 100, 100, 100, 30, 33, 16, 100, 100),
    ('MODERE', 120, 100, 150, 60, 66, 33, 100, 100),
    ('EXCELLENCE', 240, 150, 280, 98, 98, 80, 100, 100);

SELECT
    COUNT(*)
FROM
    CLASSIC_REIMBURSEMENT;

CREATE TABLE
    CUSTOMER_REIMBOURSEMENT_ARCHIVE (
        UUID_CUSTOMER_REIMBOURSEMENT_ARCHIVE UUID DEFAULT gen_random_uuid () PRIMARY KEY,
        UUID_CUSTOMER UUID,
        ARCHIVE_NUM VARCHAR(10),
        ARCHIVE_CREATE_DATE date,
        ARCHIVE_COST decimal default 0,
        ARCHIVE_DOC numeric(3) default 0,
        ARCHIVE_PARMEDICAL numeric(3) default 0,
        ARCHIVE_HOSPITAL numeric(3) default 0,
        ARCHIVE_SINGLE_GLASSES numeric(3) default 0,
        ARCHIVE_PROGRESSIVE_GLASSES numeric(3) default 0,
        ARCHIVE_MOLAR_CROWNS numeric(3) default 0,
        ARCHIVE_NON_MOLAR_CROWNS numeric(3) default 0,
        ARCHIVE_DESCALINGS numeric(3) default 0
    );

CREATE TABLE
    CUSTOMER_REIMBURSEMENT (
        UUID_CUSTOMER_REIMBOURSEMENT UUID DEFAULT gen_random_uuid () PRIMARY KEY,
        UUID_CUSTOMER UUID,
        REIMBURSEMENT_NUM VARCHAR(10),
        REIMBURSEMENT_CREATE_DATE date,
        REIMBURSEMENT_COST decimal default 0,
        REIMBURSEMENT_DOCTOR numeric(3) default 0,
        REIMBURSEMENT_PARMEDICAL numeric(3) default 0,
        REIMBURSEMENT_HOSPITAL numeric(3) default 0,
        REIMBURSEMENT_SINGLE_GLASSES numeric(3) default 0,
        REIMBURSEMENT_PROGRESSIVE_GLASSES numeric(3) default 0,
        REIMBURSEMENT_MOLAR_CROWNS numeric(3) default 0,
        REIMBURSEMENT_NON_MOLAR_CROWNS numeric(3) default 0,
        REIMBURSEMENT_DESCALINGS numeric(3) default 0
    );

INSERT INTO
    CUSTOMER_REIMBURSEMENT (
        UUID_CUSTOMER,
        REIMBURSEMENT_NUM,
        REIMBURSEMENT_CREATE_DATE,
        REIMBURSEMENT_COST,
        REIMBURSEMENT_DOCTOR,
        REIMBURSEMENT_PARMEDICAL,
        REIMBURSEMENT_HOSPITAL,
        REIMBURSEMENT_SINGLE_GLASSES,
        REIMBURSEMENT_PROGRESSIVE_GLASSES,
        REIMBURSEMENT_MOLAR_CROWNS,
        REIMBURSEMENT_NON_MOLAR_CROWNS,
        REIMBURSEMENT_DESCALINGS
    )
VALUES
    (
        (
            SELECT
                UUID_CUSTOMER
            FROM
                CUSTOMER
            WHERE
                CUSTOMER_LASTNAME = 'Dupont'
                AND CUSTOMER_FIRSTNAME = 'Jean'
        ),
        'ALL2404001',
        '2024-04-05',
        40,
        100,
        100,
        100,
        30,
        33,
        16,
        100,
        100
    ),
    (
        (
            SELECT
                UUID_CUSTOMER
            FROM
                CUSTOMER
            WHERE
                CUSTOMER_LASTNAME = 'Bernard'
                AND CUSTOMER_FIRSTNAME = 'Jacques'
        ),
        'EXC1407001',
        '2014-07-15',
        70,
        240,
        150,
        280,
        98,
        98,
        80,
        100,
        10
    );

SELECT
    COUNT(*)
FROM
    CUSTOMER_REIMBURSEMENT;

CREATE TABLE
    COST_CONDITION (
        UUID_COST_CONDITION UUID DEFAULT gen_random_uuid () PRIMARY KEY,
        CLASSIC_REIMBURSEMENT_NUMBER integer,
        COST_CONDITION_TYPE varchar(1) Default 'Z',
        COST_CONDITION_AGEMIN integer Default 0,
        COST_CONDITION_AGEMAX integer Default 0,
        COST_CONDITION_COUPLE boolean,
        COST_CONDITION_COST integer Default 0,
        COST_CONDITION_CREATE_DATE date Default '0001-01-01',
        COST_CONDITION_UPDATE_DATE date Default '0001-01-01',
        FOREIGN KEY (CLASSIC_REIMBURSEMENT_NUMBER) REFERENCES CLASSIC_REIMBURSEMENT (CLASSIC_REIMBURSEMENT_NUMBER)
    );

/*****************************************************************************************/
/*            Table des couts                                                            */
/*****************************************************************************************/
/* Contrat Excellence + enfants */
INSERT INTO
    COST_CONDITION (
        CLASSIC_REIMBURSEMENT_NUMBER,
        COST_CONDITION_TYPE,
        COST_CONDITION_AGEMIN,
        COST_CONDITION_AGEMAX,
        COST_CONDITION_COUPLE,
        COST_CONDITION_COST,
        COST_CONDITION_CREATE_DATE,
        COST_CONDITION_UPDATE_DATE
    )
VALUES
    /* condition par enfant à charge */
    (
        (
            SELECT
                CLASSIC_REIMBURSEMENT_NUMBER
            FROM
                CLASSIC_REIMBURSEMENT
            WHERE
                CLASSIC_REIMBURSEMENT_LABEL = 'EXCELLENCE'
        ),
        '1',
        0,
        0,
        False,
        10,
        CURRENT_DATE,
        '0001-01-01'
    ),
    /* condition adhérent seul - 30 ans */
    (
        (
            SELECT
                CLASSIC_REIMBURSEMENT_NUMBER
            FROM
                CLASSIC_REIMBURSEMENT
            WHERE
                CLASSIC_REIMBURSEMENT_LABEL = 'EXCELLENCE'
        ),
        '2',
        0,
        30,
        False,
        45,
        CURRENT_DATE,
        '0001-01-01'
    ),
    /* condition adhérent seul + 65 ans */
    (
        (
            SELECT
                CLASSIC_REIMBURSEMENT_NUMBER
            FROM
                CLASSIC_REIMBURSEMENT
            WHERE
                CLASSIC_REIMBURSEMENT_LABEL = 'EXCELLENCE'
        ),
        '2',
        65,
        0,
        False,
        50,
        CURRENT_DATE,
        '0001-01-01'
    ),
    /* condition adhérent seul entre 30 et 65 ans */
    (
        (
            SELECT
                CLASSIC_REIMBURSEMENT_NUMBER
            FROM
                CLASSIC_REIMBURSEMENT
            WHERE
                CLASSIC_REIMBURSEMENT_LABEL = 'EXCELLENCE'
        ),
        '2',
        30,
        65,
        False,
        40,
        CURRENT_DATE,
        '0001-01-01'
    ),
    /* condition adhérent en couple - 30 ans */
    (
        (
            SELECT
                CLASSIC_REIMBURSEMENT_NUMBER
            FROM
                CLASSIC_REIMBURSEMENT
            WHERE
                CLASSIC_REIMBURSEMENT_LABEL = 'EXCELLENCE'
        ),
        '2',
        0,
        30,
        True,
        60,
        CURRENT_DATE,
        '0001-01-01'
    ),
    /* condition adhérent en couple + 65 ans */
    (
        (
            SELECT
                CLASSIC_REIMBURSEMENT_NUMBER
            FROM
                CLASSIC_REIMBURSEMENT
            WHERE
                CLASSIC_REIMBURSEMENT_LABEL = 'EXCELLENCE'
        ),
        '2',
        65,
        0,
        True,
        65,
        CURRENT_DATE,
        '0001-01-01'
    ),
    /* condition adhérent en couple entre 30 et 65 ans */
    (
        (
            SELECT
                CLASSIC_REIMBURSEMENT_NUMBER
            FROM
                CLASSIC_REIMBURSEMENT
            WHERE
                CLASSIC_REIMBURSEMENT_LABEL = 'EXCELLENCE'
        ),
        '2',
        30,
        65,
        True,
        60,
        CURRENT_DATE,
        '0001-01-01'
    );

SELECT
    'Formule EXCELLENCE',
    COUNT(*)
FROM
    COST_CONDITION
WHERE
    CLASSIC_REIMBURSEMENT_NUMBER = (
        SELECT
            CLASSIC_REIMBURSEMENT_NUMBER
        FROM
            CLASSIC_REIMBURSEMENT
        WHERE
            CLASSIC_REIMBURSEMENT_LABEL = 'EXCELLENCE'
    );

/* Contrat Modéré */
INSERT INTO
    COST_CONDITION (
        CLASSIC_REIMBURSEMENT_NUMBER,
        COST_CONDITION_TYPE,
        COST_CONDITION_AGEMIN,
        COST_CONDITION_AGEMAX,
        COST_CONDITION_COUPLE,
        COST_CONDITION_COST,
        COST_CONDITION_CREATE_DATE,
        COST_CONDITION_UPDATE_DATE
    )
VALUES
    /* condition par enfant à charge */
    (
        (
            SELECT
                CLASSIC_REIMBURSEMENT_NUMBER
            FROM
                CLASSIC_REIMBURSEMENT
            WHERE
                CLASSIC_REIMBURSEMENT_LABEL = 'MODERE'
        ),
        '1',
        0,
        0,
        False,
        10,
        CURRENT_DATE,
        '0001-01-01'
    ),
    /* condition adhérent seul - 30 ans */
    (
        (
            SELECT
                CLASSIC_REIMBURSEMENT_NUMBER
            FROM
                CLASSIC_REIMBURSEMENT
            WHERE
                CLASSIC_REIMBURSEMENT_LABEL = 'MODERE'
        ),
        '2',
        0,
        30,
        False,
        35,
        CURRENT_DATE,
        '0001-01-01'
    ),
    /* condition adhérent seul + 65 ans */
    (
        (
            SELECT
                CLASSIC_REIMBURSEMENT_NUMBER
            FROM
                CLASSIC_REIMBURSEMENT
            WHERE
                CLASSIC_REIMBURSEMENT_LABEL = 'MODERE'
        ),
        '2',
        65,
        0,
        False,
        35,
        CURRENT_DATE,
        '0001-01-01'
    ),
    /* condition adhérent seul entre 30 et 65 ans */
    (
        (
            SELECT
                CLASSIC_REIMBURSEMENT_NUMBER
            FROM
                CLASSIC_REIMBURSEMENT
            WHERE
                CLASSIC_REIMBURSEMENT_LABEL = 'MODERE'
        ),
        '2',
        30,
        65,
        False,
        30,
        CURRENT_DATE,
        '0001-01-01'
    ),
    /* condition adhérent en couple - 30 ans */
    (
        (
            SELECT
                CLASSIC_REIMBURSEMENT_NUMBER
            FROM
                CLASSIC_REIMBURSEMENT
            WHERE
                CLASSIC_REIMBURSEMENT_LABEL = 'MODERE'
        ),
        '2',
        0,
        30,
        True,
        53,
        CURRENT_DATE,
        '0001-01-01'
    ),
    /* condition adhérent en couple + 65 ans */
    (
        (
            SELECT
                CLASSIC_REIMBURSEMENT_NUMBER
            FROM
                CLASSIC_REIMBURSEMENT
            WHERE
                CLASSIC_REIMBURSEMENT_LABEL = 'MODERE'
        ),
        '2',
        65,
        0,
        True,
        60,
        CURRENT_DATE,
        '0001-01-01'
    ),
    /* condition adhérent en couple entre 30 et 65 ans */
    (
        (
            SELECT
                CLASSIC_REIMBURSEMENT_NUMBER
            FROM
                CLASSIC_REIMBURSEMENT
            WHERE
                CLASSIC_REIMBURSEMENT_LABEL = 'MODERE'
        ),
        '2',
        30,
        65,
        True,
        50,
        CURRENT_DATE,
        '0001-01-01'
    );

SELECT
    'Formule MODEREE',
    COUNT(*)
FROM
    COST_CONDITION
WHERE
    CLASSIC_REIMBURSEMENT_NUMBER = (
        SELECT
            CLASSIC_REIMBURSEMENT_NUMBER
        FROM
            CLASSIC_REIMBURSEMENT
        WHERE
            CLASSIC_REIMBURSEMENT_LABEL = 'MODERE'
    );

/* Contrat Allégé */
INSERT INTO
    COST_CONDITION (
        CLASSIC_REIMBURSEMENT_NUMBER,
        COST_CONDITION_TYPE,
        COST_CONDITION_AGEMIN,
        COST_CONDITION_AGEMAX,
        COST_CONDITION_COUPLE,
        COST_CONDITION_COST,
        COST_CONDITION_CREATE_DATE,
        COST_CONDITION_UPDATE_DATE
    )
VALUES
    /* condition par enfant à charge */
    (
        (
            SELECT
                CLASSIC_REIMBURSEMENT_NUMBER
            FROM
                CLASSIC_REIMBURSEMENT
            WHERE
                CLASSIC_REIMBURSEMENT_LABEL = 'ALLEGE'
        ),
        '1',
        0,
        0,
        False,
        10,
        CURRENT_DATE,
        '0001-01-01'
    ),
    /* condition adhérent seul - 30 ans */
    (
        (
            SELECT
                CLASSIC_REIMBURSEMENT_NUMBER
            FROM
                CLASSIC_REIMBURSEMENT
            WHERE
                CLASSIC_REIMBURSEMENT_LABEL = 'ALLEGE'
        ),
        '2',
        0,
        30,
        False,
        25,
        CURRENT_DATE,
        '0001-01-01'
    ),
    /* condition adhérent seul + 65 ans */
    (
        (
            SELECT
                CLASSIC_REIMBURSEMENT_NUMBER
            FROM
                CLASSIC_REIMBURSEMENT
            WHERE
                CLASSIC_REIMBURSEMENT_LABEL = 'ALLEGE'
        ),
        '2',
        65,
        0,
        False,
        25,
        CURRENT_DATE,
        '0001-01-01'
    ),
    /* condition adhérent seul entre 30 et 65 ans */
    (
        (
            SELECT
                CLASSIC_REIMBURSEMENT_NUMBER
            FROM
                CLASSIC_REIMBURSEMENT
            WHERE
                CLASSIC_REIMBURSEMENT_LABEL = 'ALLEGE'
        ),
        '2',
        30,
        65,
        False,
        20,
        CURRENT_DATE,
        '0001-01-01'
    ),
    /* condition adhérent en couple - 30 ans */
    (
        (
            SELECT
                CLASSIC_REIMBURSEMENT_NUMBER
            FROM
                CLASSIC_REIMBURSEMENT
            WHERE
                CLASSIC_REIMBURSEMENT_LABEL = 'ALLEGE'
        ),
        '2',
        0,
        30,
        True,
        45,
        CURRENT_DATE,
        '0001-01-01'
    ),
    /* condition adhérent en couple + 65 ans */
    (
        (
            SELECT
                CLASSIC_REIMBURSEMENT_NUMBER
            FROM
                CLASSIC_REIMBURSEMENT
            WHERE
                CLASSIC_REIMBURSEMENT_LABEL = 'ALLEGE'
        ),
        '2',
        65,
        0,
        True,
        50,
        CURRENT_DATE,
        '0001-01-01'
    ),
    /* condition adhérent en couple entre 30 et 65 ans */
    (
        (
            SELECT
                CLASSIC_REIMBURSEMENT_NUMBER
            FROM
                CLASSIC_REIMBURSEMENT
            WHERE
                CLASSIC_REIMBURSEMENT_LABEL = 'ALLEGE'
        ),
        '2',
        30,
        65,
        True,
        40,
        CURRENT_DATE,
        '0001-01-01'
    );

SELECT
    'Formule ALLEGEE',
    COUNT(*)
FROM
    COST_CONDITION
WHERE
    CLASSIC_REIMBURSEMENT_NUMBER = (
        SELECT
            CLASSIC_REIMBURSEMENT_NUMBER
        FROM
            CLASSIC_REIMBURSEMENT
        WHERE
            CLASSIC_REIMBURSEMENT_LABEL = 'ALLEGE'
    );

CREATE TABLE
    INVOICE (
        UUID_INVOICE UUID DEFAULT gen_random_uuid () PRIMARY KEY,
        UUID_CUSTOMER_REIMBOURSEMENT UUID,
        UUID_CUSTOMER UUID,
        INVOICE_NUMBER NUMERIC(8),
        INVOICE_INCOME DECIMAL(5, 2),
        INVOICE_EXPECT DECIMAL(5, 2),
        INVOICE_CREATE_DATE DATE
    );

CREATE TABLE
    BOBO_REGION (
        UUID_REGION UUID DEFAULT gen_random_uuid () PRIMARY KEY,
        REGION_NUM NUMERIC(2) default 0,
        REGION_LABEL VARCHAR(30) default 'N/A',
        REGION_CODEDEP VARCHAR(2) default '00'
    );

INSERT INTO
    BOBO_REGION (REGION_NUM, REGION_LABEL, REGION_CODEDEP)
VALUES
    (1, 'Auvergne Rhône Alpes', '01'),
    (1, 'Auvergne Rhône Alpes', '03'),
    (1, 'Auvergne Rhône Alpes', '07'),
    (1, 'Auvergne Rhône Alpes', '15'),
    (1, 'Auvergne Rhône Alpes', '26'),
    (1, 'Auvergne Rhône Alpes', '38'),
    (1, 'Auvergne Rhône Alpes', '42'),
    (1, 'Auvergne Rhône Alpes', '43'),
    (1, 'Auvergne Rhône Alpes', '63'),
    (1, 'Auvergne Rhône Alpes', '69'),
    (1, 'Auvergne Rhône Alpes', '73'),
    (1, 'Auvergne Rhône Alpes', '74'),
    (2, 'Bourgogne Franche Comté', '21'),
    (2, 'Bourgogne Franche Comté', '25'),
    (2, 'Bourgogne Franche Comté', '39'),
    (2, 'Bourgogne Franche Comté', '58'),
    (2, 'Bourgogne Franche Comté', '70'),
    (2, 'Bourgogne Franche Comté', '71'),
    (2, 'Bourgogne Franche Comté', '89'),
    (2, 'Bourgogne Franche Comté', '90'),
    (3, 'Bretagne', '22'),
    (3, 'Bretagne', '29'),
    (3, 'Bretagne', '35'),
    (3, 'Bretagne', '56'),
    (4, 'Centre Val de Loire', '18'),
    (4, 'Centre Val de Loire', '28'),
    (4, 'Centre Val de Loire', '36'),
    (4, 'Centre Val de Loire', '37'),
    (4, 'Centre Val de Loire', '41'),
    (4, 'Centre Val de Loire', '45'),
    (5, 'Corse', '02'),
    (6, 'Grand Est', '08'),
    (6, 'Grand Est', '10'),
    (6, 'Grand Est', '51'),
    (6, 'Grand Est', '52'),
    (6, 'Grand Est', '54'),
    (6, 'Grand Est', '55'),
    (6, 'Grand Est', '57'),
    (6, 'Grand Est', '67'),
    (6, 'Grand Est', '68'),
    (6, 'Grand Est', '88'),
    (7, 'Hauts de France', '02'),
    (7, 'Hauts de France', '59'),
    (7, 'Hauts de France', '60'),
    (7, 'Hauts de France', '62'),
    (7, 'Hauts de France', '80'),
    (8, 'Ile de France', '75'),
    (8, 'Ile de France', '77'),
    (8, 'Ile de France', '78'),
    (8, 'Ile de France', '91'),
    (8, 'Ile de France', '92'),
    (8, 'Ile de France', '93'),
    (8, 'Ile de France', '94'),
    (8, 'Ile de France', '95'),
    (9, 'Normandie', '14'),
    (9, 'Normandie', '27'),
    (9, 'Normandie', '50'),
    (9, 'Normandie', '61'),
    (9, 'Normandie', '76'),
    (10, 'Nouvelle Aquitaine', '16'),
    (10, 'Nouvelle Aquitaine', '17'),
    (10, 'Nouvelle Aquitaine', '19'),
    (10, 'Nouvelle Aquitaine', '23'),
    (10, 'Nouvelle Aquitaine', '24'),
    (10, 'Nouvelle Aquitaine', '33'),
    (10, 'Nouvelle Aquitaine', '40'),
    (10, 'Nouvelle Aquitaine', '47'),
    (10, 'Nouvelle Aquitaine', '64'),
    (10, 'Nouvelle Aquitaine', '79'),
    (10, 'Nouvelle Aquitaine', '86'),
    (10, 'Nouvelle Aquitaine', '87'),
    (11, 'Occitanie', '09'),
    (11, 'Occitanie', '11'),
    (11, 'Occitanie', '12'),
    (11, 'Occitanie', '30'),
    (11, 'Occitanie', '31'),
    (11, 'Occitanie', '32'),
    (11, 'Occitanie', '34'),
    (11, 'Occitanie', '46'),
    (11, 'Occitanie', '48'),
    (11, 'Occitanie', '65'),
    (11, 'Occitanie', '66'),
    (11, 'Occitanie', '81'),
    (11, 'Occitanie', '82'),
    (12, 'Pays de la Loire', '44'),
    (12, 'Pays de la Loire', '45'),
    (12, 'Pays de la Loire', '53'),
    (12, 'Pays de la Loire', '72'),
    (12, 'Pays de la Loire', '85'),
    (13, 'Provence Alpes Cote d''azur', '04'),
    (13, 'Provence Alpes Cote d''azur', '05'),
    (13, 'Provence Alpes Cote d''azur', '06'),
    (13, 'Provence Alpes Cote d''azur', '13'),
    (13, 'Provence Alpes Cote d''azur', '83'),
    (13, 'Provence Alpes Cote d''azur', '84'),
    (14, 'Departements d''outre-mer', '97');

CREATE TABLE
    BOBO_CUSTOMER (    
        FIRSTNAME VARCHAR(20),
        LASTNAME VARCHAR(20),
        GENDER VARCHAR(1),
        EMAIL VARCHAR(50),
        BIRTHDATE VARCHAR(10),
        PHONE VARCHAR(14),
        ADRESS VARCHAR(50),
        ZIPCODE VARCHAR(5),
        REGION VARCHAR(25),
        COUNTRY VARCHAR(20),
        IBAN VARCHAR(34),
        MARITAL VARCHAR(8),
        TOWN VARCHAR(30),
        CODE_SECU BIGINT
    );