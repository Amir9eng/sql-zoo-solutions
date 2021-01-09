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



