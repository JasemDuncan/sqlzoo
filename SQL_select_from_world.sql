--1--
SELECT name, continent, population FROM world
--2--
SELECT name FROM world WHERE population >= 200000000
--3--
SELECT name, gdp/population FROM world WHERE population>=200000000
--4--
SELECT name, population/1000000 FROM world WHERE continent ='South America'
--5--
SELECT name, population FROM world WHERE name in ('France', 'Germany', 'Italy')
--6--
SELECT name FROM world WHERE name like '%United%'
--7--
SELECT name, population, area FROM world WHERE area >=3000000 or population>=250000000
--8--
SELECT name, population, area FROM world WHERE (area >=3000000 and population<250000000) or (area<3000000 and population>250000000)
--9--
SELECT name,ROUND(population/1000000,2),ROUND( gdp/1000000000,2) FROM world WHERE continent ='South America'
--10--
SELECT name,ROUND( gdp/population,-3) FROM world WHERE gdp>=1000000000000
--11--
SELECT name,capital  FROM world WHERE LENGTH(name)=LENGTH(capital)
--12--
 SELECT name,  capital FROM world WHERE left(name,1)  = left(capital,1) AND name<>capital
 --13--
 SELECT name   FROM world WHERE name LIKE '%a%' AND name LIKE '%e%' AND name like '%i%' AND name like '%o%' AND name like '%u%' AND name not like '% %'