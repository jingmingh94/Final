USE finalproject;

DROP TABLE IF EXISTS DiscountRate_Number;
CREATE TABLE DiscountRate_Number (
    Invoice_ID int(11) NOT NULL auto_increment,
`Company` VARCHAR(30) NOT NULL,
 DiscountRate char(10) NOT NULL,

  PRIMARY KEY  (Invoice_ID )
) AS
	SELECT DISTINCT Invoice_ID, Company, DiscountRate
	FROM invoices
WHERE  Invoice_ID IS NOT NULL

	ORDER BY  Invoice_ID;



UPDATE invoices
	INNER JOIN  DiscountRate_Number
	ON  DiscountRate_Number.Invoice_ID = invoices.Invoice_ID
	SET invoices.Company = DiscountRate_Number.Company
	WHERE  DiscountRate_Number.Invoice_ID IS NOT NULL;



UPDATE invoices
	INNER JOIN DiscountRate_Number
	ON DiscountRate_Number.Invoice_ID = invoices.Invoice_ID
	SET invoices.DiscountRate =DiscountRate_Number.DiscountRate
	WHERE DiscountRate_Number.Invoice_ID IS NOT NULL;



SELECT mc.Invoice_ID, pb.DiscountRate
	FROM invoices AS mc
	JOIN DiscountRate_Number AS pb
	ON pb.DiscountRate = mc.DiscountRate;



SELECT mc.Invoice_ID, pb.Company
	FROM invoices AS mc
	JOIN DiscountRate_Number AS pb
	ON pb.Company = mc.Company;

# ALTER TABLE invoices
# 	DROP COLUMN gender;


