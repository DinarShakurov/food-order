package ru.itis.web_project.servlets;

import ru.itis.web_project.utils.BlackList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/profile/user/blacklist")
public class BlackListServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("deleteAll") != null) {
            BlackList.deleteAllFromBlackList(request);
        } else if (request.getParameter("delete") != null) {
            BlackList.deleteFromBlackList(request);
        }
        response.sendRedirect("/profile/user/blacklist");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("blacklist", BlackList.getList(request));
        request.getRequestDispatcher("/jsp/blacklist.jsp").forward(request, response);
    }
}
