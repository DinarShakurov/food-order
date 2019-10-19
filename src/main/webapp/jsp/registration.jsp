<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ru">
<head>
    <title>Registration</title>

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <link rel="stylesheet" href="../css/style.css" type="text/css">
</head>
<body>
<c:set var="accessId" value="${sessionScope.accessId}"/>

<header>
    <nav class="navbar navbar-expand-lg fixed-top navbar-light bg-primary">
        <a class="navbar-brand" href="#">Restaurant</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown"
                aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="/main">Главная <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Меню</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Галерея</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Акция</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Отзывы</a>
                </li>

            </ul>
            <ul class="navbar-nav ml-auto">
                <c:if test="${accessId == null}">

                    <li class="nav-item">
                        <a class="nav-link" href="#">Зарегестрироваться</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Войти</a>
                    </li>
                </c:if>
                <c:if test="${accessId != null}">
                    <li class="nav-justified dropleft justify-content-end">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <c:out value="${sessionScope.username}"/>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">

                            <a class="dropdown-item" href="#">Профиль</a> <%--ALL--%>

                            <c:if test="${accessId == 2}">
                                <a class="dropdown-item" href="#">Корзина</a> <%--USER--%>
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

<div class="container">
    <form class="form-signin" method="post" action="/registration">
        <%--ЕСЛИ БЫЛА ПОПЫТКА зарегестрироваться, выводит успешна ли она или нет--%>
        <c:out value="${registrStatus}"/>

        <h2 class="form-signin-heading">Регистрация</h2>

        <label for="inputName" class="sr-only">Имя</label>
        <input type="text" id="inputName" class="form-control" placeholder="имя" required="" autofocus="">


        <label for="inputNumber" class="sr-only">Номер</label>
        <input type="number" id="inputNumber" class="form-control" placeholder="номер телефона" required="" autofocus="">

        <label for="inputEmail" class="sr-only">Почта</label>
        <input type="email" id="inputEmail" class="form-control" placeholder="email" required="" autofocus="">

        <label for="inputPassword" class="sr-only">Пароль</label>
        <input type="password" id="inputPassword" class="form-control" placeholder="пароль" required="a">

        <button class="btn btn-lg btn-outline-primary btn-block" type="submit">Отправить</button>
    </form>

</div>


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