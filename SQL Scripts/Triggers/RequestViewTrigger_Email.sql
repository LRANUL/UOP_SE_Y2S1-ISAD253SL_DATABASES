/*
CREATES A TRIGGER WHEN A REQUEST IS MADE TO VIEW PROEPRTY EMAILSARE SENT ALERTING CUSTOMER SERVICE
AND LAND OWNER, WITH MENTIONING OF SELECTED PROPERTY, THIS MESSAGE CAN BE IMPROVED TO PROVIDE MORE DETAILS
BUT THIS MAY DEPEND ON THE PREFERENCE OF THE BUSINESS.
*/

CREATE TRIGGER RequestView on [RequestViewing]
AFTER INSERT 
AS
BEGIN
DECLARE 
@pPropertyID Char(8),
@scNationalInsuranceNumber_RequestedBy char(8),
@csEmployeeID char(8),
@LandOwner_NINO char(9),
@CSEmailAddress VARCHAR(50),
@CSName VARCHAR(20),
@LOEmailAddress VARCHAR(50);


SELECT @pPropertyID = ins.pPropertyID FROM INSERTED ins;
SELECT @scNationalInsuranceNumber_RequestedBy = ins.scNationalInsuranceNumber_RequestedBy FROM INSERTED ins;
SELECT @csEmployeeID = ins.csEmployeeID FROM INSERTED ins;
  

IF UPDATE(Sales)
BEGIN
		SET @CSEmailAddress = ( SELECT EmailAddress FROM CUSTOMER SERVICE WHERE EmployeeID = @csEmployeeID) ;
		SET @CSName = ( SELECT FirstName FROM CUSTOMER SERVICE WHERE EmployeeID = @csEmployeeID) ;
		SET @LandOwner_NINO = (SELECT lNationalInsuranceNumber FROM RegisterProperty WHERE pPropertyID = @pPropertyID;
		SET @LOEmailAddress =  (SELECT EmailAddress FROM LandlordContact WHERE NationalInsuranceNumber = @LandOwner_NINO;
      declare @msgbody varchar(max)=
		'<h1>SAS - Student Best Choice !</h1>'+
		'<p>Hello Sir/ Madam <br> Your registered property with us <strong>Property ID: '+@pPropertyID+'</strong>'+
		' has received a viewing request.</p>'+
		'<p>Our agent '+@CSName+' will contact you shortly to inform about student to you.</p>'+
		'</br><p>Thanks from SAS Team.</p>'
 -- Message body content for demostration of procedure only, doesn't not represent any type organisation body.
		  EXEC msdb.dbo.sp_send_dbmail
          @profile_name = 'SASMAIL',
          @recipients = @LOEmailAddress,
		  @copy_recipients = @CSEmailAddress,
          @subject = 'Viewing Request Property',
          @body = @msgbody,
		  @body_format = 'HTML' ;
END
END