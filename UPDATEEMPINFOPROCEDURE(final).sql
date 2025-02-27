USE [test5]
GO
/****** Object:  StoredProcedure [dbo].[UpdateEmpInfo]    Script Date: 12/10/2024 10:40:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Cyrile Cortes>
-- Create date: <11/22/24>
-- Description:	<Update Employee Info>
-- =============================================
ALTER PROCEDURE [dbo].[UpdateEmpInfo] 
	-- Add the parameters for the stored procedure here
	@EmployeeID int,
	@Lastname VARCHAR(30),
    @Firstname VARCHAR(30),
    @Middlename VARCHAR(30),
	@DoB Date,
	@PhoneNum varchar(30),
	@Gender varchar(30),
	@Email varchar(30),
    @Position VARCHAR(30),
	@Status VARCHAR(30),
	@HourlyRate DECIMAL(5,2)
    
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update EmployeeDetail
	Set
		lastname = @Lastname,
		firstname = @Firstname,
		middlename = @Middlename,
		DoB = @DoB,
		PhoneNumber = @PhoneNum,
		Gender = @Gender,
		Email = @Email,
		position = @Position,
		[status] = @Status
	where employeeID = @EmployeeID

	-- Update the hourly rate in the Salary table
	Update Salary
	Set HourlyRate = @HourlyRate
	Where EmployeeID = @EmployeeID;
END
