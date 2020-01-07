

-- CREATING FUNCTION 2 - fnCalculationMonthlyPayment, Calculates the monthly payment amount and returns it --
 CREATE FUNCTION fnCalculationMonthlyPayment(@monthlyWaterFee MONEY, @monthlyElectricityFee MONEY, @rentAmountID CHAR(8), @monthlyTax MONEY)
   RETURNS MONEY
 AS
 BEGIN
   DECLARE @rentAmount MONEY;
   SET @rentAmount = (SELECT RentAmount FROM RentAmount WHERE RentAmountID = @rentAmountID);

   DECLARE @totalMonthlyFee MONEY;
   SET @totalMonthlyFee = (@monthlyWaterFee + @monthlyElectricityFee + @rentAmount + @monthlyTax);

   RETURN @totalMonthlyFee;
 END
