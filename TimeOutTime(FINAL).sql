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
CREATE PROCEDURE [dbo].[TimeOutTime]
    @EmployeeID int,
    @TimeOutValue Time -- Only capture the time part
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @TimeIn DateTime;
    DECLARE @TotalHours decimal(5,2);
    DECLARE @ExistingTimeOut Time;

    -- Check if there's already a TimeOut record for the employee today
    SELECT @ExistingTimeOut = CAST(TimeOut AS Time)
    FROM Attendance
    WHERE EmployeeID = @EmployeeID
      AND [Date] = CAST(GETDATE() AS DATE)
      AND TimeOut IS NOT NULL;

    -- If there's already a TimeOut record, throw an error
    IF @ExistingTimeOut IS NOT NULL
    BEGIN
        -- Throw an error message that can be captured in C#
        THROW 50001, 'Employee has already timed out today.', 1;
    END

    -- Get the TimeIn record for today (if it exists)
    SELECT @TimeIn = TimeIn
    FROM Attendance
    WHERE EmployeeID = @EmployeeID
      AND [Date] = CAST(GETDATE() AS DATE)
      AND TimeOut IS NULL;

    -- If no TimeIn record found for today, throw an error
    IF @TimeIn IS NULL
    BEGIN
        -- Throw an error message that can be captured in C#
        THROW 50002, 'No Time In record found for today.', 1;
    END

    -- Calculate the total hours worked (TimeOut - TimeIn)
    SET @TotalHours = DATEDIFF(MINUTE, @TimeIn, CAST(@TimeOutValue AS DateTime)) / 60.0;

    -- Update the attendance record with TimeOut and TotalHours
    UPDATE Attendance
    SET TimeOut = CAST(@TimeOutValue AS DateTime), TotalHours = @TotalHours
    WHERE EmployeeID = @EmployeeID
      AND [Date] = CAST(GETDATE() AS DATE)
      AND TimeOut IS NULL;

    PRINT 'TimeOut successful.';
END
