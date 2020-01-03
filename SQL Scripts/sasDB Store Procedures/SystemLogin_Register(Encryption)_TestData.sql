-- SYSTEM LOGIN AND REGISTRATION ENCRYPTION TEST DATA

DECLARE @ServerFeedback VARCHAR(300)

EXEC dbo.spSystemRegister		--INSERTING VALUES
          @UserName = 'Robert',
          @Password = 'rob123',
          @ServerFeedback=@ServerFeedback OUTPUT

SELECT * FROM [dbo].[SystemLogin]

EXEC	dbo.spSystemLogin		--TESTING WITH LEGIT VALUES
		@UserName = 'Robert',
        @Password = 'rob123',
        @ServerFeedback=@ServerFeedback OUTPUT

SELECT	@ServerFeedback as N'@ServerFeedback'

EXEC	dbo.spSystemLogin		--TESTING WITH FALSE USERNAME
		@UserName = 'hacker',
        @Password = 'root',
        @ServerFeedback=@ServerFeedback OUTPUT

SELECT	@ServerFeedback as N'@ServerFeedback'

EXEC	dbo.spSystemLogin		--TESTING WITH FALSE PASSWORD
		@UserName = 'Robert',
        @Password = 'robert123',
        @ServerFeedback=@ServerFeedback OUTPUT

SELECT	@ServerFeedback as N'@ServerFeedback'