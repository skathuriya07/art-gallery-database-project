--****PLEASE ENTER YOUR DETAILS BELOW****
--Q3-mau-mods.sql
--Student ID: 29506751
--Student Name: Shreya Kathuriya
--Tutorial No:   01

/* Comments for your marker:




*/


/*
3(i) Changes to live database 1
*/
--PLEASE PLACE REQUIRED SQL STATEMENTS FOR THIS PART HERE


ALTER TABLE customer
    ADD no_of_purchases NUMBER(4);
    

COMMENT ON COLUMN customer.no_of_purchases IS
    'column to represent the number of purchases made by a customer';
    
UPDATE customer c
SET no_of_purchases = (
    SELECT COUNT(customer_id)
    FROM sale s
    WHERE c.customer_id = s.customer_id
);
COMMIT;



/*
3(ii) Changes to live database 2
*/
--PLEASE PLACE REQUIRED SQL STATEMENTS FOR THIS PART HERE
DROP TABLE exhibition CASCADE CONSTRAINTS;


CREATE TABLE exhibition (
    exhibition_code       NUMBER(6) NOT NULL,
    exhibition_name     VARCHAR2(50) NOT NULL,
    exhibition_theme       CHAR(1) NOT NULL,
    artist_code     NUMBER(4) NOT NULL,
    artist_fname        VARCHAR2(20) NOT NULL,
    artist_lname        VARCHAR2(20) NOT NULL,
    total_number_of_artworks  NUMBER(3) NOT NULL,
    exhibition_start_day             DATE    NOT NULL,
    exhibition_end_day          DATE    NOT NULL,
     gallery_id             NUMBER(3) NOT NULL
);


COMMENT ON COLUMN exhibition.exhibition_code IS
    'exhibition''s unique identifying number';

COMMENT ON COLUMN exhibition.exhibition_name IS
    'exhibition''s  name';

COMMENT ON COLUMN exhibition.exhibition_theme IS
    'theme of exhibition';

COMMENT ON COLUMN exhibition.artist_code IS
    'exhibition''s artist code if there is artist';

COMMENT ON COLUMN exhibition.artist_fname IS
    'exhibition''s artwork"s artist first name';

COMMENT ON COLUMN exhibition.artist_lname IS
    'exhibition''s artwork"s artist last name';

COMMENT ON COLUMN exhibition.total_number_of_artworks IS
    'total number of artworks displayed in exhibition ';

COMMENT ON COLUMN exhibition.exhibition_start_day IS
    'exhibition''s start day';

COMMENT ON COLUMN exhibition.exhibition_end_day IS
    'exhibition''s end day';

COMMENT ON COLUMN exhibition.gallery_id IS
    'gallery where exhibition is hosted at';

ALTER TABLE exhibition
    ADD CONSTRAINT number_of_artworks_check CHECK (total_number_of_artworks > 0);


ALTER TABLE exhibition
    ADD CONSTRAINT exhibition_theme_check CHECK (exhibition_theme IN ( 'A','M','O' ) );

ALTER TABLE exhibition ADD CONSTRAINT exhibition_code_pk PRIMARY KEY ( exhibition_code );

ALTER TABLE exhibition
    ADD CONSTRAINT exhibition_uniq UNIQUE ( exhibition_name,
                                         exhibition_theme );

ALTER TABLE exhibition
    ADD CONSTRAINT exhibition_gallery_fk FOREIGN KEY (gallery_id )
        REFERENCES gallery (gallery_id );




-- exhibition gall 5, start date: 18/03/2020, end date : 18/04/2020
insert into exhibition
   VALUES(100 , 'Fantastic History: The Video Art of Sameness', 'A', 18,
    (select artist_gname from artist where artist_code = 18),
    (select artist_fname from artist where artist_code = 18),
    (select
        count(*) 
        from aw_status
        where aws_action = 'G' and gallery_id = 5  and artist_code = 18),
    
      TO_DATE('18/03/2020','DD/MM/YYYY') , TO_DATE('18/04/2020','DD/MM/YYYY'),5
   );

ALTER TABLE aw_display
    ADD exhibition_code NUMBER(6);

ALTER TABLE aw_display
    ADD CONSTRAINT exhibition_display_fk FOREIGN KEY (exhibition_code )
        REFERENCES exhibition (exhibition_code );

COMMENT ON COLUMN aw_display.exhibition_code IS
    'non mandatory value of exhibition is a display is happening in an exhibition';      

insert into aw_display
   values( display_seq.NEXTVAL, 18,  3,  TO_DATE('18/03/2020','DD/MM/YYYY') , TO_DATE('18/04/2020','DD/MM/YYYY'),5,100);

insert into aw_display
   values( display_seq.NEXTVAL, 18,  4,  TO_DATE('18/03/2020','DD/MM/YYYY') , TO_DATE('18/04/2020','DD/MM/YYYY'),5,100);
COMMIT;



