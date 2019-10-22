package ru.itis.web_project.servlets;

import ru.itis.web_project.models.Dish;
import ru.itis.web_project.utils.AddingDishes;
import ru.itis.web_project.utils.MenuUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("add") != null) {
            AddingDishes.toBasket(request);
        } else {
        }
        request.getRequestDispatcher("/jsp/menu.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MenuUtil.displayMenu(request);
        request.getRequestDispatcher("/jsp/menu.jsp").forward(request, response);
    }
}
