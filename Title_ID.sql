USE finalproject;
DROP TABLE IF EXISTS Title_ID;

CREATE TABLE Title_ID (
  Title_ID int(11) NOT NULL auto_increment,
  `Title` VARCHAR(30) NOT NULL,
  PRIMARY KEY  (Title_ID)
) AS
	SELECT DISTINCT `Title`
	FROM invoices
	WHERE `Title` IS NOT NULL
	ORDER BY `Title`;

ALTER TABLE invoices


 ADD COLUMN Title_ID INT(11);

UPDATE invoices
	INNER JOIN Title_ID
	ON Title_ID.Title = invoices.Title
	SET invoices.Title_ID = Title_ID.Title_ID
	WHERE Title_ID.Title IS NOT NULL;


SELECT iv.Person_ID, iv.Title,iv.Title_ID, ci.Title_ID
	FROM invoices AS iv
	JOIN Title_ID AS ci
	ON ci.Title_ID = iv.Title_ID;

 ALTER TABLE invoices
	DROP COLUMN Title;
