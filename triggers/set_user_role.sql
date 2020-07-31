DROP TRIGGER IF EXISTS set_user_role;

CREATE TRIGGER set_user_role 
	BEFORE INSERT ON usuario 
	FOR EACH ROW
BEGIN

	IF (NEW.correo LIKE '%est%') THEN
		SET NEW.role = "EST";
	ELSEIF (NEW.correo LIKE "%admin%") THEN
		SET NEW.role = "ADM";
	ELSE 
		SET NEW.role = "PRO";
  END IF;
	 
END