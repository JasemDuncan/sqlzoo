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