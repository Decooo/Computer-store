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
<html>
<head>
    <title>Produkty</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style.css">

</head>
<body>

<jsp:include page="_header.jsp"/>
<jsp:include page="_menu.jsp"/>

<h1>Lista produktow</h1>

<c:if test="${not empty msg}">
    <div class=msgSuccess>${msg}</div>
</c:if>


<table border="1">
    <th>Zdjecie</th>
    <th>Nazwa</th>
    <th>Opis</th>
    <th>Kategoria</th>
    <th>Cena</th>

    <list:forEach var="product" items="${products}">
        <tr>
            <td><img src="${pageContext.request.contextPath}/productImage?id=${product.productID}"/></td>
            <td>${product.productName}</td>
            <td>${product.productDescription}</td>
            <td>${product.categoryID}</td>
            <td><fmt:formatNumber value="${product.productPrice}" type="currency"/></td>
        </tr>
    </list:forEach>
</table>


<jsp:include page="_footer.jsp"/>


</body>
</html>
