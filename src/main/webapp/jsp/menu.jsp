<%@ page import="ru.itis.web_project.utils.permissions.PermissionUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<html lang="ru">
<head>
    <%@include file="BootstrapConnection.jsp" %>

    <title>Menu</title>
    <link rel="stylesheet" href="/css/menu.css">
</head>

<body>
<c:set var="accessId" value="${sessionScope.user.role}"/>

<%@ include file="header.jsp" %>

<div class="menu">
    <h1>Меню</h1>

    <c:if test="${addingStatus != null}">
        <div class="alert alert-success status" role="alert">
            <c:out value="${addingStatus}"/>
        </div>
    </c:if>

    <div class="album py-5">
        <div class="container">
            <div class="row">
                <%--<tag:menuTag permissionList="permissionList"></tag:menuTag>--%>
                <%--foreach--%>
                <c:forEach var="dish" items="${menuList}">
                    <form method="post" action="/menu">
                            <div class="card col-md-11">
                                <img src="../image/<c:out value="${dish.fileName}"/>">
                                <div class="card-body">
                                    <p class="card-text">Название: ${dish.name}</p>
                                    <p class="card-text">Инфа о блюде: ${dish.composition}</p>
                                    <br>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <small class="text-muted">цена: ${dish.price}</small>
                                        <div>
                                            <% if (permissionList != null && PermissionUtil.haveAccess("addToBasket", permissionList)) {%>
                                            <input name="id_count_menu" type="number" min="1" max="10" step="1"
                                                   value="1"
                                                   pattern="[0-9]*">
                                            <%}%>

                                            <input name="id_menu" value="${dish.id}" type="hidden">
                                        </div>
                                        <br>
                                    </div>
                                    <div class="btn-group">
                                        <% if (permissionList != null && PermissionUtil.haveAccess("addToBasket", permissionList)) {%>
                                        <button name="add" value="add" type="submit"
                                                class="btn btn-sm btn-outline-success">
                                            Добавить
                                        </button>
                                        <%}%>
                                        <% if (permissionList != null && PermissionUtil.haveAccess("removeDishFromMenu", permissionList)) {%>
                                        <button name="delete" value="delete" type="submit"
                                                class="btn btn-sm btn-outline-danger">
                                            Удалить
                                        </button>
                                        <%}%>
                                    </div>
                                </div>
                            </div>

                    </form>
                </c:forEach>
            </div>

        </div>
        <% if (permissionList != null && PermissionUtil.haveAccess("addDishToMenu", permissionList)) {%>
        <form method="get" action="/menu/add-dish">
            <button name="addDish" value="addDish" type="submit"
                    class="btn btn-lg btn-success">
                Добавить блюдо
            </button>
        </form>
        <%}%>
    </div>
</div>


<%@include file="BootstrapScripts.jsp" %>
</body>
</html>
