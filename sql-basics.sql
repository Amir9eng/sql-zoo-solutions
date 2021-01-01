1.
The example uses a WHERE clause to show the population of 'France'. Note that strings (pieces of text that are data) should be in 'single quotes';

Modify it to show the population of Germany

SELECT population FROM world
  WHERE name = 'Germany'


Correct answer
  population
  83149300


2.
Checking a list The word IN allows us to check if an item is in a list. The example shows the name and population for the countries 'Brazil', 'Russia', 'India' and 'China'.

Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.

SELECT name, population FROM world
  WHERE name IN ( 'Sweden', 'Norway', 'Denmark');


  Correct answer
name	population
Denmark	5822763
Norway	5367580
Sweden	10338368



3.
Which countries are not too small and not too big? BETWEEN allows range checking (range specified is inclusive of boundary values). The example below shows countries with an area of 250,000-300,000 sq. km. Modify it to show the country and the area for countries with an area between 200,000 and 250,000.

SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000


  Correct answer
name	area
Belarus	207600
Ghana	238533
Guinea	245857
Guyana	214969
Laos	236800
Romania	238391
Uganda	241550
United Kingdom	242900