-- IMPORTANT: Run CreateDbAndTables.sql and Test_Populate.sql first

/**********************************************************************
 PART 1: QUERYING INFORMATION - SELECT, DISTINCT, WHERE, AND, OR, LIKE, IN, IS NULL, IS NOT NULL */

-- Not related to a table
SELECT 'Hello','World'; -- to return results that weren't necessarily in the DB
SELECT 'Hello' as FirstWord,'World' as SecondWord; -- to return results that weren't necessarily in the DB

USE contacts; -- changing to current scheme "contacts"

-- Basic selects, aliases, DISTINCT
SELECT p.firstName, p.lastName FROM contacts.person p; -- using alias for person "p"
SELECT p.firstName as FirstName, p.lastName as LastName FROM contacts.person p; -- using alias "as"
SELECT DISTINCT p.firstName as FirstName FROM contacts.person p; -- getting only DISTINCT first names
SELECT DISTINCT p.firstName as FirstName, p.lastName as LastName FROM contacts.person p; -- getting only DISTINCT first names

-- Selects with WHERE
SELECT 	p.firstName as FirstName, 
		p.lastName as LastName, 
        p.dateOfBirth as DateOfBirth
FROM contacts.person p 
WHERE p.firstName = 'First1';

-- Using WHERE with AND
SELECT 	p.firstName as FirstName, 
		p.lastName as LastName, 
        p.dateOfBirth as DateOfBirth
FROM contacts.person p 
WHERE p.firstName = 'First1' AND p.dateOfBirth > '1980-01-01';

-- Using WHERE with OR
SELECT 	p.firstName as FirstName, 
		p.lastName as LastName, 
        p.dateOfBirth as DateOfBirth
FROM contacts.person p 
WHERE p.firstName = 'First1' OR p.firstName = 'First2';

-- Using WHERE with BETWEEN
SELECT 	p.firstName as FirstName, 
		p.lastName as LastName, 
        p.dateOfBirth as DateOfBirth
FROM contacts.person p 
WHERE p.firstName BETWEEN 'First1' AND 'First2';

-- Using WHERE with LIKE and % wildcard
SELECT 	p.firstName as FirstName, 
		p.lastName as LastName, 
        p.dateOfBirth as DateOfBirth
FROM contacts.person p 
WHERE p.firstName LIKE '%1';

-- Using WHERE with IN
SELECT 	p.firstName as FirstName, 
		p.lastName as LastName, 
        p.dateOfBirth as DateOfBirth
FROM contacts.person p 
WHERE p.firstName IN ('First1','First2');

-- Using WHERE with IS NULL
SELECT 	p.firstName as FirstName, 
		p.lastName as LastName, 
        p.dateOfBirth as DateOfBirth
FROM contacts.person p 
WHERE p.dateOfBirth IS NULL;

-- Using WHERE with IS NOT NULL
SELECT 	p.firstName as FirstName, 
		p.lastName as LastName, 
        p.dateOfBirth as DateOfBirth
FROM contacts.person p 
WHERE p.dateOfBirth IS NOT NULL;


/**********************************************************************
 PART 2: Presenting results - ORDER BY, GROUP BY, HAVING, COUNT, MAX, MIN, AVG, SUM */

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



/**********************************************************************
 PART 3: Joins INNER, OUTER LEFT etc.*/
 
 -- bad CROSS JOIN - Don't do
SELECT p.firstName as FirstName, p.LastName as LastName, e.emailAddr as Email
FROM contacts.person p, contacts.emailaddr e;

-- INNER JOIN
SELECT p.firstName as FirstName, p.LastName as LastName, e.emailAddr as Email
FROM contacts.person p INNER JOIN contacts.emailaddr e
ON p.id = e.person_id;

-- LEFT OUTER JOIN - add rows on the left that don't have values on the right
SELECT p.firstName as FirstName, p.LastName as LastName, e.emailAddr as Email
FROM contacts.person p LEFT OUTER JOIN contacts.emailaddr e
ON p.id = e.person_id;
 


/**********************************************************************
 PART 4: INSERT, UPDATE, DELETE */

-- regular INSERT - not all fields
INSERT INTO 
	contacts.person (firstName, lastName, dateOfBirth) 
    VALUES ('F1','L1','1990-01-01');

INSERT INTO 
	contacts.person (firstName, lastName) 
    VALUES ('F2','L2');

-- INSERT with number
INSERT INTO 
	contacts.person (firstName, lastName, studentId) 
    VALUES ('F3','L3', 100);
    
-- INSERT with NULL
INSERT INTO 
	contacts.person (firstName, lastName, dateOfBirth) 
    VALUES ('F4','L4',NULL);

INSERT INTO 
	contacts.person (firstName, lastName, studentId) 
    VALUES ('F5','L5',NULL);

INSERT INTO 
	contacts.person (firstName, lastName, studentId) 
    VALUES ('F6','L6', 100);
    
-- bulk INSERT
INSERT INTO 
	contacts.person (firstName, lastName) 
    VALUES 	('F10','L10'),
			('F11','L11'),
            ('F12','L12')
    ;
    
-- UPDATE
UPDATE contacts.person p
	SET p.firstName = 'F12_Changed'
    WHERE p.firstName = 'F12';

-- UPDATE multiple columns
UPDATE contacts.person p
	SET p.firstName = 'F12_2_Changed',
		p.LastName = 'F12_2_Changed'
    WHERE p.firstName = 'F12_Changed';    

-- DELETE FROM
DELETE FROM contacts.person
	WHERE firstName = 'F11';