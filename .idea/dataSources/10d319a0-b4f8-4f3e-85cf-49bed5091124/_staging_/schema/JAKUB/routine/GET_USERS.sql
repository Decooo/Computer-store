create PROCEDURE GET_USERS
(
  U_USERNAME IN VARCHAR2,
 userr out USERS%ROWTYPE
) AS 
BEGIN
  SELECT * into userr from users where username=u_username;


END GET_USERS;