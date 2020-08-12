
DROP TRIGGER IF EXISTS set_user_role_trigger ON usuario;

CREATE TRIGGER set_user_role_trigger 
BEFORE INSERT 
ON usuario FOR EACH ROW 
EXECUTE PROCEDURE set_user_role();
