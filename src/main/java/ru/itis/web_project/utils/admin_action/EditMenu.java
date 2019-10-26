package ru.itis.web_project.utils.admin_action;

import ru.itis.web_project.DAO.DishCategoryDAO;
import ru.itis.web_project.DAO.DishDAO;
import ru.itis.web_project.models.Dish;

import javax.servlet.http.HttpServletRequest;

public class EditMenu {
    public static void deleteFromMenu(HttpServletRequest request) {
        Integer id_menu = Integer.parseInt(request.getParameter("id_menu"));
        DishDAO.deleteDishFromMenu(id_menu);
    }

    public static boolean addToMenu(String name_dish, Integer price, String composition, String category) {
        Dish dish = new Dish();
        dish.setName(name_dish);
        System.out.println(name_dish);
        dish.setPrice(price);
        System.out.println(price);
        dish.setComposition(composition);
        System.out.println(composition);

        System.out.println(category);
        System.out.println(DishCategoryDAO.getIdCategoryByName(category));
        dish.setId_category(DishCategoryDAO.getIdCategoryByName(category));
        return DishDAO.insert(dish);
    }


}
