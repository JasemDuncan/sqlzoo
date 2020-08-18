--1--
SELECT id, title
 FROM movie
 WHERE yr=1962
 --2--
 SELECT yr
 FROM movie
 WHERE title='Citizen Kane'
 --3--
 SELECT id, title,yr
 FROM movie
WHERE title like '%Star Trek%'
Order by yr
--4--
SELECT id
 FROM actor
WHERE name='Glenn Close'
--5--
SELECT id
 FROM movie
WHERE title='Casablanca'
--6--
SELECT a.name
 FROM movie m 
JOIN casting c ON m.id=c.movieid
JOIN actor a ON a.id=c.actorid
WHERE movieid=11768
--7--
SELECT a.name
 FROM movie m 
JOIN casting c ON m.id=c.movieid
JOIN actor a ON a.id=c.actorid
WHERE title='Alien'
--8--
SELECT m.title
 FROM movie m 
JOIN casting c ON m.id=c.movieid
JOIN actor a ON a.id=c.actorid
WHERE a.name='Harrison Ford'
--9--
SELECT m.title
 FROM movie m 
JOIN casting c ON m.id=c.movieid
JOIN actor a ON a.id=c.actorid
WHERE a.name='Harrison Ford'
AND c.ord<>1
--10--
SELECT m.title, name
 FROM movie m 
JOIN casting c ON m.id=c.movieid
JOIN actor a ON a.id=c.actorid
WHERE m.yr=1962 AND c.ord=1
--11--
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2
--12--
SELECT title,name FROM casting c JOIN movie m ON c.movieid=m.id
JOIN actor a ON a.id=c.actorid
WHERE movieid IN (
  SELECT movieid FROM casting 
  WHERE actorid IN (select id FROM actor WHERE name='Julie Andrews'))
and ord=1
--13--
SELECT a.name 
FROM actor a JOIN casting c ON c.actorid=a.id
GROUP BY a.name
HAVING SUM(case ord when 1 then 1 else 0 end )>14
ORDER BY name
--14--
SELECT m.title, COUNT(c.actorid) as actor FROM movie m JOIN casting c ON m.id=c.movieid
WHERE m.yr=1978
GROUP BY m.title
order by actor desc,m.title
--15--
SELECT a.name 
from actor a JOIN casting c ON c.actorid=a.id
WHERE movieid IN(SELECT movieid FROM casting
WHERE actorid=(select id FROM actor WHERE name='Art Garfunkel'))
AND name<>'Art Garfunkel'