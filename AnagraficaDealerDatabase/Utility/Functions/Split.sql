
CREATE FUNCTION [Utility].[Split] (@sep char(1), @s varchar(8000))
RETURNS table
AS
RETURN (
WITH ElementsValue(IndexValue, start, stop) AS (
    
      --SELECT 1, 1, CHARINDEX(@sep, SUBSTRING(@s, 1, LEN(@s)-1))
      --UNION ALL
      --SELECT IndexValue + 1, stop + 1, CHARINDEX(@sep, SUBSTRING(@s, 1, LEN(@s)-1), stop + 1)
	  SELECT 1, 1, CHARINDEX(@sep, SUBSTRING(@s, 1, LEN(@s)))
      UNION ALL
      SELECT IndexValue + 1, stop + 1, CHARINDEX(@sep, SUBSTRING(@s, 1, LEN(@s)), stop + 1)
      FROM ElementsValue
      WHERE stop > 0
      )
    SELECT IndexValue,
			SUBSTRING(SUBSTRING(@s, 1, LEN(@s)), start, CASE WHEN stop > 0 THEN stop-start ELSE 8000 END) AS ElementValue
			--SUBSTRING(SUBSTRING(@s, 1, LEN(@s)-1), start, CASE WHEN stop > 0 THEN stop-start ELSE 8000 END) AS ElementValue
	FROM ElementsValue
  )