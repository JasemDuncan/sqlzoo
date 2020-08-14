--1--
SELECT COUNT(*) FROM stops
--2--
SELECT id FROM stops WHERE name ='Craiglockhart'
--3--
SELECT id, name FROM stops JOIN  route ON id=stop WHERE company='LRT'AND num='4'
--4--
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*)>1
--5--
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop=149
--6--
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name='London Road'
--7--
SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Haymarket' AND stopb.name='Leith'
--8--
SELECT a.company, a.num FROM route a, route aa, stops s, stops ss
WHERE a.num=aa.num AND a.company=aa.company
AND a.stop=s.id AND aa.stop=ss.id
AND s.name='Craiglockhart'
AND ss.name='Tollcross'
--9--
SELECT DISTINCT ss.name, aa.company,aa.num FROM route a, route aa, stops s, stops ss
WHERE a.num=aa.num 
AND a.company=aa.company
AND a.stop=s.id
AND aa.stop=ss.id
AND s.name='Craiglockhart'
--10--
SELECT a.num, a.company, stops.name, c.num, c.company FROM route a 
JOIN route b ON a.company=b.company AND a.num=b.num
JOIN stops ON stops.id=a.stop
JOIN route c ON stops.id=c.stop
JOIN route d ON c.company=d.company AND c.num=d.num
WHERE b.stop =(SELECT id FROM stops WHERE name= 'Craiglockhart')
AND   d.stop =(select id from stops where name= 'Lochend')