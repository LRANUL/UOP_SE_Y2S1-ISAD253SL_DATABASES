/*
CREATES A TRIGGER WHEN A REQUEST IS MADE TO UPDATE A PASSWORD IN LOGIN TABLE
THIS WILL ALERT THE REGISTERED STUDENT WITH QUICK EMAIL TO HIS ACCOUNT WITH REFERENCE DETAILS
NEW PASSWORD DETAILS CAN ALSO BE FORWARDED BUT FOR SECURITY REASONS THIS WAS NOT IMPLEMENTED.
*/

CREATE TRIGGER stPasswordUpdate on [SystemLogin]
AFTER Update
AS
BEGIN
DECLARE
@SystemLoginID Char(8),
@UserName varchar(8),
@Passwordhash Binary(64),
@sNationalInsuranceNumber varchar(9),
@StuEmailAddress VARCHAR(50);


SELECT @SystemLoginID = ins.SystemLoginID FROM INSERTED ins;
SELECT @Passwordhash = ins.Passwordhash FROM INSERTED ins;
SELECT @UserName = ins.UserName FROM INSERTED ins;


IF UPDATE(Passwordhash)
BEGIN
		SET @sNationalInsuranceNumber = ( SELECT sNationalInsuranceNumber FROM UndergraduateStudents,PostgraduateStudents WHERE slSystemLoginID = @SystemLoginID) ;
		SET @StuEmailAddress = ( SELECT EmailAddress FROM StudentContact WHERE NationalInsuranceNumber = @sNationalInsuranceNumber);
      declare @msgbody varchar(max)=
		'<h1>SAS - Student Best Choice !</h1>'+
		'<p>Hello Dear Student, <br> You are receiving this email because your account password has been changed.</p>'+
		' <p><strong>Reference Account Email :- '+@StuEmailAddress+'</strong><br></p>'+
		' <p><strong>Reference Account UserName :- '+@UserName+'</strong><br></p>'+
		'<p>If you did not do this please contact support to recover your account.</p>'+
		'</br><p>Thanks from SAS Team.</p>'
 -- Message body content for demostration of procedure only, doesn't not represent any type organisation body.
		  EXEC msdb.dbo.sp_send_dbmail
          @profile_name = 'SASMAIL',
          @recipients = @StuEmailAddress,
          @subject = 'Password Changed !',
          @body = @msgbody,
		  @body_format = 'HTML' ;
END
END
