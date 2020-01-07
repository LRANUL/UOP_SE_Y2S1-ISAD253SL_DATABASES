

-- CREATING FUNCTION 1 - fnCalculationMonthlyTax, Calculates the monthly tax amount and returns it --
 CREATE FUNCTION fnCalculationMonthlyTax(@monthlyWaterFee MONEY, @monthlyElectricityFee MONEY, @rentAmountID CHAR(8))
   RETURNS MONEY
 AS
 BEGIN
   DECLARE @rentAmount MONEY;
   SET @rentAmount = (SELECT RentAmount FROM RentAmount WHERE RentAmountID = @rentAmountID);

   DECLARE @taxAmount MONEY;
   SET @taxAmount = ((@monthlyWaterFee + @monthlyElectricityFee + @rentAmount) * 0.2);

   RETURN @taxAmount;
 END

