package ru.itis.web_project.servlets;

import ru.itis.web_project.utils.user_action.DishesUtil;
import ru.itis.web_project.utils.admin_action.EditMenu;
import ru.itis.web_project.utils.MenuUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        if (request.getParameter("add") != null) {
            request.setAttribute("addingStatus", "Блюдо добавлено в ваш заказ");
            DishesUtil.toBasket(request);
        } else if (request.getParameter("delete") != null) {
            EditMenu.deleteFromMenu(request);
        }
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MenuUtil.getMenuList(request);
        request.getRequestDispatcher("/jsp/menu.jsp").forward(request, response);
    }
}
