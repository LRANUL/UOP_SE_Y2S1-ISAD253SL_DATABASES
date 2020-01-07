/*
CREATES A TRIGGER WHEN A REQUEST IS MADE TO UPDATE A PASSWORD IN LOGIN TABLE
THIS WILL ALERT THE REGISTERED LAND OWNER JUST LIKE IT ALERTED THE STUDENT WITH A
QUICK EMAIL TO HIS/HER  ACCOUNT WITH REFERENCE DETAILS
NEW PASSWORD DETAILS CAN ALSO BE FORWARDED BUT FOR SECURITY REASONS THIS WAS NOT IMPLEMENTED.
*/

CREATE TRIGGER loPasswordUpdate on [SystemLogin]
AFTER Update
AS
BEGIN
DECLARE
@SystemLoginID Char(8),
@UserName varchar(8),
@Passwordhash Binary(64),
@LONationalInsuranceNumber varchar(9),
@StuEmailAddress VARCHAR(50);


SELECT @SystemLoginID = ins.SystemLoginID FROM INSERTED ins;
SELECT @Passwordhash = ins.Passwordhash FROM INSERTED ins;
SELECT @UserName = ins.UserName FROM INSERTED ins;


IF UPDATE(Passwordhash)
BEGIN
		SET @LONationalInsuranceNumber = ( SELECT lcNationalInsuranceNumber FROM MultiplePropertyLandlord,SinglePropertyLandlord WHERE slSystemLoginID = @SystemLoginID) ;
		SET @LOEmailAddress = ( SELECT EmailAddress FROM LandlordContact WHERE NationalInsuranceNumber = @LONationalInsuranceNumber);
      declare @msgbody varchar(max)=
		'<h1>SAS - Student Best Choice !</h1>'+
		'<p>Hello Dear Sir/Madam, <br> You are receiving this email because your account password has been changed.</p>'+
		' <p><strong>Reference Account Email :- '+@LOEmailAddress+'</strong><br></p>'+
		' <p><strong>Reference Account UserName :- '+@UserName+'</strong><br></p>'+
		'<p>If you did not do this please contact support to recover your account.</p>'+
		'</br><p>Thanks from SAS Team.</p>'
 -- Message body content for demostration of procedure only, doesn't not represent any type organisation body.
		  EXEC msdb.dbo.sp_send_dbmail
          @profile_name = 'SASMAIL',
          @recipients = @LOEmailAddress,
          @subject = 'Password Changed !',
          @body = @msgbody,
		  @body_format = 'HTML' ;
END
END
