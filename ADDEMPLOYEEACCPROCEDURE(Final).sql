USE [test5]
GO
/****** Object:  StoredProcedure [dbo].[AddEmployeeAcc]    Script Date: 12/10/2024 10:36:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[AddEmployeeAcc]
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
    @Password VARCHAR(30),
	@HourlyRate DECIMAL(5,2)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


    -- Insert statements for procedure here
	Insert into EmployeeDetail (Firstname, Lastname, Middlename, DoB,PhoneNumber,Gender,Email,position)
	values (@Lastname, @Firstname, @Middlename, @DoB, @PhoneNumber, @Gender, @Email, @Position)


    -- Capture the new EmployeeID
    DECLARE @newEmployeeID INT;
    SET @newEmployeeID = SCOPE_IDENTITY();

	INSERT INTO Salary (HourlyRate, employeeID)
	values (@HourlyRate, @newEmployeeID)

    -- Insert into Account table using the captured EmployeeID
    INSERT INTO Account (Username, [Password], employeeID)
    VALUES (@Username, @Password, @newEmployeeID);

	
END
