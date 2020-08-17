--1--
SELECT SUM(population) FROM world
--2--
select continent from world group by continent
--3--
select SUM(gdp) from world WHERE continent='africa'
--4--
select COUNT(name) from world WHERE area >= 1000000
--5--
select SUM(population) from world WHERE name in ('Estonia', 'Latvia', 'Lithuania')
--6--
select continent, COUNT(name) from world GROUP BY continent
--7--
select continent, COUNT(DISTINCT name) from world  
WHERE population >=10000000 
GROUP BY continent 
--8--
select continent from world  
GROUP BY continent 
HAVING SUM(population) >=100000000 
