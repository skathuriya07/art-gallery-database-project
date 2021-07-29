--****PLEASE ENTER YOUR DETAILS BELOW****
--Q1b-mau-dm.sql
--Student ID: 29506751
--Student Name: Shreya Kathuriya
--Tutorial No:   01

/* Comments for your marker:


*/

/*
1b(i) Create a sequence 
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) FOR THIS PART HERE
DROP SEQUENCE status_seq;

DROP SEQUENCE display_seq;

DROP SEQUENCE sale_seq;
-- creating sequence for AW_STATUS
CREATE SEQUENCE status_seq START WITH 300;
-- creating sequence for AW_DISPLAY
CREATE SEQUENCE display_seq START WITH 300;
-- creating sequence for SALE
CREATE SEQUENCE sale_seq
START WITH 300;

COMMIT;

/*
1b(ii) Take the necessary steps in the database to record data.
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) FOR THIS PART HERE
INSERT INTO artwork VALUES (
    17,
    1,
    'Saint Catherine of Siena',
    500000.00,
    TO_DATE('22/10/2020 10:00', 'DD/MM/YYYY HH24:MI')
);


INSERT INTO aw_status (
    aws_id,
    artist_code,
    artwork_no,
    aws_date_time,
    aws_action
) VALUES (
    status_seq.NEXTVAL,
    17,
    1,
    TO_DATE('22/10/2020 10:00', 'DD/MM/YYYY HH:MI AM'),
    'W'
);

/*
1b(iii) Take the necessary steps in the database to record changes. 
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) FOR THIS PART HERE
-- (a)
-- updating artwork status of being in transit to gallery with phone number 0413432569
INSERT INTO aw_status VALUES (
    status_seq.NEXTVAL,
    17,
    1,
    TO_DATE('22/10/2020 11:00', 'DD/MM/YYYY HH:MI AM'),
    'T',
    (
        SELECT
            gallery_id
        FROM
            gallery
        WHERE
            gallery_phone = 0413432569
    )
);

-- (b)
-- updating artwork status of being recieved by gallery after 3 hours and 15 minutes 
INSERT INTO aw_status VALUES (
    status_seq.NEXTVAL,
    17,
    1,
    (
        SELECT
            aws_date_time
        FROM
            aw_status
        WHERE
                artist_code = 17
            AND artwork_no = 1
            AND aws_action = 'T'
    ) + ( 1 / 24 * 3.25 ),
    'G',
    (
        SELECT
            gallery_id
        FROM
            gallery
        WHERE
            gallery_phone = 0413432569
    )
);


-- (c)
-- ) updating display since on the next day the gallery places the artwork on display 
INSERT INTO aw_display (
    aw_display_id,
    artist_code,
    artwork_no,
    aw_display_start_date,
    gallery_id
) VALUES (
    display_seq.NEXTVAL,
    17,
    1,
    (
        SELECT
            aws_date_time
        FROM
            aw_status
        WHERE
                artist_code = 17
            AND artwork_no = 1
            AND aws_action = 'G'
    ) + 1,
    (
        SELECT
            gallery_id
        FROM
            gallery
        WHERE
            gallery_phone = 0413432569
    )
);

/*
1b(iv) Take the necessary steps in the database to record changes. 
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) FOR THIS PART HERE
--   2:30 PM on the 5th day since this artwork has been displayed sold to customer 1 for $850,000
INSERT INTO sale VALUES (
    sale_seq.NEXTVAL,
    (
        SELECT
            aws_date_time
        FROM
            aw_status
        WHERE
                artist_code = 17
            AND artwork_no = 1
            AND aws_action = 'G'
    ) + 5 + ( 1 / 24 * 0.25 ),
    850000,
    1,
    (
        SELECT
            aw_display_id
        FROM
            aw_display
        WHERE
                artist_code = 17
            AND artwork_no = 1
    )
);


-- updating time of selling
/*UPDATE SALE
    SET sale_date = TO_DATE('02:30', 'HH:MI PM')
WHERE aw_display_id = (SELECT aw_display_id FROM AW_DISPLAY WHERE 
                artist_code = 17 AND artwork_no = 1 );
COMMIT;
*/
-- updatind display end date
UPDATE aw_display
SET
    aw_display_end_date = (
        SELECT
            sale_date
        FROM
            sale
        WHERE
            aw_display_id = (
                SELECT
                    aw_display_id
                FROM
                    aw_display
                WHERE
                        artist_code = 17
                    AND artwork_no = 1
            )
    )
WHERE
        artist_code = 17
    AND artwork_no = 1;


-- INSERTING STATUS: SOLD
INSERT INTO aw_status VALUES (
    status_seq.NEXTVAL,
    17,
    1,
    (
        SELECT
            sale_date
        FROM
            sale
        WHERE
            aw_display_id = (
                SELECT
                    aw_display_id
                FROM
                    aw_display
                WHERE
                        artist_code = 17
                    AND artwork_no = 1
            )
    ),
    'S',
    (
        SELECT
            gallery_id
        FROM
            gallery
        WHERE
            gallery_phone = 0413432569
    )
);

COMMIT;