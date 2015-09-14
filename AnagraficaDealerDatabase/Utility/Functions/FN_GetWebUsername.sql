CREATE FUNCTION [Utility].[FN_GetWebUsername] ()
RETURNS NVARCHAR(50)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Username NVARCHAR(50) = 'dbo'

	-- Return the result of the function
	RETURN @Username

END