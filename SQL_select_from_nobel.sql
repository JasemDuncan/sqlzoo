--1--
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950
 --2--
 SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'
--3--
SELECT yr, subject
  FROM nobel
 WHERE winner='Albert Einstein'
 --4--
 SELECT winner
  FROM nobel
 WHERE yr>=2000 and subject ='Peace'
 --5--
 SELECT yr,subject,winner
  FROM nobel
 WHERE (yr between '1980' and 1989) and subject ='Literature'
 --6--
 SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Barack Obama',
                  'Jimmy Carter')
--7--
SELECT winner FROM nobel WHERE winner like 'John%'
--8--
SELECT yr, subject, winner FROM nobel
 WHERE (subject ='Physics' and yr =1980) or (subject='Chemistry' and yr=1984)
 --9--
 SELECT yr, subject, winner FROM nobel
 WHERE subject NOT IN('Chemistry','Medicine') and yr =1980
 --10--
 SELECT yr, subject, winner FROM nobel WHERE (subject ='Medicine' and yr <1910) or (subject='Literature' and yr>2003)
 --11--
 SELECT yr, subject, winner FROM nobel WHERE winner ='PETER GRÜNBERG'
 --12--
 SELECT yr, subject, winner FROM nobel WHERE winner like 'EUGENE O%'
 --13--
 SELECT winner, yr, subject FROM nobel WHERE winner like 'Sir %'
 --14--
 SELECT winner, subject
 FROM nobel
 WHERE yr=1984
 ORDER BY subject in ('Chemistry','Physics'), subject, winner
