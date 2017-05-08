<%--
  Created by IntelliJ IDEA.
  User: Jakub
  Date: 19.04.2017
  Time: 21:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="list" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Koszyk</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style.css">

</head>
<body>
<jsp:include page="_header.jsp"/>
<jsp:include page="_menu.jsp"/>
<h1>Koszyk</h1>


<table border="1">
    <th>Produkt</th>
    <th>Ilosc</th>
    <th>Cena</th>


    <list:forEach var="cart" items="${carts}">
        <tr>
            <td><a href="/cart/productName?id=${cart.productID}" />${cart.productID}</td>
            <td>${cart.quantity}</td>
            <td><fmt:formatNumber value="${cart.totalPrice}" type="currency"/></td>
            <td><input type="submit" value="Usun" onclick="location.href='delete/${cart.cartID}';"/></td>
        </tr>
    </list:forEach>
</table>

<jsp:include page="_footer.jsp"/>

</body>
</html>