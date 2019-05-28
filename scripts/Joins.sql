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