 ALTER TABLE dbo.[SystemLogin] ADD Cryptography UNIQUEIDENTIFIER 
 
 GO
 
 CREATE PROCEDURE dbo.spSystemRegister
    @UserName VARCHAR(8), 
    @Password VARCHAR(30),
	@EmailAddress VARCHAR(50),
    @ServerFeedback VARCHAR(300) OUTPUT
AS
BEGIN
    SET NOCOUNT ON
    DECLARE @Cryptography UNIQUEIDENTIFIER=NEWID()
    BEGIN TRY
-- REFERENCES (Docs.microsoft.com. (2020). HASHBYTES (Transact-SQL) - SQL Server. [online] Available at: https://docs.microsoft.com/en-us/sql/t-sql/functions/hashbytes-transact-sql?view=sql-server-ver15 [Accessed 3 Jan. 2020].)
		declare @msgbody varchar(max)=
		'<h1>SAS - Student Best Choice !</h1>'+
		'<p>Please find the your credentials below to access <strong>SAS UK</strong></p>'+
		'</br><p>UserName:<strong>'+@UserName+'</strong></p>'+
		'</br><p>Password:<strong>'+@Password+'</strong></p>'+
		'</br><p>Thanks from SAS Team.</p>'
 
		  EXEC msdb.dbo.sp_send_dbmail
          @profile_name = 'SASMAIL',
          @recipients = @EmailAddress,
          @subject = 'Thank you for Registering with SAS',
          @body = @msgbody,
		  @body_format = 'HTML' ;

		INSERT INTO dbo.[SystemLogin] (UserName,Passwordhash,Cryptography)
        VALUES(@UserName, HASHBYTES('SHA2_512', @Password+CAST(@Cryptography AS NVARCHAR(86))),@Cryptography)

        SET @ServerFeedback='Credentials Stored Securely.'

    END TRY
    BEGIN CATCH
        SET @ServerFeedback=ERROR_MESSAGE() 
    END CATCH
END