USE finalproject;
DROP TABLE IF EXISTS Price;

CREATE TABLE Price (
   PartNumber int,
  `Price` float NOT NULL,
  PRIMARY KEY  ( PartNumber)
) AS
	SELECT DISTINCT PartNumber , `Price`
	FROM invoices
	WHERE PartNumber IS NOT NULL
	ORDER BY PartNumber;

UPDATE invoices
INNER JOIN Price
	ON Price.PartNumber = invoices.PartNumber

	SET invoices.Price =Price.Price
	WHERE Price.PartNumber IS NOT NULL;

SELECT mc.PartNumber, pb.Price
	FROM invoices AS mc
	JOIN Price AS pb
ON pb.Price = mc.Price;

 ALTER TABLE invoices
     DROP COLUMN TaxAmount,
     	DROP COLUMN InvoiceTotal,
 	DROP COLUMN ExtendedPrice;


