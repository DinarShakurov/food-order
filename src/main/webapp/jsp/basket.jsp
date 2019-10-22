<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ru">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <title>Profile</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
<c:set var="accessId" value="${sessionScope.user.role}"/>

<header>
    <nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-primary">
        <a class="navbar-brand" href="#">Restaurant</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown"
                aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/main">Главная <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/menu">Меню</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Галерея</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Акции</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Отзывы</a>
                </li>

            </ul>
            <ul class="navbar-nav ml-auto">
                <c:if test="${accessId == null}">

                    <li class="nav-item">
                        <a class="nav-link" href="/registration">Зарегестрироваться</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/login">Войти</a>
                    </li>
                </c:if>
                <c:if test="${accessId != null}">
                    <li class="nav-justified dropleft justify-content-end">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <c:out value="${sessionScope.user.name}"/>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">

                            <a class="dropdown-item active" href="/profile">Профиль</a> <%--ALL--%>

                            <c:if test="${accessId == 2}">
                                <a class="dropdown-item" href="/basket">Корзина</a> <%--USER--%>
                            </c:if>
                            <c:if test="${accessId == 1}">
                                <a class="dropdown-item" href="#">Администрирование меню</a> <%--ADMIN--%>
                            </c:if>
                            <c:if test="${accessId == 1}">
                                <a class="dropdown-item" href="#">Клиенты/работники</a> <%--ADMIN--%>
                            </c:if>
                            <c:if test="${accessId == 1 || accessId == 4}">
                                <a class="dropdown-item" href="#">Посмотреть заказы</a> <%--ADMIN, KITCHEN--%>
                            </c:if>
                            <c:if test="${accessId == 1 || accessId == 3}">
                                <a class="dropdown-item" href="#">Посмотреть столы </a> <%--ADMIN, WAITER--%>
                            </c:if>
                            <hr>
                            <a class="dropdown-item" href="/exit">Выйти</a> <%--ALL--%>
                        </div>
                    </li>
                </c:if>
            </ul>

        </div>
    </nav>
</header>

<form>
    <table class="table basket">
        <thead>
        <tr>
        </tr>
        <tr>
            <th>#</th>
            <th>Название</th>
            <th>Цена</th>
            <th>Количество</th>
            <th></th>
        </tr>
        </thead>
        <tbody>

        <c:set var="i" value="${1}"/>
        <c:forEach var="order" items="${sessionScope.orderDeliveryList}">
            <form action="/basket" method="post">
                <tr>

                    <td><c:out value="i"/></td>
                    <td class="name"><c:out value="${order.name_dish}"/></td>

                    <td><c:out value="${order.price}"/></td>
                    <td><c:out value="${order.count_id_menu}"/></td>
                    <td><input type="hidden" name="deleted_count_id" value="${order.id_count_menu}"></td>
                    <td><input type="hidden" name="deleted_id" value="${order.id_menu}"></td>
                    <td>
                        <button type="button" class="btn btn-sm btn-outline-primary">Удалить</button>
                    </td>
                </tr>
            </form>
            <c:set var="i" value="${i+1}"/>
        </c:forEach>

        </tbody>
        <tfoot>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td>
                <c:out value="Итого:"/>
                <c:out value="${sessionScope.totalPriceFromBasket}"/>
            </td>
        </tr>
        </tfoot>
    </table>
</form>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
</body>
</html>
