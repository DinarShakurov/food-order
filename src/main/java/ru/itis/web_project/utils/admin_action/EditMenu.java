package ru.itis.web_project.utils.admin_action;

import ru.itis.web_project.DAO.DishDAO;

import javax.servlet.http.HttpServletRequest;

public class EditMenu {
    public static void deleteFromMenu(HttpServletRequest request) {
        Integer id_menu = Integer.parseInt(request.getParameter("id_menu"));
        DishDAO.deleteDishFromMenu(id_menu);
    }


}
