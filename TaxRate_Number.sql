USE finalproject;

DROP TABLE IF EXISTS TaxRate_Number;
CREATE TABLE TaxRate_Number (


`City` varchar(20) ,
`State` char(2) ,
 TaxRate char(10) NOT NULL,
  PRIMARY KEY  (City )
) AS
	SELECT DISTINCT State,City,TaxRate
	FROM invoices
WHERE   TaxRate IS NOT NULL

	ORDER BY  State;




UPDATE invoices
	INNER JOIN TaxRate_Number
	ON TaxRate_Number.City = invoices.City
	SET invoices.TaxRate =TaxRate_Number.TaxRate

	WHERE TaxRate_Number.City IS NOT NULL;



SELECT mc.State, pb.TaxRate
	FROM invoices AS mc
	JOIN TaxRate_Number AS pb
	ON pb.TaxRate = mc.TaxRate;

# ALTER TABLE invoices
# 	DROP COLUMN gender;


