create FUNCTION amount(
      c_userID in cart.userID%type,
      c_totalPrice OUT cart.totalPrice%type)
    RETURN Number
  AS
    myresult NUMBER;
    CURSOR kursor
    IS
      SELECT quantity*totalPrice FROM cart WHERE userID=23;
  BEGIN

    OPEN kursor;
    LOOP
      FETCH kursor INTO c_totalPrice;
      myresult:=myresult+c_totalPrice;
      dbms_output.put_line(myresult);
      EXIT
    WHEN kursor%notfound;
    END LOOP;
    CLOSE kursor;
    RETURN myresult;
  END amount;