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

    <title>Basket</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
<%@ include file="header.jsp" %>

<table class="table basket">
    <thead>
    <tr>
    </tr>
    <tr>
        <th>#</th>
        <th>Название</th>
        <th>Цена</th>
        <th>Количество</th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <c:set var="i" value="${1}"/>
    <c:forEach var="order" items="${sessionScope.orderDeliveryList}">
        <form action="/profile/basket" method="post">
            <tr>

                <td><c:out value="${i}"/></td>
                <td class="name"><c:out value="${order.name_dish}"/></td>

                <td><c:out value="${order.price}"/></td>
                <td><c:out value="${order.count_id_menu}"/></td>

                <td>
                    <button type="submit" class="btn btn-sm btn-outline-danger">Удалить</button>
                </td>
                <td><input type="hidden" name="deleted_count_id" value="${order.count_id_menu}"></td>
                <td><input type="hidden" name="deleted_id" value="${order.id_menu}"></td>
            </tr>
        </form>
        <c:set var="i" value="${i+1}"/>
    </c:forEach>

    </tbody>
    <tfoot>
    <tr>
        <form method="post" action="/profile/basket">
            <td></td>
            <td></td>
            <td></td>
            <td>Итого:
                <c:out value="${sessionScope.totalPriceFromBasket}"/></td>
            <td>
                <button name="buyAll" value="buyAll" type="submit" class="btn btn-sm btn-success">Заказать
                </button>
            </td>
        </form>
    </tr>
    </tfoot>

</table>

<c:if test="${buyStatus != null}">
    <div class="alert alert-success basket" role="alert">
        <c:out value="${buyStatus}"/>
    </div>
</c:if>

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
