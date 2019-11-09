package ru.itis.web_project.servlets;

import ru.itis.web_project.models.Dish;
import ru.itis.web_project.models.User;
import ru.itis.web_project.utils.DishToOffer;
import ru.itis.web_project.utils.user_action.DishesUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.HashSet;
import java.util.List;

@WebServlet(urlPatterns = "/profile/user/basket/offer")
public class OfferServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("add") != null) {
            request.setAttribute("addingStatus", "Блюдо добавлено в ваш заказ");
            DishesUtil.toBasket(request);
            response.sendRedirect("/profile/user/basket");
        } else if (request.getParameter("delete") != null) {
            DishesUtil.updateUserAntipathy(false,
                    ((HashSet<Integer>) request.getSession(false).getAttribute("userAntipathySet")),
                    Integer.parseInt(request.getParameter("id_menu")),
                    ((User) request.getSession(false).getAttribute("user")).getId());

            doGet(request, response);
            /*((HashSet<Integer>) request.getSession(false).getAttribute("userAntipathySet"))
                    .add(Integer.parseInt(request.getParameter("id_menu")));*/
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session.getAttribute("orderDeliveryList") != null) {
            List<Dish> list = DishToOffer.makeOffer(request);
            if (list != null) {
                session.setAttribute("dishListForOffer", list);
                request.getRequestDispatcher("/jsp/additionalDish.jsp").forward(request, response);
            } else {
                DishesUtil.buyFromBasket(request);
                request.setAttribute("buyStatus", "Заказ был добавлен");
                request.getRequestDispatcher("/jsp/basket.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("buyStatus", "Список пуст");
            request.getRequestDispatcher("/jsp/basket.jsp").forward(request, response);
        }

    }
}
