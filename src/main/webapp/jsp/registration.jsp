<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ru">
<head>
    <%@include file="BootstrapConnection.jsp" %>

    <title>Registration</title>
    <link rel="stylesheet" href="/css/style.css" type="text/css">
</head>
<body>
<%@ include file="header.jsp" %>

<div class="container">
    <form class="form-signin" method="post" action="/registration">
        <%--ЕСЛИ БЫЛА ПОПЫТКА зарегестрироваться, выводит успешна ли она или нет--%>
        <c:if test="${registrStatus!=null}">
            <c:out value="${registrStatus}"/>
        </c:if>

        <h2 class="form-signin-heading">Регистрация</h2>
        <br>

        <label for="inputName" class="sr-only">Имя</label>
        <input name="username" type="text" id="inputName" class="form-control" placeholder="имя" required=""
               autofocus="">
        <br>

        <label for="inputNumber" class="sr-only">Номер</label>
        <input name="phoneNumber" type="number" id="inputNumber" class="form-control" placeholder="номер телефона"
               required=""
               autofocus="">
        <br>

        <label for="inputAddress" class="sr-only">Адрес</label>
        <input name="address" type="text" id="inputAddress" class="form-control" placeholder="адрес" required=""
               autofocus="">
        <br>

        <label for="inputEmail" class="sr-only">Почта</label>
        <input name="login" type="email" id="inputEmail" class="form-control" placeholder="email" required=""
               autofocus="">
        <br>

        <label for="inputPassword" class="sr-only">Пароль</label>
        <input name="password" type="password" id="inputPassword" class="form-control" placeholder="пароль"
               required="">
        <br>

        <button class="btn btn-lg btn-success btn-block" type="submit">Отправить</button>
    </form>

</div>


<%@include file="BootstrapScripts.jsp" %>
</body>
</html>