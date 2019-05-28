-- ORDER BY, GROUP BY

-- ORDER BY 
SELECT 	p.firstName as FirstName, 
		p.lastName as LastName, 
        p.dateOfBirth as DateOfBirth
FROM contacts.person p 
ORDER BY p.firstName;

