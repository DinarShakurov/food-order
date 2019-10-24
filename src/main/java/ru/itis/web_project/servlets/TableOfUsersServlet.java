package ru.itis.web_project.servlets;

import ru.itis.web_project.utils.admin_action.AdminsAction;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/profile/admin/all-users")
public class TableOfUsersServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("userList",AdminsAction.getAllUsers());
        request.getRequestDispatcher("/jsp/users.jsp").forward(request, response);
    }
}
