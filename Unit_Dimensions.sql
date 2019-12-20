USE finalproject;
DROP TABLE IF EXISTS Unit_Dimension;

CREATE TABLE Unit_Dimension (
   Dimension_Number INT(11),
  `UnitDimensions` CHAR(10) NOT NULL,
  PRIMARY KEY  ( Dimension_Number)
) AS
	SELECT DISTINCT Dimension_Number , `UnitDimensions`
	FROM invoices
	WHERE Dimension_Number IS NOT NULL
	ORDER BY Dimension_Number;
ALTER TABLE invoices


 ADD COLUMN Dimension_Number INT(11);

UPDATE invoices
INNER JOIN Unit_Dimension
	ON Unit_Dimension.Dimension_Number = invoices.Dimension_Number

	SET invoices.UnitDimensions =Unit_Dimension.UnitDimensions
	WHERE Unit_Dimension.Dimension_Number IS NOT NULL;

SELECT mc.PartNumber, mc.Dimension_Number, pb.UnitDimensions
	FROM invoices AS mc
	JOIN Unit_Dimension AS pb
ON pb.UnitDimensions = mc.UnitDimensions;

ALTER TABLE Invoices
DROP COLUMN UnitDimensions;



