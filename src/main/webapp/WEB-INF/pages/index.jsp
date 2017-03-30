<%@taglib prefix="list" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sklep komputerowy</title>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style.css">

</head>

<body>
<jsp:include page="_header.jsp"/>

<h2>Sklep komputerowy</h2>

<h1>Lista kategorii</h1>

<table border="1">
    <th>CategoryID</th>
    <th>CategoryName</th>
    <th>CategoryDescription</th>

</table>

<jsp:include page="_footer.jsp"/>

</body>
</html>
