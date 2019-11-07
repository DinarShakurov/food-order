package ru.itis.web_project.utils;

import ru.itis.web_project.DAO.DeliveryOrderDAO;
import ru.itis.web_project.models.DeliverOrder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class AllOrders {
    public static List<DeliverOrder> showAllOrders() {
        List<DeliverOrder> list = DeliveryOrderDAO.showAllDeliverOrders();

        return list;
    }
}
