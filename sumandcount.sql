Total world population
1.
Show the total population of the world.

world(name, continent, area, population, gdp)
SELECT SUM(population)
FROM world



Correct answer
SUM(population)
7615648652




List of continents
2.
List all the continents - just once each.

SELECT DISTINCT continent 
FROM world




Correct answer
continent
Africa
Asia
Caribbean
Eurasia
Europe
North America
Oceania
South America



GDP of Africa
3.
Give the total GDP of Africa

SELECT SUM(gdp)
FROM world
where continent = 'Africa'




Correct answer
SUM(gdp)
1964824000000




Count the big countries
4.
How many countries have an area of at least 1000000

SELECT COUNT(name)
from world
where area >= 1000000



Correct answer
COUNT(name)
29




Baltic states population
5.
What is the total population of ('Estonia', 'Latvia', 'Lithuania')

SELECT SUM(population)
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania')



Correct answer
SUM(populatio..
6028631


Using GROUP BY and HAVING
You may want to look at these examples: Using GROUP BY and HAVING.

Counting the countries of each continent
6.
For each continent show the continent and number of countries.

SELECT continent, COUNT(name)
from world
GROUP BY continent



Correct answer
continent	COUNT(name)
Africa	53
Asia	47
Caribbean	11
Eurasia	2
Europe	44
North America	11
Oceania	14
South America	13




Counting big countries in each continent
7.
For each continent show the continent and number of countries with populations of at least 10 million.

SELECT continent, COUNT(name)
from world
WHERE population >= 10000000
GROUP BY continent



Correct answer
continent	COUNT(name)
Africa	31
Asia	28
Caribbean	3
Eurasia	1
Europe	15
North America	4
Oceania	1
South America	8




Counting big continents
8.
List the continents that have a total population of at least 100 million.

SELECT continent
from world
GROUP BY continent
HAVING SUM(population) >= 100000000



Correct answer
continent
Africa
Asia
Eurasia
Europe
North America
South America

