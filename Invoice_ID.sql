USE finalproject;
DROP TABLE IF EXISTS Invoice_ID;

CREATE TABLE Invoice_ID (
  Invoice_ID int(11) NOT NULL auto_increment,
  `InvoiceID` int,
  PRIMARY KEY  (Invoice_ID)
) AS
	SELECT DISTINCT `InvoiceID`
	FROM invoices
	WHERE `InvoiceID` IS NOT NULL
	ORDER BY `InvoiceID`;

ALTER TABLE invoices


 ADD COLUMN Invoice_ID INT(11);

UPDATE invoices
	INNER JOIN Invoice_ID
	ON Invoice_ID.InvoiceID = invoices.InvoiceID
	SET invoices.Invoice_ID = Invoice_ID.Invoice_ID
	WHERE Invoice_ID.InvoiceID IS NOT NULL;


SELECT iv.InvoiceID, iv.Invoice_ID, ci.InvoiceID
	FROM invoices AS iv
	JOIN Invoice_ID AS ci
	ON ci.Invoice_ID = iv.Invoice_ID;

 ALTER TABLE invoices
 	DROP COLUMN InvoiceID;


