<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:set var="accessId" value="${sessionScope.user.role}"/>
<header>
    <nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
        <a class="navbar-brand" href="/main">Restaurant</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown"
                aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/main">Главная <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/menu">Меню</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Галерея</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Акция</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Отзывы</a>
                </li>

            </ul>
            <ul class="navbar-nav ml-auto">
                <c:if test="${accessId == null}">

                    <li class="nav-item">
                        <a class="nav-link" href="/registration">Зарегестрироваться</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/login">Войти</a>
                    </li>
                </c:if>
                <c:if test="${accessId != null}">
                    <li class="nav-justified dropleft justify-content-end">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <c:out value="${sessionScope.user.name}"/>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">

                            <a class="dropdown-item" href="/profile">Профиль</a> <%--ALL--%>

                            <c:if test="${accessId == 2}">
                                <a class="dropdown-item" href="/profile/basket">Корзина</a> <%--USER--%>
                            </c:if>
                            <c:if test="${accessId == 1}">
                                <a class="dropdown-item" href="#">Администрирование меню</a> <%--ADMIN--%>
                            </c:if>
                            <c:if test="${accessId == 1}">
                                <a class="dropdown-item"
                                   href="/profile/admin/all-users">Клиенты/работники</a> <%--ADMIN--%>
                            </c:if>
                            <c:if test="${accessId == 1 || accessId == 4}">
                                <a class="dropdown-item" href="#">Посмотреть заказы</a> <%--ADMIN, KITCHEN--%>
                            </c:if>
                            <%--<c:if test="${accessId == 1 || accessId == 3}">
                                <a class="dropdown-item" href="#">Посмотреть столы </a> &lt;%&ndash;ADMIN, WAITER&ndash;%&gt;
                            </c:if>--%>
                            <hr>
                            <a class="dropdown-item" href="/exit">Выйти</a> <%--ALL--%>
                        </div>
                    </li>
                </c:if>
            </ul>
        </div>
    </nav>
</header>
