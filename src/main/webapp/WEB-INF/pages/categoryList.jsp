<%--
  Created by IntelliJ IDEA.
  User: Jakub
  Date: 23.03.2017
  Time: 12:55
  To change this template use File | Settings | File Templates.
--%>
<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@taglib prefix="list" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Lista Kategorii -- -- PAGES</title>
</head>
<body>
<h1>Lista kategorii</h1>

<table border="1">
    <th>CategoryID</th>
    <th>CategoryName</th>
    <th>CategoryDescription</th>
    <list:forEach var="category" items="${categories}">
        <tr>
            <%--<td>${category.categoryID}</td>--%>
            <td>${category.categoryName}</td>
            <%--<td>${category.categoryDescription}</td>--%>
        </tr>
    </list:forEach>
</table>

</body>
</html>
