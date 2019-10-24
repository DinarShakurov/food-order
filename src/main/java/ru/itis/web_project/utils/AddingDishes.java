package ru.itis.web_project.utils;

import ru.itis.web_project.DAO.DeliveryOrderDAO;
import ru.itis.web_project.DAO.DishDAO;
import ru.itis.web_project.models.DeliverOrder;
import ru.itis.web_project.models.Dish;
import ru.itis.web_project.models.User;
import ru.itis.web_project.utils.delivery_utils.TableObjectModel;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class AddingDishes {

    public static void toBasket(HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        List<TableObjectModel> orderList = (ArrayList<TableObjectModel>) session.getAttribute("orderDeliveryList");
        User user = (User) session.getAttribute("user");
        Integer totalPriceFromBasket = (Integer) session.getAttribute("totalPriceFromBasket");

        if (orderList == null) {
            orderList = new ArrayList<>();

        }

        Integer id_menu = Integer.parseInt(request.getParameter("id_menu"));
        Integer id_count_menu = Integer.parseInt(request.getParameter("id_count_menu"));
        Dish dish = DishDAO.getDishById(id_menu).get();
        TableObjectModel tableObject = new TableObjectModel();
        tableObject.setCount_id_menu(id_count_menu);
        tableObject.setId_menu(id_menu);
        tableObject.setName_dish(dish.getName());
        tableObject.setPrice(dish.getPrice());
        tableObject.setDate(new Date(System.currentTimeMillis()));
        totalPriceFromBasket = totalPriceFromBasket + dish.getPrice() * id_count_menu;


        boolean tag = false;
        for (TableObjectModel tableObj : orderList) {
            if (tableObj.getId_menu() == tableObject.getId_menu() && tableObj.getCount_id_menu() == tableObject.getCount_id_menu()) {
                tableObj.setCount_id_menu(tableObj.getCount_id_menu() + tableObject.getCount_id_menu());
                tag = true;
                break;
            }
        }
        if (!tag) orderList.add(tableObject);

        session.setAttribute("totalPriceFromBasket", totalPriceFromBasket);
        session.setAttribute("orderDeliveryList", orderList);
    }

    public static boolean buyFromBasket(HttpServletRequest request) {
        HttpSession session = request.getSession();

        List<TableObjectModel> orderList = (ArrayList) session.getAttribute("orderDeliveryList");
        User user = (User) session.getAttribute("user");

        if (orderList == null) {
            return false; //ваша корзина пуста
        }
        for (TableObjectModel tableObject : orderList) {
            DeliverOrder deliverOrder = new DeliverOrder();
            deliverOrder.setCount_id_menu(tableObject.getCount_id_menu());
            deliverOrder.setId_menu(tableObject.getId_menu());
            deliverOrder.setId_user(user.getId());
            DeliveryOrderDAO.insertDeliveryOrder(deliverOrder);
        }
        session.setAttribute("orderDeliveryList", null);
        session.setAttribute("totalPriceFromBasket", 0);
        return true;
    }

    public static void deleteDishFromBasket(HttpServletRequest request) {
        Integer deleted_id = Integer.parseInt(request.getParameter("deleted_id"));
        Integer count_deleted_id = Integer.parseInt(request.getParameter("deleted_count_id"));

        HttpSession session = request.getSession(false);
        List<TableObjectModel> orderList = (ArrayList) session.getAttribute("orderDeliveryList");

        for (TableObjectModel tableObject : orderList) {
            if (tableObject.getId_menu().equals(deleted_id) && tableObject.getCount_id_menu().equals(count_deleted_id)) {
                orderList.remove(tableObject);
                session.setAttribute("totalPriceFromBasket", (Integer) session.getAttribute("totalPriceFromBasket") - tableObject.getPrice() * tableObject.getCount_id_menu());
                break;
            }
        }
    }

}
