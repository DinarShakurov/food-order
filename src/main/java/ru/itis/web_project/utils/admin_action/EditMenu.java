package ru.itis.web_project.utils.admin_action;

import ru.itis.web_project.DAO.DishCategoryDAO;
import ru.itis.web_project.DAO.DishDAO;
import ru.itis.web_project.DAO.DishPairDAO;
import ru.itis.web_project.models.Dish;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public class EditMenu {
    public static void deleteFromMenu(HttpServletRequest request) {
        Integer id_menu = Integer.parseInt(request.getParameter("id_menu"));
        DishPairDAO.deletePair(id_menu);
        DishDAO.deleteDishFromMenu(id_menu);
    }

    public static boolean addToMenu(String name_dish, Integer price, String composition, String category) {
        Dish dish = new Dish();
        dish.setName(name_dish);
        dish.setPrice(price);
        dish.setComposition(composition);
        dish.setId_category(DishCategoryDAO.getIdCategoryByName(category));

        List<Dish> dishList = DishDAO.getAllDishes().orElse(null);
        boolean tag = DishDAO.insert(dish);
        if (dishList != null && tag) {
            dish = DishDAO.findByName(name_dish);
            for (Dish dish1 : dishList) {
                int id = dish1.getId();
                DishPairDAO.insertNewPair(id, dish.getId());
            }
        }
        return tag;
    }


}
