Bigger than Russia
1.
List each country name where the population is larger than that of 'Russia'.

world(name, continent, area, population, gdp)

SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')



Correct answer
name
Bangladesh
Brazil
China
India
Indonesia
Nigeria
Pakistan
United States



Richer than UK
2.
Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.

Per Capita GDP
SELECT name from world 
where continent = 'Europe'
AND gdp/population >
(SELECT gdp/population FROM world
      WHERE name='United Kingdom')


Correct answer
name
Andorra
Austria
Belgium
Denmark
Finland
Germany
Iceland
Ireland
Liechtenstein
Luxembourg
Monaco
Netherlands
Norway
San Marino
Sweden
Switzerland




Neighbours of Argentina and Australia
3.

List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.

SELECT name,continent FROM world
WHERE continent IN (SELECT continent FROM world
                      where name IN ('Argentina', 'Australia'))
ORDER BY name





Correct answer
name	continent
Argentina	South America
Australia	Oceania
Bolivia	South America
Brazil	South America
Chile	South America
Colombia	South America
Ecuador	South America
Fiji	Oceania
Guyana	South America
Kiribati	Oceania
Marshall Islands	Oceania
Micronesia, Federated States of	Oceania
Nauru	Oceania
New Zealand	Oceania
Palau	Oceania
Papua New Guinea	Oceania
Paraguay	South America
Peru	South America
Saint Vincent and the Grenadines	South America
Samoa	Oceania
Solomon Islands	Oceania
Suriname	South America
Tonga	Oceania
Tuvalu	Oceania
Uruguay	South America
Vanuatu	Oceania
Venezuela	South America



Between Canada and Poland
4.
Which country has a population that is more than Canada but less than Poland? Show the name and the population.

SELECT name, population FROM world
WHERE population > (SELECT population FROM world 
 WHERE name= 'Canada') AND population <
(SELECT population FROM world WHERE name='Poland')



Correct answer
name	population




Percentages of Germany
5.
Germany (population 80 million) has the largest population of the countries in Europe. Austria (population 8.5 million) has 11% of the population of Germany.

Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.

The format should be Name, Percentage for example:

name	percentage
Albania	3%
Andorra	0%
Austria	11%
...	...
Decimal places
Percent symbol %
You can use the function CONCAT to add the percentage symbol.
SELECT name, CONCAT(ROUND(100*population/(SELECT population FROM world WHERE name='Germany'))
, '%')
FROM world 
WHERE continent= 'Europe'




Correct answer
name	CONCAT(ROUND(..
Albania	3%
Andorra	0%
Austria	11%
Belarus	11%
Belgium	14%
Bosnia and Herzegovina	4%
Bulgaria	8%
Croatia	5%
Czech Republic	13%
Denmark	7%
Estonia	2%
Finland	7%
France	81%
Germany	100%
Greece	13%
Hungary	12%
Iceland	0%
Ireland	6%
Italy	72%
Kazakhstan	22%
Latvia	2%
Liechtenstein	0%
Lithuania	3%
Luxembourg	1%
Malta	1%
Moldova	3%
Monaco	0%
Montenegro	1%
Netherlands	21%
North Macedonia	2%
Norway	6%
Poland	46%
Portugal	12%
Romania	23%
San Marino	0%
Serbia	8%
Slovakia	7%
Slovenia	3%
Spain	57%
Sweden	12%
Switzerland	10%
Ukraine	50%
United Kingdom	80%
Vatican City	0%





Bigger than every country in Europe
6.
Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)

SELECT name FROM world 
  WHERE gdp > ALL(SELECT gdp FROM world 
                     WHERE continent = 'Europe' AND gdp>0)
 


Correct answer
name
China
Japan
United States



Largest in each continent
7.
Find the largest country (by area) in each continent, show the continent, the name and the area:

SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)




Correct answer
continent	name	area
Africa	Algeria	2381741
Oceania	Australia	7692024
South America	Brazil	8515767
North America	Canada	9984670
Asia	China	9596961
Caribbean	Cuba	109884
Europe	Kazakhstan	2724900
Eurasia	Russia	17125242





First country of each continent (alphabetically)
8.
List each continent and the name of the country that comes first alphabetically.

SELECT continent, name
  FROM world x
  WHERE name <= ALL(SELECT name FROM world y 
  	                WHERE y.continent = x.continent)




Correct answer
continent	name
Africa	Algeria
Asia	Afghanistan
Caribbean	Antigua and Barbuda
Eurasia	Armenia
Europe	Albania
North America	Belize
Oceania	Australia
South America	Argentina





Difficult Questions That Utilize Techniques Not Covered In Prior Sections
9.
Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.

SELECT name, continent, population FROM world x
WHERE 25000000 >= ALL(SELECT population FROM world y 
                      WHERE y.continent = x.continent
                      AND population > 0)  





Correct answer
name	continent	population
Antigua and Barbuda	Caribbean	96453
Bahamas	Caribbean	385340
Barbados	Caribbean	287025
Cuba	Caribbean	11209628
Dominica	Caribbean	71808
Dominican Republic	Caribbean	10358320
Grenada	Caribbean	112003
Haiti	Caribbean	11577779
Jamaica	Caribbean	2726667
Saint Lucia	Caribbean	178696
Trinidad and Tobago	Caribbean	1363985







10.
Some countries have populations more than three times that of any of their neighbours (in the same continent). Give the countries and continents.

SELECT name, continent 
  FROM world x
  WHERE population > ALL(SELECT population*3 FROM world y
                        WHERE y.continent = x.continent
                        AND population > 0
                        AND y.name != x.name)




Correct answer
name	continent
Brazil	South America
Russia	Eurasia
