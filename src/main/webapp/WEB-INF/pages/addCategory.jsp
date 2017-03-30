<%--
  Created by IntelliJ IDEA.
  User: Jakub
  Date: 24.03.2017
  Time: 23:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Dodawanie kategorii</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style.css">
</head>
<body>
<jsp:include page="_header.jsp"/>
<jsp:include page="_menu.jsp"/>
<h1>Dodawanie kategorii</h1>

<form:form commandName="category" action="save" method="POST">

    Nazwa: <form:input path="categoryName"/><form:errors path="categoryName"/> <br/>
    Opis: <form:input path="categoryDescription"/><form:errors path="categoryDescription"/><br/>

    <form:button>Zapisz</form:button>
</form:form>

<jsp:include page="_footer.jsp"/>
</body>
</html>
