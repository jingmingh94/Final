USE finalproject;
DROP TABLE IF EXISTS Quantity;

CREATE TABLE Quantity (
   InvoiceID int,
  `Quantity` VARCHAR(30) NOT NULL,
  PRIMARY KEY  ( InvoiceID)
) AS
	SELECT DISTINCT InvoiceID , `Quantity`
	FROM invoices
	WHERE InvoiceID IS NOT NULL
	ORDER BY InvoiceID;

UPDATE invoices
INNER JOIN Quantity
	ON Quantity.InvoiceID = invoices.InvoiceID

	SET invoices.Quantity =Quantity.Quantity
	WHERE Quantity.InvoiceID IS NOT NULL;

SELECT mc.InvoiceID, pb.Quantity
	FROM invoices AS mc
	JOIN Quantity AS pb
ON pb.Quantity = mc.Quantity;

# ALTER TABLE my_contacts
# 	DROP COLUMN gender;


