USE finalproject;
DROP TABLE IF EXISTS Tax_Able;

CREATE TABLE Tax_Able (
  Tax_Able int(11) NOT NULL auto_increment,
  `Taxable` VARCHAR(30) NOT NULL,
  PRIMARY KEY  (Tax_Able)
) AS
	SELECT DISTINCT `Taxable`
	FROM invoices
	WHERE `Taxable` IS NOT NULL
	ORDER BY `Taxable`;

ALTER TABLE invoices


 ADD COLUMN Tax_Able INT(11);

UPDATE invoices
	INNER JOIN Tax_Able
	ON Tax_Able.Taxable = invoices.Taxable
	SET invoices.Tax_Able = Tax_Able.Tax_Able
	WHERE Tax_Able.Taxable IS NOT NULL;


SELECT   iv.PartNumber,iv.Taxable, iv.Tax_Able, ci.Taxable
	FROM invoices AS iv
	JOIN Tax_Able AS ci
	ON ci.Tax_Able = iv.Tax_Able;

 ALTER TABLE invoices
	DROP COLUMN Taxable;


