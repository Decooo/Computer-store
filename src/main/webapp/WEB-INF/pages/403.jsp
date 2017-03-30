<%--
  Created by IntelliJ IDEA.
  User: Jakub
  Date: 29.03.2017
  Time: 21:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>403</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles.css">
</head>
<body>
<jsp:include page="_header.jsp"/>
<jsp:include page="_menu.jsp"/>

Błąd 403

<h3 style="color: red">Nie masz dostępu do tej strony!</h3>

<jsp:include page="_footer.jsp"/>
</body>
</html>
