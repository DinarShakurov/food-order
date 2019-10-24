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

    <title>Role rights</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<%@ include file="header.jsp" %>

<table class="table basket">
    <thead>
    <tr>
    </tr>
    <tr>
        <th>Роль</th>
        <th>Добавить</th>
        <th>Права</th>

    </tr>
    </thead>
    <tbody>
        <form method="post" action="/profile/admin/all-users">
                <tr>
                    <td>Администартор</td>
                    <td>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                            <label class="form-check-label" for="defaultCheck1">
                                Право 1
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="defaultCheck2">
                            <label class="form-check-label" for="defaultCheck2">
                                Право 2
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="defaultCheck3">
                            <label class="form-check-label" for="defaultCheck2">
                                Право 3
                            </label>
                        </div>
                        <button name="AddRights" value="add" type="submit" class="btn btn-sm btn-success">
                            Добавить
                        </button>
                    </td>
                    <td>Список прав</td>
                </tr>
        </form>
    </tbody>

</table>