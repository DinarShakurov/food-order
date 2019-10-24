<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ru">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Login</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <link rel="stylesheet" href="../css/style.css">
</head>

<body>
<%@ include file="header.jsp" %>

<div class="container">
    <form class="form" method="post" action="/login">


        <h2 class="form-heading">Войти</h2>
        <br>

        <label for="inputEmail" class="sr-only">Почта</label>
        <input name="login" type="email" id="inputEmail" class="form-control" placeholder="user@mail.ru" required=""
               autofocus="">
        <br>

        <label for="inputPassword" class="sr-only">Пароль</label>
        <input name="password" type="password" id="inputPassword" class="form-control" placeholder="password"
               required="">

        <div class="checkbox">
            <label>
                <input name="remember" type="checkbox" value="remember-me"> Запомнить меня
            </label>
        </div>
        <button class="btn btn-lg btn-success btn-block" type="submit">Отправить</button>
        <div>
            Первый раз? <a href="/registration" class="link" style="color: aqua">Зарегистрируйся</a>.
        </div>

        <c:if test="${loginStatus != null}">
            <div class="alert alert-danger login" role="alert">
                <c:out value="${loginStatus}"/>
            </div>
        </c:if>

    </form>
</div> <!-- /container -->


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