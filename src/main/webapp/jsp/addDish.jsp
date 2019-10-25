<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ru">
<head>

    <%@include file="BootstrapConnection.jsp" %>

    <title>Add dish</title>
    <link rel="stylesheet" href="/css/style.css" type="text/css">
</head>
<body>
<%@ include file="header.jsp" %>

<div class="container">
    <form>

        <h2 class="form-signin-heading">Добавление блюда</h2>
        <br>

        <label for="dishName" class="sr-only">Название</label>
        <input name="dishName" type="text" id="dishName" class="form-control" placeholder="имя" required=""
               autofocus="">
        <br>

        <label for="inputPrice" class="sr-only">Цена</label>
        <input name="price" type="number" id="inputPrice" class="form-control" placeholder="цена"
               required=""
               autofocus="">
        <br>

        <label for="inputInfo" class="sr-only">Описание</label>
        <input name="info" type="text" id="inputInfo" class="form-control" placeholder="описание" required=""
               autofocus="">
        <br>

        <label for="inputPhoto" class="sr-only">Фото</label>
        <input name="photo" type="file" id="inputPhoto" class="form-control" placeholder="фото"
               required="">
        <br>

        <button class="btn btn-lg btn-success btn-block" type="submit">Отправить</button>
    </form>

</div>


<%@include file="BootstrapScripts.jsp" %>
</body>
</html>