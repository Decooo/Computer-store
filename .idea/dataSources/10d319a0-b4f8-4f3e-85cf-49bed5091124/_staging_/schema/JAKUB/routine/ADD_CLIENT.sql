CREATE PROCEDURE add_client
  (c_firstname    IN  client.firstname%TYPE,
   c_lastname     IN  client.lastname%TYPE,
   c_emailaddress IN  client.emailaddress%TYPE,
   c_street       IN  client.street%TYPE,
   c_numberhouse  IN  client.numberhouse%TYPE,
   c_postcode     IN  client.postcode%TYPE,
   c_city         IN  client.city%TYPE,
   c_clientID     OUT client.clientID%TYPE,
   u_username     IN  users.username%TYPE,
   u_password     IN  users.password%TYPE)
IS
  BEGIN
    INSERT INTO client (firstname, lastname, emailaddress, street, numberhouse, postcode, city)
    VALUES (c_firstname, c_lastname, c_emailaddress, c_street, c_numberhouse, c_postcode, c_city)
    RETURNING CLIENTID INTO c_clientID;

    INSERT INTO users (username, password, CLIENTID, USERROLE)
    VALUES (u_username, u_password, c_clientID, 'client');

  END;