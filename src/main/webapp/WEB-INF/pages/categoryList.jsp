<%--
  Created by IntelliJ IDEA.
  User: Jakub
  Date: 23.03.2017
  Time: 12:55
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="list" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lista Kategorii</title>
</head>
<body>
<h1>Lista kategorii</h1>

<table border="1">
    <th>CategoryID</th>
    <th>CategoryName</th>
    <th>CategoryDescription</th>
    <list:forEach items="%{category}" var="cat">
        <tr>
            <td>%{category.categoryID}</td>
            <td>%{category.categoryName}</td>
            <td>%{category.categoryDescription}</td>
        </tr>
    </list:forEach>
</table>

</body>
</html>
