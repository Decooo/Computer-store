<%--
  Created by IntelliJ IDEA.
  User: Jakub
  Date: 24.03.2017
  Time: 23:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Dodawanie kategorii</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style.css">
</head>
<body>
<jsp:include page="_header.jsp"/>
<jsp:include page="_menu.jsp"/>
<div class="main">
<h1>Dodawanie kategorii</h1>

<c:if test="${not empty msg}">
    <div class=${css}>${msg}</div>
</c:if>

<form:form commandName="category" action="save" method="POST">

    Nazwa: <form:input path="categoryName"/><form:errors path="categoryName"/> <br/>
    Opis: <form:textarea path="categoryDescription"/><form:errors path="categoryDescription"/><br/>

    <form:button>Zapisz</form:button>
</form:form>
<input type="submit" value="Powrot" onclick="location.href='view'"/>
</div>
<jsp:include page="_footer.jsp"/>
</body>
</html>
