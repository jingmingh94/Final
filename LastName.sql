USE finalproject;
DROP TABLE IF EXISTS LastName_ID;

CREATE TABLE LastName_ID (
  LastName_ID int(11) NOT NULL auto_increment,
  `LastName` VARCHAR(30) NOT NULL,
  PRIMARY KEY  (LastName_ID)
) AS
	SELECT DISTINCT `LastName`
	FROM invoices
	WHERE `LastName` IS NOT NULL
	ORDER BY `LastName`;

ALTER TABLE invoices


 ADD COLUMN LastName_ID INT(11);

UPDATE invoices
	INNER JOIN LastName_ID
	ON LastName_ID.LastName = invoices.LastName
	SET invoices.LastName_ID = LastName_ID.LastName_ID
	WHERE LastName_ID.LastName IS NOT NULL;


SELECT iv.FullName, iv.LastName_ID, ci.LastName
	FROM invoices AS iv
	JOIN LastName_ID AS ci
	ON ci.LastName_ID = iv.LastName_ID;

 ALTER TABLE invoices
	DROP COLUMN LastName;


