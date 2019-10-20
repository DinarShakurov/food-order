package ru.itis.web_project.utils.delivery_utils;

import ru.itis.web_project.DAO.DeliveryOrderDAO;
import ru.itis.web_project.DAO.DishDAO;
import ru.itis.web_project.models.DeliveryOrder;
import ru.itis.web_project.models.Dish;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class DeliveryTableUtil {

    public static List<TableObject> getTableDeliveryOrder(Integer user_id) {
        ArrayList<DeliveryOrder> arrayList = null;
        Optional<List<DeliveryOrder>> pseudoList = DeliveryOrderDAO.getAllDeliveryOrdersByIdUser(user_id);
        if (pseudoList.isEmpty()) {
            return null;
        } else {
            arrayList = (ArrayList<DeliveryOrder>) pseudoList.get();
            List<TableObject> newList = new ArrayList<>();

            for (DeliveryOrder delivery : arrayList) {
                Dish dish = DishDAO.getDishById(delivery.getId_menu()).get();
                TableObject tableObject = new TableObject();
                tableObject.setCount_id_menu(delivery.getCount_id_menu());
                tableObject.setDate(delivery.getDate());
                tableObject.setName_dish(dish.getName());
                tableObject.setPrice(dish.getPrice());
                newList.add(tableObject);
            }
            return newList;
        }
    }
}
