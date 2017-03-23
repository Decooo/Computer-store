<%@taglib prefix="list" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<h2>Hello in online Computer store --- - PAGES</h2>

<h1>Lista kategorii</h1>

<table border="1">
    <th>CategoryID</th>
    <th>CategoryName</th>
    <th>CategoryDescription</th>
    <list:forEach items="${category}" var="cat">
        <tr>
            <td>${cat.categoryID}</td>
            <td>${cat.categoryName}</td>
            <td>${cat.categoryDescription}</td>
        </tr>
    </list:forEach>
</table>
</body>
</html>
