/*
THIS VIEW WAS CREATED TO GET STATISTICS OF ALL USE ENTITIES IN  THE SYSTEM FOR MANAGEMENT PURPOSES.
*/

CREATE VIEW [StudentUniversities] AS
SELECT Count(PRecordID) as 'No of Postgraduates', Name as 'University'
FROM PostgraduateStudents,UniversityContact
JOIN 
UniversityContact
ON PostgraduateStudents.ucUniversityID_EnrolledTo = UniversityContact.UniversityID



