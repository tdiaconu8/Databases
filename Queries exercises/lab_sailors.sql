--Sailors who’ve reserved at least one boat

SELECT DISTINCT name 
FROM sailors
JOIN reserves on sailors.sid = reserves.sid;


--Sailors who’ve reserved a red or a green boat 

SELECT name 
from sailors 
WHERE sid in (SELECT sid from reserves JOIN boats ON reserves.bid = boats.bid WHERE boats.color = 'red' OR boats.color = 'green');


--Sailors who’ve reserved a black and a brown boat

SELECT name FROM sailors
JOIN
(SELECT DISTINCT A.s1 as sid, A.color as c1, B.color as c2 FROM
(SELECT sid as s1, color from reserves JOIN boats on reserves.bid = boats.bid WHERE boats.color = 'black') as A,
(SELECT sid AS s2, color from reserves JOIN boats on reserves.bid = boats.bid WHERE boats.color = 'brown') as B) as C
ON sailors.sid = C.sid;


--For each black boat, find the number of reservations for this boat 
SELECT name, COUNT(NAME) from boats
JOIN reserves ON boats.bid = reserves.bid
where color = 'black'
GROUP BY name;


--Find name and age of the oldest sailor(s)

SELECT name, age from sailors where age = (SELECT MAX(age) from sailors);


--Find age of the youngest sailor with age >= 18, for each rating with at least 2 such sailors 

SELECT name, age from sailors 
WHERE rating IN (SELECT rating from (SELECT * from sailors where age >=18) as A
group BY rating HAVING COUNT(rating) >=2)
ORDER BY age
LIMIT 1;


--Find age of the youngest sailor with age >= 18, for each rating with at least 2 sailors between 18 and 60 

SELECT name, age from sailors 
WHERE rating IN (SELECT rating from (SELECT * from sailors where age >=18 AND age <=60) as A
group BY rating HAVING COUNT(rating) >=2)
ORDER BY age
LIMIT 1;


--Find age of the youngest sailor with age > 18, for each rating with at least 2 sailors (of any age) 

SELECT name, age, rating from sailors 
WHERE rating IN (SELECT rating from (SELECT * from sailors) as A
group BY rating HAVING COUNT(rating) >=2)
HAVING age > 18
ORDER BY age
LIMIT 1;


--Find those ratings for which the average age is the minimum over all ratings 

SELECT rating, AVG(age)
from sailors 
group by rating
ORDER by AVG(age)
LIMIT 1;


--Find sailors who’ve reserved all boats 

SELECT name from sailors
join 
(SELECT sid, count(DISTINCT bid) 
from reserves 
group by sid
HAVING COUNT(DISTINCT bid) = (SELECT COUNT(DISTINCT bid) from boats)) as A 
ON sailors.sid = A.sid