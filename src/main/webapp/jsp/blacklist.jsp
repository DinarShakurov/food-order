<%@ page import="ru.itis.web_project.utils.permissions.PermissionUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>--%>
<html lang="ru">
<head>
    <%@include file="BootstrapConnection.jsp" %>

    <title>Черный список блюд</title>
    <link rel="stylesheet" href="/css/menu.css">
</head>

<body>
<c:set var="accessId" value="${sessionScope.user.role}"/>

<%@ include file="header.jsp" %>

<div class="menu">
    <h1>Черный список блюд</h1>
    <c:if test="${blacklist!=null}">
    <form action="/profile/user/blacklist" method="post">
        <button name="deleteAll" value="deleteAll" type="submit"
                class="btn btn-sm btn-outline-success">
            Отчистить весь список
        </button>
    </form>
    <div class="album py-5">
        <div class="container">
            <div class="row">
                    <%--foreach--%>
                <c:forEach items="${blacklist}" var="dish">
                    <form action="/profile/user/blacklist" method="post">
                        <div class="card mb-4 shadow-sm">
                            <img src="../../../image/<c:out value="${dish.fileName}"/>">
                            <div class="card-body">
                                <p class="card-text">Название: ${dish.name}</p>
                                <p class="card-text">Инфа о блюде: ${dish.composition}</p>
                                <br>
                                <div class="d-flex justify-content-between align-items-center">
                                    <small class="text-muted">цена: ${dish.price}</small>
                                    <div>
                                        <input name="id_count_menu" type="number" min="1" max="10" step="1"
                                               value="1"
                                               pattern="[0-9]*">

                                        <input name="id_menu" value="${dish.id}" type="hidden">
                                        <br>
                                    </div>
                                </div>
                                <button name="delete" value="delete" type="submit"
                                        class="btn btn-sm btn-outline-success">
                                    Удалить из черного списка
                                </button>
                            </div>
                        </div>
                    </form>
                </c:forEach>
            </div>
        </div>
    </div>
    </c:if>
    <%@include file="BootstrapScripts.jsp" %>
</body>
</html>
