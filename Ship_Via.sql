USE finalproject;
DROP TABLE IF EXISTS Ship_Via_Number;

CREATE TABLE Ship_Via_Number (
  Ship_Via_Number int(11) NOT NULL auto_increment,
  `ShipVia` VARCHAR(30) NOT NULL,
  PRIMARY KEY  (Ship_Via_Number)
) AS
	SELECT DISTINCT `ShipVia`
	FROM invoices
	WHERE `ShipVia` IS NOT NULL
	ORDER BY `ShipVia`;

ALTER TABLE invoices


 ADD COLUMN Ship_Via_Number INT(11);

UPDATE invoices
	INNER JOIN Ship_Via_Number
	ON Ship_Via_Number.ShipVia = invoices.ShipVia
	SET invoices.Ship_Via_Number = Ship_Via_Number.Ship_Via_Number
	WHERE Ship_Via_Number.ShipVia IS NOT NULL;


SELECT   iv.InvoiceID,iv.ShipVia, iv.Ship_Via_Number, ci.ShipVia
	FROM invoices AS iv
	JOIN Ship_Via_Number AS ci
	ON ci.Ship_Via_Number = iv.Ship_Via_Number;

 ALTER TABLE invoices
	DROP COLUMN ShipVia;


