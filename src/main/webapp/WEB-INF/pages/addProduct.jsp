<%--
  Created by IntelliJ IDEA.
  User: Jakub
  Date: 20.04.2017
  Time: 21:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Tworzenie produktu</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style.css">
</head>
<body>
<jsp:include page="_header.jsp"/>
<jsp:include page="_menu.jsp"/>
<div class="main">
<h1>Tworzenie nowego produktu</h1>

<c:if test="${not empty msg}">
    <div class=${css}>${msg}</div>
</c:if>


<form:form commandName="product" action="save" method="POST" enctype="multipart/form-data">
    Nazwa: <form:input path="productName"/><form:errors path="productName"/> <br/><br/>
    Opis: <form:input path="productDescription"/><form:errors path="productDescription"/><br/><br/>
    Cena: <form:input path="productPrice"/><form:errors path="productPrice"/><br/><br/>
    Kategoria: <form:select path="categoryID"><form:options items="${categoryID}" itemValue="categoryID"
                                                            itemLabel="categoryName"/> </form:select> <form:errors
        path="categoryID"/><br/><br/>

    Zdjecie: <input type="file" name="file"/><br/><br/>

    <form:button >Stworz produkt</form:button>
</form:form>



</div>
<jsp:include page="_footer.jsp"/>
</body>
</html>
