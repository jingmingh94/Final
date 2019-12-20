USE finalproject;
DROP TABLE IF EXISTS ProductName;

CREATE TABLE ProductName (
  `PartNumber`char(15),
 `ProductName` varchar(60) ,
  PRIMARY KEY  (`PartNumber`)
) AS
	SELECT DISTINCT `PartNumber`,`ProductName`
	FROM invoices
	WHERE `PartNumber` IS NOT NULL
	ORDER BY `PartNumber`;

UPDATE invoices
	INNER JOIN ProductName
	ON  invoices.`PartNumber` = ProductName.`PartNumber`
	SET ProductName.ProductName = invoices.ProductName
	WHERE ProductName.`PartNumber` IS NOT NULL;


SELECT iv.ProductName, iv.`PartNumber`, ci.ProductName
	FROM invoices AS iv
	JOIN ProductName AS ci
	ON ci.ProductName = iv.ProductName;

# ALTER TABLE my_contacts
# 	DROP COLUMN gender;


