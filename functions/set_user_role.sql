CREATE OR REPLACE FUNCTION set_user_role()
  RETURNS TRIGGER 
  LANGUAGE PLPGSQL  
AS $$
BEGIN
	 IF (NEW.correo LIKE '%est.ucab.edu.ve%') THEN
		NEW.role := 'EST';
	END IF;
	IF (NEW.correo LIKE '%admin%') THEN
		NEW.role := 'ADM';
	END IF;
	IF (NEW.correo LIKE '%ucab.edu.ve%') THEN
		NEW.role = 'PRO';
	END IF; 
	
	RETURN NEW;
END;
$$