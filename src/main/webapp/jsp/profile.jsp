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
    <link rel="stylesheet" href="../css/profile.css">
</head>
<body>
<c:set var="accessId" value="${sessionScope.accessId}"/>

<header>
    <nav class="navbar navbar-expand-lg fixed-top navbar-light bg-light">
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
                            <c:out value="${sessionScope.username}"/>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">

                            <a class="dropdown-item active" href="/profile">Профиль</a> <%--ALL--%>

                            <c:if test="${accessId == 2}">
                                <a class="dropdown-item" href="#">Корзина</a>                   <%--USER--%>
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


<div class="container emp-profile">
    <%--<form method="post">--%>
    <div class="row">
        <div class="col-md-4">
            <div class="profile-img">
                <img src="/image/rest.png" alt=""/>
                <div class="file btn btn-lg btn-primary">
                    Изменить фото
                    <input type="file" name="file"/>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="profile-head">
                <h3>
                    Restaurant

                </h3>
                <h6>
                    ресторан бичёвской кухни
                </h6>
                <p class="proile-rating">Ваши бонусы: <span>2000</span></p>
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab"
                           aria-controls="home" aria-selected="true">Обо мне</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="history-tab" data-toggle="tab" href="#history" role="tab"
                           aria-controls="history" aria-selected="false">История</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab"
                           aria-controls="profile" aria-selected="false">Редактировать</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="password-tab" data-toggle="tab" href="#password" role="tab"
                           aria-controls="password" aria-selected="false">Изменить пароль</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-md-2">
            <form method="get" action="/exit">
                <input type="submit" class="profile-edit-btn" name="btnAddMore" value="Выйти"/>
            </form>
        </div>
    </div>
    <div class="row">
        <div class="col-md-8">
            <div class="tab-content profile-tab" id="myTabContent">
                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                    <div class="row">
                        <div class="col-md-6">
                            <label>Имя</label>
                        </div>
                        <div class="col-md-6">
                            <p>Иван</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <label>Email</label>
                        </div>
                        <div class="col-md-6">
                            <p>user@gmail.com</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <label>Номер телефона</label>
                        </div>
                        <div class="col-md-6">
                            <p>+799999</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <label>Статус</label>
                        </div>
                        <div class="col-md-6">
                            <p>Золотой</p>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade show" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                    <div class="row">
                        <div class="col-md-6 change-form">
                            <label for="inputName" class="sr-only">Имя</label>
                            <input type="text" id="inputName" class="form-control" placeholder="имя" required=""
                                   autofocus="" value="Иван">
                            <br>

                            <label for="inputNumber" class="sr-only">Номер</label>
                            <input type="number" id="inputNumber" class="form-control" placeholder="номер телефона"
                                   required="" autofocus="" value="79999">
                            <br>

                            <label for="inputEmail" class="sr-only">Почта</label>
                            <input type="email" id="inputEmail" class="form-control" placeholder="email" required=""
                                   autofocus="" value="user@mail.ru">
                            <br>
                        </div>
                        <div class="col-md-4 change-btn">
                            <button class="btn btn-lg btn-outline-primary btn-block" type="submit">Изменить</button>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade show" id="password" role="tabpanel" aria-labelledby="password-tab">
                    <div class="row">
                        <div class="col-md-6 change-form">
                            <label for="inputOldPassword" class="sr-only">Пароль</label>
                            <input type="password" id="inputOldPassword" class="form-control"
                                   placeholder="старый пароль"
                                   required="a">
                            <br>
                            <label for="inputNewPassword" class="sr-only">Пароль</label>
                            <input type="password" id="inputNewPassword" class="form-control" placeholder="новый пароль"
                                   required="a">
                            <br>
                        </div>

                        <div class="col-md-4 change-btn">
                            <button class="btn btn-lg btn-outline-primary btn-block" type="submit">Изменить</button>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade show orders col-md-12" id="history" role="tabpanel"
                     aria-labelledby="history-tab">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Список блюд</th>
                            <th>Цена</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th>1</th>
                            <td>Борщ, картофель фри</td>
                            <td>200 рублей</td>
                        </tr>
                        <tr>
                            <th>2</th>
                            <td>Бич пакет</td>
                            <td>2000 рублей</td>
                        </tr>
                        <tr>
                            <th>3</th>
                            <td>автомат по сетям</td>
                            <td>бесценно</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
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