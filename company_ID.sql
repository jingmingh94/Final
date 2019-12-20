USE finalproject;
DROP TABLE IF EXISTS Company_ID;

CREATE TABLE Company_ID (
  Company_ID int(11) NOT NULL auto_increment,
  `Company` VARCHAR(30),
  PRIMARY KEY  (Company_ID)
) AS
	SELECT DISTINCT `Company`
	FROM invoices
	WHERE `Company` IS NOT NULL
	ORDER BY `Company`;

ALTER TABLE invoices


 ADD COLUMN Company_ID INT(11);

UPDATE invoices
	INNER JOIN Company_ID
	ON Company_ID.Company = invoices.Company
	SET invoices.Company_ID = Company_ID.Company_ID
	WHERE Company_ID.Company IS NOT NULL;


SELECT  iv.Company, iv.Company_ID, ci.Company_ID
	FROM invoices AS iv
	JOIN Company_ID AS ci
	ON ci.Company_ID = iv.Company_ID;

 ALTER TABLE invoices
 	DROP COLUMN Company;


