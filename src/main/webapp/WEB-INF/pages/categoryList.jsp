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
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Lista Kategorii </title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style.css">
</head>
<body>
<jsp:include page="_header.jsp"/>
<jsp:include page="_menu.jsp"/>

<h1>Lista kategorii</h1>

<c:if test="${not empty msg}">
    <div class=msgSuccess>${msg}</div>
</c:if>

<input type="submit" value="Dodaj kategorie" onclick="location.href='add'"/><input type="submit" value="Odswiez"
                                                                                   onclick="location.href='view'"/>

<table border="1">
    <th>ID</th>
    <th>Nazwa kategorii</th>
    <th>Opis kategorii</th>
    <th>Akcja</th>

    <list:forEach var="category" items="${categories}">
        <tr>
            <td>${category.categoryID}</td>
            <td>${category.categoryName}</td>
            <td>${category.categoryDescription}</td>
            <td><input type="submit" value="Edytuj" onclick="location.href='update/${category.categoryID}';"/><input
                    type="submit" value="Usun" onclick="location.href='delete/${category.categoryID}';"/></td>
        </tr>
    </list:forEach>
</table>

<jsp:include page="_footer.jsp"/>
</body>
</html>
