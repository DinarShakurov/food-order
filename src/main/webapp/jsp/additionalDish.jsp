<%@ page import="ru.itis.web_project.utils.permissions.PermissionUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>--%>
<html lang="ru">
<head>
    <%@include file="BootstrapConnection.jsp" %>

    <title>Добавить в заказ</title>
    <link rel="stylesheet" href="/css/menu.css">
</head>

<body>
<c:set var="accessId" value="${sessionScope.user.role}"/>

<%@ include file="header.jsp" %>

<div class="menu">
    <h1>С вашему блюдами часто заказывают:</h1>
    <c:if test="${addingStatus != null}">
    <h6>${addingStatus}</h6>
    </c:if>

    <div class="album py-5">
        <div class="container">
            <div class="row">
                <%--foreach--%>
                <c:forEach items="${dishListForOffer}" var="dish">
                    <form method="post" action="/profile/user/basket/offer">
                        <div class="card mb-4 shadow-sm">
                            <img src="../image/dish.jpg">
                            <div class="card-body">
                                <p class="card-text">Название:${dish.name} </p>
                                <p class="card-text">Инфа о блюде:${dish.composition} </p>
                                <br>
                                <div class="d-flex justify-content-between align-items-center">
                                    <small class="text-muted">Цена: ${dish.price}</small>
                                    <div>
                                        <input name="id_count_menu" type="number" min="1" max="10" step="1"
                                               value="1"
                                               pattern="[0-9]*">

                                        <input name="id_menu" value="${dish.id}" type="hidden">
                                        <br>
                                    </div>
                                </div>
                                <button name="add" value="add" type="submit"
                                        class="btn btn-sm btn-outline-success">
                                    Добавить в заказ
                                </button>
                                <button name="delete" value="delete" type="submit"
                                        class="btn btn-sm btn-outline-danger">
                                    Никогда не предлагать
                                </button>
                            </div>
                        </div>
                    </form>
                </c:forEach>
            </div>
        </div>
    </div>
    <form action="/profile/user/basket" method="post">
        <button name="buy" value="buy" type="submit"
                class="btn btn-sm btn-outline-success">
            Заказать
        </button>
    </form>
    <%@include file="BootstrapScripts.jsp" %>
</body>
</html>