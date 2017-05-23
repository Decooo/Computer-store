<%--
  Created by IntelliJ IDEA.
  User: Jakub
  Date: 23.05.2017
  Time: 23:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="list" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Szczegóły zamówienia</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style.css">

</head>
<body>
<jsp:include page="_header.jsp"/>
<jsp:include page="_menu.jsp"/>
<div class="main">
    <h1>Szczegóły zamówienia</h1>

    <table border="1" align="center">
        <th>Numer zamowienia</th>
        <th>Nazwa produktu</th>
        <th>Ilość</th>
        <th>Cena za sztuke</th>

        <list:forEach var="orderDetail" items="${orderDetails}" varStatus="loop">
            <tr>
                <td>${orderDetail.orderID}</td>
                <td><list:forEach begin="${loop.index}" step="1" end="${loop.index}" var="product"
                                  items="${products}">${product.productName}</list:forEach></td>
                <td>${orderDetail.quantity}</td>
                <td><fmt:formatNumber value="${orderDetail.price}" type="currency"/></td>
            </tr>
        </list:forEach>
    </table>

    <input type="submit" value="Powrot" onclick="location.href='/orders/list'"/>

</div>
<jsp:include page="_footer.jsp"/>

</body>
</html>
