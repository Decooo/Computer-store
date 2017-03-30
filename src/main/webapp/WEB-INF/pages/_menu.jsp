<%--
  Created by IntelliJ IDEA.
  User: Jakub
  Date: 30.03.2017
  Time: 16:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
  

<div class="menu">
    <a href="${pageContext.request.contextPath}/">Strona główna</a>

    <security:authorize access="hasAnyRole('ROLE_administrator')">
        <a href="${pageContext.request.contextPath}/category/view">Kategorie</a>
    </security:authorize>


</div>