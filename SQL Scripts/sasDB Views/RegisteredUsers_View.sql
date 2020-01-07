/*
THIS VIEW WAS CREATED TO GET STATISTICS OF ALL USE ENTITIES IN  THE SYSTEM FOR MANAGEMENT PURPOSES.
*/

CREATE VIEW [SystemStatus] AS
SELECT count(UGRecordID) as 'No of Undergraduates',count(PRecordID0) as 'No of Postgraduates', Count(PRecordID) as 'No of Properties', Count(SPLRecordID) as 'No of Single Land Owners', Count(MPLRecordID) as 'No of Multiple Property Land Owners',
FROM UndergraduateStudents, PostgraduateStudents, Property, SinglePropertyLandlord, MultiplePropertyLandlord
LEFT JOIN UndergraduateStudents.UGRecordID ON PostgraduateStudents.PRecordID
LEFT JOIN PostgraduateStudents.PRecordID ON Property.PRecordID
LEFT JOIN Property.PRecordID ON SinglePropertyLandlord.SPLRecordID
LEFT JOIN SinglePropertyLandlord.SPLRecordID ON MultiplePropertyLandlord.MPLRecordID;


