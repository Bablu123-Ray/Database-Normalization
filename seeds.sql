-- INSERT SAMPLE DATA --

INSERT INTO Majors VALUES ('CS', 'Dr. Smith');
INSERT INTO Majors VALUES ('Physics', 'Dr. Lee');

INSERT INTO Students VALUES ('S101', 'Alice', 'alice@uni.edu', 'CS');
INSERT INTO Students VALUES ('S102', 'Bob', 'bob@uni.edu', 'CS');
INSERT INTO Students VALUES ('S103', 'Carol', 'carol@uni.edu', 'Physics');

INSERT INTO Courses VALUES ('CS301', 'Algorithms', 4, 'Science', '205');
INSERT INTO Courses VALUES ('MATH201', 'Linear Algebra', 3, 'Math Wing', '101');
INSERT INTO Courses VALUES ('PHYS101', 'Mechanics', 4, 'Science', '301');

INSERT INTO Enrollments VALUES ('S101', 'CS301', 'A');
INSERT INTO Enrollments VALUES ('S101', 'MATH201', 'B');
INSERT INTO Enrollments VALUES ('S102', 'CS301', 'C');
INSERT INTO Enrollments VALUES ('S103', 'PHYS101', 'A');
