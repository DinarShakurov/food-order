package ru.itis.web_project.utils;

import ru.itis.web_project.DAO.UserDAO;
import ru.itis.web_project.models.User;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Optional;

public class Authorization {

    public static boolean isItCorrect(HttpServletRequest request, HttpServletResponse response) {

        Optional<User> user = UserDAO.findUserByLoginAndPassword(request.getParameter("login"), HashPassword.getHash(request.getParameter("password")));

        if (user.isEmpty()) {
            return false;
        } else {
            setAttributesForSession(request, user);
            if (request.getParameter("remember") != null) {
                Cookie cookie = new Cookie("userId", String.valueOf(user.get().getId()));
                cookie.setMaxAge(60 * 60 * 24);
                response.addCookie(cookie);
            }
            return true;
        }
    }

    public static boolean giveAccess(Integer userId, HttpServletRequest request, HttpServletResponse response) {
        Optional<User> user = UserDAO.findUserById(userId);
        if (user.isEmpty()) {
            return false;
        } else {
            setAttributesForSession(request, user);
            return true;
        }
    }

    private static void setAttributesForSession(HttpServletRequest request, Optional<User> user) {
        User user1 = user.get();
        HttpSession session = request.getSession(true);
        session.setAttribute("userId", user1.getId());
        session.setAttribute("username", user1.getName());
        session.setAttribute("accessId", user1.getRole());
    }
}
