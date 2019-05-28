USE contacts;
INSERT INTO contacts.person (firstName, lastName, dateOfBirth) VALUES ('First1', 'Last1', '1980-01-01');
INSERT INTO contacts.person (firstName, lastName, dateOfBirth) VALUES ('First2', 'Last2', '1980-01-01');
INSERT INTO contacts.person (firstName, lastName, dateOfBirth) VALUES ('First3', 'Last3', '1980-01-01');
INSERT INTO contacts.person (firstName, lastName, dateOfBirth) VALUES ('First1', 'Last1', '1981-01-01');
INSERT INTO contacts.person (firstName, lastName, dateOfBirth) VALUES ('First1', 'Last4', '1982-01-01');
INSERT INTO contacts.person (firstName, lastName, dateOfBirth) VALUES ('First4', 'Last1', '1980-01-01');

-- No dateOfBirth
INSERT INTO contacts.person (firstName, lastName) VALUES ('FirstNoDOB', 'LastNoDOB');

INSERT INTO contacts.emailaddr (person_id, emailAddr) VALUES (1, 'p1_email1.com');
INSERT INTO contacts.emailaddr (person_id, emailAddr) VALUES (1, 'p1_email2.com');
INSERT INTO contacts.emailaddr (person_id, emailAddr) VALUES (2, 'p2_email1.com');
