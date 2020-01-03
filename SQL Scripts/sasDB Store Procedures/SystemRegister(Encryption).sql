 ALTER TABLE dbo.[SystemLogin] ADD Cryptography UNIQUEIDENTIFIER 
 
 GO
 
 CREATE PROCEDURE dbo.spSystemRegister
    @UserName VARCHAR(8), 
    @Password VARCHAR(30),
    @ServerFeedback VARCHAR(300) OUTPUT
AS
BEGIN
    SET NOCOUNT ON
    DECLARE @Cryptography UNIQUEIDENTIFIER=NEWID()
    BEGIN TRY
-- REFERENCES (https://docs.microsoft.com/en-us/sql/t-sql/functions/hashbytes-transact-sql?view=sql-server-ver15)
        INSERT INTO dbo.[SystemLogin] (UserName,Passwordhash,Cryptography)
        VALUES(@UserName, HASHBYTES('SHA2_512', @Password+CAST(@Cryptography AS NVARCHAR(86))),@Cryptography)

        SET @ServerFeedback='Credentials Stored Securely.'

    END TRY
    BEGIN CATCH
        SET @ServerFeedback=ERROR_MESSAGE() 
    END CATCH
END