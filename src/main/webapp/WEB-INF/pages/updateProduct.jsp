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
    <title>Aktualizowanie produktu</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style.css">

</head>
<body>
<jsp:include page="_header.jsp"/>
<jsp:include page="_menu.jsp"/>
<h1>Aktualizowanie produktu</h1>

<c:if test="${not empty msg}">
    <div class=${css}>${msg}</div>
</c:if>

<form:form action="/product/saveupdate" modelAttribute="updateProduct" method="POST" enctype="multipart/form-data">
    <form:hidden path="productID"/><br/>
    Nazwa: <form:input path="productName"/><form:errors path="productName"/> <br/>
    Opis: <form:input path="productDescription"/><form:errors path="productDescription"/><br/>
    Cena: <form:input path="productPrice"/><form:errors path="productPrice"/><br/>
    Kategoria: <form:select path="categoryID"><form:options items="${categoryID}" itemValue="categoryID"
                                                            itemLabel="categoryName"/> </form:select> <form:errors
        path="categoryID"/><br/>

    Zdjecie: <input type="file" name="file"/><br/>


    <form:button>Aktualizuj</form:button>
</form:form>
<input type="submit" value="Powrot" onclick="location.href='/product/list'"/>

<jsp:include page="_footer.jsp"/>

</body>
</html>
