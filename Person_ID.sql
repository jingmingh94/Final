USE finalproject;
DROP TABLE IF EXISTS Person_ID;

CREATE TABLE Person_ID (
  Person_ID int(11) NOT NULL auto_increment,
  `FullName` VARCHAR(30) NOT NULL,

  PRIMARY KEY  (Person_ID)
) AS
	SELECT DISTINCT `FullName`
	FROM invoices
	WHERE `FullName` IS NOT NULL
	ORDER BY `FullName`;

ALTER TABLE invoices


 ADD COLUMN Person_ID INT(11);

UPDATE invoices
	INNER JOIN Person_ID
	ON Person_ID.FullName= invoices.FullName
	SET invoices.Person_ID = Person_ID.Person_ID
	WHERE Person_ID.FullName IS NOT NULL;

SELECT iv.FullName,  iv.Person_ID, ci.FullName
	FROM invoices AS iv
	JOIN Person_ID AS ci
	ON ci.Person_ID = iv.Person_ID;
 ALTER TABLE invoices
	DROP COLUMN FullName;


