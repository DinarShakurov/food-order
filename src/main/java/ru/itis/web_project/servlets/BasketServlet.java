package ru.itis.web_project.servlets;

import ru.itis.web_project.utils.user_action.AddingDishes;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/profile/user/basket")
public class BasketServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("buyAll") == null) {
            AddingDishes.deleteDishFromBasket(request);
        } else {
            if (request.getSession(false).getAttribute("orderDeliveryList") != null) {

                //TODO сделать бизнес логику, реквест не должен передаваться в качестве параметра, и переделать таблицу пермишенов
                AddingDishes.buyFromBasket(request);
                request.setAttribute("buyStatus", "Заказ был добавлен");
            } else {
                request.setAttribute("buyStatus", "Список пуст");
            }
        }
        request.getRequestDispatcher("/jsp/basket.jsp").forward(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/jsp/basket.jsp").forward(request, response);
    }
}
