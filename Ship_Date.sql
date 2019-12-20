USE finalproject;
DROP TABLE IF EXISTS Ship_Date;

CREATE TABLE Ship_Date (
  ShipDate_ID INT(11),
  `ShipDate` date NOT NULL,
  PRIMARY KEY  (ShipDate_ID)
) AS
	SELECT DISTINCT ShipDate_ID , `ShipDate`
	FROM invoices
	WHERE ShipDate_ID IS NOT NULL
	ORDER BY ShipDate_ID;

ALTER TABLE invoices


 ADD COLUMN ShipDate_ID INT(11);
UPDATE invoices
INNER JOIN Ship_Date
	ON Ship_Date.ShipDate_ID = invoices.ShipDate_ID

	SET invoices.ShipDate =Ship_Date.ShipDate
	WHERE Ship_Date.ShipDate_ID IS NOT NULL;

SELECT mc.InvoiceID, pb.ShipDate
	FROM invoices AS mc
	JOIN Ship_Date AS pb
ON pb.ShipDate = mc.ShipDate;

ALTER TABLE invoices
 	DROP COLUMN ShipDate;


