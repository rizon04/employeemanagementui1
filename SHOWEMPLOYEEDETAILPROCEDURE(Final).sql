USE [test5]
GO
/****** Object:  StoredProcedure [dbo].[ShowEmployeeDetail]    Script Date: 12/10/2024 10:37:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[ShowEmployeeDetail] 
	-- Add the parameters for the stored procedure here
	@EmployeeID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	SELECT gender,DoB,Email,PhoneNumber FROM EmployeeDetail where EmployeeID = @EmployeeID	
END
