-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE AddEmployeeAcc
	-- Add the parameters for the stored procedure here
	@Lastname VARCHAR(30),
    @Firstname VARCHAR(30),
    @Middlename VARCHAR(30),
    @DoB DATE,
	@PhoneNumber varchar(30),
    @Gender VARCHAR(30),
	@Email varchar(30),
    @Position VARCHAR(30),
    @Username VARCHAR(30),
    @Password VARCHAR(30)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into EmployeeDetail (Firstname, Lastname, Middlename, DoB,PhoneNumber,Gender,Email,position)
	values (@Lastname, @Firstname, @Middlename, @DoB, @PhoneNumber, @Gender, @Email, @Position,@Username,@Password)

    -- Capture the new EmployeeID
    DECLARE @newEmployeeID INT;
    SET @newEmployeeID = SCOPE_IDENTITY();

    -- Insert into Account table using the captured EmployeeID
    INSERT INTO Account (Username, [Password], employeeID)
    VALUES (@Username, @password, @newEmployeeID);
END
GO
