USE finalproject;
DROP TABLE IF EXISTS Street_Number;

CREATE TABLE Street_Number (
  Street_Number int(11) NOT NULL auto_increment,
  `Street` VARCHAR(30) NOT NULL,
  PRIMARY KEY  (Street_Number)
) AS
	SELECT DISTINCT `Street`
	FROM invoices
	WHERE `Street` IS NOT NULL
	ORDER BY `Street`;

ALTER TABLE invoices


 ADD COLUMN Street_Number INT(11);

UPDATE invoices
	INNER JOIN Street_Number
	ON Street_Number.Street = invoices.Street
	SET invoices.Street_Number = Street_Number.Street_Number
	WHERE Street_Number.Street IS NOT NULL;


SELECT  iv.Street, iv.Street_Number, ci.Street
	FROM invoices AS iv
	JOIN Street_Number AS ci
	ON ci.Street_Number = iv.Street_Number;

 ALTER TABLE invoices
	DROP COLUMN Street;


