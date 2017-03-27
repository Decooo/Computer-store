create procedure addcategory
(c_categoryName IN varchar2, c_categoryDescription IN Varchar2)
IS
BEGIN
INSERT INTO category(categoryName,categoryDescription)
Values(c_categoryName,c_categoryDescription);

END addcategory;