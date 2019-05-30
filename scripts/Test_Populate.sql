USE contacts;
INSERT INTO contacts.person (firstName, lastName, dateOfBirth) VALUES 	('First1', 'Last1', '1980-01-01'), 
																		('First2', 'Last2', '1980-01-01'),
																		('First3', 'Last3', '1980-01-01'),
																		('First1', 'Last1', '1981-01-01'),
																		('First1', 'Last4', '1982-01-01'),
																		('First4', 'Last1', '1980-01-01');
-- No dateOfBirth
INSERT INTO contacts.person (firstName, lastName) VALUES ('FirstNoDOB', 'LastNoDOB');

INSERT INTO contacts.emailaddr (person_id, emailAddr) VALUES 	(1, 'p1_email1.com'),
																(1, 'p1_email2.com'),
																(2, 'p2_email1.com');

-- Different length first names
INSERT INTO contacts.person (firstName, lastName) VALUES 
		('123456789_','L10'),
        ('123456789*','L10'),
        ('123456789','L9'),
        ('12345678','L8'),
        ('1234567','L7'),
        ('123456','L6'),
        ('12345','L5'),
        ('1234','L4'),
        ('123','L3'),
        ('12','L2'),
        ('1','L1'),
        ('a','L1');