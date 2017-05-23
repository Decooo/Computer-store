<%--
  Created by IntelliJ IDEA.
  User: Jakub
  Date: 23.05.2017
  Time: 22:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="list" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Zamówienia</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style.css">

</head>
<body>
<jsp:include page="_header.jsp"/>
<jsp:include page="_menu.jsp"/>
<div class="main">
    <h1>Zamówienia</h1>

    <table border="1" align="center">
        <th>Numer zamowienia</th>
        <th>Data</th>
        <th>Nazwa zamawiajacego</th>
        <th>Kwota</th>
        <th>Szczegóły</th>

        <list:forEach var="order" items="${orders}" varStatus="loop">
            <tr>
                <td>${order.orderID}</td>
                <td><fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd"/></td>
                <td><list:forEach begin="${loop.index}" step="1" end="${loop.index}" var="user"
                                  items="${users}">${user.username}</list:forEach></td>
                <td><fmt:formatNumber value="${order.totalPrice}" type="currency"/></td>
                <td><input type="submit" value="Podgląd" onclick="location.href='details/${order.orderID}';"/></td>
            </tr>
        </list:forEach>
    </table>

</div>
<jsp:include page="_footer.jsp"/>

</body>
</html>
