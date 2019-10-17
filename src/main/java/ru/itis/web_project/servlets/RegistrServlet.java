package ru.itis.web_project.servlets;

import ru.itis.web_project.controllers.UserController;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/registration")
public class RegistrServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (UserController.registrUser(request.getParameter("phoneNumber"), request.getParameter("username"), request.getParameter("login"), request.getParameter("password"), request.getParameter("address"))) {
            request.setAttribute("registr-status", "Регистрация прошла успешна");
        } else{
            request.setAttribute("registr-status", "Ошибка, попробуйте заново");
        }
        request.getRequestDispatcher("/jsp/registration.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/jsp/registration.jsp").forward(request, response);
    }
}
