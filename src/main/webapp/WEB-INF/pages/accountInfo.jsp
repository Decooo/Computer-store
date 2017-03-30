<%--
  Created by IntelliJ IDEA.
  User: Jakub
  Date: 29.03.2017
  Time: 21:30
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Konto</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style.css">
</head>
<body>
<jsp:include page="_header.jsp"/>
Informacje o koncie

<div class="account-container">


    <ul>
        <li>Nazwa użytkownika: ${pageContext.request.userPrincipal.name}</li>

    </ul>
</div>

<jsp:include page="_footer.jsp"/>
</body>
</html>
