package ru.itis.web_project.utils;

import ru.itis.web_project.DAO.AntipathyDAO;
import ru.itis.web_project.DAO.DishDAO;
import ru.itis.web_project.models.Dish;
import ru.itis.web_project.models.User;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class BlackList {
    public static List<Dish> getList(HttpServletRequest request) {
        Set<Integer> antipathy = AntipathyDAO.getUsersAntipathy(((User) request.getSession(false).getAttribute("user")).getId());
        List<Dish> blacklist = new ArrayList<>();
        for (Integer integer : antipathy) {
            blacklist.add(DishDAO.getDishById(integer).get());
        }
        return blacklist.size() > 0 ? blacklist : null;
    }

    public static void deleteFromBlackList(HttpServletRequest request) {
        Set<Integer> antipathy = ((HashSet<Integer>) request.getSession(false).getAttribute("userAntipathySet"));
        Integer dish_id = Integer.parseInt(request.getParameter("dish_id"));
        antipathy.remove(dish_id);
        AntipathyDAO.delete(((User) request.getSession(false).getAttribute("user")).getId(), dish_id);
    }

    public static void deleteAllFromBlackList(HttpServletRequest request) {
        request.getSession(false).setAttribute("userAntipathySet", new HashSet<>());
        AntipathyDAO.deleteAll(((User) request.getSession(false).getAttribute("user")).getId());
    }
}
