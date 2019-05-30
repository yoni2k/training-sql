-- Based on https://www.hackerrank.com/challenges/the-company

CREATE DATABASE companies;

USE companies;

CREATE TABLE company 
(
	company_code varchar(100),
    founder varchar(100)
);

CREATE TABLE lead_manager 
(
	lead_manager_code varchar(100),
    company_code varchar(100)
);

CREATE TABLE senior_manager 
(
	senior_manager_code varchar(100),
	lead_manager_code varchar(100),
    company_code varchar(100)
);

CREATE TABLE manager 
(
	manager_code varchar(100),
	senior_manager_code varchar(100),
	lead_manager_code varchar(100),
    company_code varchar(100)
);

CREATE TABLE employee 
(
	employee_code varchar(100),
	manager_code varchar(100),
	senior_manager_code varchar(100),
	lead_manager_code varchar(100),
    company_code varchar(100)
);

INSERT INTO companies.company (company_code, founder) VALUES 	
('C1', 'Monika'),
('C2', 'Samantha');
INSERT INTO companies.lead_manager (lead_manager_code, company_code) VALUES 	
('LM1','C1'),
('LM2','C2');
INSERT INTO companies.senior_manager (senior_manager_code, lead_manager_code, company_code) VALUES 	
('SM1','LM1','C1'),
('SM2','LM1','C1'),
('SM3','LM2','C2');
INSERT INTO companies.manager (manager_code, senior_manager_code, lead_manager_code, company_code) VALUES 	
('M1','SM1','LM1','C1'),
('M2','SM3','LM2','C2'),
('M3','SM3','LM2','C2');
INSERT INTO companies.employee (employee_code, manager_code, senior_manager_code, lead_manager_code, company_code) VALUES 	
('E1','M1','SM1','LM1','C1'),
('E2','M1','SM1','LM1','C1'),
('E3','M2','SM3','LM2','C2'),
('E4','M3','SM3','LM2','C2');

-- [Question: print name of company, founder, and how many lead managers, senior managers, managers, and regular employees there are]
SELECT c.company_code, c.founder, COUNT(DISTINCT l.lead_manager_code), COUNT(DISTINCT s.senior_manager_code), COUNT(DISTINCT m.manager_code), COUNT(DISTINCT e.employee_code)
FROM    employee e
    RIGHT OUTER JOIN manager m ON m.manager_code = e.manager_code
	RIGHT OUTER JOIN senior_manager s ON 	s.senior_manager_code = m.senior_manager_code
	RIGHT OUTER JOIN lead_manager l ON 	l.lead_manager_code = s.lead_manager_code
	RIGHT OUTER JOIN company c ON 		c.company_code = l.company_code 
	GROUP BY c.company_code


