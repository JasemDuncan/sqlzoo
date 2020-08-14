--1--
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')
--2--
SELECT name FROM world
  WHERE gdp/population >
     (SELECT gdp/population FROM world
      WHERE name='United Kingdom') AND continent='Europe'
--3--
SELECT name, continent FROM world
  WHERE continent in
     (SELECT continent FROM world WHERE name ='Argentina' or name ='Australia')
ORDER BY name
--4--
SELECT name, continent FROM world
  WHERE population >
     (SELECT population FROM world WHERE name ='Canada')
  AND population<
     (SELECT population FROM world WHERE name ='Poland')
ORDER BY name
--5--
SELECT name,CONCAT(ROUND( population/(select population from world where name='Germany') *100,0),'%') FROM world
WHERE continent='Europe'
--6--
SELECT name
  FROM world
 WHERE gdp > ALL(SELECT gdp
                           FROM world
                          WHERE continent='Europe' and gdp>0)
--7--
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y WHERE y.continent=x.continent and area>0)
--8--
SELECT continent, name FROM world x
WHERE name =(SELECT y.name FROM world y WHERE y.continent=x.continent 
ORDER BY name LIMIT 1)
--9--
SELECT name, continent, population FROM world x
WHERE 25000000>=ALL
(SELECT y.population FROM world y WHERE x.continent=y.continent and population>0)
--10--
SELECT name, continent FROM world x
WHERE x.population >=ALL
(SELECT y.population*3 FROM world y 
WHERE x.continent=y.continent and population>0 AND x.name!=y.name)