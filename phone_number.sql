USE finalproject;
DROP TABLE IF EXISTS Phone;

CREATE TABLE Phone (
   Person_ID int(11) NOT NULL auto_increment,
  `Phone` CHAR(12) NOT NULL,
   `Fax` CHAR(12) NOT NULL,
  PRIMARY KEY  ( Person_ID)
) AS
	SELECT DISTINCT Person_ID,`Fax`, `Phone`
	FROM invoices
	WHERE Person_ID IS NOT NULL
	ORDER BY Person_ID;

UPDATE invoices
INNER JOIN Phone
	ON Phone.Person_ID = invoices.Person_ID

	SET invoices.Phone =Phone.Phone
	WHERE Phone.Person_ID IS NOT NULL;
UPDATE invoices
INNER JOIN Phone
	ON Phone.Person_ID = invoices.Person_ID

	SET invoices.Fax =Phone.Fax
	WHERE Phone.Person_ID IS NOT NULL;

SELECT mc.Person_ID, pb.Phone
	FROM invoices AS mc
	JOIN Phone AS pb
ON pb.Phone = mc.Phone;

SELECT mc.Person_ID, pb.Phone
	FROM invoices AS mc
	JOIN Phone AS pb
ON pb.Fax = mc.Fax;


# ALTER TABLE my_contacts
# 	DROP COLUMN gender;


