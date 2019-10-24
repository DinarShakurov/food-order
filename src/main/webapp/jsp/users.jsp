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

    <title>Users</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<%@ include file="header.jsp" %>

<table class="table basket">
    <thead>
    <tr>
    </tr>
    <tr>
        <th>Id</th>
        <th>Login</th>
        <th>Username</th>
        <th>Phone number</th>
        <th>Address</th>
        <th>Register date</th>
        <th>Role</th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <form>
        <c:set var="i" value="${1}"/>
        <c:forEach var="user" items="${userList}">
            <tr>
                <td><c:out value="${i}"/></td>
                <td>
                        <c:out value="${user.login}"/>
                <td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.phone_number}"/></td>
                <td><c:out value="${user.address}"/></td>
                <td><c:out value="${user.date}"/></td>
                <td><c:out value="${user.role}"/></td>
                <c:if test="${user.role != 2 && sessionScope.user.id!=user.id}">
                    <td>
                        <button type="submit" class="btn btn-sm btn-outline-danger">Удалить</button>
                    </td>
                </c:if>
            </tr>
        </c:forEach>
    </form>

    </tbody>
    <tfoot>
    <tr>
        <form method="post" action="/basket">
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td>
                <button value="add" type="submit" class="btn btn-sm btn-success">Добавить работника
                </button>
            </td>
        </form>
    </tr>
    </tfoot>

</table>

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
