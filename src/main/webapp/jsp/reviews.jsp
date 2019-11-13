<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<html lang="ru">
<head>

    <%@include file="BootstrapConnection.jsp" %>

    <title>Reviews</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<%@ include file="header.jsp" %>

<h3 class="rating">
    Средний рейтинг: <c:out value="${requestScope.reviewRating}"/>
</h3>

<%
    if (permissionList != null && PermissionUtil.haveAccess("makeReview", permissionList)) {
%>
<table class="table basket">
    <tbody>
    <tr>
        <form action="/reviews" method="post">
            <td>
                <input name="mark" type="number" id="inputMark" class="form-control" placeholder="оценка" required=""
                       min="1" max="5" step="1" autofocus="">
            </td>
            <td>
                <input name="review" type="text" id="inputText" class="form-control" placeholder="отзыв" required=""
                       autofocus=""></td>
            <td>
                <button name="addReview" value="addReview" type="submit" class="btn btn-sm btn-success">
                    Добавить отзыв
                </button>
            </td>
        </form>
    </tr>
    </tbody>
</table>
<%
    }
%>

<table class="table basket">
    <thead>
    <tr>
        <th>Имя пользователя</th>
        <th>Отзыв</th>
        <th>Оценка</th>
        <th>Дата</th>
    </tr>
    </thead>
    <tbody>
    <%--    <%--%>
    <%--        for (int i = 0; i <; i++) {--%>
    <%--    %>--%>

    <tag:reviewsTag></tag:reviewsTag>
    <%--    <%--%>
    <%--        }--%>
    <%--    %>--%>


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
