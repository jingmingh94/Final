USE finalproject;
DROP TABLE IF EXISTS City_Number;

CREATE TABLE City_Number (
  City_Number int(11) NOT NULL auto_increment,
  `City` VARCHAR(30) NOT NULL,
  PRIMARY KEY  (City_Number)
) AS
	SELECT DISTINCT `City`
	FROM invoices
	WHERE `City` IS NOT NULL
	ORDER BY `City`;

ALTER TABLE invoices


 ADD COLUMN City_Number INT(11);

UPDATE invoices
	INNER JOIN City_Number
	ON City_Number.City = invoices.City
	SET invoices.City_Number = City_Number.City_Number
	WHERE City_Number.City IS NOT NULL;


SELECT  iv.City, iv.City_Number, ci.City
	FROM invoices AS iv
	JOIN City_Number AS ci
	ON ci.City_Number = iv.City_Number;

 ALTER TABLE invoices
 	DROP COLUMN City;


