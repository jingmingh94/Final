USE finalproject;
DROP TABLE IF EXISTS Product_Weight;

CREATE TABLE Product_Weight (
   PartNumber int,
  `ProductWeight` VARCHAR(30) NOT NULL,
  PRIMARY KEY  ( PartNumber)
) AS
	SELECT DISTINCT PartNumber , `ProductWeight`
	FROM invoices
	WHERE PartNumber IS NOT NULL
	ORDER BY PartNumber;

UPDATE invoices
INNER JOIN Product_Weight
	ON Product_Weight.PartNumber = invoices.PartNumber

	SET invoices.ProductWeight =Product_Weight.ProductWeight
	WHERE Product_Weight.PartNumber IS NOT NULL;

SELECT mc.PartNumber, pb.ProductWeight
	FROM invoices AS mc
	JOIN Product_Weight AS pb
ON pb.ProductWeight = mc.ProductWeight;

# ALTER TABLE my_contacts
# 	DROP COLUMN gender;


