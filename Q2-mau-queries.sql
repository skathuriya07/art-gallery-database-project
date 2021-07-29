--****PLEASE ENTER YOUR DETAILS BELOW****
--Q2-mau-queries.sql
--Student ID: 29506751
--Student Name: Shreya Kathuriya
--Tutorial No:   01

/* Comments for your marker */


/*
2(i) Query 1
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
/*List the artist code, artist full name, artwork number, artwork title, 
artist minimum payment and the number of days the artwork was held by MAU 
*/

SELECT
    lpad(to_char(w.artist_code),16,' ') as "Artist Code", 
    lpad(to_char(a.artist_gname), 16, ' ') || ' ' || a.artist_fname  AS "Artist Name" ,
    lpad(to_char(w.artwork_no), 16, ' ') as "Artwork No.",
    lpad(to_char(w.artwork_title),20,' ') as " Artwork Title",
    lpad('$',16,' ') || w.artwork_minpayment as "Artwork Min. Payment" , 
    lpad(to_char(ROUND(s.aws_date_time  - w.artwork_submitdate)), 28, ' ')  as "Number of Days with MAU"
FROM AW_STATUS s
     JOIN ARTWORK w ON s.artist_code = w.artist_code and s.artwork_no = w.artwork_no
    JOIN ARTIST a ON s.artist_code = a.artist_code
WHERE 
    aws_action LIKE '%R' and ROUND(s.aws_date_time  - w.artwork_submitdate) < 120
ORDER BY 
    w.artist_code;


/*
2(ii) Query 2
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
/* ​ List the artist code, artwork no, artwork title, gallery id, gallery name, 
display start date and number of days the artwork was on display for all MAU artworks 
that have completed their display and were on display in the gallery for less than 13 days.
The output must be ordered by artwork - for any given artwork the shortest period of display 
should be shown first.
Where an artwork has been displayed in different galleries 
for the same period this should be ordered by gallery id and display start date.
The column headings in your output should be renamed as Artist Code, Artwork No., 
Artwork Title, Gallery ID, Gallery Name, Display Start Date and Number of Days in Gallery.
*/

SELECT 
    d.artist_code AS "Artist Code",
    d.artwork_no AS "Artwork No.",
    artwork_title AS "Artwork Title",
    d.gallery_id AS "Gallery ID",
    g.gallery_name AS"Gallery Name",
    TO_CHAR(aw_display_start_date,'Dy dd Month yyyy') AS "Display Start Date",
    ROUND(aw_display_end_date - AW_display_start_date) AS "Number of Days in Gallery"
FROM AW_DISPLAY     d
    JOIN ARTWORK a ON d.artist_code = a.artist_code
    AND d.artwork_no = a.artwork_no
    JOIN GALLERY g ON d.gallery_id = g.gallery_id
WHERE aw_display_end_date IS NOT NULL
    AND ROUND(aw_display_end_date - aw_display_start_date) < 13
ORDER BY
      "Number of Days in Gallery", AW_display_start_date, g.gallery_id;


/*
2(iii) Query 3
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
/*
List the artist code, artwork number, artwork title and 
number of movements for those artworks which have moved to/from any gallery, 
i.e., in transit 
less than the average number of movements to/from any gallery by an artwork.
The output must be displayed in ascending format of number of movements. 

For those artworks with the same number of movements, display them by the artist code and artwork number in ascending format.

The column headings in your output should be renamed as Artist Code, Artwork No., Artwork Title and Number of Movements.

*/


    
SELECT
    s.artist_code as "Artist Code",
    s.artwork_no as "Artwork No.",
    a.artwork_title "Artwork Title",
    count(*) as "Number of Movements"
FROM
    AW_STATUS s
    JOIN ARTWORK a ON s.artist_code =a.artist_code AND s.artwork_no = a.artwork_no
WHERE 
    aws_action like '%T' 
GROUP BY 
      s.artist_code, s.artwork_no, a.artwork_title
HAVING
    count(aws_action) < ( select
                                avg(count(aws_action))
                        from    
                            AW_STATUS s
                            JOIN ARTWORK a ON s.artist_code =a.artist_code AND s.artwork_no = a.artwork_no
                        WHERE 
                             aws_action like '%T'
                        GROUP BY 
                            s.artist_code, s.artwork_no, a.artwork_title)
ORDER BY
    "Number of Movements", s.artist_code, s.artwork_no;



/*
2(iv) Query 4
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
/*
MAU would like the ability to quickly find out an estimated minimum selling price for all the unsold artworks for the five galleries 
(gallery ids 1 to 5) they currently deal with so they can prioritise their return in the case of competing gallery display requests.

For this display, list the artist code, artwork title and for

each gallery, the minimum selling price for the artwork title for the artist 
that MAU should be prepared to sell the artwork for, taking into account, the payment to the gallery as commission, 
payment to MAU as commission and the minimum payment to the artist requirements for all the unsold artworks. 
The estimated minimum selling price should be rounded up to the nearest dollar.

As an example, an artwork has been provided by an artist with an indicated minimum payment to the artist of $1400. 
This artwork is to be sold by a gallery with a 10% commission. An estimate of the minimum selling price must include 
the minimum payment to the artist, the gallery commission and the MAU commission (20%). Here since 30% is commissions, 
the $1400 must represent 70% of the sold price, so the estimated minimum selling price would need to be 
$2000 (artist payment $1400, gallery commission $200 and MAU commission $400).
The output must be displayed in ascending format by artist code and where there is more
han one artwork for an artist, display the result by artwork title in ascending format.
The column headings in your output should be renamed as Artist Code, Artwork Title and Min. Sale Price Est. 
(Gallery 1), Min. Sale Price Est. (Gallery 2), Min. Sale Price Est. (Gallery 3), Min. Sale Price Est. (Gallery 4) 
and Min. Sale Price Est. (Gallery 5). Your output must have the form shown below (only some rows shown). 
Your actual data may clearly be different from the data shown below.
*/


SELECT
  artist_code as "ARTIST_CODE", 
    artwork_title as "ARTWORK_TITLE",
    lpad(to_char('$' || round((to_number(artwork_minpayment) * 100)/ (100 - (select gallery_sale_percent from gallery where gallery_id = 1) + 20), 0)),30,' ') as "MIN. Sale Price Est. (Gallery 1)",
    lpad(to_char('$' || round((to_number(artwork_minpayment) * 100)/ (100 - (select gallery_sale_percent from gallery where gallery_id = 2) + 20), 0)),30,' ') as "MIN. Sale Price Est. (Gallery 2)",
    lpad(to_char('$' || round((to_number(artwork_minpayment) * 100)/ (100 - (select gallery_sale_percent from gallery where gallery_id = 3) + 20), 0)),30,' ') as "MIN. Sale Price Est. (Gallery 3)",
    lpad(to_char('$' || round((to_number(artwork_minpayment) * 100)/ (100 - (select gallery_sale_percent from gallery where gallery_id = 4) + 20), 0)),30,' ') as "MIN. Sale Price Est. (Gallery 4)",
    lpad(to_char('$' || round((to_number(artwork_minpayment) * 100)/ (100 - (select gallery_sale_percent from gallery where gallery_id = 5) + 20), 0)),30,' ') as "MIN. Sale Price Est. (Gallery 5)"

FROM
    artwork
MINUS
SELECT
    artist_code as "ARTIST_CODE", 
    artwork_title as "ARTWORK_TITLE",
    lpad(to_char('$' || round((to_number(artwork_minpayment) * 100)/ (100 - (select gallery_sale_percent from gallery where gallery_id = 1) + 20), 0)),30,' ') as "MIN. Sale Price Est. (Gallery 1)",
    lpad(to_char('$' || round((to_number(artwork_minpayment) * 100)/ (100 - (select gallery_sale_percent from gallery where gallery_id = 2) + 20), 0)),30,' ') as "MIN. Sale Price Est. (Gallery 2)",
    lpad(to_char('$' || round((to_number(artwork_minpayment) * 100)/ (100 - (select gallery_sale_percent from gallery where gallery_id = 3) + 20), 0)),30,' ') as "MIN. Sale Price Est. (Gallery 3)",
    lpad(to_char('$' || round((to_number(artwork_minpayment) * 100)/ (100 - (select gallery_sale_percent from gallery where gallery_id = 4) + 20), 0)),30,' ') as "MIN. Sale Price Est. (Gallery 4)",
    lpad(to_char('$' || round((to_number(artwork_minpayment) * 100)/ (100 - (select gallery_sale_percent from gallery where gallery_id = 5) + 20), 0)),30,' ') as "MIN. Sale Price Est. (Gallery 5)"

FROM
    artwork natural join aw_status
WHERE aws_action = 'S'
ORDER BY
    "ARTIST_CODE",
    "ARTWORK_TITLE";

/*
2(v) Query 5
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
/*
For each artwork sold, list the artist code, artist full name, artwork title, the gallery id for the gallery in which the work was sold, 
the sale price and the percentage that the artwork sold above the estimated minimum selling price. The estimated minimum selling price includes 
the commission payment to the gallery where it was sold, the commission payment to MAU and the minimum payment to the artist - see example part (iv).
As an example, assume an artwork which had an estimated minimum selling price of $2000 sold for $2500 - this would represent a sale at 25% above the minimum selling price.
The​ last row of the output​ should show the average (in the sixth column) of the percentage sold above the minimum selling price for all the sales.
The column headings in your output should be renamed as Artist Code, Artist Full Name, Artwork Title, Gallery ID, Sale Price and % Sold Above Min. Sell Price.
Your output must have the form shown below (some rows have been blurred)​.​ ​Your actual data will clearly be different from the data shown below.
*/



