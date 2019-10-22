package ru.itis.web_project.utils;

import ru.itis.web_project.DAO.DishDAO;
import ru.itis.web_project.models.Dish;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Optional;

public class MenuUtil {
    public static void getMenuList(HttpServletRequest request) {
        Optional<List<Dish>> listOptional = DishDAO.getAllDishes();
        if (listOptional.isPresent()) {
            List<Dish> list = listOptional.get();
            request.setAttribute("menuList", list);
        }
    }
}
