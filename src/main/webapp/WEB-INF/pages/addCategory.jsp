<%--
  Created by IntelliJ IDEA.
  User: Jakub
  Date: 24.03.2017
  Time: 23:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Dodawanie kategorii</title>
</head>
<body>
<h1>Dodawanie kategorii</h1>

<form:form commandName="category" action="save" method="POST">

    <form:input path="categoryName"/><br/>
    <form:input path="categoryDescription"/><br/>

    <form:button>Zapisz</form:button>
</form:form>

</body>
</html>
