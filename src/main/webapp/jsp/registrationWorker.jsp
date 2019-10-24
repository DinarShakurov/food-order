<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ru">
<head>
    <title>Registration Worker</title>

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <link rel="stylesheet" href="/css/style.css" type="text/css">
</head>
<body>
<%@ include file="header.jsp" %>

<div class="container">
    <form class="form-signin" method="post" action="/profile/admin/create-user">
        <%--ЕСЛИ БЫЛА ПОПЫТКА зарегестрироваться, выводит успешна ли она или нет--%>


        <c:out value="${registrStatus}"/>

        <h2 class="form-signin-heading">Регистрация</h2>
        <br>

        <label for="inputName" class="sr-only">Имя</label>
        <input name="username" type="text" id="inputName" class="form-control" placeholder="имя" required="" autofocus="">
        <br>

        <label for="inputNumber" class="sr-only">Номер</label>
        <input name="phoneNumber" type="number" id="inputNumber" class="form-control" placeholder="номер телефона" required=""
               autofocus="">
        <br>

        <label for="inputAddress" class="sr-only">Адрес</label>
        <input name="address" type="text" id="inputAddress" class="form-control" placeholder="адрес" required=""
               autofocus="">
        <br>

        <label for="inputEmail" class="sr-only">Почта</label>
        <input name="login" type="email" id="inputEmail" class="form-control" placeholder="email" required="" autofocus="">
        <br>

        <label for="inputPassword" class="sr-only">Пароль</label>
        <input name="password" type="password" id="inputPassword" class="form-control" placeholder="пароль" required="a">
        <br>


        <div class="form-row align-items-center">
            <div class="col-auto my-1">
                <label class="mr-sm-2 sr-only" for="inlineFormCustomSelect">Preference</label>
                <select name="role" class="custom-select mr-sm-2" id="inlineFormCustomSelect">
                    <option selected>Выбрать</option>
                    <option value="Admin">Администратор</option>
                    <option value="Waiter">ОФициант</option>
                    <option value="Kitchen">Повар</option>
                </select>
            </div>
        </div>
        <br>

        <button class="btn btn-lg btn-success btn-block" type="submit">Отправить</button>
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