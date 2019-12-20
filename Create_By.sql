USE finalproject;
DROP TABLE IF EXISTS CreatedBy_ID;

CREATE TABLE CreatedBy_ID (
  CreatedBy_ID int(11) NOT NULL auto_increment,
  `CreatedBy` VARCHAR(30),
  PRIMARY KEY  (CreatedBy_ID)
) AS
	SELECT DISTINCT `CreatedBy`
	FROM invoices
	WHERE `CreatedBy` IS NOT NULL
	ORDER BY `CreatedBy`;

ALTER TABLE invoices


 ADD COLUMN CreatedBy_ID INT(11);

UPDATE invoices
	INNER JOIN CreatedBy_ID
	ON CreatedBy_ID.CreatedBy = invoices.CreatedBy
	SET invoices.CreatedBy_ID = CreatedBy_ID.CreatedBy_ID
	WHERE CreatedBy_ID.CreatedBy IS NOT NULL;


SELECT  iv.InvoiceID, iv.CreatedBy_ID, ci.CreatedBy_ID
	FROM invoices AS iv
	JOIN CreatedBy_ID AS ci
	ON ci.CreatedBy_ID = iv.CreatedBy_ID;

 ALTER TABLE invoices
 	DROP COLUMN CreatedBy;


