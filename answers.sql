1

-----

Select all fields for all brands in the brands table.

The result set for this query should be every record in the brands table.

-----


SELECT * FROM brands;


==========
2

-----

Select all fields for all car models made by Pontiac in the 
models table. 

The result set should be:
  id   | year  | brand_name |    name
-------+-------+------------+------------
    25 |  1961 | Pontiac    | Tempest
    27 |  1962 | Pontiac    | Grand Prix
    36 |  1963 | Pontiac    | Grand Prix
    42 |  1964 | Pontiac    | GTO
    43 |  1964 | Pontiac    | LeMans
    44 |  1964 | Pontiac    | Bonneville
    45 |  1964 | Pontiac    | Grand Prix
(7 rows)


-----


SELECT * FROM models WHERE brand_name = 'Pontiac';


==========
3

-----

Select the brand name and model name for all models made in 
1964 from the models table. 

The result set should be:
 brand_name |    name
------------+-------------
 Chevrolet  | Corvette
 Ford       | Mustang
 Ford       | Galaxie
 Pontiac    | GTO
 Pontiac    | LeMans
 Pontiac    | Bonneville
 Pontiac    | Grand Prix
 Plymouth   | Fury
 Studebaker | Avanti
 Austin     | Mini Cooper
 (10 rows)
 

-----


SELECT brand_name, name FROM models WHERE year = '1964';


==========
4

-----

Select the model name, brand name, and headquarters for 
the Ford Mustang from the models and brands tables.

The result set should be:
  name   | brand_name | headquarters
---------+------------+--------------
 Mustang | Ford       | Dearborn, MI
 (1 rows)


-----


select models.name, models.brand_name, headquarters from models join brands on brands.name = models.brand_name WHERE models.name = 'Mustang'; 


==========
5

-----

Select all rows for the three oldest brands from the brands
table.

The result set should be:
  id   |    name    | founded |    headquarters     | discontinued
-------+------------+---------+---------------------+--------------
    10 | Studebaker |    1852 | South Bend, Indiana |         1967
    13 | Rambler    |    1901 | Kenosha, Washington |         1969
     6 | Cadillac   |    1902 | New York City, NY   |
(3 rows)


-----


select * from brands order by founded asc limit 3;


==========
6

-----

Count the Ford models in the database The output should be a 
number.

The result set should be:
   count
------------
          6
(1 rows)


-----


select count(*) from models, brands where brands.name = 'Ford' and models.brand_name = 'Ford';


==========
7

-----

Select the name of any and all car brands that are not 
discontinued.

The result set should be:
   name
-----------
 Ford
 Chrysler
 Chevrolet
 Cadillac
 BMW
 Buick
 Tesla
(7 rows)


-----


select name from brands where discontinued is null;


==========
9

-----

Select the brand, name, and year the model's brand was 
founded for all of the models from 1960. Include row(s)
for model(s) even if their brand(s) are not in the brands table.

Note that in the result set, the year the brand was founded should be NULL if
the brand is not in the brands table.

So, the result set should be:
   name   | brand_name | founded
----------+------------+---------
 Corvette | Chevrolet  |    1911
 Corvair  | Chevrolet  |    1911
 Rockette | Fairthorpe |    1954
 Fillmore | Fillmore   |
(4 rows)


-----


select models.name, brand_name, founded from models full join brands on brands.name = models.brand_name where year = 1960;


==========
10

-----

Modify the query so that it shows all brands that are 
not discontinued regardless of whether they have any models in the models table.
The correct output should not include records for Fillmore and Outback, but should
show information about Tesla, a brand with no models in the models table.

-----


SELECT b.name,
         b.founded,
         m.name
  FROM brands AS b
    LEFT JOIN models AS m
      ON m.brand_name = b.name
  WHERE b.discontinued IS NULL;


==========
11

-----

Modify the query so it only selects models whose brands ARE in the brands table.
So, we shouldn't see models who brands aren't in the brands table (a.k.a. Fillmore,
Outback) nor should we see information about brands who don't have any models in 
the models table (a.k.a. Tesla).

-----


SELECT m.name,
         m.brand_name,
         b.founded
  FROM models AS m
INNER JOIN brands as b
ON b.name = m.brand_name;


==========
12

-----

Modify the query so that it only selects brands that do NOT have any
models in the models table.

The correct result set is:

 name  | founded
-------+---------
 Tesla |    2003
(1 rows)

-----


SELECT b.name,
         founded
  FROM brands AS b
    LEFT JOIN models AS m
      ON b.name = m.brand_name
WHERE m.name is null;




-- ************ISSUES WITH QUESTION 8 AND QUESTION 13 FROM SQL QUIZ*****************
-- HAVING ISSUES WITH QUESTION 8 ON SQL QUIZ - QUERY RESULTS LOOK CORRECT HOWEVER ALL 
-- ID COLUMNS ARE OFF BY 1. (EVEN THOUGH I HAVEN'T MODIFIED THE TABLE).

-- QUESTION 8 Task: Select everything from rows 15-24 of the models table in 
-- alphabetical order by name. The result set should have 10 records:


-- THIS IS THE CLOSEST I CAN GET TO THE QUESTION 8 ANSWER:
-- Select * from models order by name asc offset 13 limit 10;





-- ALSO HAVING ISSUES WITH QUESTION 13 ON SQL QUIZ- QUERY RESULTS LOOK CORRECT HOWEVER THE
-- PONTIAC GTO ROW IS OUT OF ORDER.


-- QUESTION 13:
-- The query below shows some brand information about each model 
-- in the models table whose brand has been discontinued.

--   SELECT b.name,
--          m.name,
--          m.year,
--          b.discontinued
--   FROM models AS m
--     LEFT JOIN brands AS b
--       ON m.brand_name = b.name
--   WHERE b.discontinued IS NOT NULL
--   ORDER BY b.name, m.name, m.year;

-- Task: Modify the query to add another field to the results that gives 
-- the number of years from the year of the model until the brand becomes 
-- discontinued.

-- Display this new field with the name years_until_brand_discontinued. The correct
-- result set is:


-- THIS IS THE CLOSEST I CAN GET TO THE QUESTION 13 ANSWER:
-- select b.name, 
-- m.name,
-- m.year,
-- b.discontinued,
-- b.discontinued - m.year as years_until_brand_discontinued
-- FROM models AS m 
-- LEFT JOIN brands as b 
-- ON m.brand_name = b.name
-- WHERE b.discontinued IS NOT NULL
-- ORDER BY b.name, m.name, m.year;





