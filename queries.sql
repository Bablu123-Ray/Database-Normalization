-- VERIFICATION QUERY --
-- This joins all normalized tables to reconstruct original data --

SELECT 
    s.StudentID, s.Name, s.Email, s.Major, 
    m.Advisor, 
    c.CourseID, c.CourseTitle, c.Credits, 
    e.Grade, c.Building, c.Room
FROM Students s
JOIN Majors m ON s.Major = m.Major
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID;
