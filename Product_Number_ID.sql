USE finalproject;
DROP TABLE IF EXISTS Product_Number_ID;

CREATE TABLE Product_Number_ID (
  Product_Number_ID int(11) NOT NULL auto_increment,
  `PartNumber`char(15),

  PRIMARY KEY  (Product_Number_ID)
) AS
	SELECT DISTINCT `PartNumber`
	FROM invoices
	WHERE `PartNumber` IS NOT NULL
	ORDER BY `PartNumber`;

ALTER TABLE invoices


 ADD COLUMN Product_Number_ID INT(11);

UPDATE invoices
	INNER JOIN Product_Number_ID
	ON Product_Number_ID.PartNumber= invoices.PartNumber
	SET invoices.Product_Number_ID = Product_Number_ID.Product_Number_ID
	WHERE Product_Number_ID.PartNumber IS NOT NULL;

SELECT iv.PartNumber,  iv.Product_Number_ID, ci.PartNumber
	FROM invoices AS iv
	JOIN Product_Number_ID AS ci
	ON ci.Product_Number_ID = iv.Product_Number_ID;
 ALTER TABLE invoices
	DROP COLUMN PartNumber;


