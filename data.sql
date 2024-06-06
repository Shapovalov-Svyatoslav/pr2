USE university
GO

INSERT Students
VALUES (1, 'Oleg', 'Shevchenko', 'sheva@gmail.com', 'sheva', 5)

INSERT Subjects
VALUES (1, 'English', 'English')

INSERT Teachers
VALUES (1, 'Anastasiya', 'Tarasenko', 'tarasenko@gmail.com', 'tarasenko')

INSERT Grades
VALUES (1, 1, 1, '2024-06-05', 3)

SELECT AVG(Grade) AS average
FROM Grades
WHERE SubjectId = 1
	AND Date BETWEEN '2024-06-01' AND '2024-06-10'

SELECT StudentId, SubjectId, AVG(Grade) as average
FROM Grades
GROUP BY StudentId, SubjectId

SELECT *
FROM Schedule 
WHERE Weekday = 'friday'
