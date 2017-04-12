create PROCEDURE GET_USER
  (
      U_USERNAME IN OUT VARCHAR2,
      U_ID OUT NUMBER
    , U_PASSWORD OUT VARCHAR2
    , U_CLIENTID OUT NUMBER
    , U_ROLE OUT varchar2
  ) AS
  BEGIN
    SELECT userID,username,password,clientID,userRole into u_id, u_username, u_password, u_clientID, u_role from users where username=u_username;

    EXCEPTION
    WHEN no_data_found THEN
    dbms_output.put_line('No such customer!');

  END GET_USER;