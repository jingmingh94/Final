USE finalproject;
DROP TABLE IF EXISTS Email;

CREATE TABLE Email (
   Person_ID int,
`Email` VARCHAR(40),
  `Email_1` VARCHAR(40),
`Email_2` VARCHAR(40),
  PRIMARY KEY  ( Person_ID)
) AS
	SELECT DISTINCT Person_ID , `Email`
	FROM invoices
	WHERE Person_ID IS NOT NULL
	ORDER BY Person_ID;


ALTER TABLE invoices
 ADD COLUMN  `Email_1` VARCHAR(40),
 ADD COLUMN `Email_2` VARCHAR(40);
UPDATE Email
   SET
      Email.Email_1=  SUBSTRING_INDEX(Email.Email ,',', 1)
WHERE Email.Email IS NOT NULL;
UPDATE Email
   SET
   Email.Email=REPLACE(Email.Email,CONCAT(Email.Email_1,','),'')
       WHERE  Email.Email IS NOT NULL;
UPDATE Email
   SET
   Email.Email=REPLACE(Email.Email,Email.Email_1,'')
       WHERE  Email.Email IS NOT NULL;
UPDATE Email
	  SET
	     Email.Email_2=  Email.Email
WHERE Email.Email IS NOT NULL;


UPDATE invoices
	INNER JOIN Email
	ON Email.Person_ID = invoices.Person_ID
	SET invoices.Email_1 = Email.Email_1
	WHERE Email.Person_ID IS NOT NULL;
UPDATE invoices
	INNER JOIN Email
	ON Email.Person_ID = invoices.Person_ID
SET invoices.Email_2 = Email.Email_2
	WHERE  Email.Person_ID IS NOT NULL;
SELECT mc.Email_1, mc.Email_2, ps.Email_1,ps.Email_2
	FROM invoices AS mc
	JOIN Email AS ps
	ON ps.Email_1= mc.Email_1;
SELECT mc.Email_1, mc.Email_2, ps.Email_1,ps.Email_2
	FROM invoices AS mc
	JOIN Email AS ps
	    ON ps.Email_2= mc.Email_2;





 ALTER TABLE invoices
 	DROP COLUMN Email;



