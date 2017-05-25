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
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<html>
<head>
    <title>Koszyk</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style.css">

</head>
<body>
<jsp:include page="_header.jsp"/>
<jsp:include page="_menu.jsp"/>
<div class="main">
<h1>Koszyk</h1>


<table border="1" align="center">
    <th>Nazwa produktu</th>
    <th>Ilosc</th>
    <th>Cena za sztuke</th>
    <th>Ilosc sztuk</th>
    <th>Usuwanie</th>

    <list:forEach var="cart" items="${carts}" varStatus="loop">
        <tr>
            <td><list:forEach begin="${loop.index}" step="1" end="${loop.index}" var="product"
                              items="${products}">${product.productName}</list:forEach></td>
            <td>${cart.quantity}</td>
            <td><fmt:formatNumber value="${cart.totalPrice}" type="currency"/></td>
            <td><a href="/cart/reduceQuantity?id=${cart.cartID}"><button> - </button></a><a href="/cart/addQuantity?id=${cart.cartID}"><button> + </button></a></td>
            <td><input type="submit" value="Usun" onclick="location.href='delete/${cart.cartID}';"/></td>
        </tr>
    </list:forEach>
</table>

</div>

<div class="price">
Kwota: <fmt:formatNumber value="${amount}" type="currency"/><br/>
Rabat: <fmt:formatNumber value="${rebate}" type="currency"/><br/><br/>

Kwota końcowa: <fmt:formatNumber value="${finalAmount}" type="currency"/><br/><br/>

<form:form commandName="carts" action="order" method="POST">
    <form:button >Złóż zamówienie</form:button>
</form:form>
</div>
<jsp:include page="_footer.jsp"/>

</body>
</html>