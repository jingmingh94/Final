USE finalproject;
DROP TABLE IF EXISTS PostalCode_Number;

CREATE TABLE PostalCode_Number (
 `City` varchar(20),
  `PostalCode` VARCHAR(12) NOT NULL,
  PRIMARY KEY  (`City`)
) AS
	SELECT DISTINCT `City`,`PostalCode`
	FROM invoices
	WHERE `City` IS NOT NULL
	ORDER BY `City`;

UPDATE invoices
	INNER JOIN PostalCode_Number
	ON  invoices.`City` = PostalCode_Number.`City`
	SET PostalCode_Number.PostalCode = invoices.PostalCode
	WHERE PostalCode_Number.`City` IS NOT NULL;


SELECT iv.PostalCode, iv.`City`, ci.PostalCode
	FROM invoices AS iv
	JOIN PostalCode_Number AS ci
	ON ci.PostalCode = iv.PostalCode;

# ALTER TABLE my_contacts
# 	DROP COLUMN gender;


