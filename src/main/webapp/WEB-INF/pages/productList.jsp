<%--
  Created by IntelliJ IDEA.
  User: Jakub
  Date: 27.04.2017
  Time: 21:19
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="list" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<html>
<head>
    <title>Produkty</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style.css">

</head>
<body>

<jsp:include page="_header.jsp"/>
<jsp:include page="_menu.jsp"/>
<div class="main">
<h1>Lista produktow</h1>

<c:if test="${not empty msg}">
    <div class=msgSuccess>${msg}</div>
</c:if>


<table border="1" align="center">
    <th>Zdjecie</th>
    <th>Nazwa</th>
    <th>Opis</th>
    <th>Kategoria</th>
    <th>Cena</th>
    <th>Akcja</th>


    <list:forEach var="product" items="${products}">
        <tr>
        <td><img src="/product/productImage?id=${product.productID}" width="100" height="100"/></td>
        <td>${product.productName}</td>
        <td>${product.productDescription}</td>
        <td>${product.categoryID}</td>
        <td><fmt:formatNumber value="${product.productPrice}" type="currency"/></td>
        <td>
            <input type="submit" value="Dodaj do koszyka" onclick="location.href='cart/${product.productID}';"/>
            <security:authorize access="hasAnyRole('ROLE_administrator')">
                <input type="submit" value="Edytuj" onclick="location.href='update/${product.productID}';"/><input
                    type="submit" value="Usun"
                    onclick="location.href='delete/${product.productID}';"/></security:authorize></td>
        </tr>
    </list:forEach>
</table>

</div>
<jsp:include page="_footer.jsp"/>


</body>
</html>
