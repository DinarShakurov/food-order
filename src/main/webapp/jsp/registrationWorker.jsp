<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ru">
<head>

    <%@ include file="BootstrapConnection.jsp" %>

    <title>Registration Worker</title>
    <link rel="stylesheet" href="/css/style.css" type="text/css">
</head>
<body>
<%@ include file="header.jsp" %>

<div class="container">
    <form class="form-signin" method="post" action="/profile/admin/create-user">
        <%--ЕСЛИ БЫЛА ПОПЫТКА зарегестрироваться, выводит успешна ли она или нет--%>

        <c:if test="${registrCode == false}">
            <div class="alert alert-danger" role="alert">
                <c:out value="${registrStatus}"/>
            </div>
        </c:if>

        <c:if test="${registrCode == true}">
            <div class="alert alert-success" role="alert">
                <c:out value="${registrStatus}"/>
            </div>
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
               required="a">
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


<%@include file="BootstrapScripts.jsp" %>
</body>
</html>