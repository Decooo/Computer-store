<%--
  Created by IntelliJ IDEA.
  User: Jakub
  Date: 06.04.2017
  Time: 22:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>

    <title>Rejestracja</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style.css">

</head>
<jsp:include page="_header.jsp"/>
<jsp:include page="_menu.jsp"/>
    <div class="main">
<h1>Rejestracja</h1><br/>


<c:if test="${not empty msg}">
    <div class=${css}>${msg}</div>
</c:if>

<form:form commandName="registration" method="post" action="${pageContext.request.contextPath}save" role="form">
    <h3>Wprowadz swoje dane</h3>
        <table align="center">
        <tr>
            <td>Nazwa uzytkownika:</td>
            <td><input type="text" name="username"/></td>
                <%--  <td><form:errors path="username" name="username"/></td>--%>
        </tr>

        <tr>
            <td>Haslo:</td>
            <td><input type="text" name="password"/></td>
                <%--  <td><form:errors path="password" name="password"/></td> --%>
        </tr>

        <tr>
            <td>Imie:</td>
            <td><input type="text" name="firstName"/></td>
            <td><form:errors name="firstName"/></td>
        </tr>

        <tr>
            <td>Nazwisko:</td>
            <td><input type="text" name="lastName"/></td>
            <td><form:errors name="lastName"/></td>
        </tr>

        <tr>
            <td>email:</td>
            <td><input type="text" name="emailAddress"/></td>
            <td><form:errors name="emailAddress"/></td>
        </tr>

        <tr>
            <td>Ulica:</td>
            <td><input type="text" name="street"/></td>
            <td><form:errors  name="street"/></td>
        </tr>

        <tr>
            <td>Numer domu:</td>
            <td><input type="text" name="numberHouse"/></td>
            <td><form:errors  name="numberHouse"/></td>
        </tr>

        <tr>
            <td>Kod pocztowy:</td>
            <td><input type="text" name="postCode"/></td>
            <td><form:errors  name="postCode"/></td>
        </tr>

        <tr>
            <td>Miejscowosc:</td>
            <td><input type="text" name="city"/></td>
            <td><form:errors name="city"/></td>
        </tr>

        <tr>
            <td><input type="submit" value="Zarejestruj"></td>
        </tr>
    </table>

</form:form>
</div>
<jsp:include page="_footer.jsp"/>
</body>
</html>
