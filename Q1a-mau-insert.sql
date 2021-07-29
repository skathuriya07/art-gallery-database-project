--****PLEASE ENTER YOUR DETAILS BELOW****
--Q1a-mau-insert.sql
--Student ID: 29506751
--Student Name: Shreya Kathuriya
--Tutorial No:   01

/* Comments for your marker:*/


/*
1(a) Load selected tables with your own additional test data
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) FOR THIS PART HERE


/* Inserting Artwork 1 for artist Martainn Jenteau with artist_code 1*/
INSERT INTO ARTWORK 
    VALUES (1, 1, 'Possesion Of Emotions', 2000.00, TO_DATE('02/01/2019','DD/MM/YYYY'));

/* Inserting Artwork 2 for artist Nutley Wade with artist_code 21*/
INSERT INTO ARTWORK 
    VALUES (21, 1, 'Black', 1700000.00, TO_DATE('13/01/2019','DD/MM/YYYY'));

/* Inserting Artwork 3 for artist Bard Harli with artist_code 18*/
INSERT INTO ARTWORK 
    VALUES (18, 2, 'Girl on the Train', 1888888.00, TO_DATE('23/01/2020','DD/MM/YYYY'));

/* Inserting Artwork 4 for artist Nicklinson Monic with artist_code 13*/
INSERT INTO ARTWORK 
    VALUES (13, 1, 'Universe', 188888.00, TO_DATE('25/02/2019','DD/MM/YYYY'));

/* Inserting Artwork 5 for artist Dugget Adrianna with artist_code 20*/
INSERT INTO ARTWORK 
    VALUES (20, 1, 'Greens and Pollution', 500000.00, TO_DATE('02/03/2019','DD/MM/YYYY'));

/* Inserting Artwork 6 for artist Jessi Allward with artist_code 3*/
INSERT INTO ARTWORK 
    VALUES (3, 1, 'Dragon Fire', 40000.00, TO_DATE('25/04/2019','DD/MM/YYYY'));

/* Inserting Artwork 7 for artist Doette with artist_code 10*/
INSERT INTO ARTWORK 
    VALUES (10, 1, 'Yellow Fire', 170000.00, TO_DATE('27/04/2019','DD/MM/YYYY'));

/* Inserting Artwork 8 for artist Champerlen Marlee with artist_code 9*/
INSERT INTO ARTWORK 
    VALUES (9, 1, 'Winds', 71000.00, TO_DATE('02/05/2019','DD/MM/YYYY'));

/* Inserting Artwork 9 for artist Jenteau MArtian with artist_code 1*/
INSERT INTO ARTWORK 
    VALUES (1, 2, 'Word In Eyes', 14000.00, TO_DATE('07/06/2020','DD/MM/YYYY'));

/* Inserting Artwork 10 for artist Aaronsohn Maggi with artist_code 15*/
INSERT INTO ARTWORK 
    VALUES (15, 1, 'Zoo', 72000.00, TO_DATE('13/06/2020','DD/MM/YYYY'));

/* Inserting Artwork 11 for artist Wildman Reeba with artist_code 8*/
INSERT INTO ARTWORK 
    VALUES (8, 1, 'Digital', 909000.00, TO_DATE('07/08/2019','DD/MM/YYYY'));

/* Inserting Artwork 12 for artist Grellis Kipp with artist_code 2*/
INSERT INTO ARTWORK 
    VALUES (2, 1, 'Work Life', 181000.00, TO_DATE('30/08/2019','DD/MM/YYYY'));

/* Inserting Artwork 13 for artist Nicklinson Monica with artist_code 13*/
INSERT INTO ARTWORK 
    VALUES (13, 2, 'Waters', 200000.00, TO_DATE('05/10/2019','DD/MM/YYYY'));

/* Inserting Artwork 14 for artist Bard Harli with artist_code 18*/
INSERT INTO ARTWORK 
    VALUES (18, 1, 'Red Green Blue', 200000.00, TO_DATE('05/11/2019','DD/MM/YYYY'));

/* Inserting Artwork 15 for artist Moisey Kilian with artist_code 12*/
INSERT INTO ARTWORK 
    VALUES (12, 1, 'Glass', 820000.00, TO_DATE('28/05/2020','DD/MM/YYYY'));

/* Inserting Artwork 16 for artist Moisey Kilian with artist_code 12*/
INSERT INTO ARTWORK 
    VALUES (1, 3, 'Rain', 574300.00, TO_DATE('18/06/2020','DD/MM/YYYY'));


/* Inserting AW_DISPLAYS

/* Inserting Display 1*/
INSERT INTO AW_DISPLAY
    VALUES (2312340, 1, 1, TO_DATE('15/01/2019','DD/MM/YYYY'), TO_DATE('02/02/2019','DD/MM/YYYY'),3);

/* Inserting Display 2*/
INSERT INTO AW_DISPLAY
    VALUES (0009786, 21, 1, TO_DATE('15/01/2019','DD/MM/YYYY'), TO_DATE('31/01/2019','DD/MM/YYYY'),3);

/* Inserting Display 3*/
INSERT INTO AW_DISPLAY
    VALUES (1029123, 3, 1, TO_DATE('05/05/2019','DD/MM/YYYY'), TO_DATE('29/05/2019','DD/MM/YYYY'),2);

/* Inserting Display 4*/
INSERT INTO AW_DISPLAY 
    VALUES (0065760, 10, 1, TO_DATE('05/05/2019','DD/MM/YYYY'), TO_DATE('07/05/2019','DD/MM/YYYY'),2);

/* Inserting Display 5*/
INSERT INTO AW_DISPLAY
    VALUES (0004212, 9, 1, TO_DATE('05/05/2019','DD/MM/YYYY'), TO_DATE('01/06/2019','DD/MM/YYYY'),2);

/* Inserting Display 6*/
INSERT INTO AW_DISPLAY 
    VALUES (1097843, 12, 1, TO_DATE('20/06/2020','DD/MM/YYYY'), TO_DATE('13/07/2020','DD/MM/YYYY'),5);

/* Inserting Display 7 */
INSERT INTO AW_DISPLAY 
    VALUES (0080112, 2, 1, TO_DATE('01/09/2019','DD/MM/YYYY'), TO_DATE('23/09/2019','DD/MM/YYYY'),2);

/* Inserting Display 8*/
INSERT INTO AW_DISPLAY 
    VALUES (0087112, 8, 1, TO_DATE('01/09/2019','DD/MM/YYYY'), TO_DATE('30/09/2019','DD/MM/YYYY'), 2);

/* Inserting Display 9*/
INSERT INTO AW_DISPLAY 
    VALUES (9738475, 18, 1, TO_DATE('07/11/2019','DD/MM/YYYY'), TO_DATE('07/11/2019','DD/MM/YYYY'),3);

/* Inserting Display 10*/
INSERT INTO AW_DISPLAY 
    VALUES (0874902, 15, 1, TO_DATE('20/06/2020','DD/MM/YYYY'), TO_DATE('27/06/2020','DD/MM/YYYY'),5);

/* Inserting Display 11*/
INSERT INTO AW_DISPLAY 
    VALUES (1007456, 1, 2, TO_DATE('20/06/2020','DD/MM/YYYY'), TO_DATE('30/06/2020','DD/MM/YYYY'), 5);

/* Inserting Display 12*/
INSERT INTO AW_DISPLAY (aw_display_id, artist_code, artwork_no, aw_display_start_date, gallery_id)
    VALUES (40001, 1, 3, TO_DATE('20/06/2020','DD/MM/YYYY'), 5);




-- sale 1 of artwork Black
INSERT INTO SALE
    VALUES(00098, TO_DATE('31/01/2019','DD/MM/YYYY'), 881500, 3, 9786);
    
-- sale 2 of artwork Possesion Of Emotions
INSERT INTO SALE
    VALUES(90872, TO_DATE('02/02/2019','DD/MM/YYYY'), 2150, 7, 2312340);

-- sale 3 of artwork Work Life
INSERT INTO SALE
    VALUES(10070, TO_DATE('23/09/2019','DD/MM/YYYY'), 199643, 5, 80112);

-- sale 4 of artwork Red Green Blue
INSERT INTO SALE
    VALUES(00560, TO_DATE('07/11/2019','DD/MM/YYYY'), 215000, 3, 9738475);

-- sale 5 of artwork Glass
INSERT INTO SALE
    VALUES(00657, TO_DATE('27/06/20','DD/MM/YYYY'), 79560, 1, 874902);


INSERT INTO AW_STATUS (aws_id, artist_code, artwork_no, aws_date_time, aws_action)
    VALUES(2210, 1,1, TO_DATE('29/01/2019','DD/MM/YYYY'), 'W');


INSERT INTO AW_STATUS 
    VALUES(2211,  1, 1, TO_DATE('31/01/2020','DD/MM/YYYY'), 'G', 3);

INSERT INTO AW_STATUS
    VALUES(2212, 1, 1, TO_DATE('02/02/2019','DD/MM/YYYY'),'S', 3);


INSERT INTO AW_STATUS (aws_id, artist_code, artwork_no, aws_date_time, aws_action)
    VALUES(00009, 21, 1, TO_DATE('13/01/2019','DD/MM/YYYY'), 'W');

INSERT INTO AW_STATUS 
    VALUES(00010, 21, 1, TO_DATE('14/01/2019','DD/MM/YYYY'), 'T', 3);

INSERT INTO AW_STATUS 
    VALUES(00011, 21, 1, TO_DATE('15/01/2019','DD/MM/YYYY'), 'G', 3);

INSERT INTO AW_STATUS
    VALUES(00012, 21, 1, TO_DATE('31/01/2019','DD/MM/YYYY'),'S', 3);

INSERT INTO AW_STATUS (aws_id, artist_code, artwork_no, aws_date_time, aws_action)
    VALUES(800, 18, 2, TO_DATE('23/01/2020','DD/MM/YYYY'), 'W');

INSERT INTO AW_STATUS 
    VALUES(00210, 21, 1, TO_DATE('14/01/2020','DD/MM/YYYY'), 'T', 3);


INSERT INTO AW_STATUS 
    VALUES(8811, 18, 2, TO_DATE('25/01/2020','DD/MM/YYYY'), 'T', 3);
COMMIT;

INSERT INTO AW_STATUS 
    VALUES(802, 18, 2, TO_DATE('27/01/2020','DD/MM/YYYY'), 'G', 3);
COMMIT;


INSERT INTO AW_STATUS (aws_id, artist_code, artwork_no, aws_date_time, aws_action)
    VALUES(2343, 13, 1, TO_DATE('25/02/2019','DD/MM/YYYY'),'W');
COMMIT;
INSERT INTO AW_STATUS (aws_id, artist_code, artwork_no, aws_date_time, aws_action)
    VALUES(2113, 13, 1, TO_DATE('25/03/2019','DD/MM/YYYY'),'R');
COMMIT;

INSERT INTO AW_STATUS (aws_id, artist_code, artwork_no, aws_date_time, aws_action)
    VALUES(400, 20, 1, TO_DATE('23/03/2019','DD/MM/YYYY'), 'W');
COMMIT;


INSERT INTO AW_STATUS 
    VALUES(501, 3, 1, TO_DATE('29/05/2019','DD/MM/YYYY'), 'G', 2);
COMMIT;

INSERT INTO AW_STATUS 
    VALUES(333, 10, 1, TO_DATE('07/05/2019','DD/MM/YYYY'), 'G', 5);
COMMIT;

INSERT INTO AW_STATUS 
    VALUES(1000, 9, 1, TO_DATE('01/06/2019','DD/MM/YYYY'), 'S', 2);
COMMIT;

INSERT INTO AW_STATUS 
    VALUES(90, 1, 2, TO_DATE('30/06/2020','DD/MM/YYYY'), 'G', 5);
COMMIT;

INSERT INTO AW_STATUS 
    VALUES(5753, 15, 1, TO_DATE('27/06/2020','DD/MM/YYYY'), 'G', 5);
COMMIT;

INSERT INTO AW_STATUS 
    VALUES(27524, 8, 1, TO_DATE('30/09/2019','DD/MM/YYYY'), 'G', 2);
COMMIT;

INSERT INTO AW_STATUS 
    VALUES(454, 2, 1, TO_DATE('23/09/2019','DD/MM/YYYY'), 'S', 2);
COMMIT;

INSERT INTO AW_STATUS 
    VALUES(3246, 13, 2, TO_DATE('05/10/2019','DD/MM/YYYY'), 'T', 1);
COMMIT;

INSERT INTO AW_STATUS 
    VALUES(345, 18, 1, TO_DATE('07/11/2019','DD/MM/YYYY'), 'S', 3);
COMMIT;

INSERT INTO AW_STATUS 
    VALUES(885, 12, 1, TO_DATE('13/07/2020','DD/MM/YYYY'), 'G', 5);
COMMIT;

INSERT INTO AW_STATUS 
    VALUES(323, 1, 3, TO_DATE('13/07/2020','DD/MM/YYYY'), 'G', 5);
COMMIT;

INSERT INTO ARTWORK 
    VALUES (9, 3, 'DROP', 5300.00, TO_DATE('18/03/2020','DD/MM/YYYY'));
COMMIT;

INSERT INTO AW_STATUS 
    VALUES(111, 9, 3, TO_DATE('23/07/2020','DD/MM/YYYY'), 'G', 5);
COMMIT;

INSERT INTO AW_STATUS (aws_id, artist_code, artwork_no, aws_date_time, aws_action)
    VALUES(11112, 9, 3, TO_DATE('25/07/2020','DD/MM/YYYY'),'R');
COMMIT;

INSERT INTO ARTWORK 
    VALUES (9, 4, 'DROPLET', 5300.00, TO_DATE('18/03/2020','DD/MM/YYYY'));
COMMIT;

INSERT INTO AW_STATUS 
    VALUES(3103, 9, 4, TO_DATE('18/03/2020','DD/MM/YYYY'), 'G', 5);
COMMIT;

INSERT INTO ARTWORK 
    VALUES (18,3, 'NATURAL BEAUTY', 5300.00, TO_DATE('18/03/2020','DD/MM/YYYY'));
COMMIT;
INSERT INTO AW_STATUS 
    VALUES(112, 18, 3, TO_DATE('18/03/2020','DD/MM/YYYY'), 'G', 5);
COMMIT;

INSERT INTO ARTWORK 
    VALUES (18, 4, 'RANDOM', 500300.00, TO_DATE('18/03/2020','DD/MM/YYYY'));
COMMIT;

INSERT INTO AW_STATUS 
    VALUES(1012, 18, 4, TO_DATE('18/03/2020','DD/MM/YYYY'), 'G', 5);
COMMIT;
