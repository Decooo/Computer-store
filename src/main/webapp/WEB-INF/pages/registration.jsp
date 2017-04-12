<%--
  Created by IntelliJ IDEA.
  User: Jakub
  Date: 06.04.2017
  Time: 22:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Rejestracja</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style.css">

</head>
<body>
<jsp:include page="_header.jsp"/>
<jsp:include page="_menu.jsp"/>

Rejestracja:<br/>

<form method="post" action="${pageContext.request.contextPath}save" role="form">
    <table>
        <tr>
            <td>Nazwa uzytkownika:</td>
            <td><input type="text" name="username"/></td>
        </tr>

        <tr>
            <td>Haslo:</td>
            <td><input type="text" name="password"/></td>
        </tr>

        <tr>
            <td>Imie:</td>
            <td><input type="text" name="firstName"/><form:errors path="firstName"/></td>
        </tr>

        <tr>
            <td>Nazwisko:</td>
            <td><input type="text" name="lastName"/><form:errors path="lastName"/></td>
        </tr>

        <tr>
            <td>email:</td>
            <td><input type="text" name="emailAddress"/><form:errors path="emailAddress"/></td>
        </tr>

        <tr>
            <td>Ulica:</td>
            <td><input type="text" name="street"/><form:errors path="street"/></td>
        </tr>

        <tr>
            <td>Numer domu:</td>
            <td><input type="text" name="numberHouse"/><form:errors path="numberHouse"/></td>
        </tr>

        <tr>
            <td>Kod pocztowy:</td>
            <td><input type="text" name="postCode"/><form:errors path="postCode"/></td>
        </tr>

        <tr>
            <td>Miejscowosc:</td>
            <td><input type="text" name="city"/><form:errors path="city"/></td>
        </tr>

        <tr>
            <td><input type="submit" value="Zarejestruj"></td>
        </tr>
    </table>
</form>

<jsp:include page="_footer.jsp"/>
</body>
</html>
