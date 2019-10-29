<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ru">
<head>

    <%@include file="BootstrapConnection.jsp" %>

    <title>Reviews</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<%@ include file="header.jsp" %>

<table class="table basket">
    <tbody>
    <tr>
        <form>
            <td><input name="text" type="number" id="inputMark" class="form-control" placeholder="оценка" required=""
                       min="1" max="10" step="1" autofocus=""></td>
            <td>
                <input name="text" type="text" id="inputText" class="form-control" placeholder="отзыв" required=""
                       autofocus=""></td>
            <td>
                <button type="submit" class="btn btn-sm btn-success">Добавить отзыв
                </button>
            </td>
        </form>
    </tr>
    </tbody>
</table>

<table class="table basket">
    <thead>
    <tr>
        <th>Имя пользователя</th>
        <th>Отзыв</th>
        <th>Оценка</th>
    </tr>
    </thead>
    <tbody>

    <tr>
        <td>Имя</td>
        <td>Это самый лучший ресторан</td>
        <td>5</td>
    </tr>


    </tbody>
    <%--<tfoot>--%>
    <%--<tr>--%>
    <%--<form>--%>
    <%--<td><input name="text" type="number" id="inputMark" class="form-control" placeholder="оценка" required=""--%>
    <%--min="1" max="10" step="1" autofocus=""></td>--%>
    <%--<td>--%>
    <%--<input name="text" type="text" id="inputText" class="form-control" placeholder="отзыв" required=""--%>
    <%--autofocus=""></td>--%>
    <%--<td>--%>
    <%--<button type="submit" class="btn btn-sm btn-success">Добавить отзыв--%>
    <%--</button>--%>
    <%--</td>--%>
    <%--</form>--%>
    <%--</tr>--%>
    <%--</tfoot>--%>

</table>

<%@include file="BootstrapScripts.jsp" %>
</body>
</html>
