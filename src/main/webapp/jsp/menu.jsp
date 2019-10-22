<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ru">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <title>Menu</title>
    <link rel="stylesheet" href="../css/menu.css">
</head>

<body>
<c:set var="accessId" value="${sessionScope.user.role}"/>

<%@ include file="header.jsp"%>

<div class="menu">
    <h1>Меню</h1>
    <div class="album py-5">
        <div class="container">
            <%--foreach--%>
            <c:forEach var="dish" items="${menuList}">
                <form method="post" action="/menu">
                    <div class="row">

                        <div class="col-md-4">
                            <div class="card mb-4 shadow-sm">
                                <img src="image/soup.png">
                                <div class="card-body">
                                    <p class="card-text">Название: ${dish.name}</p>
                                    <p class="card-text">Инфа о блюде: ${dish.composition}</p>
                                    <br>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <small class="text-muted">цена: ${dish.price}</small>

                                        <div>
                                            <input name="id_count_menu" type="number" min="1" max="10" step="1" value="1" pattern="[0-9]*">
                                            <input name="id_menu" value="${dish.id}" type="hidden">
                                        </div>
                                        <br>
                                        <div class="btn-group">
                                            <c:if test="${accessId == 2}">
                                                <button name="add" value="add" type="submit" class="btn btn-sm btn-outline-secondary">
                                                    Добавить
                                                </button>
                                            </c:if>
                                            <c:if test="${accessId == 1}">
                                                <button name="delete" value="delete" type="submit" class="btn btn-sm btn-outline-secondary">
                                                    Удалить
                                                </button>
                                            </c:if>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </c:forEach>
        </div>
    </div>
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
