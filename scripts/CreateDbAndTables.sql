-- DROP TABLE contacts.person;
-- DROP TABLE contacts.emailAddr;
CREATE DATABASE contacts;
USE contacts;
CREATE TABLE person
(	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	firstName VARCHAR(55) NOT NULL,
    lastName VARCHAR(55) NOT NULL
);
CREATE TABLE emailAddr 
(	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT, 
	person_id INTEGER NOT NULL,
    emailAddr VARCHAR(55) NOT NULL
);
CREATE TABLE phoneNumber
(	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	person_id INTEGER NOT NULL,
    phoneNumber VARCHAR(20) NOT NULL
);
ALTER TABLE emailAddr
ADD CONSTRAINT FK_emailAddr_person_id 
	FOREIGN KEY (person_id) REFERENCES person(id);
ALTER TABLE phoneNumber
ADD CONSTRAINT FK_phoneNumber_person_id 
	FOREIGN KEY (person_id) REFERENCES person(id);					