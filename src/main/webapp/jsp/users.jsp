<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ru">
<head>
    <%@include file="BootstrapConnection.jsp" %>

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
    <form method="post" action="/profile/admin/all-users">
        <c:set var="i" value="${1}"/>
        <c:forEach var="user" items="${userList}">
            <tr>
                <td><c:out value="${i}"/></td>
                <td>
                    <c:out value="${user.login}"/>
                </td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.phone_number}"/></td>
                <td><c:out value="${user.address}"/></td>
                <td><c:out value="${user.date}"/></td>
                <td><c:out value="${user.role}"/></td>

                <c:if test="${user.role != 2 && sessionScope.user.id!=user.id}">
                    <td>
                        <button name="deleteUser" value="delete" type="submit" class="btn btn-sm btn-outline-danger">
                            Удалить
                        </button>
                    </td>
                    <td><input type="hidden" name="deleted_id" value="${user.id}"></td>
                </c:if>

            </tr>
        </c:forEach>
    </form>

    </tbody>
    <tfoot>
    <tr>
        <form method="get" action="/profile/admin/create-user">
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

<%@include file="BootstrapScripts.jsp" %>
</body>
</html>
