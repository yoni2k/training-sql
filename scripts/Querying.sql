SELECT 'Hello','World'; -- to return results that weren't necessarily in the DB
SELECT 'Hello' as FirstWord,'World' as SecondWord; -- to return results that weren't necessarily in the DB

USE contacts; -- changing to current scheme "contacts"
SELECT p.firstName, p.lastName FROM contacts.person p; -- using alias for person "p"
SELECT p.firstName as FirstName, p.lastName as LastName FROM contacts.person p; -- using alias "as"
SELECT DISTINCT p.firstName as FirstName FROM contacts.person p; -- getting only DISTINCT first names
SELECT DISTINCT p.firstName as FirstName, p.lastName as LastName FROM contacts.person p; -- getting only DISTINCT first names

