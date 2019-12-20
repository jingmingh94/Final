USE finalproject;
DROP TABLE IF EXISTS FirstName_ID;

CREATE TABLE FirstName_ID (
  FirstName_ID int(11) NOT NULL auto_increment,
  `FirstName` VARCHAR(30) NOT NULL,
  PRIMARY KEY  (FirstName_ID)
) AS
	SELECT DISTINCT `FirstName`
	FROM invoices
	WHERE `FirstName` IS NOT NULL
	ORDER BY `FirstName`;

ALTER TABLE invoices


 ADD COLUMN FirstName_ID INT(11);

UPDATE invoices
	INNER JOIN FirstName_ID
	ON FirstName_ID.FirstName = invoices.FirstName
	SET invoices.FirstName_ID = FirstName_ID.FirstName_ID
	WHERE FirstName_ID.FirstName IS NOT NULL;


SELECT  iv.FirstName, iv.FirstName_ID, ci.FirstName
	FROM invoices AS iv
	JOIN FirstName_ID AS ci
	ON ci.FirstName_ID = iv.FirstName_ID;

 ALTER TABLE invoices
	DROP COLUMN FirstName;


