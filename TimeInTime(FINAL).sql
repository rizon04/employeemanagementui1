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
CREATE PROCEDURE [dbo].[TimeInTime]
    @EmployeeID int,
    @TimeInValue Time -- Only capture the time part
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ExistingTimeIn Time;

    -- Check if the employee already has a TimeIn record for the current date
    SELECT @ExistingTimeIn = CAST(TimeIn AS Time)
    FROM Attendance
    WHERE EmployeeID = @EmployeeID
      AND [Date] = CAST(GETDATE() AS DATE) -- Use current date
      AND TimeIn IS NOT NULL;

    -- If there's already a TimeIn record for the current date, throw an error
    IF @ExistingTimeIn IS NOT NULL
    BEGIN
        -- Throw an error message that can be captured in C#
        THROW 50000, 'Employee has already time-in today.', 1;
    END

    -- Insert a new record with the provided time and current date
    INSERT INTO Attendance (EmployeeID, TimeIn, [Date])
    VALUES (@EmployeeID, CAST(@TimeInValue AS DateTime), CAST(GETDATE() AS DATE));

    PRINT 'TimeIn successful.';
END

