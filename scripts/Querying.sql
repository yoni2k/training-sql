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
