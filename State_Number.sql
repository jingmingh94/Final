USE finalproject;
DROP TABLE IF EXISTS State_Number;

CREATE TABLE State_Number (
  State_Number int(11) NOT NULL auto_increment,
  `State` VARCHAR(30) NOT NULL,
  PRIMARY KEY  (State_Number)
) AS
	SELECT DISTINCT `State`
	FROM invoices
	WHERE `State` IS NOT NULL
	ORDER BY `State`;

ALTER TABLE invoices


 ADD COLUMN State_Number INT(11);

UPDATE invoices
	INNER JOIN State_Number
	ON State_Number.State = invoices.State
	SET invoices.State_Number = State_Number.State_Number
	WHERE State_Number.State IS NOT NULL;


SELECT  iv.State, iv.State_Number, ci.State
	FROM invoices AS iv
	JOIN State_Number AS ci
	ON ci.State_Number = iv.State_Number;

 ALTER TABLE invoices
	DROP COLUMN State;

