-- Based on https://www.hackerrank.com/challenges/the-report

CREATE DATABASE gradesReport;

USE gradesReport;

CREATE TABLE students 
(
	id INTEGER,
    name VARCHAR(100),
    marks INTEGER
);

CREATE TABLE grades 
(
	grade INTEGER,
    min_mark INTEGER,
    max_mark INTEGER
);

INSERT INTO gradesReport.students (id, name, marks) VALUES 	
(1,'Ju',88),
(2,'Sa',68),
(3,'M',99),
(4,'Sc',78),
(5,'A',63),
(6,'Ja',81);

INSERT INTO gradesReport.grades (grade, min_mark, max_mark) VALUES 	
(1,0,9),
(2,10,19),
(3,20,29),
(4,30,39),
(5,40,49),
(6,50,59),
(7,60,69),
(8,70,79),
(9,80,89),
(10,90,100);

(
	SELECT s.name, g.grade, s.marks
	FROM gradesReport.students s INNER JOIN gradesReport.grades g ON (s.marks BETWEEN g.min_mark AND g.max_mark)
    WHERE g.grade > 7
	ORDER BY g.grade DESC, s.name
)
UNION
(
	SELECT NULL as name, g.grade, s.marks
	FROM gradesReport.students s INNER JOIN gradesReport.grades g ON (s.marks BETWEEN g.min_mark AND g.max_mark)
    WHERE g.grade < 8
	ORDER BY g.grade DESC, s.marks
);

SELECT IF(g.grade < 8, NULL, s.name) as name, g.grade, s.marks
FROM gradesReport.students s INNER JOIN gradesReport.grades g ON (s.marks BETWEEN g.min_mark AND g.max_mark)
ORDER BY g.grade DESC, name, s.marks;
