USE finalproject;
DROP TABLE IF EXISTS Shipment_Status_Number;

CREATE TABLE Shipment_Status_Number (
  Shipment_Status_Number int(11) NOT NULL auto_increment,
  `ShipmentStatus` char(10) NOT NULL,
  PRIMARY KEY  (Shipment_Status_Number)
) AS
	SELECT DISTINCT `ShipmentStatus`
	FROM invoices
	WHERE `ShipmentStatus` IS NOT NULL
	ORDER BY `ShipmentStatus`;

ALTER TABLE invoices


 ADD COLUMN Shipment_Status_Number INT(11);

UPDATE invoices
	INNER JOIN Shipment_Status_Number
	ON Shipment_Status_Number.ShipmentStatus = invoices.ShipmentStatus
	SET invoices.Shipment_Status_Number = Shipment_Status_Number.Shipment_Status_Number
	WHERE Shipment_Status_Number.ShipmentStatus IS NOT NULL;


SELECT  iv.InvoiceID, iv.ShipmentStatus, iv.Shipment_Status_Number, ci.ShipmentStatus
	FROM invoices AS iv
	JOIN Shipment_Status_Number AS ci
	ON ci.Shipment_Status_Number = iv.Shipment_Status_Number;

 ALTER TABLE invoices
	DROP COLUMN ShipmentStatus;


