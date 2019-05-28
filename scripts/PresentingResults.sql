-- ORDER BY, GROUP BY

-- ORDER BY 
SELECT 	p.firstName as FirstName, 
		p.lastName as LastName, 
        p.dateOfBirth as DateOfBirth
FROM contacts.person p 
ORDER BY p.firstName;

-- ORDER BY DESC
SELECT 	p.firstName as FirstName, 
		p.lastName as LastName, 
        p.dateOfBirth as DateOfBirth
FROM contacts.person p 
ORDER BY p.firstName DESC;

-- COUNT with *
SELECT COUNT(*) as NumberOfRows
FROM contacts.person p;

-- COUNT explicit - gives the same answer
SELECT COUNT(p.firstName) as NumberOfFirstNames
FROM contacts.person p;

-- COUNT with DISTINCT 
SELECT COUNT(DISTINCT p.firstName) as NumberOfFirstNames
FROM contacts.person p;

-- MAX
SELECT MAX(p.dateOfBirth) as maxDOB
FROM contacts.person p;

-- MIN
SELECT MIN(p.dateOfBirth) as minDOB
FROM contacts.person p;

-- AVG - average
SELECT AVG(p.dateOfBirth) as minDOB
FROM contacts.person p;

-- SUM - just as an example, doesn't make so much sense
SELECT SUM(p.dateOfBirth) as sumDOB
FROM contacts.person p;

-- SUM with DISTINCT - just as an example, doesn't make so much sense
SELECT SUM(DISTINCT p.dateOfBirth) as sumDOB
FROM contacts.person p;

-- GROUP BY 
SELECT p.firstName, COUNT(p.firstName) as numFirstNames
FROM contacts.person p
GROUP BY p.firstName;

-- GROUP BY HAVING
SELECT p.firstName as FirstName, COUNT(p.firstName) as NumInstancesFirstName
FROM contacts.person p
GROUP BY p.firstName
HAVING NumInstancesFirstName > 1;
