package ru.itis.web_project.utils;

import ru.itis.web_project.DAO.UserDAO;
import ru.itis.web_project.models.User;

public class Registration {
    public static boolean registrUser(String phoneNumber, String username, String login, String password, String address) {
        User user = new User();
        user.setPhone_number(phoneNumber);
        user.setPassword(HashPassword.getHash(password));
        user.setLogin(login);
        user.setName(username);
        user.setAddress(address);
        user.setRole(2);
        return UserDAO.insertUser(user);
    }
}
