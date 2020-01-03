CREATE PROCEDURE dbo.spSystemLogin
      @UserName VARCHAR(8), 
      @Password VARCHAR(30),
      @ServerFeedback VARCHAR(300)='' OUTPUT
AS
BEGIN

    SET NOCOUNT ON

    DECLARE @SLRecordID INT

    IF EXISTS (SELECT TOP 1 SLRecordID FROM [dbo].[SystemLogin] WHERE UserName=@UserName)
    BEGIN
        SET @SLRecordID=(SELECT SLRecordID FROM [dbo].[SystemLogin] WHERE UserName=@UserName AND PasswordHash=HASHBYTES('SHA2_512', @Password+CAST(Cryptography AS VARCHAR(86))))

       IF(@SLRecordID IS NULL)
           SET @ServerFeedback='INVALID CREDENTIALS, CHECK PASSWORD'
       ELSE 
           SET @ServerFeedback='Login Success...'
    END
    ELSE
       SET @ServerFeedback='ACCOUNT NOT FOUND !'

END