--****PLEASE ENTER YOUR DETAILS BELOW****
--Q4-mau-plsql.sql
--Student ID: 29506751
--Student Name: Shreya Kathuriya
--Tutorial No:   01

/* Comments for your marker:

*/

/* (i) Create a trigger
*/
/*Please copy your trigger code and any other necessary SQL statements after this line*/
CREATE OR REPLACE TRIGGER check_min_payment BEFORE
    INSERT ON sale
    FOR EACH ROW
DECLARE
    input_min_price NUMBER(7);
BEGIN
    SELECT
        round((to_number(artwork_minpayment) * 100) /(100 -(
            SELECT
                gallery_sale_percent
            FROM
                gallery
            WHERE
                gallery_id = 1
        ) + 20),
              0)
    INTO input_min_price
    FROM
             artwork a
        JOIN aw_status s ON a.artist_code = s.artist_code
                            AND a.artwork_no = s.artwork_no * 100;

    IF :new.sale_price < input_min_price THEN
        raise_application_error(-20000, 'Selling price should be higher');
    END IF;

END;

/

-- Test Harness
--set echo on
-- Prior state
SELECT
    *
FROM
    sale;

SELECT
    *
FROM
    artwork;

-- Test trigger 

INSERT INTO artwork VALUES (
    5,
    1,
    'illusions',
    2000,
    TO_DATE('01/09/2019', 'DD/MM/YYYY')
);

INSERT INTO sale VALUES (
    99999,
    TO_DATE('01/01/1900', 'DD/MM/YYYY'),
    0,
    1,
    1
);
-- Post state
SELECT
    *
FROM
    sale;

SELECT
    *
FROM
    artwork;

-- Undo changes
ROLLBACK;
--set echo off;

/* (ii) Create trigger/s 
*/
/*Please copy your trigger code and any other necessary SQL statements after this line*/

SELECT
    *
FROM
    sale;

INSERT INTO sale VALUES (
    99999,
    TO_DATE('01/01/1900', 'DD/MM/YYYY'),
    0,
    1,
    1
);
/* display after value*/
SELECT
    *
FROM
    sale;
/* closes transaction*/
ROLLBACK;


/* (ii) Create trigger/s 
*/
/*Please copy your trigger code and any other necessary SQL statements after this line*/
CREATE OR REPLACE TRIGGER resorl_check BEFORE
    INSERT ON artwork
    FOR EACH ROW
DECLARE
    artwork_count NUMBER(7);
BEGIN
    SELECT
        COUNT(aws.aws_action)
    INTO artwork_count
    FROM
             aw_status aws
        JOIN artwork aw ON aws.artist_code = aw.artist_code
                           AND aws.artwork_no = aws.artwork_no
    WHERE
            aw.artist_code = :new.artist_code
        AND aw.artwork_no = :new.artwork_no
        AND aws.aws_action = 'S';

    IF artwork_count > 0 THEN
        raise_application_error(-20000, 'Artwork has already been sold');
    END IF;
END;

/

/* Test Harness*/
/* display before value*/
SELECT
    *
FROM
    artwork;

INSERT INTO artwork VALUES (
    1,
    8,
    'Nation',
    900000.00,
TO_DATE('01/09/2019', 'DD/MM/YYYY')
);
/* display after value*/
SELECT
    *
FROM
    artwork;
/* closes transaction*/
ROLLBACK;