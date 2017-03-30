<%--
  Created by IntelliJ IDEA.
  User: Jakub
  Date: 29.03.2017
  Time: 21:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Logowanie</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style.css">
</head>
<body>
<jsp:include page="_header.jsp"/>

Formularz logowania

<div class="login">
    Podaj login i hasło użytkownika:
    <br/>
    <c:if test="${param.error == 'true'}">
        <div style="color: red; margin: 10px 0px;">

            Login Failed!!!<br /> Reason :
                ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}

        </div>
    </c:if>

    <form method="post" action="${pageContext.request.contextPath}/j_spring_security_check" role="form">
        <table>
            <tr>
                <td>Nazwa użytkownika:</td>
                <td><input type="text" name="username"/></td>
            </tr>

            <tr>
                <td>Hasło:</td>
                <td><input type="password" name="password"/></td>
            </tr>

            <tr>
                <td>&nbsp;</td>
                <td><input type="submit" value="Zaloguj"></td>
            </tr>

        </table>
    </form>
</div>

<jsp:include page="_footer.jsp" />
</body>
</html>
