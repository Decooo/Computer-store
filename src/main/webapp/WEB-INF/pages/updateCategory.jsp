<%--
  Created by IntelliJ IDEA.
  User: Jakub
  Date: 19.04.2017
  Time: 21:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Aktualizowanie kategorii</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style.css">

</head>
<body>
<jsp:include page="_header.jsp"/>
<jsp:include page="_menu.jsp"/>
<div class="main">
<h1>Aktualizowanie kategorii</h1>

<c:if test="${not empty msg}">
    <div class=${css}>${msg}</div>
</c:if>

<form:form action="/category/saveupdate" modelAttribute="updateCategory" method="POST">
    <form:hidden path="categoryID"/><br/>
    Nazwa: <form:input path="categoryName"/><form:errors path="categoryName"/> <br/><br/>
    Opis: <form:textarea path="categoryDescription"/><form:errors path="categoryDescription"/><br/><br/>

    <form:button>Aktualizuj</form:button>
</form:form>
<input type="submit" value="Powrot" onclick="location.href='/category/view'"/>

<jsp:include page="_footer.jsp"/>
</div>
</body>
</html>
