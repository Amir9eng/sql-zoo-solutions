1.
Read the notes about this table. Observe the result of running this SQL command to show the name, continent and population of all countries.

SELECT name, continent, population FROM world




Large Countries
2.
How to use WHERE to filter records. Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros.

SELECT name
  FROM world
 WHERE population >=  200000000

 Correct answer
name
Brazil
China
India
Indonesia
Nigeria
Pakistan
United States




Per capita GDP
3.
Give the name and the per capita GDP for those countries with a population of at least 200 million.


SELECT name, gdp/population
from world
WHERE population >= 200000000


Correct answer
name	gdp/population
Brazil	9721.37
China	8724.3064
India	1891.7811
Indonesia	3804.7723
Nigeria	1822.8862
Pakistan	1377.0363
United States	59121.1921



4.
Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions.


SELECT name, population/1000000 
from world 
where continent = 'South America'


Correct answer
name	population/10..
Argentina	44.9387
Bolivia	11.4699
Brazil	211.4426
Chile	19.1072
Colombia	49.3957
Ecuador	17.4729
Guyana	0.7828
Paraguay	7.2527
Peru	32.1314
Saint Vincent and the Grenadines	0.1106
Suriname	0.5814
Uruguay	3.5186
Venezuela	32.2195




France, Germany, Italy
5.
Show the name and population for France, Germany, Italy


SELECT name, population
from world
WHERE name IN  ('France', 'Germany', 'Italy')


Correct answer
name	population
France	67076000
Germany	83149300
Italy	60238522



United
6.
Show the countries which have a name that includes the word 'United'

SELECT name 
from world 
WHERE name LIKE '%United%'


Correct answer
name
United Arab Emirates
United Kingdom
United States



Two ways to be big
7.
Two ways to be big: A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million.

Show the countries that are big by area or big by population. Show name, population and area.

SELECT name, population,area 
from world
WHERE population > 250000000 OR area > 3000000


Correct answer
name	population	area
Australia	25690023	7692024
Brazil	211442625	8515767
Canada	38007166	9984670
China	1402378640	9596961
India	1361503224	3166414
Indonesia	266911900	1904569
Russia	146745098	17125242
United States	329583916	9826675




One or the other (but not both)
8.
Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.

Australia has a big area but a small population, it should be included.
Indonesia has a big population but a small area, it should be included.
China has a big population and big area, it should be excluded.
United Kingdom has a small population and a small area, it should be excluded.
SELECT name, population,area 
from world
WHERE (population > 250000000 AND area < 3000000)
OR (population < 250000000 AND area > 3000000)



Correct answer
name	population	area
Australia	25690023	7692024
Brazil	211442625	8515767
Canada	38007166	9984670
Indonesia	266911900	1904569
Russia	146745098	17125242



Rounding
9.
Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. Use the ROUND function to show the values to two decimal places.

For South America show population in millions and GDP in billions both to 2 decimal places.
Millions and billions
SELECT name, ROUND(population/1000000,2), ROUND(gdp/1000000000,2)
from world
WHERE continent = 'South America'




Correct answer
name	ROUND(populat..	ROUND(gdp/100..
Argentina	44.94	637.49
Bolivia	11.47	37.51
Brazil	211.44	2055.51
Chile	19.11	277.08
Colombia	49.4	309.19
Ecuador	17.47	104.3
Guyana	0.78	3.09
Paraguay	7.25	29.44
Peru	32.13	211.4
Saint Vincent and the Grenadines	0.11	0.73
Suriname	0.58	5.21
Uruguay	3.52	59.18
Venezuela	32.22	255.09




Name and capital have the same length
11.
Greece has capital Athens.

Each of the strings 'Greece', and 'Athens' has 6 characters.

Show the name and capital where the name and the capital have the same number of characters.

You can use the LENGTH function to find the number of characters in a string
SELECT name,capital
from world
where LENGTH(name) = LENGTH(capital)


Correct answer
name	capital
Algeria	Algiers
Angola	Luanda
Armenia	Yerevan
Botswana	Gaborone
Cameroon	Yaoundé
Canada	Ottowa
Djibouti	Djibouti
Egypt	Cairo
Estonia	Tallinn
Fiji	Suva
Gambia	Banjul
Georgia	Tbilisi
Ghana	Accra
Greece	Athens
Luxembourg	Luxembourg
Mauritania	Nouakchott
Peru	Lima
Poland	Warsaw
Russia	Moscow
Rwanda	Kigali
San Marino	San Marino
Singapore	Singapore
Taiwan	Taipei
Turkey	Ankara
Zambia	Lusaka




Matching name and capital
12.
The capital of Sweden is Stockholm. Both words start with the letter 'S'.

Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
You can use the function LEFT to isolate the first character.
You can use <> as the NOT EQUALS operator.

SELECT name, capital
FROM world
WHERE LEFT(name,1) = LEFT(capital,1)
AND name <> capital


Correct answer
name	capital
Algeria	Algiers
Andorra	Andorra la Vella
Barbados	Bridgetown
Belize	Belmopan
Brazil	Brasília
Brunei	Bandar Seri Begawan
Burundi	Bujumbura
Guatemala	Guatemala City
Guyana	Georgetown
Kuwait	Kuwait City
Maldives	Malé
Marshall Islands	Majuro
Mexico	Mexico City
Monaco	Monaco-Ville
Mozambique	Maputo
Niger	Niamey
Panama	Panama City
Papua New Guinea	Port Moresby
Sao Tomé and Príncipe	São Tomé
South Korea	Seoul
Sri Lanka	Sri Jayawardenepura Kotte
Sweden	Stockholm
Taiwan	Taipei
Tunisia	Tunis



All the vowels
13.
Equatorial Guinea and Dominican Republic have all of the vowels (a e i o u) in the name. They don't count because they have more than one word in the name.

Find the country that has all the vowels and no spaces in its name.

You can use the phrase name NOT LIKE '%a%' to exclude characters from your results.
The query shown misses countries like Bahamas and Belarus because they contain at least one 'a'


SELECT name
   FROM world
WHERE name LIKE '%a%'
  AND name LIKE '%e%'
  AND name LIKE '%i%'
  AND name LIKE '%o%'
  AND name LIKE '%u%'
  AND name NOT LIKE '% %'


Correct answer
name
Mozambique